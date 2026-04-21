class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.3.0/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "36f47db896378ec584ff31a53af070dbae27f8c3e72e74f0ef18fe5e15278615"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.3.0/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "de159aaca436881dfde1db5921d3806fa42844c6eb1755c690bb19cfaac50f17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.3.0/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0c3bc5f6b0b903c399788727c469edd153089d6787234f5bcc045197a5c1e923"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.3.0/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "802996e112d58182d8d1a5194c894f7f5195fe72e1726a9da517b5ed5cc92f82"
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
