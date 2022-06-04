# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Huekeys < Formula
  desc 'Control the keyboard backlight on System76 laptops'
  homepage 'https://github.com/BitPonyLLC/huekeys'
  url 'https://github.com/BitPonyLLC/huekeys/releases/download/v0.4.4/huekeys'
  version "v0.4.4"
  sha256 "316a9f9ae70934d8d592a559f0d5c77969ed8c411cb505826d6627b7a674b204"
  license 'MIT'

  depends_on :linux

  def install
    bin.install 'huekeys'
  end

  test do
    assert_match "v0.4.4", shell_output("#{bin}/huekeys --version", 2)
  end
end
