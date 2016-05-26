# Multilang Field Wrapper

This gem improves standard input fields , he adds tabs for all the languages ​​with which you can easily edit all translations at once

####It allows:

* Submit form with all translations at once
* Use this inputs with nested attributes

###Dependencies

```ruby
gem 'globalize', '~> 5.0.0'
gem 'globalize-accessors'
```

### Install

```ruby
gem 'multilang_field', github: 'kelevro/multilang_field'
```

### Run generator

```console
$ bundle install
$ rails g multilang_field:install
```

in `application.js` add

```js
//= require jquery
//= require bootstrap-sprockets
```

in `application.css.scss` add

```scss
 *= require multilang_field


 @import "bootstrap-sprockets";
 @import "bootstrap";
```

example:

```ruby
class ArticlesController < ApplicationController
  ...
  def article_params
    article = Article.globalize_attribute_names
    article += [:some_other_params]
    params.require(:article).permit(*article)
  end
end

class Article < ActiveRecord::Base
  translates :title, :description, fallbacks_for_empty_translations: true
  globalize_accessors
  ...
end
```

```erb
<%= form_for @article do |form| %>
  <%= multilang_wrapper(:title) { |attribute| form.input(attribute) } %>
<% end %>
```
for nested attributes:

```erb
<%= form_for @article do |form| %>
  <%= nested_multilang_wrapper(:title) { |attribute| form.input(attribute) } %>
<% end %>
```


![Usage](vendor/assets/images/use_field.gif)

## TODO
  * TDD
  * Cut out bootstrap



This project rocks and uses MIT-LICENSE.
