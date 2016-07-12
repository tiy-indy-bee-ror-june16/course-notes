# Intro to Active Record
### Putting the Model into MVC


* We've talked about Views and Controllers, ActiveRecord is the Models
* In other words, the stuff that lives in `app/models`
* AR models can be thought of as Ruby classes with a database backing ... and some super powers.

---

## The Active Record pattern

> "An object that wraps a row in a database table or view, encapsulates the database access, and adds domain logic on that data."
- [Martin Fowler](http://martinfowler.com/)

* The Active Record pattern (which Active Record* follows) maps objects to database rows and provides the ability to save or persist them back and forth to said database.

\* - Confusing, I know.

---

# Let's make a model


`rails g model Post title:string body:text summary:string author_id:integer published:boolean`

```
      invoke  active_record
      create    db/migrate/20150728012620_create_posts.rb
      create    app/models/post.rb
      invoke    test_unit
      create      test/models/post_test.rb
      create      test/fixtures/posts.yml
```

---

# Migrations

* Remember `CREATE TABLE` from yesterday? Rails is _on it_.

```ruby
class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :summary
      t.integer :author_id
      t.boolean :published

      t.timestamps null: false
    end
  end
end
```

---

# Why not do it manually?

* Migrations exist because database schemas change over time.
* You need a way to record all those changes
* Especially when you deploy to a server or onboard another developer
* And, besides, why not let Rails do the work for you?

---

## Setting up your new database table

`rake db:migrate`

```
== 20150728012620 CreatePosts: migrating ======================================
-- create_table(:posts)
   -> 0.0018s
== 20150728012620 CreatePosts: migrated (0.0019s) =============================
```

---

# Our class

```ruby
class Post < ActiveRecord::Base
end
```

---

## Models for nothing (and your methods for free)

* Each Post has a getter and setter method for each database column.
* You get class methods such as `.all` and `.find` (and more!)
* This new class works almost identically to last week's Post class

---

`rails c`

```ruby
post = Post.new(:title => "Learning Active Record", 
								:body => "This is my body. There are many like it, but this one is mine.",
								:summary => "A short description of a post, but that's not important right now ...", 
								:published => true
							)
post.persisted?
# false
post.save
post.persisted?
# true
Post.all.each do |p|
	puts p.title
end
db_post = Post.find(1)
db_post.title
db_post.body
db_post.summary
db_post.published?
db_post.author_id
```

```ruby
no_title = Post.create(:body => "Jesse Ventura", :summary => "Pro wrestler, statesman")
no_title.persisted?
# true
no_title.body
no_title.summary
no_title.published?
no_title.title
```

---

## Validations

* You can do them in the model or the database
* For now, let's talk about in the model
* Because, if you do them in the db, you need to worry about error handling (and we'll cover that later)

```ruby
class Post < ActiveRecord::Base
	
	validates_presence_of :title
	
end
```

---

## Let's test it!

`test/models/post_test.rb`

```ruby
require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "should not save a post without a title" do
    post = Post.new(:body => "Jesse Ventura", :summary => "Pro wrestler, statesman")
    assert_not post.save, "Saved the post without a title"
  end

end
```

---

## More validations

[The official docs](http://api.rubyonrails.org/classes/ActiveModel/Validations/HelperMethods.html)

```
validates_absence_of
validates_acceptance_of
validates_confirmation_of
validates_exclusion_of
validates_format_of
validates_inclusion_of
validates_length_of
validates_numericality_of
validates_presence_of
validates_size_of
```

---

# Associations

## Let's give our posts an author

`rails g model Author name:string bio:text`

```
      invoke  active_record
      create    db/migrate/20150728023801_create_authors.rb
      create    app/models/author.rb
      invoke    test_unit
      create      test/models/author_test.rb
      create      test/fixtures/authors.yml
```

`rake db:migrate`

---

## Let's tie together authors and posts

`app/models/post.rb`

```ruby
class Post < ActiveRecord::Base

  belongs_to :author

  validates_presence_of :title

end
```

---

`app/models/author.rb`

```ruby
class Author < ActiveRecord::Base
  
  has_many :posts
  
end
```

---

`rails c`

```ruby
post = Post.last
author = Author.new(:name => "Kurt Vonnegut")
author.save
author.posts
# []
author.posts << post
author.posts
post.author
```
