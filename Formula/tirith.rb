class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.2.4"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.4/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "c4cced3e02e1f654a7cfce1517033ebd89b2e3c09daf37e5224fb513206108f6"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.4/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "68ab1fd8def5c9cc575bd2e2a002de513a4b196448275083ab2cdabe281c65bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.4/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c74d636547394aa069dc537061e7533ab6791f545ae8a4e19b8b4819e59796a5"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.4/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f02f06289c0bf675713c760debc95d2097766d923889482a439d93a332f8a11c"
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
