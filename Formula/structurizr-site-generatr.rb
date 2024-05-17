# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class StructurizrSiteGeneratr < Formula
  desc "Static site generator for architecture models created with Structurizr DSL"
  homepage "https://avisi-cloud.github.io/structurizr-site-generatr/"
  url "https://github.com/avisi-cloud/structurizr-site-generatr/releases/download/1.2.5/structurizr-site-generatr-1.2.5.tar.gz"
  sha256 "1956e50fff911f9feac64e56e63747c76662752fbaf30d89e5545af826822f61"
  license "Apache-2.0"


  depends_on "graphviz"
  depends_on "openjdk"

  def install
    libexec.install Dir["*"]
    (bin/"structurizr-site-generatr").write_env_script libexec/"bin/structurizr-site-generatr", Language::Java.overridable_java_home_env
  end

  test do
    result = pipe_output("#{bin}/structurizr-site-generatr version").strip
    assert_match "Structurizr Site Generatr v#{version}", result
  end
end