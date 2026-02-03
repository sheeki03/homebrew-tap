class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.3/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "79a76182ba0093c9a3bae3a89cc3f79e97fd207bc898c881b5bda9a39ce6f409"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.3/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "3fcdc8143734f6e4deac7a7b749f185e6cba0d6582dd4b72119bdcb5394423be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.3/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c9d49f23debdfbfb0caadbb99981dca2b93ac5a7160d5467f91c678bb8e6e954"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.3/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3ec6cc575751c714e334e1b08948969e7ce9fc31061e8f90e1dfb6c5c0ca1b1a"
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
