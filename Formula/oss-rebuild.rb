class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/f4bac2c6121fd9bae5fa43bc8200f53a33ad66b4.tar.gz"
  version "2026.09.03-f4bac2c"
  sha256 "f32acdd85d6c13ddbc9ddeb4d3365a6f5fed1d198d59ea7f71a444db89125af8"
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
