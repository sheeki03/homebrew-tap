class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.5.0/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "9de9d965cb528adb46bacca37f879347b075487b99119ad7dc1e732bdfd9c5f5"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.5.0/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "7f55d7b8287566207e0c712972d432acfca8392c9ffe8b9c0daf469351756ad7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.5.0/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e9f3d685f0a5ba210c67e763749905915a1b34099a1419f9ce87a1ee60b9fc37"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.5.0/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e2a87b1fbb967e8d37bc9c3c19bcd97f7979c9253e2f600d9293fce4d86d07ce"
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
