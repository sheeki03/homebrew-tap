class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.2.8"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.8/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "da70b71fb1049c7e813e10ff15d040d0bde1ee049668d25d0986de6d8d0d6c7c"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.8/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "7e12db84c70a1599c7a66430ed321a5ee443ac16d68132347bb2acc634f78a74"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.8/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1046381fd24959217e7ecfb6d866fb0213607f21ff7935f78dbf871d75c6a912"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.8/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3dbd563f6fcbea6e30ba5899b0680a8c725720438d9160f4d86413abe46852b8"
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
