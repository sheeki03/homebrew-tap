class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "Apache-2.0"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.2/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "4c3cc0367c7d498be34a8559c05708eed57d60a846bbdac256bf02985462f3e8"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.2/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "08e2f58c1ec57b66ab4ee3373ab0c7a2a627acdff08e6ef63ab67eae9850256b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.2/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cd00054570b9dc486fe9e042d16528e0c2f9f4e0b9d617146067eafcae7dc95d"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.2/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e5a437f2a6bce717296e1d95409c7241eed10cc5b6e51e62f880177cbb6234f5"
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
