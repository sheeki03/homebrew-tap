class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.2.4"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.4/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "96df01b56c58e5c0f2ae8eaf630f3d2b4540e1c25c231194e99c85a88fa36a13"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.4/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "4b8b0f011f1a3ace4fd7974366d9aeb705c00a84612c91b823a7597e74717756"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.4/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e478ea10054d3b316f33c52baf43fb2976f111b73ad485a530efc974d30e6d11"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.4/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8d8baac0af06b052c6d3afaa5d9522312df957ca974e34c68553d980309d63fc"
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
