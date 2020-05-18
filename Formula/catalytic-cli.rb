class CatalyticCli < Formula
  desc "Catalytic CLI"
  homepage "https://catalytic-developer.readme.io/reference/cli"
  version "1.0.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/catalyticlabs/homebrew-catalytic/releases/download/v1.0.0-cli/catalytic_1.0.0_osx-x64.tar.gz"
    sha256 "572c9fc3343a33c5d7b1ff4656d94bd155e5a256397dabe29a1485a0735afb0d"
  elsif OS.linux?
    url "https://github.com/catalyticlabs/homebrew-catalytic/releases/download/v1.0.0-cli/catalytic_1.0.0_linux-x64.tar.gz"
    sha256 "dce14bae7c9e8b5d5a30108d53417da11b5cf0ef392979d5fd27deb65e9b517b"
  end

  def install
    libexec.install Dir["cli/*"]
    File.chmod(0777, libexec/"Catalytic.CLI")
    bin.install_symlink libexec/"Catalytic.CLI" => "catalytic"
  end

  test do
    help_text = shell_output("#{bin}/catalytic --help")
    assert_includes help_text, "Catalytic"
    assert_includes help_text, "CLI"
  end
end
