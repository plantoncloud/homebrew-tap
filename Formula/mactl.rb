class Mactl < Formula
  version "v0.0.17"
  desc "mactl: cli to quickly bootstrap macbooks."
  homepage "https://github.com/plantoncloud/mactl"
  os_arch = `arch`
  arch = (os_arch.include? "arm64")? "arm64" : "amd64"
  url "https://storage.googleapis.com/mactl/#{version}/mactl-#{version}-#{arch}"
  def install
    os_arch = `arch`
    arch = (os_arch.include? "arm64")? "arm64" : "amd64"
    binary_name="mactl-#{version}-#{arch}"
    bin.install "#{binary_name}"
    mv bin/"#{binary_name}", bin/"mactl"
  end
end
