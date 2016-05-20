# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: myob-essentials-api 0.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "myob-essentials-api"
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["BrunoChauvet"]
  s.date = "2016-05-20"
  s.description = "Integrate with MYOB Essentials Accounting"
  s.email = "it@maestrano.com"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".ruby-version",
    ".travis.yml",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/myob-essentials-api.rb",
    "lib/myob/essentials/api/client.rb",
    "lib/myob/essentials/api/helper.rb",
    "lib/myob/essentials/api/model/account.rb",
    "lib/myob/essentials/api/model/account_balance.rb",
    "lib/myob/essentials/api/model/account_classification.rb",
    "lib/myob/essentials/api/model/account_type.rb",
    "lib/myob/essentials/api/model/base.rb",
    "lib/myob/essentials/api/model/business.rb",
    "lib/myob/essentials/api/model/contact.rb",
    "lib/myob/essentials/api/model/inventory_item.rb",
    "lib/myob/essentials/api/model/sale_invoice.rb",
    "lib/myob/essentials/api/model/sale_payment.rb",
    "lib/myob/essentials/api/model/tax_type.rb",
    "myob-essentials-api.gemspec",
    "spec/fixtures/account/classifications.json",
    "spec/fixtures/account/classifications/1.json",
    "spec/fixtures/account/types.json",
    "spec/fixtures/account/types/1.json",
    "spec/fixtures/base1.json",
    "spec/fixtures/base2.json",
    "spec/fixtures/base3.json",
    "spec/fixtures/businesses.json",
    "spec/fixtures/businesses/168254.json",
    "spec/fixtures/businesses/168254/contacts.json",
    "spec/fixtures/businesses/168254/contacts/3604150.json",
    "spec/fixtures/businesses/168254/generalledger/accounts.json",
    "spec/fixtures/businesses/168254/generalledger/accounts/10108109.json",
    "spec/fixtures/businesses/168254/inventory/items.json",
    "spec/fixtures/businesses/168254/inventory/items/987816.json",
    "spec/fixtures/businesses/168254/sale/invoices.json",
    "spec/fixtures/businesses/168254/sale/invoices/35608735.json",
    "spec/fixtures/tax/types.json",
    "spec/fixtures/tax/types/5.json",
    "spec/myob/essentials/api/client_spec.rb",
    "spec/myob/essentials/api/model/account_classification_spec.rb",
    "spec/myob/essentials/api/model/account_spec.rb",
    "spec/myob/essentials/api/model/account_type_spec.rb",
    "spec/myob/essentials/api/model/base_spec.rb",
    "spec/myob/essentials/api/model/business_spec.rb",
    "spec/myob/essentials/api/model/contact_spec.rb",
    "spec/myob/essentials/api/model/inventory_item_spec.rb",
    "spec/myob/essentials/api/model/sale_invoice_spec.rb",
    "spec/myob/essentials/api/model/sale_payment_spec.rb",
    "spec/myob/essentials/api/model/tax_type_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/BrunoChauvet/myob-essentials-api"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Integrate with MYOB Essentials Accounting"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<oauth2>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<oauth2>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<oauth2>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end

