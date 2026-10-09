# typed: false
# frozen_string_literal: true

class Magents < Formula
  desc "Shared session bus for Claude Code, Codex, Cursor, Grok, and OpenCode"
  homepage "https://github.com/abnegate/magents"
  version "0.13.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.13.2/magents-aarch64-apple-darwin.tar.gz"
      sha256 "09fb290c6c366bb2cb8fb72fe0d596ed7ba4a54ea1b5984fd8d509f0e52bfb65"
    end
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.13.2/magents-x86_64-apple-darwin.tar.gz"
      sha256 "6c304b31e569cb7ed495f35204365b272489480d479755c54a40a7b61a9084a9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/abnegate/magents/releases/download/0.13.2/magents-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d7ba478f0fd8a4fb56bbdad66206cb910bf7397301ceb56affeba60864f3afb8"
    end
    on_arm do
      url "https://github.com/abnegate/magents/releases/download/0.13.2/magents-aarch64-unknown-linux-musl.tar.gz"
      sha256 "29ddf8375c2a62443458895aaac9c24f02029e7ac5d1f3e5dc5388156c953536"
    end
  end

  def install
    bin.install Dir["magents-*"].first => "magents"
  end

  test do
    assert_match "magents", shell_output("#{bin}/magents --help")
  end
end
