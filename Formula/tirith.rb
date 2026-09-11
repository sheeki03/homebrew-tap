class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.4.2"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.4.2/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "551f9a6ebf58344e7d0aa06bcc78d7a4f2f7b44b8011be563e0a91976cc9c4df"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.4.2/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "dda8a14df00a49c4b0f607c15a82259f96c94da91b09718a7ebbc34a831d6f54"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.4.2/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c550b1bfb0c8c872ab3421cd6ef756f260f7cf4981a18cedd49f141fa2d77569"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.4.2/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "efa6bf414a83dba385d4f13137e8677f850ced9102fe74ebb14c72f31df0dc77"
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
