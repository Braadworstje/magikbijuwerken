class QualitiesController < ApplicationController
  
    def show
    	@quality = Quality.find(params[:id])
    end

    def new
    	@quality = Quality.new
    end

    def edit
    	@quality = Quality.find(params[:id])
    end

    def create 
    	@quality = Quality.create(quality_params)

  	if @quality.save
  		redirect_to admin_qualities_path
  	else
  		render action: "new"
  	end
    end

    def update
      @quality = Quality.find(params[:id])
      if @quality.update_attributes(quality_params)
        flash[:success] = "Nieuwsbericht geupdated"
        redirect_to admin_qualities_path
      else
        render 'edit'
      end
    end

    def destroy
      @quality = Quality.find(params[:id])
      flash[:notice] = "Nieuwsbericht verwijdered" 
      @quality.destroy
      redirect_to admin_qualities_path
    end

    def quality_params
      params.require(:quality).permit(:id, :quality) 
    end  
end
