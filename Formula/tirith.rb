class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.2.11"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.11/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "d9526e0959d141f873b41a10efada0320718d4178602aacbcdbf085bc302d24f"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.11/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "63e39e3b736e41150f5595e69829081464ac064b6ceaceca0e02bc4ec485b889"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.11/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4eb1388717529a30c7265a79ea50f60d0bea670961bb7b7ea9fdaa63af96bc71"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.11/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5f68016b4eadd4455c4164c392db9ee5e6ab6f6d523256f2f778564029f49af0"
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
