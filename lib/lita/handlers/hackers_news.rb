require 'lita/handlers/hn/api'

module Lita
  module Handlers
    class HackersNews < Handler
      include LitaHackersNews::Api

      route(%r{^hn$},
            :hn,
            command: true,
            help: { 'hn' => 'Show HN top 10' })

      def hn; end
    end

    Lita.register_handler(HackersNews)
  end
end
