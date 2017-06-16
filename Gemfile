source 'https://rubygems.org'

# зависим от рельсов 4.2.*
gem 'rails', '~> 4.2.6'

gem 'devise', '~> 4.1.1'
gem 'devise-i18n'
gem 'rails_12factor'
gem 'russian'
gem 'annotate'
gem 'omniauth'
gem 'omniauth-vkontakte'
gem 'carrierwave'
gem 'rmagick'
gem 'fog-google'
gem 'google-api-client', '>= 0.6.2', '< 0.9'
gem 'mime-types'

# гем, интегрирующий bootstrap
gem 'twitter-bootstrap-rails'

gem 'uglifier', '>= 1.3.0'

# для поддержки jquery
gem 'jquery-rails'

# в продакшен сервере heroku этот гем соединяет с базой данных Postgres
group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
end

