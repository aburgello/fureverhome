require 'net/http'
require 'json'

class DogApiService
  DOG_API_URL = "https://api.thedogapi.com/v1/images/search"
  DOG_API_KEY = "live_mu73nFXmSeCCFjme0jRozwZjZdVm9dDx9m8rLeepgRVEZpVBFzNJagYq9SjM6erf"
  CAT_API_URL = "https://api.thecatapi.com/v1/images/search"
  CAT_API_KEY = "live_a3OSAAo72Ajbn3kcIFD07MnuOe3lAZjhTAmj1lxMJp3Jvov8gb2L7vCbYhggDvVa"

  def self.call
    dogs = fetch_dogs
    cats = fetch_cats
    dogs + cats
  end

  def self.fetch_dogs
    url = URI("#{DOG_API_URL}?api_key=#{DOG_API_KEY}")
    response = Net::HTTP.get(url)
    parsed_response = JSON.parse(response)
    parsed_response.map do |dog|
      next unless dog['breeds'] && dog['breeds'].any?

      {
        name: dog['breeds'].first['name'],
        description: dog['breeds'].first['temperament'],
        image_url: dog['url']
      }
    end.compact
  end

  def self.fetch_cats
    url = URI("#{CAT_API_URL}?api_key=#{CAT_API_KEY}")
    response = Net::HTTP.get(url)
    parsed_response = JSON.parse(response)
    parsed_response.map do |cat|
      next unless cat['breeds'] && cat['breeds'].any?

      {
        name: cat['breeds'].first['name'],
        description: cat['breeds'].first['temperament'],
        image_url: cat['url']
      }
    end.compact
  end
end
