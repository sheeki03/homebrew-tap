class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.2.7"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.7/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "47e1f18f413ab2fef9bfed358d0e0e82b16784ec31fd06845533e527e6657979"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.7/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "fb8f9e6fc84022e225bdabef34d990a1458cab1d631c73db9009665c0684f1a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.7/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "13d66539b2fb0ee9333bf56abcc7cdbcb13f84da84cbad46a50d25215809c01b"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.7/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1626d3b39611753a47cac3cd018dc09bd0fc8e5da8eb2841064b69731f195c36"
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
