class Mfcuk < Formula
  desc "MiFare Classic Universal toolKit"
  homepage "https://code.google.com/p/mfcuk/"
  url "https://mfcuk.googlecode.com/files/mfcuk-0.3.8.tar.gz"
  sha256 "977595765b4b46e4f47817e9500703aaf5c1bcad39cb02661f862f9d83f13a55"

  bottle do
    cellar :any
    sha256 "8b329dbd3feb25bc4f04f40451cf25e832395721a5184eb4ee287366aaa06334" => :el_capitan
    sha256 "bdf696192e1a660b2fa1ad58498bdce941b1d45c4b51847b95427f41debd4c2d" => :yosemite
    sha256 "1394e4115a4e65abacc23e81659fd77475d6039ac39979cea7fd335ee5cf09e6" => :mavericks
  end

  depends_on "pkg-config" => :build
  depends_on "libnfc"
  depends_on "libusb"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system bin/"mfcuk", "-h"
  end
end
