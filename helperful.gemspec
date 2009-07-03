# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{helperful}
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Simone Carletti"]
  s.date = %q{2009-07-03}
  s.description = %q{    Helperful aims to be a collection of useful and reusable Rails helpers.
}
  s.email = %q{weppos@weppos.net}
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "lib/helperful/affiliations_helper.rb", "lib/helperful/asset_tag_helper.rb", "lib/helperful/content_helper.rb", "lib/helperful/deprecations.rb", "lib/helperful/javascript_helper.rb", "lib/helperful/title_helper.rb", "lib/helperful/version.rb", "lib/helperful.rb", "LICENSE.rdoc", "README.rdoc"]
  s.files = ["CHANGELOG.rdoc", "helperful.gemspec", "init.rb", "install.rb", "lib/helperful/affiliations_helper.rb", "lib/helperful/asset_tag_helper.rb", "lib/helperful/content_helper.rb", "lib/helperful/deprecations.rb", "lib/helperful/javascript_helper.rb", "lib/helperful/title_helper.rb", "lib/helperful/version.rb", "lib/helperful.rb", "LICENSE.rdoc", "Manifest", "rails/init.rb", "Rakefile", "README.rdoc", "tasks/helperful_tasks.rake", "test/affiliations_helper_test.rb", "test/asset_tag_helper_test.rb", "test/content_helper_test.rb", "test/fixtures/content/has_content.html.erb", "test/fixtures/content/has_content_is_called_alone.html.erb", "test/fixtures/layouts/has_content.html.erb", "test/helperful_test.rb", "test/javascript_helper_test.rb", "test/test_helper.rb", "test/title_helper_test.rb", "uninstall.rb"]
  s.homepage = %q{http://code.simonecarletti.com/helperful}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Helperful", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{A collection of useful Rails helpers.}
  s.test_files = ["test/affiliations_helper_test.rb", "test/asset_tag_helper_test.rb", "test/content_helper_test.rb", "test/helperful_test.rb", "test/javascript_helper_test.rb", "test/test_helper.rb", "test/title_helper_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0.8"])
      s.add_development_dependency(%q<echoe>, [">= 3.1"])
      s.add_development_dependency(%q<mocha>, [">= 0.9"])
    else
      s.add_dependency(%q<rake>, [">= 0.8"])
      s.add_dependency(%q<echoe>, [">= 3.1"])
      s.add_dependency(%q<mocha>, [">= 0.9"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0.8"])
    s.add_dependency(%q<echoe>, [">= 3.1"])
    s.add_dependency(%q<mocha>, [">= 0.9"])
  end
end
