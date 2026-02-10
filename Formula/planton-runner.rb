class PlantonRunner < Formula
  version "v0.0.22-runner.20260210.2"
  desc "planton-runner: Unified agent for Cloud Operations and Automation Workflows"
  homepage "https://planton.ai"
  os_arch = `arch`
  arch = (os_arch.include? "arm64")? "arm64" : "amd64"
  url "https://downloads.planton.ai/runner/#{version}/planton-runner-#{version}-darwin-#{arch}"
  def install
    os_arch = `arch`
    arch = (os_arch.include? "arm64")? "arm64" : "amd64"
    binary_name="planton-runner-#{version}-darwin-#{arch}"
    bin.install "#{binary_name}"
    mv bin/"#{binary_name}", bin/"planton-runner"
    # Remove macOS quarantine attribute to avoid Gatekeeper warning
    system "xattr", "-dr", "com.apple.quarantine", bin/"planton-runner" if OS.mac?
  end

  def caveats
    <<~EOS
      Installation Complete!

      Planton Runner is a unified agent that establishes a secure reverse tunnel
      to the Planton Control Plane for cloud operations and IaC execution.

      Quick Start

      1. Register a runner and generate credentials:

         planton runner register --name my-runner
         planton runner generate-credentials my-runner

      2. Start the runner in gRPC mode (CloudOps):

         planton-runner \\
           --channel-id org.myorg.runner.my-runner \\
           --tunnel-host runner-tunnel.planton.live \\
           --ca-cert ~/.planton/certs/ca.crt \\
           --agent-cert ~/.planton/certs/agent.crt \\
           --agent-key ~/.planton/certs/agent.key

      3. Check the version:

         planton-runner version

      Prerequisites (for IaC operations in temporal/dual mode)

        brew install pulumi
        brew install opentofu
        brew install go

      For more help, run:

         planton-runner --help

      Documentation: https://planton.ai/docs
    EOS
  end
end
