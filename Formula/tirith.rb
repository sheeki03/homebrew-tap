class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.4/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "f48fd593300f7929bdc0ce1ecf5d7ec500162710491ae460276fcf90fb642dba"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.4/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "d574aed587cf34b9e82ba21c78a8c4133aab278d35af2fd96473fb3588e4412f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.4/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ef1a02aa1252c908f7c113457d4b86bef8d4c64e87b24a90d0e5374387468e22"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.4/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dcfa0324300db46d561dabd5eff81f1817b9f7d1eb8aacda156c414049ae8897"
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
