class ClaudeSync < Formula
  include Language::Python::Shebang

  desc "Sync Claude Code configuration between machines via git"
  homepage "https://github.com/rydersd/claudeTools"
  url "https://github.com/rydersd/claudeTools/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "d1b871b8b2637f98fd1b7f9f1eeb08378b055e25c84c1c8282f081224ac7d0f9"
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
