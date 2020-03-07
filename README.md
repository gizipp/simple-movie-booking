# Description

Simple movie ticket booking codebase - [Rails](https://rubyonrails.org/) framework based.

# Development

Clone this repository, make sure required Ruby and bundler installed, in example

```
$ ruby -v
# ruby 2.6.4p104 (2019-08-28 revision 67798) [x86_64-darwin18]

$ bundler -v
Bundler version 2.1.4

```
And run

```
bundle install
```

Recommended tools and requirement :
- Ruby 2.6.4, use [RVM](https://rvm.io/), [rbenv](https://github.com/rbenv/rbenv) or [asdf](https://github.com/asdf-vm/asdf) to install preferred version with version manager
- [Bundler](https://bundler.io/) 2.1.4, simply run `gem install bundler -v 2.1.4`
- Rails 6.0.2.1, minimal requirement ruby >= 2.5.0 and bundler >= 1.8.11

Start server

```
rails s -b 0.0.0.0
# server should be running on http://localhost:3000
```

If databases not created/migrated yet

```
rails db:create
rails db:migrate
```
