module LitaHackersNews
  module Routes
    route(%r{^hn$},
          :hn,
          command: true,
          help: { 'hn' => 'Show HN top 10' })
  end
end
