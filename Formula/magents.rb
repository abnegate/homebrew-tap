# typed: false
# frozen_string_literal: true

class Magents < Formula
  desc "Shared session bus for Claude Code, Codex, Cursor, Grok, and OpenCode"
  homepage "https://github.com/abnegate/magents"
  version "0.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.10.1/magents-aarch64-apple-darwin.tar.gz"
      sha256 "e76c1e8cb3d23b46c2e258fa5b06455c5877b4c6a88aa60bb4ed6c4dc853943a"
    end
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.10.1/magents-x86_64-apple-darwin.tar.gz"
      sha256 "c19b074e25e2aa84faf13afaafdf319d1f79240ab271f911f17c0ca39021996b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.10.1/magents-x86_64-unknown-linux-musl.tar.gz"
      sha256 "65b614477129946ec87abeaae51a151962ef1daba37f6a26a24c37998247fb00"
    end
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.10.1/magents-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2c5db9d5f5453dfb6f616346bc5d7afc8e2e2e127019d0a769f603daf3ef56d0"
    end
  end

  def install
    bin.install Dir["magents-*"].first => "magents"
  end

  test do
    assert_match "magents", shell_output("#{bin}/magents --help")
  end
end
