# typed: false
# frozen_string_literal: true

class Magents < Formula
  desc "Shared session bus for Claude Code, Codex, Cursor, Grok, and OpenCode"
  homepage "https://github.com/abnegate/magents"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.13.0/magents-aarch64-apple-darwin.tar.gz"
      sha256 "7685351130c4f6373c039d4cd161103c16ecede6b94d185476106be873b51ecb"
    end
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.13.0/magents-x86_64-apple-darwin.tar.gz"
      sha256 "eb18199829d4a1a0a43de50809d13720d6d9538b6e3932961d79e95bb842abd2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.13.0/magents-x86_64-unknown-linux-musl.tar.gz"
      sha256 "226cfd2ca831c99a90fe0e80441159fb88ba4cf0ce5e545c7bf6238422561913"
    end
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.13.0/magents-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b7cdc186f5d7a0a84a1a8c3b96ada0ccc06105289a093729932ba21b79fd4149"
    end
  end

  def install
    bin.install Dir["magents-*"].first => "magents"
  end

  test do
    assert_match "magents", shell_output("#{bin}/magents --help")
  end
end
