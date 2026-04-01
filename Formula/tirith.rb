class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.2.12"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.12/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "87b98cc4ce9862b76a096f1c14a4dc9eb84a30d16020ca084ac450c7b1246d62"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.12/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "cef651abab534ab5f89517ef991b0fd8b470eaa48db844974eaf681978bad072"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.12/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9762f4c70ba3f1dd8efeea9a583d7bd0fb09a6c153a39ec7d2d7f78a7a148a2c"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.12/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af9b4727c102bdca6ef8ef17faaed8106bc23081d02d532aeb6b3bb9bc492b0b"
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
