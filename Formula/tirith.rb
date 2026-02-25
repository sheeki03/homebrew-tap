class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.2.2"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.2/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "85be75c50c317c0a5bd161f0faf2e28273bb599b5f0ca64bcf558b1a82b93f37"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.2/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "c5234efc3a154b4f10aba99cd139ab2ba59fe6b7b6ca8c6e19062b1ec42c2e5b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.2/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ef63e6352494164f660bd78349c1d55a51cdedeceab0c1d933fe4073a9a792fd"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.2/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f80841b6c88c8b6b84469602d00e06b2d54395366626f67b4e32a7a307a3311a"
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
