class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.1.9"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.9/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "51b73f40ef892cd7b1517d4f87390b440e9b66ff47958f1319f9a5d6d7895c7f"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.9/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "7d21d253753666502182219208b8dc4a4ab099219b7e0ac729d22156f8be1fa3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.9/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d0e286700eb6ed035724faf422a3f548bae0be86da0f574b71c32a71289a350"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.9/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a971b9564b46a72b5c31efecccaf4ecca5948f8352666abb2ad835bda51035e"
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
