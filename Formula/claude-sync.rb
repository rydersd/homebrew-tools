class ClaudeSync < Formula
  desc "Sync Claude Code configuration between machines via git"
  homepage "https://github.com/rydersd/claudeTools"
  url "https://github.com/rydersd/claudeTools/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "a6f5b0b39ff79bcf5d9f552781884bb563640dedf344939a5cb960ea94612d47"
  license "MIT"
  head "https://github.com/rydersd/claudeTools.git", branch: "main"

  depends_on "python@3"

  def install
    libexec.install "claude-sync.py"

    (bin/"claude-sync").write <<~EOS
      #!/bin/bash
      exec "#{Formula["python@3"].opt_bin}/python3" "#{libexec}/claude-sync.py" "$@"
    EOS
  end

  test do
    assert_match "Sync Claude Code configuration", shell_output("#{bin}/claude-sync --help")
  end
end
