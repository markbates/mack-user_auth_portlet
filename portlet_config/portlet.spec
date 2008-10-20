Mack::Portlet.portlet_spec = Gem::Specification.new do |s|
  s.name = "mack-user_auth_portlet"
  s.version = "0.0.1"
  s.summary = "mack-user_auth_portlet portlet for the Mack Framework"
  s.description = "mack-user_auth_portlet portlet for the Mack Framework"
  s.author = "markbates"
  s.email = ""
  s.homepage = ""

  s.test_files = FileList['test/**/*']

  s.files = FileList['lib/**/*', 'README', 'doc/**/*.*', 'bin/**/*']
  s.require_paths << 'lib'

  s.bindir = "bin"
  # s.executables << ""
  #s.default_executable = ""
  #s.add_dependency("", "")
  #s.add_dependency("", "")
  #s.extensions << ""
  s.extra_rdoc_files = ["README"]
  s.has_rdoc = true
  #s.platform = "Gem::Platform::Ruby"
  #s.required_ruby_version = ">= 1.8.6"
  #s.requirements << "An ice cold beer."
  #s.requirements << "Some free time!"
  s.rubyforge_project = "mack-user_auth_portlet"
end
