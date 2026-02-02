class Tirith < Formula
  desc "URL security analysis for shell environments"
  homepage "https://github.com/sheeki03/tirith"
  license "Apache-2.0"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.0/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "2dbdd04e73ca93075503e49fdd9705f77805b384b516223bab7a3fc78eee3e1b"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.0/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "50bd1e06d1c87fecefeafde944aa9435c3f1e22e5ae1460ce1529a8e0253990e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.0/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7bb41519018afb40c2440c08beafe3a53ef9d3d6a041ec32d2bd4e61102036da"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.0/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7cbb3136d38de0a63db1e459f13f1a1b5013544d59c92ffb0c9015c8764d9f14"
    end
  end

  def install
    bin.install "tirith"

    # Completions (pre-generated, shipped in archive)
    bash_completion.install "completions/tirith.bash"
    zsh_completion.install "completions/_tirith"
    fish_completion.install "completions/tirith.fish"

    # Man page (pre-generated, shipped in archive)
    man1.install "man/tirith.1"
  end

  def caveats
    <<~EOS
      Add to your shell profile:
        eval "$(tirith init)"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tirith --version")
    system bin/"tirith", "doctor"
  end
end
