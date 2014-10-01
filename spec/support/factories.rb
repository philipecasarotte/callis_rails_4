FactoryGirl.define do
  factory :event do
    name "Upcoming Event"
    happens_on Date.tomorrow
    body "This event will happen in the future. Pretty cool, eh?"
  end
  
  factory :user do |u|
    u.avatar { File.new("#{Rails.root}/spec/support/fixtures/files/test.jpg") } 
    u.login "philipe"
    u.email "philipe@test.com"
    u.name 'User'
    u.birthday "1985-05-08"
    u.password 'secret'
    u.password_confirmation 'secret'
    u.password_salt salt = Authlogic::Random.hex_token
    u.crypted_password Authlogic::CryptoProviders::Sha512.encrypt("secret" + salt)
    u.perishable_token Authlogic::Random.friendly_token
  end
  
  factory :page do |p|
    p.name 'Home'
    p.body 'Coming Soon'
    p.permalink 'home'
    p.is_protected 0
  end

  factory :about, :parent => :page do |p|
    p.name 'About Us'
    p.body 'About us'
    p.permalink 'about-us'
    p.is_protected 0
  end

  factory :about_child, :parent => :page do |f|
    f.parent { |parent| parent.association(:about)  }
  end

  factory :long_page, :parent => :page do |f|
    f.body "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sed lectus ac sapien consectetur dapibus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed hendrerit elit. Aliquam velit felis, imperdiet eu, egestas sed, consequat et, ligula. Nullam bibendum dictum metus. Maecenas ut tellus non nulla dapibus tincidunt. Curabitur ullamcorper, arcu sed feugiat elementum, ligula libero accumsan velit, bibendum pulvinar enim est at magna. Suspendisse et neque quis leo lobortis dictum. Aliquam justo mauris, ornare ac, mollis vitae, convallis vitae, metus. Nunc commodo sapien et mauris. Aliquam vitae ligula. Proin mi turpis, dignissim sed, mattis quis, dignissim sagittis, diam. Nullam a neque. Maecenas ornare vulputate metus. Suspendisse potenti. Vestibulum mattis arcu et quam."
  end
  
end