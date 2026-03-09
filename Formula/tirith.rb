class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.2.6"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.6/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "93f9a12c2aa3f910108a8e7b0607135330a3164c00dc897df9f86d3b28bc76b3"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.6/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "6053cdf07297d8536c2d69941115dc0b9fa99df19ef15e49856183c11b1e7688"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.6/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aa72792d4e95f298807bd5fbb6e17aab7b42fc5e108e1e1e9da1a721ff065b0f"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.6/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ddec2315085ca6892d8baffd198591d39b0cce726d32ca8c41be3ae9a2f16e99"
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
