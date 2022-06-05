# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Huekeys < Formula
  desc 'Control the keyboard backlight on System76 laptops'
  homepage 'https://github.com/BitPonyLLC/huekeys'
  url 'https://github.com/BitPonyLLC/huekeys/releases/download/v0.4.6/huekeys'
  version "v0.4.6"
  sha256 "eee1b07e8a23ecb7a4cc4871d94377ad081bdb2e28d148674c9f3bd9993fadd7"
  license 'MIT'

  depends_on :linux

  def install
    bin.install 'huekeys'
  end

  test do
    assert_match "v0.4.6", shell_output("#{bin}/huekeys --version", 2)
  end
end
