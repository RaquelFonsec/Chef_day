
class RecipesController < ApplicationController
  #exibe uma lista de receitas
  def index
    if params[:search].present? #se search presente
      response = HTTParty.get ou HTTPS.get("https://api.developer.edman.com/search?q=#{params[:search]}") #faz uma solicitacao para a API externa
      @recipes = JSON.parse(response.body) #analisa a resposta e armazena na variavel recipes
    else
      @recipes = []# se search nao estiver presente rdefine uma variavel recipe como matriz vazia
    end
  end
end
