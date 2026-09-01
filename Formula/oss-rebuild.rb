class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/8ab7df60816adde206ad0af26264ccd47b16f8f9.tar.gz"
  version "2026.09.01-8ab7df6"
  sha256 "2117c6ab3ec731a5694600be9b071120ceadb5eb0e7e8a7755e94fee7ab8d576"
  license "Apache-2.0"
  head "https://github.com/google/oss-rebuild.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"oss-rebuild"), "./cmd/oss-rebuild"
  end

  test do
    system bin/"oss-rebuild", "--help"
  end
end
