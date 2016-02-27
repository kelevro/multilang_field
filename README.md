## Multilang Field Wrapper

# Install
````ruby
gem 'multilang_field'

bundle install
````

# Run generator
````
$rake g multilang_field:install
```

# application.js
````js
//= require jquery
//= require bootstrap-sprockets
````

# application.css.scss
````scss
 *= require multilang_field
 
 
 @import "bootstrap-sprockets";
 @import "bootstrap";
````


````erb
 <?= multilang_wrapper(:title) { |attribute| form.input(attribute) } ?>
````

## TODO
  * TDD
  * Cut out bootstrap



This project rocks and uses MIT-LICENSE.