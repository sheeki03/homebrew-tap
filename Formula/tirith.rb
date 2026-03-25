class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.2.10"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.10/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "dcd1805db3ace2358887da2f714166953619001d4a081d10272fa3395cca061c"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.10/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "8dfd313af94722b7e5ef0386fa58259ae5bedb5873c3371f51bbf4911999e52b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.10/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3d710fbc5832a33c2c1968c30de2ff261a86109cd3023cf0b970ffcec9bd1697"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.10/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ed84c834340590958533c63b47df2ef1420985e6a96b6fd2c9dddbb37c6d8f5c"
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
