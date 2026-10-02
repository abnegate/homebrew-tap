# typed: false
# frozen_string_literal: true

class Aiusg < Formula
  desc "Usage limits and reset times across all your AI provider accounts"
  homepage "https://github.com/abnegate/aiusg"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/aiusg/releases/download/0.5.0/aiusg-aarch64-apple-darwin.tar.gz"
      sha256 "a4613875f3f5b755ea3ddf8498b9b41deef9735b9e373c45c87fa32e973d2698"
    end
    on_intel do
      url "https://github.com/abnegate/aiusg/releases/download/0.5.0/aiusg-x86_64-apple-darwin.tar.gz"
      sha256 "b1042e14ce46592e6e8768677a1e2f9fa563441ee4aaead7b4b764dad22575d9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/aiusg/releases/download/0.5.0/aiusg-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "facbe9e3b295ef15b7b654c062828c68097d0df51d862da55942d264d9ec2a98"
    end
    on_arm do
      url "https://github.com/abnegate/aiusg/releases/download/0.5.0/aiusg-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9b5317c70a6d4c665c6cce00cfc5ccdd0105197481dc042cfda14a85f311b49f"
    end
  end

  def install
    bin.install Dir["aiusg-*"].first => "aiusg"
  end

  test do
    assert_match "aiusg", shell_output("#{bin}/aiusg --help")
  end
end
