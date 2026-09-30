cask "llmeter" do
  version "0.1.2"
  sha256 "df3d7c77c2f9bd54fff74801498e84c93aaad0b7f5c1b284129098e5c54a970f"

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
