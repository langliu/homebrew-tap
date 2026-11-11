cask "llmeter" do
  version "0.1.9"
  sha256 "3175edae71d3ef8ac4cf6178d0212966b1cc97eb0f7bc18526e8bcc28ea146b6"

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
