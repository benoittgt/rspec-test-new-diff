# Rspec test diff

## Use this code

I use local version of gem
```
$ cat .bundle/config
---
BUNDLE_LOCAL__RSPEC-EXPECTATIONS: "/Users/bti/code/rspec-expectations"
BUNDLE_LOCAL__RSPEC-SUPPORT: "/Users/bti/code/rspec-support"
```

Run `bundle exec rspec ./spec/test_diff_spec.rb`

## Current output

```
$ clear; bundle exec rspec --color ./spec/test_diff_spec.rb
/Users/bti/code/rspec-support/lib/rspec/support/caller_filter.rb:9: warning: already initialized constant RSpec::CallerFilter::RSPEC_LIBS
/Users/bti/.rvm/gems/ruby-2.4.1/gems/rspec-core-2.99.2/lib/rspec/core/caller_filter.rb:11: warning: previous definition of RSPEC_LIBS was here
/Users/bti/code/rspec-support/lib/rspec/support/caller_filter.rb:18: warning: already initialized constant RSpec::CallerFilter::ADDITIONAL_TOP_LEVEL_FILES
/Users/bti/.rvm/gems/ruby-2.4.1/gems/rspec-core-2.99.2/lib/rspec/core/caller_filter.rb:19: warning: previous definition of ADDITIONAL_TOP_LEVEL_FILES was here
/Users/bti/code/rspec-support/lib/rspec/support/caller_filter.rb:20: warning: already initialized constant RSpec::CallerFilter::LIB_REGEX
/Users/bti/.rvm/gems/ruby-2.4.1/gems/rspec-core-2.99.2/lib/rspec/core/caller_filter.rb:21: warning: previous definition of LIB_REGEX was here
.FFF

Failures:

  1) differ_formater with a basic string display only the change in the middle
     Failure/Error: expect(long_string_with_Z).to eq(long_string)

       expected: ...aaaaaaaa...
            got: ...aaaZaaaa...

       (compared using ==)
     # /Users/bti/code/rspec-support/lib/rspec/support.rb:97:in `block in <module:Support>'
     # /Users/bti/code/rspec-support/lib/rspec/support.rb:106:in `notify_failure'
     # ./spec/test_diff_spec.rb:15:in `block (3 levels) in <top (required)>'

  2) differ_formater with a recursive array formats the recursive element as [...] and other elements with custom formatting
     Failure/Error: expect(input).to eq(expected)

       expected: ...a"],
            got: ...a"]]

       (compared using ==)
     # /Users/bti/code/rspec-support/lib/rspec/support.rb:97:in `block in <module:Support>'
     # /Users/bti/code/rspec-support/lib/rspec/support.rb:106:in `notify_failure'
     # ./spec/test_diff_spec.rb:35:in `block (3 levels) in <top (required)>'

  3) differ_formater recursive hash with same content should eq {:array=>[:next_is_recursive_hash, {...}]}
     Failure/Error: it { expect(input).to eq(output) }

       expected: {:array=>[:next_is_recursive_hash, {...}]}
            got: {:array=>[:next_is_recursive_hash]}

       (compared using ==)
     # /Users/bti/code/rspec-support/lib/rspec/support.rb:97:in `block in <module:Support>'
     # /Users/bti/code/rspec-support/lib/rspec/support.rb:106:in `notify_failure'
     # ./spec/test_diff_spec.rb:52:in `block (3 levels) in <top (required)>'

Finished in 0.03358 seconds
4 examples, 3 failures

Failed examples:

rspec ./spec/test_diff_spec.rb:14 # differ_formater with a basic string display only the change in the middle
rspec ./spec/test_diff_spec.rb:34 # differ_formater with a recursive array formats the recursive element as [...] and other elements with custom formatting
rspec ./spec/test_diff_spec.rb:52 # differ_formater recursive hash with same content should eq {:array=>[:next_is_recursive_hash, {...}]}
```
