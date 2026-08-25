class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.4.0/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "fed9f7f1b9140b04bb56c520b2feb37a38596bc1baf478e6ed0427ecec0cff02"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.4.0/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "abcd0870a0aa364c03585ec8e4480f01bc5664839761008177d73afca04d656c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.4.0/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8d421d04079ad88caf660dc021bc2e8447142c2d308a4998595ba24a4d2c23c6"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.4.0/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ec90836eef3519829f0b8371836a09c12c31fd8620d411a38b69423b19b5e468"
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
