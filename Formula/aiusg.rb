# typed: false
# frozen_string_literal: true

class Aiusg < Formula
  desc "Usage limits and reset times across all your AI provider accounts"
  homepage "https://github.com/abnegate/aiusg"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/aiusg/releases/download/0.4.1/aiusg-aarch64-apple-darwin.tar.gz"
      sha256 "3e172013e8518c34a6ffed64e22caa5614d22f06c5a4aaa6fb6da5605f568e65"
    end
    on_intel do
      url "https://github.com/abnegate/aiusg/releases/download/0.4.1/aiusg-x86_64-apple-darwin.tar.gz"
      sha256 "4fc273629e5a75a3a5e51a6b9cbf0c673b20881745e08e71f68d72ed103e6294"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/aiusg/releases/download/0.4.1/aiusg-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "37c5f124db57059062ab10ad09195d25a50e6778efb5f89986bced515db09cce"
    end
    on_arm do
      url "https://github.com/abnegate/aiusg/releases/download/0.4.1/aiusg-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "92f3dc37eac8e588292f8efd2d3999fb84b84b947b903d7682f0e8dee3aac2cf"
    end
  end

  def install
    bin.install Dir["aiusg-*"].first => "aiusg"
  end

  test do
    assert_match "aiusg", shell_output("#{bin}/aiusg --help")
  end
end
