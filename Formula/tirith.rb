class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.2.12"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.12/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "0c469d5f8ba556d25aab478435cefe4ab6073e6e7a6f8ca58a58bfdc18052053"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.12/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "13b2c9b3d238b25b8b161617521ef1a40f97c554b2a36df071cc87f811c98b99"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.12/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5af09847e555c91fd240c80643350e8baecb1a73f706ec271beafab2acc7141b"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.12/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "014a71d9dac03da24d8343e586b7437518822e9916cfc7cd1cd1a69086a85d63"
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
