class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.3/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "c1642784e9e9b06aa437820bb795390aa7d124a1cbdfd42966f2c798420e3654"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.3/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "27636192aca050a02fa0e0101213d87e1cdc7113258d3cd3e723868487b9b270"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.3/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0e01952e91814a24eda6b2cc669580664ded43d2d909970c431dfc5f8ff84251"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.3/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f6be13c8b902b2fac7d5b7c8c5ae8dfaddcee47cf7a83c46d6dcc3d970712c53"
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
