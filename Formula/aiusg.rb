# typed: false
# frozen_string_literal: true

class Aiusg < Formula
  desc "Usage limits and reset times across all your AI provider accounts"
  homepage "https://github.com/abnegate/aiusg"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/aiusg/releases/download/0.4.0/aiusg-aarch64-apple-darwin.tar.gz"
      sha256 "d399b0dce773a10cc426bd4d6031ba9eab965bd43298e8fbb3c4367504fd501b"
    end
    on_intel do
      url "https://github.com/abnegate/aiusg/releases/download/0.4.0/aiusg-x86_64-apple-darwin.tar.gz"
      sha256 "e85dded715abcaa1ccfd09e5be43c86143655866dd3db864262949ca66c3180d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/aiusg/releases/download/0.4.0/aiusg-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fa8a1db10c418e2a985d3d3ac76f1d63366a31da15b35d5d76cee2a57d0805c1"
    end
    on_arm do
      url "https://github.com/abnegate/aiusg/releases/download/0.4.0/aiusg-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5eed10ca39d23706c8a7076203b0be2f861d64cea77036941e8f11f8abdc928f"
    end
  end

  def install
    bin.install Dir["aiusg-*"].first => "aiusg"
  end

  test do
    assert_match "aiusg", shell_output("#{bin}/aiusg --help")
  end
end
