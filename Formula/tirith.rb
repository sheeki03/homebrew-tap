class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.2.5"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.5/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "38f6c71c68a4708041315098eecafb0e041c63326e0b92c72f2cedd9798ac673"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.5/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "54824b486d7d01f1747dec47f058a930616cff153fbc395814609f9c3b96ff0d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.5/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b34be5e29c1ef3dd69e7c490a32d281b8ff1238fe80628a98ec060e5297a0265"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.5/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a61937df38b69b7861e95feb637e328f3779f30d080ddf54cf906eb92116b47b"
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
