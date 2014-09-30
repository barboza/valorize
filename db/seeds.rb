# coding: utf-8

puts 'Seeding the database...'

[
  { pt: 'Arte', en: 'Art' },
  { pt: 'Artes plásticas', en: 'Visual Arts' },
  { pt: 'Circo', en: 'Circus' },
  { pt: 'Comunidade', en: 'Community' },
  { pt: 'Humor', en: 'Humor' },
  { pt: 'Quadrinhos', en: 'Comicbooks' },
  { pt: 'Dança', en: 'Dance' },
  { pt: 'Design', en: 'Design' },
  { pt: 'Eventos', en: 'Events' },
  { pt: 'Moda', en: 'Fashion' },
  { pt: 'Gastronomia', en: 'Gastronomy' },
  { pt: 'Cinema e Vídeo', en: 'Film & Video' },
  { pt: 'Jogos', en: 'Games' },
  { pt: 'Jornalismo', en: 'Journalism' },
  { pt: 'Música', en: 'Music' },
  { pt: 'Fotografia', en: 'Photography' },
  { pt: 'Ciência e Tecnologia', en: 'Science & Technology' },
  { pt: 'Teatro', en: 'Theatre' },
  { pt: 'Esporte', en: 'Sport' },
  { pt: 'Web', en: 'Web' },
  { pt: 'Carnaval', en: 'Carnival' },
  { pt: 'Arquitetura e Urbanismo', en: 'Architecture & Urbanism' },
  { pt: 'Literatura', en: 'Literature' },
  { pt: 'Mobilidade e Transporte', en: 'Mobility & Transportation' },
  { pt: 'Meio Ambiente', en: 'Environment' },
  { pt: 'Negócios Sociais', en: 'Social Business' },
  { pt: 'Educação', en: 'Education' },
  { pt: 'Filmes de Ficção', en: 'Fiction Films' },
  { pt: 'Filmes Documentários', en: 'Documentary Films' },
  { pt: 'Filmes Universitários', en: 'Experimental Films' }
].each do |name|
   category = Category.find_or_initialize_by(name_pt: name[:pt])
   category.update_attributes({
     name_en: name[:en]
   })
 end

{
  company_name: 'Valorize.me',
  company_logo: 'http://catarse.me/assets/catarse_bootstrap/logo_icon_catarse.png',
  host: 'valorizeme.com.br',
  base_url: "http://valorizeme.com.br",

  email_contact: 'contatovalorize@gmail.com',
  email_payments: 'contatovalorize@gmail.com',
  email_projects: 'contatovalorize@gmail.com',
  email_system: 'contatovalorize@gmail.com',
  email_no_reply: 'no-reply@valorizeme.com.br',
  facebook_url: "http://facebook.com/valorizeme",
  facebook_app_id: '717080581706153',
  twitter_url: 'http://twitter.com/valorizeme',
  twitter_username: "valorizeme",
  mailchimp_url: "http://valorize.us9.list-manage.com/subscribe?u=687c6af96086e6890182cf8ef&id=f99d920613",
  catarse_fee: '0.13',
  support_forum: 'http://valorizeme.uservoice.com/',
  base_domain: 'valorizeme.com.br',
  uservoice_secret_gadget: 'change_this',
  uservoice_key: 'uservoice_key',
  faq_url: 'http://valorizeme.uservoice.com/',
  feedback_url: 'http://valorizeme.uservoice.com/',
  terms_url: 'http://valorizeme.uservoice.com/',
  privacy_url: 'http://valorizeme.uservoice.com/',
  about_channel_url: 'http://valorizeme.uservoice.com/',
  instagram_url: 'http://instagram.com/valorizeme',
  blog_url: "http://blog.valorizeme.com.br",
  github_url: 'http://github.com/engageis/valorize.me',
  contato_url: 'http://valorizeme.uservoice.com/'
}.each do |name, value|
   conf = CatarseSettings.find_or_initialize_by(name: name)
   conf.update_attributes({
     value: value
   }) if conf.new_record?
end


Channel.find_or_create_by!(name: "Channel name") do |c|
  c.permalink = "sample-permalink"
  c.description = "Lorem Ipsum"
end


OauthProvider.find_or_create_by!(name: 'facebook') do |o|
  o.key = '717080581706153'
  o.secret = '27c0109dd0e6fb595efe28a9771ea3a5'
  o.path = 'facebook'
end

puts
puts '============================================='
puts ' Showing all Authentication Providers'
puts '---------------------------------------------'

OauthProvider.all.each do |conf|
  a = conf.attributes
  puts "  name #{a['name']}"
  puts "     key: #{a['key']}"
  puts "     secret: #{a['secret']}"
  puts "     path: #{a['path']}"
  puts
end


puts
puts '============================================='
puts ' Showing all entries in Configuration Table...'
puts '---------------------------------------------'

CatarseSettings.all.each do |conf|
  a = conf.attributes
  puts "  #{a['name']}: #{a['value']}"
end

Rails.cache.clear

puts '---------------------------------------------'
puts 'Done!'
