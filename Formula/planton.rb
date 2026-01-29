class Planton < Formula
  version "v0.0.22-cli.20260129.0"
  desc "planton: CLI interface for Planton Cloud"
  homepage "https://planton.cloud"
  os_arch = `arch`
  arch = (os_arch.include? "arm64")? "arm64" : "amd64"
  url "https://downloads.planton.ai/cli/#{version}/planton-#{version}-darwin-#{arch}"
  def install
    os_arch = `arch`
    arch = (os_arch.include? "arm64")? "arm64" : "amd64"
    binary_name="planton-#{version}-darwin-#{arch}"
    bin.install "#{binary_name}"
    mv bin/"#{binary_name}", bin/"planton"
    # Remove macOS quarantine attribute to avoid Gatekeeper warning
    system "xattr", "-dr", "com.apple.quarantine", bin/"planton" if OS.mac?
  end

  def caveats
    <<~EOS
      ✨ Installation Complete!

      Next Steps

      1. Authenticate with Planton Cloud:

         planton auth login

         This will open your browser to log in with your planton.cloud credentials.

      2. Set your organization context:

         planton context set --org acmecorp

         This sets the default organization for all CLI commands.

      3. (Optional) Set your environment context:

         planton context set --org acmecorp --env prod

         This sets the default environment for cloud resource operations.

      Happy deploying! 🚀

      For more help, visit https://planton.ai/docs or run:

         planton --help
    EOS
  end
end
