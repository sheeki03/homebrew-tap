class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.1.6"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.6/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "b51f8fd0aed48a7bf2cdea937b14c950c93634e737dd7499f96b6ea7a376c096"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.6/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "d6c566923a5cadb4aced39afab8345766f3451fa2cd2b6a6909b42c58e1e71c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.6/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c670012993a5e8661bd91920a6013c002c75905f6d55b6dc16ed8af64f4b8246"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.6/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "74414357cbb1c822216b473cd428db858e068bad7ac42b800f3d4414d334fce0"
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
