class ArticlesController < ApplicationController

  # HTTP Authentication method for authenticate user
  http_basic_authenticate_with name: "aditya", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  # Action for view new.html.erb
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # render method take plain symbol as key and params... as value
    #render plain: params[:article].inspect

    #@article = Article.new(params[:article])

    @article = Article.new(article_params)
    # @article.save # @article.save is responsible for saving the model in the database
    # redirect_to @article

    # return true if article name is more then 5 words and return false if article name is less than 5 word
    if @article.save
      redirect_to @article # article_path(@article)
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
