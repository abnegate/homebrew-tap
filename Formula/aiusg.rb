# typed: false
# frozen_string_literal: true

class Aiusg < Formula
  desc "Usage limits and reset times across all your AI provider accounts"
  homepage "https://github.com/abnegate/aiusg"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/aiusg/releases/download/0.1.0/aiusg-aarch64-apple-darwin.tar.gz"
      sha256 "592832c2619eb86c97846b7d24bb4f9359fde9573e4c091f732d948e7ade4b4f"
    end
    on_intel do
      url "https://github.com/abnegate/aiusg/releases/download/0.1.0/aiusg-x86_64-apple-darwin.tar.gz"
      sha256 "0500c623d8a29d50c858248b5d0edce98fbd30d0a49b71948cf1ab83152181e6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/aiusg/releases/download/0.1.0/aiusg-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2e47c2d47f8a1c2a355b8c125cf09f5636ad421028ac4966c75b4c026325b1bb"
    end
    on_arm do
      url "https://github.com/abnegate/aiusg/releases/download/0.1.0/aiusg-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5263d03ff1ff221936610d1cff824ded364f4c18eccdb642b98c6ba9bad0a870"
    end
  end

  def install
    bin.install Dir["aiusg-*"].first => "aiusg"
  end

  test do
    assert_match "aiusg", shell_output("#{bin}/aiusg --help")
  end
end
