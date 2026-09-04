class OssRebuild < Formula
  desc "CLI tool for OSS Rebuild"
  homepage "https://github.com/google/oss-rebuild"
  url "https://github.com/google/oss-rebuild/archive/f07582e4801bf4264183eb7e23834959b75a76d4.tar.gz"
  version "2026.09.03-f07582e"
  sha256 "0c71a4f85234728af96f1c5dafde26613e6a51a309e6a2e362651ff0a3f10774"
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
