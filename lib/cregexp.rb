class Cregexp	
  def self.url(options = {})
  	/(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix
  end 
  
  def self.email(options = {})
  	/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  end 
  
  # Slug 
  # my-title-here passes
  # my_title_here fails
  def self.slug(options = {}) 
  	/^[a-z0-9-]+$/  
  end 
  
  # IP Address
  def self.ip(options = {})
  	/^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/  
  end
  
  # Hex Value
  # #a3c113 passes
  # #4d82h4 failes(contains h)
  def self.hex(options = {})
  	/^#?([a-f0-9]{6}|[a-f0-9]{3})$/
  end   
  
  # Image 
  # Checke if file extension is of a valid image type
  def self.image
    /.png|.jpg|.jpeg|.gif|.bmp|.tiff|.PNG|.JPG|.JPEG|.GIF|.BMP|.TIFF$/
  end
  
  # Cregexp.match("http://www.google.com", :url) => true 
  def self.match(string, matcher, options = {}) 
  	!(string =~ send(matcher.to_sym)).nil?
  end
end 
