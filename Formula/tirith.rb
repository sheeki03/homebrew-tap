class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.3.2"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.3.2/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "7d2f9e69c3dbb8d0e8a501054db067904f0f4c8945fd135bbdb8e3acffbc3dec"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.3.2/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "8f9ad63a36ae104b7fcbdcd4efd5868e299c48003432ffc4993f50679e482943"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.3.2/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cf95efe4ae5f499dc7decfdb15d296425979afc845af3cdd87fe29c3f4dea20d"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.3.2/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c49707097abfffb3b92da9d03182549add9db70a4421242ece1d330871b9365"
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
