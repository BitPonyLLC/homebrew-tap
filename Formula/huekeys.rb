# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Huekeys < Formula
  desc 'Control the keyboard backlight on System76 laptops'
  homepage 'https://github.com/BitPonyLLC/huekeys'
  url 'https://github.com/BitPonyLLC/huekeys/releases/download/v0.5.7/huekeys'
  version "v0.5.7"
  sha256 "a9eec1b3af59b24f9025c3ee0e9535ea3108fcd4ea53c443b3e16443d7c87b14"
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
