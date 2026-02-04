class Tirith < Formula
  desc "Terminal security - catches homograph attacks, pipe-to-shell, ANSI injection"
  homepage "https://github.com/sheeki03/tirith"
  license "AGPL-3.0-only"
  version "0.1.7"

  on_macos do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.7/tirith-aarch64-apple-darwin.tar.gz"
      sha256 "da9d37266bb049071051076722f50769c07a54075d703716c50a947b66cf4f95"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.7/tirith-x86_64-apple-darwin.tar.gz"
      sha256 "3f9d464d9f46bf945b87a03427699ee602cda08cc85adaa146115b019ff4a183"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.7/tirith-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1fc4c6a681a8ae14032e7fe0193d0d43ea0bd9f3d704e91edd00158d65663f90"
    end
    on_intel do
      url "https://github.com/sheeki03/tirith/releases/download/v0.1.7/tirith-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b60cda89fe7bd2ea356157abd0c0e85617b554fe6561278bfb5df216aa52cda6"
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
