source 'https://supermarket.chef.io'

metadata

group :integration do
  cookbook 'embulk_test', path: './test/fixtures/cookbooks/embulk_test'

  # not a strict dependency, but necessary for TK testing
  cookbook 'java'
  cookbook 'curl'
end
