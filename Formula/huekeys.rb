# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Huekeys < Formula
  desc 'Control the keyboard backlight on System76 laptops'
  homepage 'https://github.com/BitPonyLLC/huekeys'
  url 'https://github.com/BitPonyLLC/huekeys/releases/download/v0.4.8/huekeys'
  version "v0.4.8"
  sha256 "15806be4e8e29d11c0b632dc41e00342000d275e9a66335427f290ab8b47a106"
  license 'MIT'

  depends_on :linux

  def install
    ayatana = 'libayatana-appindicator3-1'
    `apt list --installed 2>/dev/null | grep -q ^#{ayatana}`
    unless $?.success?
      $stderr.puts "huekeys requires #{ayatana} to be installed"
      system 'sudo', 'apt', 'install', ayatana
    end
    bin.install 'huekeys'
  end

  test do
    assert_match self.version, shell_output("#{bin}/huekeys --version", 2)
  end
end
