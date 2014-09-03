# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

SITE_NAME = 'Intranet Callis'
SITE_DOMAIN = 'callis.com.br'
SITE_URL = "http://www.#{SITE_DOMAIN}/"
SITE_EMAIL = "miriam@#{SITE_DOMAIN}"
SITE_META_KEYWORDS = ""

PAPERCLIP_PATH = ":rails_root/public/system/:class/:id/:style/:basename.:extension"
PAPERCLIP_URL = "/system/:class/:id/:style/:basename.:extension"
