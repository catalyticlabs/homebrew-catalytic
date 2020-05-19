class CatalyticCli < Formula
  desc "Catalytic CLI"
  homepage "https://catalytic-developer.readme.io/reference/cli"
  version "1.0.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/catalyticlabs/homebrew-catalytic/releases/download/v1.0.0-cli/catalytic_1.0.0_osx-x64.tar.gz"
    sha256 "ab73a8a9fb074ae34fd7d9dd9f9fc790a14be8fc22b04760699dc07d380bc9a5"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/catalyticlabs/homebrew-catalytic/releases/download/v1.0.0-cli/catalytic_1.0.0_linux-x64.tar.gz"
      sha256 "fc6324bd3abba00ff757d5ab411c663c0ce62ff5ce82223c60504ff9c04cf2c8"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/catalyticlabs/homebrew-catalytic/releases/download/v1.0.0-cli/catalytic_1.0.0_linux-arm64.tar.gz"
        sha256 "ccb7e283e720c74e141d9ff027bb83b2df7c33e5177360d56666f0e010d4852b"
      else
        url "https://github.com/catalyticlabs/homebrew-catalytic/releases/download/v1.0.0-cli/catalytic_1.0.0_linux-arm.tar.gz"
        sha256 "2da6807dc286a67d9226526feaa1a6f385554a8482d6d48c3814b63ad1fd0253"
      end
    end
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
