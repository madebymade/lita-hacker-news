describe LitaHackerNews::API do
  around(:each) { |example| VCR.use_cassette(:hn_top_stories, &example) }

  context 'when retreiving current top stories' do
    subject { described_class.new.top_stories.first }
    it { is_expected.to match(a_hash_including('title')) }
  end
end
