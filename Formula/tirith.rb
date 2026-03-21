class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.2.8"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.8/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "6826e2a6b640e45a31592cb7ca228bf6841652fb5df1e857ff66ec3d7519d9e4"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.8/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "9797c998cfd1e6e0a0f0cc2c9192b248f30940dbc26b3b63ce345faea989894c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.8/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "59aec0714b3234c894fe91434f7aad6dcf3a428244943dd27667fcee59f1bc15"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.8/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fbfc863ea055547315489b4346e0d0846ce532e66c0a158bcb9e78826af36995"
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
