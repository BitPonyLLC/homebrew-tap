# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Huekeys < Formula
  desc 'Control the keyboard backlight on System76 laptops'
  homepage 'https://github.com/BitPonyLLC/huekeys'
  url 'https://github.com/BitPonyLLC/huekeys/releases/download/v0.4.7/huekeys'
  version "v0.4.7"
  sha256 "570b679037b44e8fd22b9329cf44c71406dc36b4ad6b29b541345616430f1b94"
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
