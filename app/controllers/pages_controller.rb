class PagesController < ApplicationController
  
  def index
  	@pages = Page.all
  end

  def show
  	@page = Page.find(params[:id])
  end

  def new
  	@page = Page.new
  end

  def edit
  	@page = Page.find(params[:id])
  end

  def create 
  	@page = Page.create(pages_params)

  	if @page.save
  		redirect_to admin_pages_path
  	else
  		render action: "new"
  	end
  end

  def update
    @page = Page.find(params[:id])
    
    if @page.update_attributes(pages_params)
      flash[:success] = "Nieuwsbericht geupdate"
      redirect_to admin_pages_path
    else
      render 'edit'
    end
  end

  def destroy
    @page = Page.find(params[:id])
    flash[:notice] = "Nieuwsbericht verwijdered" 
    @page.destroy
    redirect_to admin_pages_path
  end
  
  def home
    
  end
  
  def faq
    @page = Page.order("created_at").last
  end
  
  def terms
    @page = Page.order("created_at").last
  end
  
  def company
    @page = Page.order("created_at").last
  end
  
  def contact
    @page = Page.order("created_at").last
  end

  def pages_params
    params.require(:page).permit(:id, :faq, :terms, :company, :contact) 
  end
end
