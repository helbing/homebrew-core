class Pinentry < Formula
  desc "Passphrase entry dialog utilizing the Assuan protocol"
  homepage "https://www.gnupg.org/related_software/pinentry/"
  url "https://gnupg.org/ftp/gcrypt/pinentry/pinentry-0.9.7.tar.bz2"
  mirror "https://www.mirrorservice.org/sites/ftp.gnupg.org/gcrypt/pinentry/pinentry-0.9.7.tar.bz2"
  sha256 "6398208394972bbf897c3325780195584682a0d0c164ca5a0da35b93b1e4e7b2"

  bottle do
    cellar :any
    sha256 "900f11f54736c466347729a8637aa6c7fea1f87a73797783bfb0b60d33f85e7a" => :el_capitan
    sha256 "5fd170e47d35060f0039da259f53455a562c283a7777cb95fdf27fd6400c8d69" => :yosemite
    sha256 "a920f43f3468e847e3ea52d30b3e655d4c3d9e386dd876722bd6f4418612e6c8" => :mavericks
    sha256 "45c37ab285fd6422ec33d9822a1598810b7a122f9491fe569b266ee9b4de0645" => :mountain_lion
  end

  depends_on "pkg-config" => :build
  depends_on "libgpg-error"
  depends_on "libassuan"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--disable-pinentry-qt4",
                          "--disable-pinentry-gtk2",
                          "--disable-pinentry-gnome3"
    system "make", "install"
  end

  test do
    system "#{bin}/pinentry", "--version"
  end
end
