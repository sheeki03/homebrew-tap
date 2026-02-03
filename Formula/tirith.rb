class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.3/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "6cd0829fbdc0390b773705f5ecdff7da8eb2fc18b6669f88d1dd25dfd69c8a82"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.3/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "21ebf16233fde95d3985876f30eb503d2a97fb7e028085fa81f8512b4d0d70c8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.3/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "238ab4cbfea947d26bdf1e0b95f04b9d8d1e576143af529659c0d43b5191e8fc"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.3/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2706e98ca3e67cd38627049086a5257d5e9049111c7cd5542771bcd2ec4ff926"
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
