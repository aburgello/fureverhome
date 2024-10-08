require 'net/http'
require 'json'

class DogApiService
  def self.call
    url = URI("https://dogapi.dog/api/v2/breeds")
    response = Net::HTTP.get(url)
    parsed_response = JSON.parse(response)

    breeds = parsed_response['data']

    breeds.map do |breed|
      {
        name: breed.dig('attributes', 'name'),
        description: breed.dig('attributes', 'description'),
      }
    end
  end
end
