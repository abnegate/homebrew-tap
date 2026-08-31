# typed: false
# frozen_string_literal: true

class Magents < Formula
  desc "Shared session bus for Claude Code, Codex, Cursor, Grok, and OpenCode"
  homepage "https://github.com/abnegate/magents"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.6.0/magents-aarch64-apple-darwin.tar.gz"
      sha256 "7a40b1f2d81799f8749fc747b4c21873e029eeebee5074fbffb4cd5e75962ab1"
    end
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.6.0/magents-x86_64-apple-darwin.tar.gz"
      sha256 "80d7463e8eeda323f2e506304c08df79dddb28ae84d7fec282e962c6591450bb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.6.0/magents-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8fc3dc6911950fd77c8cace2545bba961b19fb136b2449a3715a800fc6c3125d"
    end
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.6.0/magents-aarch64-unknown-linux-musl.tar.gz"
      sha256 "60b5bf90f305905a212f0c443e9dc64dea1de4c752aba43617f4aafcccc34c1f"
    end
  end

  def install
    bin.install Dir["magents-*"].first => "magents"
  end

  test do
    assert_match "magents", shell_output("#{bin}/magents --help")
  end
end
