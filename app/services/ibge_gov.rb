class IbgeGov
  def get_cities_by_uf(state_acronym)
    uri = URI("https://servicodados.ibge.gov.br/api/v1/localidades/estados/#{state_acronym}/municipios")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(uri.path)
    http.request(request)
  end
end
