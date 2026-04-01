class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.2.12"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.12/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "0657e3d9c6aa7e84cb0c3a5b6ceaa31b890f70d22c38a136b450566fc8bfa6d0"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.12/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "95fc99cc2d0642d03d96d6cf446a18d39a0dc75a100bf2f4ba304e8b8a18d304"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.12/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "88121146c91857b1bc74360fb2a320fc1f6feb848e1a3531ee84f5a16f83a9cc"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.12/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0ecc5430d9d9a78f4df95e14c920897b7ceda1c7102ac132bf6063440e92ef96"
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
