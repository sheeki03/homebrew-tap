class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.1.5"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.5/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "5ec65ea5b9f4bfc45f6ff8bb05757898da1e6ed61be0ef7cc604c699e351aa97"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.5/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "b9ad83c43abb02e718982db60b25eb5db9a71ed8849e10a8eb6f1430cfdfef03"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.5/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d68825a9c5bf5227b7a9303f247b4f051b3af7ba2b969b760509a636915ea13f"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.5/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0d7f17e8521ce71b7ce891dafdec923d9944c0ac5cfcc52d5d8a0b843c41b751"
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
