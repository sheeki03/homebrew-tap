class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.2.12"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.12/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "79edb30646bd95770266712290e6130b0160bf0370bca834cd8478254932ff8f"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.12/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "43ad065cb112a372b1ae6485a694b6c3a8bc4c86c825d5e6eae47cadfca1f27c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.12/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f11f471cd1707530dd3e3b4a5a4dcfb6527d1986c98156958806fe7b26a2db7d"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.12/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6eaad5af09f2adbc8f14d73ccbd80999af0e21c8377473bd95c05f7ddb851434"
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
