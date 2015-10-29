## Bdd

Bdd brings cucumber-style Given/When/Then/And/But steps for RSpec examples

### Status

| Master | Gem Version |
| :----: | :----: |
| [![Master Build Status](https://img.shields.io/travis/thejamespinto/bdd.svg)](https://travis-ci.org/thejamespinto/bdd) | [![Gem Version](https://img.shields.io/gem/v/bdd.svg)](https://rubygems.org/gems/bdd) |


[![GitHub License](https://img.shields.io/github/license/mashape/apistatus.svg)](https://rubygems.org/gems/bdd)
[![Gem Downloads](http://img.shields.io/gem/dt/bdd.svg)](https://rubygems.org/gems/bdd)
[![GitHub Issues](https://img.shields.io/github/issues/thejamespinto/bdd.svg)](https://rubygems.org/gems/bdd)



### Description

This gem brings two major functionality to your tests

* Verbosity for rspec documentation formatter.
* Ability to comment or describe set of actions in example into some step.



## Installation

Include in your Gemfile:

```ruby
group :test do
  gem 'bdd'
end
```

### RSpec

Run specs with custom format specified inline:

`
rspec --format Bdd::RSpec::Formatter --color spec
`

Or, if you want to use as your default formatter, simply put the options in your .rspec file:

`.rspec`

```yml
--format Bdd::RSpec::Formatter
--color
```

## Output Example

`spec/features/search_spec.rb`

```ruby
context 'Searching' do
  it 'Result is found' do
    Given 'I am on the search page' do
      visit '/search'
      expect(page).to have_content('Search')
    end

    When 'I search something' do
      fill_in 'Search', with: 'John'
      click_button 'Go'
    end

    Then 'I should see the word result' do
      expect(page).to have_content('Result')
    end
  end
end
```


### Documentation formatting output:

`rspec -fd spec/features/search_spec.rb`

<pre>
<b>Searching</b>
  <b>Result is found</b>
    <b>Given</b> I am on the search page
    <b> When</b> I search something
    <b> Then</b> I should see the word result
</pre>


## Basic & Shared Examples

<table>
  <thead>
    <tr>
      <th>Basic Example</th>
      <th>Shared 1</th>
      <th>Shared 2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <a href='https://github.com/thejamespinto/bdd/blob/master/spec/bdd/rspec_steps/basic_spec.rb'>basic_spec.rb</a>
        <img src='http://cl.ly/image/0R3c1U3q2a3a/download/basic.png' />
      </td>
      <td>
        <a href='https://github.com/thejamespinto/bdd/blob/master/spec/bdd/rspec_steps/shared_1_spec.rb'>shared_1_spec.rb</a>
        <img src='http://cl.ly/image/3g3g3X1s3I15/download/shared1.png' />
      </td>
      <td>
        <a href='https://github.com/thejamespinto/bdd/blob/master/spec/bdd/rspec_steps/shared_2_spec.rb'>shared_2_spec.rb</a>
        <img src='http://cl.ly/image/2L3428303w0A/download/shared2.png' />
      </td>
    </tr>
    <tr>
      <td>Same Output</td>
      <td>Same Output</td>
      <td>Same Output</td>
    </tr>
    <tr>
      <td><img src='http://cl.ly/image/1D2Q1m2I281v/download/outcome.png' />
      </td>
      <td><img src='http://cl.ly/image/1D2Q1m2I281v/download/outcome.png' />
      </td>
      <td><img src='http://cl.ly/image/1D2Q1m2I281v/download/outcome.png' />
      </td>
    </tr>
  </tbody>
</table>



### Renaming

Useful for refactored nesting, you can change a step's name

```ruby
def when_I_log_in
  When "I log in" do
    visit '/login'
    fill_in 'Login', with: 'jack@example.com'
    fill_in 'Password', with: 'password'
    click_button "Log in"
    expect(page).to have_content('Welcome jack@example.com')
  end
end


def given_I_log_in
  Given when_I_log_in
end

context 'User Flow'
  it 'User updates profile description' do
    given_I_log_in
    When 'I update profile description' do
      ...
    end
    then_I_should_see_a_confirmation_message
  end

  it 'User updates profile avatar' do
    given_I_log_in
    When 'I update profile avatar' do
      ...
    end
    then_I_should_see_a_confirmation_message
  end
end
```
Output:
<pre>
<b>User Flow</b>
  <b>User updates profile description</b>
    <b>Given</b> I log in
    <b> When</b> I update profile description
    <b> Then</b> I should see a confirmation message
</pre>







## Development

Currently we only support __RSpec__

__minitest__ and __test_unit__ pull requests are wanted.

__internationalization__ pull requests are wanted.


## Authors

* [James Pinto](http://github.com/thejamespinto)



## Contributing

1. Fork it ( https://github.com/thejamespinto/bdd/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Alternatives and Inspiration

* [rspec-steps](https://github.com/LRDesign/rspec-steps)
* [rspec-given](https://github.com/jimweirich/rspec-given)
* [rspec-example_steps](https://github.com/railsware/rspec-example_steps)
* [cucumber](https://github.com/cucumber/cucumber)

<pre>
  <b>rspec-steps</b>, <b>rspec-given</b> and <b>rspec-example_steps</b> run <i>AS</i> examples.
  <b>bdd</b> and <b>cucumber</b> run <i>INSIDE</i> examples, running tests faster.
</pre>
