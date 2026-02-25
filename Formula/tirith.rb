class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.0/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "6271f913ed031d3f2eda6ba1ddc986fda8e2e5ff929815e6f27c95983ec25bf8"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.0/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "e533eafee60779225c977b8d8f04593fddbd9bbfe488ff57039051cf1023c457"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.0/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8606d56769e9ef0030a2ad32bbd0aad208f6da299cafeffa132d780c46e2b567"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.2.0/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "005a8dbaee9613b41e74b1e9fb3cdf270320b71f9c9635886852447b6d889cef"
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
