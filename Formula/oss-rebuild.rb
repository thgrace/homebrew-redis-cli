class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/795914a72c63328545449558b065f2c07569c97d.tar.gz"
  version "2026.08.27-795914a"
  sha256 "2ba6ea9aa94ab9767a2ea92775851f6fff3d66c41ad74d8488ed7f5be3154881"
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
