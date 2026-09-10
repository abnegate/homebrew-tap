# typed: false
# frozen_string_literal: true

class Aiusg < Formula
  desc "Usage limits and reset times across all your AI provider accounts"
  homepage "https://github.com/abnegate/aiusg"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/aiusg/releases/download/0.2.0/aiusg-aarch64-apple-darwin.tar.gz"
      sha256 "ec52cc1cd46b4b3d7cc149cc44db3493a1a25226fb4b17038c9b3452a9c5b1a3"
    end
    on_intel do
      url "https://github.com/abnegate/aiusg/releases/download/0.2.0/aiusg-x86_64-apple-darwin.tar.gz"
      sha256 "899c5e7172d503d162b88a3f1d9ddf0ed74a38114fe4764e523c5f5071722abc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/aiusg/releases/download/0.2.0/aiusg-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a0d1642335815faf5065c24f9cbe79b1f3941c022e6dbf29effdfd69d2e1f286"
    end
    on_arm do
      url "https://github.com/abnegate/aiusg/releases/download/0.2.0/aiusg-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "245eaceb036a10194f66a75874e9a1c211b8666ebf6f7a7915f31d8ff3e4c10e"
    end
  end

  def install
    bin.install Dir["aiusg-*"].first => "aiusg"
  end

  test do
    assert_match "aiusg", shell_output("#{bin}/aiusg --help")
  end
end
