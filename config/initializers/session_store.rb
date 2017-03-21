# Be sure to restart your server when you modify this file.

#Rails.application.config.session_store :cookie_store, key: '_artcartridge_session'


Rails.application.config.session_store :cookie_store, key: '_artcartridge_session', domain: {
  production: '.artcartridge.com',
  development: '.localhost'
}.fetch(Rails.env.to_sym, :all)
