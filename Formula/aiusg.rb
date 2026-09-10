# typed: false
# frozen_string_literal: true

class Aiusg < Formula
  desc "Usage limits and reset times across all your AI provider accounts"
  homepage "https://github.com/abnegate/aiusg"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/aiusg/releases/download/0.3.0/aiusg-aarch64-apple-darwin.tar.gz"
      sha256 "9f84bd31beec5c6b3a6cef5e1aaff1635048da0b43d4dca9c4f0cdf2b70c74fb"
    end
    on_intel do
      url "https://github.com/abnegate/aiusg/releases/download/0.3.0/aiusg-x86_64-apple-darwin.tar.gz"
      sha256 "f6b73844f9b175b6eed14056acc12c25aaf1cd8c3f551f944b4cb4f366df20c6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/aiusg/releases/download/0.3.0/aiusg-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "397fd77da1069bdb11458e5b33aba287da5d450d34664d7fbf083303d2844797"
    end
    on_arm do
      url "https://github.com/abnegate/aiusg/releases/download/0.3.0/aiusg-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0a4d761de8662e23464de56e2845ca7a3265142aeff966eb767a0f52d0ea3cf3"
    end
  end

  def install
    bin.install Dir["aiusg-*"].first => "aiusg"
  end

  test do
    assert_match "aiusg", shell_output("#{bin}/aiusg --help")
  end
end
