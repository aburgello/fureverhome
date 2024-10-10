require 'net/http'
require 'json'

class DogApiService
  DOG_API_URL = "https://api.thedogapi.com/v1/images/search"
  DOG_API_KEY = "live_mu73nFXmSeCCFjme0jRozwZjZdVm9dDx9m8rLeepgRVEZpVBFzNJagYq9SjM6erf"
  CAT_API_URL = "https://api.thecatapi.com/v1/images/search"
  CAT_API_KEY = "live_a3OSAAo72Ajbn3kcIFD07MnuOe3lAZjhTAmj1lxMJp3Jvov8gb2L7vCbYhggDvVa"

  def self.call(include_sleep: true)
    dogs = fetch_dogs(include_sleep)
    cats = fetch_cats(include_sleep)
    dogs + cats
  end

  def self.fetch_dogs(include_sleep)
    url = URI("#{DOG_API_URL}?api_key=#{DOG_API_KEY}")
    response = Net::HTTP.get(url)
    parsed_response = JSON.parse(response)

    parsed_response.map do |dog|
      # Default values if no breeds are present
      breed_name = dog['breeds'].any? ? dog['breeds'].first['name'] : 'Unknown'
      temperament = dog['breeds'].any? ? dog['breeds'].first['temperament'] : 'Unknown temperament'

      sleep 2 if include_sleep

      {
        name: breed_name,
        description: temperament,
        image_url: dog['url']
      }
    end.compact
  end

  def self.fetch_cats(include_sleep)
    url = URI("#{CAT_API_URL}?api_key=#{CAT_API_KEY}")
    response = Net::HTTP.get(url)
    parsed_response = JSON.parse(response)

    parsed_response.map do |cat|
      # Default values if no breeds are present
      breed_name = cat['breeds'].any? ? cat['breeds'].first['name'] : 'Unknown'
      temperament = cat['breeds'].any? ? cat['breeds'].first['temperament'] : 'Unknown temperament'

      sleep 2 if include_sleep

      {
        name: breed_name,
        description: temperament,
        image_url: cat['url']
      }
    end.compact
  end
end
