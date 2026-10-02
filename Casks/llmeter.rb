cask "llmeter" do
  version "0.1.6"
  sha256 "8f5e6d371ada04e32e5612b93fbaf0cea3ba42389d860cab88d0b3f41aa5d64c"

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
