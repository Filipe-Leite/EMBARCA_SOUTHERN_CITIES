class IbgeGov
    def get_cities_by_uf(uf)
        uri = URI("https://servicodados.ibge.gov.br/api/v1/localidades/estados/#{uf}/municipios")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
       
        request = Net::HTTP::Get.new(uri.path)
        response = http.request(request)
    end
  end