require 'formula'

class Solidity < Formula

  desc "The Solidity Contract-Oriented Programming Language"
  homepage "http://solidity.readthedocs.org"
  url "https://github.com/ethereum/solidity/archive/v0.4.1.tar.gz"
  version "0.4.1"
  sha256 "83c2c5ac350efe862f481254c78e0bcc2e3ac67a4dbdcef87ba6b4e1b4e58871"

  depends_on "cmake" => :build
  depends_on "boost" => "c++11"
  depends_on "cryptopp"
  depends_on "gmp"
  depends_on "jsoncpp"

  def install
    system "/bin/echo '4fc6fc2' > commit_hash.txt"
    touch "prerelease.txt"
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "#{bin}/solc", "--version"
  end
end
