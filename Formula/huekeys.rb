# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Huekeys < Formula
  desc 'Control the keyboard backlight on System76 laptops'
  homepage 'https://github.com/BitPonyLLC/huekeys'
  url 'https://github.com/BitPonyLLC/huekeys/releases/download/0.4.1/huekeys'
  version "0.4.1"
  sha256 "696e94486b918791f21117b6659bcec7cdea2a6774a95342afeeaaba76bb65e7"
  license 'MIT'

  depends_on :linux

  def install
    bin.install 'huekeys'
  end

  test do
    assert_match "0.4.1", shell_output("#{bin}/huekeys --version", 2)
  end
end
