class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.3.3"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.3.3/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "720ed4637d16fed908c2d268fd1da854632a15d59ce74c3d78903c5a92ccbc1c"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.3.3/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "3484968821debe2c0b987b14459da2615dcc45f81acbb2fb59037b16e2d5a3d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.3.3/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c784233083003a6a1533db9ebba30b1a7bb7cefaa239db6ca121598b384cca1a"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.3.3/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6cdbe35e8f9ccf42e70ad95b501c93cd218ac18201c3df958d54f6ba0d995ce2"
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
