require 'net/http'
require 'uri'

module Net
  class HTTP
    def self.fetch(uri)
      res = get_response(uri)
      if res.code == '302'
        res = fetch(URI.parse(res['location']))
      end
      res
    end
  end
end
