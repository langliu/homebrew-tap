# Homebrew Tap for langliu

个人 macOS 桌面软件的 Homebrew Tap 仓库。

## 目录结构

```text
homebrew-tap/
├── README.md
└── Casks/                     # 存放所有带 UI 的 macOS 桌面软件（.app）
    └── llmeter.rb             # LLMeter 桌面版
```

---

## 安装与使用

### 1. 添加此 Tap 源

```bash
brew tap langliu/tap
```

> **说明**：GitHub 仓库名为 `homebrew-tap`，使用 `brew tap langliu/tap` 即可自动定位并拉取。若系统启用了 Homebrew 7.0+ 的第三方 tap 安全策略，初次使用可按提示执行 `brew trust langliu/tap`。

---

### 2. 软件列表

#### [LLMeter](https://github.com/langliu/llmeter)
Local-first AI coding usage tracker（本地 AI 编码 Token 消耗追踪器）。

- **安装**：
  ```bash
  brew install --cask llmeter
  ```
  或者不单独 tap 直接安装：
  ```bash
  brew install --cask langliu/tap/llmeter
  ```

  安装完成后将在 `/Applications` 中生成 `LLMeter.app`，并同时软链接 `llmeter` 命令行工具到系统路径。

- **卸载与清理配置**：
  ```bash
  brew uninstall --cask --zap llmeter
  ```

---

## 维护与更新指南

### 1. 更新现有软件版本（以 LLMeter 为例）
当上游发布新版本（例如 `v0.2.0`）时：
1. 获取 DMG 产物的 SHA256：
   ```bash
   curl -sL https://github.com/langliu/llmeter/releases/download/v0.2.0/LLMeter-macos-arm64.dmg.sha256
   # 或手动计算:
   curl -sL https://github.com/langliu/llmeter/releases/download/v0.2.0/LLMeter-macos-arm64.dmg | shasum -a 256
   ```
2. 修改 `Casks/llmeter.rb` 中的 `version` 与 `sha256`。
3. 提交并推送到 GitHub 仓库。

### 2. 添加新的桌面软件 (Cask)
在 `Casks/` 目录下创建 `<app-name>.rb`：
```ruby
cask "<app-name>" do
  version "1.0.0"
  sha256 "..."

  url "https://github.com/langliu/<app-name>/releases/download/v#{version}/<App>-macos-arm64.dmg"
  name "<App>"
  desc "<Description>"
  homepage "https://github.com/langliu/<app-name>"

  depends_on arch: :arm64

  app "<App>.app"

  zap trash: [
    "~/Library/Application Support/<App>",
    "~/Library/Preferences/com.example.<app>.plist",
  ]
end
```

> **提示**：如果未来需要发布纯命令行工具（CLI），可后续在根目录下创建 `Formula/` 目录并添加对应的 `.rb` 文件。
