class Opengrep < Formula
  desc "Static code analysis engine to find security issues in code"
  homepage "https://github.com/opengrep/opengrep"
  version "1.29.0"
  license "LGPL-2.1-only"

  on_macos do
    on_arm do
      url "https://github.com/opengrep/opengrep/releases/download/v#{version}/opengrep_osx_arm64"
      sha256 "dacc12a24e95b22c8b1ab55be1777b6eb877a922c5571a95b9a8de30f3963438"
    end
    on_intel do
      url "https://github.com/opengrep/opengrep/releases/download/v#{version}/opengrep_osx_x86"
      sha256 "7173bd701491b58e1d1f62c24470ca0be124ecd63885c4d6293cbf71fd706508"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/opengrep/opengrep/releases/download/v#{version}/opengrep_manylinux_aarch64"
      sha256 "db3cda6e6e53251a3874e62b7c8493c281508480b3f3b4db554be41583b21174"
    end
    on_intel do
      url "https://github.com/opengrep/opengrep/releases/download/v#{version}/opengrep_manylinux_x86"
      sha256 "3365ef49d04893e01338d85d9bbd49b2bd5261ad4c9c0df0a6a0f8d44232ae13"
    end
  end

  def install
    bin.install Dir["*"].first => "opengrep"
  end

  test do
    (testpath/".config").mkpath
    (testpath/".cache").mkpath
    assert_match version.to_s, shell_output("#{bin}/opengrep --version")
  end
end
