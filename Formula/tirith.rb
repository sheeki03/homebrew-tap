class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.3.0/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "e12a2a6d53f8f16b5ea2c08f8510624a03f37c1cb7ab800cb67200a02b1a8e06"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.3.0/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "2df8f142b10db9adb9c205cb2539b887235cafe3066607020c75f9c472fe343f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.3.0/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ac9981269557ae338a1a75e92904691d8b865caa6e4fd0fa059fe64e69ca74ed"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.3.0/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "111471db8839013a0875f076f70437a78d8f4cf3d3f90ba0b3f096c558478257"
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
