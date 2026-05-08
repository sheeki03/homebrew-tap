class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.3.1"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.3.1/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "f221473159ca2b41af296427bbc21de23a9809fbc7393b4afd6d7306ca3107f1"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.3.1/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "82bc4616f08809784e519a7d1d7aa92205cf630874e60c7995895d6fa2001ea7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.3.1/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0462fe5083b4c72c45a8de918d5413e21d17aa8077aa7dbe53c0876b112847bb"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.3.1/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "571e6a300e4c444293476537a322666069e561c7f05283d6650f5b8ef83db3ac"
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
