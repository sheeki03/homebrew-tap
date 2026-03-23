class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.2.9"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.9/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "4847dbb7e45948bbe81f2f5568512ff02b596284c913e7bb8c937907fce49cae"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.9/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "9b343e6cdbae99a908d85694ea31c8bc4a2e3fd6c0d723e46d575c5b700f47bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.9/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da10a4585e2e44c9ca1ed3a0ddf910860ce3988eddbcff71508b361ee9a599b4"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.9/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aa728b12421180c267f7859f38d2971fdea66d61d5c334b7e7c381c3edbb4f6a"
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
