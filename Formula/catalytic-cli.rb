class CatalyticCli < Formula
  desc "Catalytic CLI"
  homepage "https://catalytic-developer.readme.io/reference/cli"
  version "0.0.2"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/catalyticlabs/homebrew-catalytic/releases/download/v0.0.2-pre-cli/catalytic_0.0.2_osx-64.tar.gz",
    :using => :curl
    sha256 "0d34eb04d22fb67ca62f0cd2c25d64890808d91700807994b0b9c1c7e9442cbf"
  elsif OS.linux?
    url "https://github.com/catalyticlabs/homebrew-catalytic/releases/download/v0.0.2-pre-cli/catalytic_0.0.2_linux-x64.tar.gz"
    sha256 "875b2f698af86a141e9b19456a1cd23a302f0c6f7761474cc9324a0fafc63eec"
  end

  def install
    libexec.install Dir["cli/*"]
    bin.install_symlink libexec/"Catalytic.CLI" => "catalytic"
  end

  test do
    help_text = shell_output("#{bin}/catalytic --help")
    assert_includes help_text, "Catalytic"
    assert_includes help_text, "CLI"
  end
end
