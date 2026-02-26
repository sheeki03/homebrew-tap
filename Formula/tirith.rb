class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.2.3"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.3/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "9d59b3f0bb4543acc5849de847e1390eb8346ba412ce34fdb3c406a0c2bcc6b4"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.3/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "d86b52873fc671c0358ffb1f835e7669a1bb464e5198979c40045d8178ea0596"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.3/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8253c52de90b4bca49e822a2a4904c2b55e5872c003d0a2f02b8bdb83ca2b450"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.3/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "862163d006cf8df443713d47121e54c898f211fcddcd1abd35bc17294c8efc2b"
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
