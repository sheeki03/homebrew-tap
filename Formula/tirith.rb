class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.1/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "60a4fd8204663feb7acbd9b43a762b323d56538e3d535f892d0236f396d34f9e"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.1/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "faab6da152ba458295831dadc69c24d66050fd99420af95f1d009f64ffde37c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.1/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "226e2d7a6d18163631a08ac8b7b8d7bcbc6e4a8bb804d5a7d02aad4c351d0446"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.1/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "392a339c35afd825a0efca12d448db504a0e576e43ba2f6c4250857cf7595c9f"
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
