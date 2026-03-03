class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.2.4"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.4/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "ebbbd948fe1ad82e052467190b737fcffd820371f2da5a1c4e9e1952ce9bf771"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.4/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "9182ca24dc9bd35bb7fb894c0ee41af3a288c95cac6b1e1ab24c5bac2cc2e54f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.4/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "195ca67466c8dfdc48928eb7f8b29aa672b06187681b9ba31f7d64e1162b4ee4"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.4/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ac5651d57aa7eda608b3fac4de4f0aa6b91cba668e7f17c23a45f1e3f429130b"
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
