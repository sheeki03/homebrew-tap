class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.4.1"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.4.1/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "87e17384a9a905c64acc4d5d9396def638e80b1e703ef1def75f549cf3d212f9"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.4.1/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "e0320b6a5460a7c0f188c3a0c12a4614b76f53eccf0b401dbac5facf37b6a6f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.4.1/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a01e368e58a0c48714d9c85cf3a9c78b05d0256007d2c49caf15e92c349c3462"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.4.1/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a5035f4fde81b34cd0cf69d24151b1504552ae352b4eb7c88c49acd56289362e"
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
