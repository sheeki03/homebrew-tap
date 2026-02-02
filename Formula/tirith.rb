class Tirith < Formula
  desc "URL security analysis for shell environments"
  homepage "https://github.com/sheeki03/tirith"
  license "Apache-2.0"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.1/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "01e3f2308ff341502ae27f46a73e2de9da49220766882400171be1eca734e361"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.1/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "e6c043686962701e8294b11acb7b0b5fd1d96539e48d492d674378adf5e6725e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.1/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "524ee3fdea82d632745808856da9cd94d41868ba134940186a1a60b51355b6c9"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.1/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ef65b2ca31c2fed28d2ad523bb8157e621fe13cc6f0a2cdc33fdba1d33c8788c"
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
      To activate tirith, add this line to your shell profile:

        For zsh  (~/.zshrc):   eval "$(tirith init)"
        For bash (~/.bashrc):  eval "$(tirith init)"
        For fish (~/.config/fish/config.fish):  tirith init | source

      Then restart your terminal or run:
        source ~/.zshrc    # (or ~/.bashrc)

      Verify with:
        tirith doctor
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tirith --version")
    system bin/"tirith", "doctor"
  end
end
