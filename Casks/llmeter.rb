cask "llmeter" do
  version "0.1.0"
  sha256 "f6ddcec0581d3fb4e25164a7356d8a9d719cb477981a2a45576e750a4ccc0de5"

  url "https://github.com/langliu/llmeter/releases/download/v#{version}/LLMeter-macos-arm64.dmg"
  name "LLMeter"
  desc "Local-first AI coding usage tracker"
  homepage "https://github.com/langliu/llmeter"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  app "LLMeter.app"
  binary "#{appdir}/LLMeter.app/Contents/MacOS/llmeter"

  zap trash: [
    "~/Library/Application Support/LLMeter",
    "~/Library/Caches/io.github.langliu.llmeter",
    "~/Library/Preferences/io.github.langliu.llmeter.plist",
    "~/Library/Saved Application State/io.github.langliu.llmeter.savedState",
  ]
end
