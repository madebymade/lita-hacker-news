require 'lita/handlers/hn/api'

module Lita
  module Handlers
    class HackerNews < Handler
      include LitaHackerNews::Api

      route(%r{^hn$},
            :hn,
            command: true,
            help: { 'hn' => 'Show HN top 10' })

      def hn; end
    end

    Lita.register_handler(HackerNews)
  end
end
