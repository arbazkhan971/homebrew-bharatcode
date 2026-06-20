class Bharatcode < Formula
  desc "Indian, local-first, Apache-2.0 Rust terminal AI coding agent"
  homepage "https://github.com/arbazkhan971/bharatcode-cli"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    # No prebuilt macOS binary yet — build from source (Apache-2.0).
    url "https://github.com/arbazkhan971/bharatcode-cli/archive/refs/tags/v0.7.0.tar.gz"
    sha256 "f2a904362dc155c702f47f33d455b6bd5f4651ede76556ad49a3295e831279f1"
    depends_on "rust" => :build

    def install
      system "cargo", "build", "--release", "--locked", "-p", "goose-cli",
             "--no-default-features", "--features", "portable-default"
      bin.install "target/release/bharatcode"
    end
  end

  on_linux do
    on_intel do
      # Prebuilt linux-x86_64 binary from the GitHub release.
      url "https://github.com/arbazkhan971/bharatcode-cli/releases/download/v0.7.0/bharatcode-0.7.0-linux-x86_64.tar.gz"
      sha256 "ae0545500ebcff9e7a2ea8a35c7db8d14db0597209a76deeca288781b67aecb6"

      def install
        bin.install "bharatcode"
      end
    end
  end

  test do
    assert_match "0.7.0", shell_output("#{bin}/bharatcode --version")
  end
end
