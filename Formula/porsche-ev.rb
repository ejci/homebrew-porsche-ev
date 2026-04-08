class PorscheEv < Formula
  desc "Porsche Connect CLI & TUI Dashboard"
  homepage "https://github.com/ejci/porsche-ev"
  url "https://github.com/ejci/porsche-ev/archive/d2a695a555acd5908f25ae14cb251489b3929c48.tar.gz"
  sha256 "0c13ab288009ab938d959ba2758b3bb289ad99c2b4534c5b50fb506f2081e3be"
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
