cask "llmeter" do
  version "0.1.4"
  sha256 "079f157227a7e91378002a84606b50d90ad8b77829da3c53ff11c93286951872"

  url "https://github.com/langliu/llmeter/releases/download/v#{version}/LLMeter-macos-arm64.zip"
  name "LLMeter"
  desc "Local-first AI coding usage tracker"
  homepage "https://github.com/langliu/llmeter"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "LLMeter.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/LLMeter.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/LLMeter",
    "~/Library/Saved Application State/io.github.langliu.llmeter.savedState",
  ]
end
