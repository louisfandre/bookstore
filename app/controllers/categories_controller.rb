class CategoriesController < ApplicationController
  def new
    @page_title = 'add new category'
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category created"
      redirect_to categories_path
    else
      render 'new'
    end



  end

  def update
    @category = Category.find(params[:id])

    @category.update(category_params)
    flash[:notice] = "Category updated"
    redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])

    @category.destroy
    flash[:notice] = "Category removed"
    redirect_to categories_path
  end

  def index
    @categories = Category.all
  end

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @books = @category.books
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end

