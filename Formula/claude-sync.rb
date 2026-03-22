class ClaudeSync < Formula
  include Language::Python::Shebang

  desc "Sync Claude Code configuration between machines via git"
  homepage "https://github.com/rydersd/claudeTools"
  url "https://github.com/rydersd/claudeTools/archive/refs/tags/v1.1.0"
  sha256 "e70e7ccad2b10e4f3c712ede30717ff862d8d72af2360d14733278d9b1f07eed"
  license "MIT"
  head "https://github.com/rydersd/claudeTools.git", branch: "main"

  depends_on "python@3"

  def install
    bin.install "claude-sync.py" => "claude-sync"
    bin.install "claude-sync-mcp.py" => "claude-sync-mcp"
    rewrite_shebang detected_python_shebang, bin/"claude-sync"
    rewrite_shebang detected_python_shebang, bin/"claude-sync-mcp"
  end

  test do
    assert_match "Sync Claude Code configuration", shell_output("#{bin}/claude-sync --help")
  end
end
