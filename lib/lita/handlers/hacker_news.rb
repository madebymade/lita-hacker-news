require 'lita/handlers/hn/api'

module Lita
  module Handlers
    class HackerNews < Handler
      include LitaHackerNews

      route(%r{^hn$},
            :hn,
            command: true,
            help: { 'hn' => 'Show HN top 10' })

      def hn(response)
        response.reply(render_template('top_stories', top_stories: API.new.top_stories))
      end
    end

    Lita.register_handler(HackerNews)
  end
end
