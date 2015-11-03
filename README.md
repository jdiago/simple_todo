## README

Requirements:
* Ruby 2.2.3
* bundler
* A recent version of Firefox


```
git clone https://github.com/jdiago/simple_todo.git
cd simple_todo
bundle install
```

To run specs:
`bin/rake spec`

To run the app:
```
bin/rake db:create db:schema:load
bin/rails s
```
