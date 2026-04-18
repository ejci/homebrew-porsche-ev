class PorscheEv < Formula
  desc "Porsche Connect CLI & TUI Dashboard"
  homepage "https://github.com/ejci/porsche-ev"
  url "https://github.com/ejci/porsche-ev/archive/11666e97b04eefc3c20d87735c2e4d116bf30c6c.tar.gz"
  sha256 "9d641adb1205d32debc40a33f98d44fb1eb50d4f3d61c096f482d54911cdceeb"
  license "MIT"

  depends_on "node"

  def install
    # Fix broken shebang in upstream source
    inreplace "app.js", "#!/usr/bin / env node", "#!/usr/bin/env node"

    system "npm", "install", *std_npm_args(prefix: libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/porsche-ev", "--help"
  end
end
