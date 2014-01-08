class NewsController < ApplicationController
	  
  def index
  	@news = News.all
  end

  def show
  	@news = News.find(params[:id])
  end

  def new
  	@news = News.new
  end

  def edit
  	@news = News.find(params[:id])
  end

  def create 
  	@news = News.create(news_params)

	if @news.save
		redirect_to news_index_path
	else
		render action: "new"
	end
  end

  def update
    @news = News.find(params[:id])

    @news = News.all
    if @news.update_attributes(news_params)
      flash[:success] = "Nieuwsbericht geupdated"
      redirect_to @news
    else
      render 'edit'
    end
  end

  def destroy
    @news = News.find(params[:id])
    flash[:notice] = "Nieuwsbericht verwijdered" 
    @news.destroy
    redirect_to @news
  end

  def news_params
    params.require(:news).permit(:id, :title, :content) 
  end
end
