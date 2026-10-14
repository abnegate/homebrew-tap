# typed: false
# frozen_string_literal: true

class Magents < Formula
  desc "Shared session bus for Claude Code, Codex, Cursor, Grok, and OpenCode"
  homepage "https://github.com/abnegate/magents"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.14.0/magents-aarch64-apple-darwin.tar.gz"
      sha256 "5d3662d9ed4b5dc1a88968822b17be94e9ce07fc69da6055700878b697a75a21"
    end
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.14.0/magents-x86_64-apple-darwin.tar.gz"
      sha256 "24198a98d402a89bb984fae90c40983b556f4494a0ae1267c0a61fe4090c3739"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.14.0/magents-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cae5b9488bed2f35ee1d98b441172f07207949c841ca02bd8fe7266705e5cc11"
    end
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.14.0/magents-aarch64-unknown-linux-musl.tar.gz"
      sha256 "23acaa6a98d48b551548347561feab9bda85e9c13adec5548f3dbe5054983a1f"
    end
  end

  def install
    bin.install Dir["magents-*"].first => "magents"
  end

  test do
    assert_match "magents", shell_output("#{bin}/magents --help")
  end
end
