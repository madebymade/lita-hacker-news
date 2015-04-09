require "spec_helper"

describe Lita::Handlers::HackersNews, lita_handler: true do
  context 'when lita is send a valid command' do
    it { is_expected.to route_command('hn').to(:hn) }
  end
end
