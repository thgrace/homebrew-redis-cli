class Container < Formula
  desc "Create and run Linux containers using lightweight virtual machines on Mac"
  homepage "https://github.com/apple/container"
  url "https://github.com/apple/container/releases/download/1.4.1/container-1.4.1-installer-signed.pkg",
      using: :nounzip
  sha256 "c0d2716afefbb194c93fae662e9cae7cc186bcbcf746816608ec673dd648a6a4"
  license "Apache-2.0"
  head "https://github.com/apple/container.git", branch: "main"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  def install
    system "pkgutil", "--expand-full", cached_download, "pkg"

    (libexec/"root").install Dir["pkg/Payload/*"]
    bin.write_exec_script libexec/"root/bin/container"
  end

  def caveats
    <<~EOS
      container requires macOS 26 and Apple silicon.

      Start the system service with:
        container system start
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/container --version")
  end
end
