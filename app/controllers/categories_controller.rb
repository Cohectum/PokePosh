class CategoriesController < InheritedResources::Base
  private

  def category_params
    params.require(:category).permit(:name)
  end

  def search
    if params[:search].blank?
      redirect_to pokemons_path and return
    else
      @parameter = params[:search].downcase
      @results = Pokemon.all.where("lower(name) LIKE :search",
                                   search: "%#{@parameter}%").order(id: :asc).page(params[:page])
    end
  end
end
