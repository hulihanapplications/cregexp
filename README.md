# Cregexp

Cregexp is a library of commonly used regular expressions written in ruby.

## Examples

### Current Regexps 

```ruby
Cregexp.url 	# /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix
Cregexp.email 	# /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
Cregexp.ip 		# /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/ 
Cregexp.hex 	# /^#?([a-f0-9]{6}|[a-f0-9]{3})$/
Cregexp.image 	# /.png|.jpg|.jpeg|.gif|.bmp|.tiff|.PNG|.JPG|.JPEG|.GIF|.BMP|.TIFF$/
```

### Matching 

```ruby
Cregexp.match("http://www.example.com", :url) 	# true
Cregexp.match("http://invalid", :url) 			# false

Cregexp.match("192.168.0.1", :ip) 				# true
Cregexp.match("256.255.255.255", :ip) 			# false
```

## Using Cregexp in Rails 3.x

Add this to your app's Gemfile:

```ruby
gem "cregexp"
```

That's It! Now Use it in a model for easy validations:


```ruby
class Image < ActiveRecord::Base
  validates_format_of :file, :format => Cregexp.image
  
  ...
end
```