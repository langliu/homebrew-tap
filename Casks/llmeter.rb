cask "llmeter" do
  version "0.1.8"
  sha256 "1bad04fe23f75c99836cf979669da2b4e47279a6bd860416f00ea8485afc8807"

  url "https://github.com/langliu/llmeter/releases/download/v#{version}/LLMeter-macos-arm64.zip"
  name "LLMeter"
  desc "Local-first AI coding usage tracker"
  homepage "https://github.com/langliu/llmeter"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "LLMeter.app"

  postflight_steps do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/LLMeter.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/LLMeter",
    "~/Library/Saved Application State/io.github.langliu.llmeter.savedState",
  ]
end
