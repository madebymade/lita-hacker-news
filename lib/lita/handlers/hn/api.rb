require 'net/http'

module LitaHackerNews
  class API
    ENDPOINTS = {
      top_stories: 'https://hacker-news.firebaseio.com/v0/topstories.json',
      story: 'https://hacker-news.firebaseio.com/v0/item/'
    }

    def top_stories
      top_story_ids.first(10).map { |id| fetch_story(id) }
    end

    private

    def top_story_ids
      parsed_response(ENDPOINTS[:top_stories])
    end

    def fetch_story(id)
      parsed_response("#{ENDPOINTS[:story]}/#{id}.json")
    end

    def parsed_response(url)
      JSON.parse(response(url).body)
    end

    def response(url)
      uri = URI(url)

      Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
        http.request(Net::HTTP::Get.new(uri))
      end
    end
  end
end
