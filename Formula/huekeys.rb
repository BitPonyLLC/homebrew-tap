# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Huekeys < Formula
  desc 'Control the keyboard backlight on System76 laptops'
  homepage 'https://github.com/BitPonyLLC/huekeys'
  url 'https://github.com/BitPonyLLC/huekeys/releases/download/v0.5.1/huekeys'
  version "v0.5.1"
  sha256 "6e96ac4bc320eeb16a0a8e4a539095f49257e17cc479134b223f9cbfe12a9410"
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

  def post_install
    system "#{bin}/huekeys", "restart"
  end

  test do
    assert_match self.version, shell_output("#{bin}/huekeys --version", 2)
  end
end
