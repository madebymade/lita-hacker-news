describe Lita::Handlers::HackerNews, lita_handler: true do
  around(:each) { |example| VCR.use_cassette(:hn_top_stories, &example) }

  context 'when lita is sent a valid command' do
    it { is_expected.to route_command('hn').to(:hn) }
  end

  context 'when lita is asked to return the top hn stories' do
    before(:each) { send_command('hn') }
    it { expect(replies.last).to include('social experiment driving Reddit crazy http://www.vox.com/2015/4/10/8383165/reddit-button-explained') }
  end
end
