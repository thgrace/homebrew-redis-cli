class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/888b6e96fe08f8103515824f691f917e95c7c0e6.tar.gz"
  version "2026.09.01-888b6e9"
  sha256 "833cabac5681da3d08a48b70631404ee783804e2662fa625bc1e8832cdc44fe3"
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
