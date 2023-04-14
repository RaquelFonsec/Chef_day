
class RecipesController < ApplicationController
  def index
    if user_signed_in?
      # se o usuário estiver logado, redirecione-o para a página de boas-vindas
      redirect_to welcome_path
    else
      # caso contrário, exiba a lista de receitas
      @recipes = Recipe.all
    end
  end

  def welcome
    # Adicione aqui a lógica para exibir a página de boas-vindas
  end

  # outras ações do controlador aqui
end
