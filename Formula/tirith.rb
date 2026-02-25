class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.2.2"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.2/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "ea296ed1bb28602c34539c73fbbeb6934227161866a96c54485670e6103bf29c"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.2/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "5c8f43aca266f869fa31047904d1bddf1be5a1ebcbd50c2722c52e162f3f1ed1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.2/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "732940efac9dd1216e3a41e3f55a25d5608f011ae30a2a2676674719102fb256"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.2/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "acdcc47c884564a78588dcd2dc85382d433cb92d738969393bf605309982a612"
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
      Activate tirith by adding to your shell profile:

        zsh  (~/.zshrc):                        eval "$(tirith init)"
        bash (~/.bashrc):                       eval "$(tirith init)"
        fish (~/.config/fish/config.fish):      tirith init | source

      Then restart your terminal or run: source ~/.zshrc

      Verify: tirith doctor
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tirith --version")
    system bin/"tirith", "doctor"
  end
end
