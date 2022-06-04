# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Huekeys < Formula
  desc 'Control the keyboard backlight on System76 laptops'
  homepage 'https://github.com/BitPonyLLC/huekeys'
  url 'https://github.com/BitPonyLLC/huekeys/releases/download/v0.4.5/huekeys'
  version "v0.4.5"
  sha256 "a6bdae861017775681df353a9d230e5b1d2c2d0ad36ebca6a6079f2b418d9146"
  license 'MIT'

  depends_on :linux

  def install
    bin.install 'huekeys'
  end

  test do
    assert_match "v0.4.5", shell_output("#{bin}/huekeys --version", 2)
  end
end
