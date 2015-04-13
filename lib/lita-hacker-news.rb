require 'lita'

Lita.load_locales(Dir[File.expand_path('../../locales/*.yml', __FILE__)])

require 'lita/handlers/hacker_news'

Lita::Handlers::HackerNews.template_root(File.expand_path('../../templates', __FILE__))
