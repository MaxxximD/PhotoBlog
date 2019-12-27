class CategoriesController < ApplicationController
 # before_action :authenticate_user!, except: :show
  before_action :set_category, only: :show

  def show
    @posts = Post.where(category_id: [@category.subtree_ids]).paginate(page: params[:page], per_page: 5)
  end

  #Приватная секция
  private
  def set_category
    @category = Category.find(params[:id])
  end

end