class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.2.5"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.5/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "57c2e8d6734f61a1a74379e4535c1722adfcacb04e7c063edc39256d66410f2a"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.5/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "3dd42b860e9516da2e1f8ab1ff81d7d16c9fe60fc92a3bf12d29448f6bbcf872"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.5/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3aa6a2bcc5bb1927a75063616cfef41c747aebef7b934bc8c062ee6439f07f86"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.5/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "011a798e64016ef9bde0b7abb3907563aa4e3d4f36c6a7632e4522232224a1f6"
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
