class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/889ff40e8a512d9e7eb4054f88a7e845b566a87d.tar.gz"
  version "2026.08.24-889ff40"
  sha256 "2cf05b9a91720aaae11f49d204b2db7d3739e5dc2a14755e375d93152d3849af"
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
