class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.1.8"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.8/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "8019ead9f8b777870ee612f5c47cd4d878a19cff0a9cb0289a50fd04deeab926"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.8/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "0703d2978bd39c4293f17e539bec3eb54e64c928441b55ba9a707475e2a63475"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.8/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0cd0695982269aaa854b77d1e0bfb7cac27b21607af3740558e08e4ce43ea4f1"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.8/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6ecf7346bc96c9fbfffe1b93b64ac75cf64321c4b749903fdd5bd14a9a515cb2"
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
