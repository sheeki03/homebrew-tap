class Tirith < Formula
  desc "URL security analysis for shell environments"
  homepage "https://github.com/sheeki03/tirith"
  license "Apache-2.0"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.0/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "2e31b8a3102a1f7406c98789f2c62b667133dd08caac23a5378aeec6e50f8c05"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.0/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "659138b4c0c269af7a911fff07562a1eaf65f386d7ed9ca52dfa219126840483"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.0/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c4bd1a1f77673ae7d010491d751b4c17fb71ec058da1e5f24f56b4215fa4df82"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.0/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2cda252be083429cc90b317b3e7c08f26cfb466274b35081d1c6f7823f665177"
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
      Add to your shell profile:
        eval "$(tirith init)"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tirith --version")
    system bin/"tirith", "doctor"
  end
end
