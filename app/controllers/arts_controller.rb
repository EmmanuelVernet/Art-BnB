class ArtsController < ApplicationController
  def index
    if params[:query].present?
      @arts = Art.search_by_all_attributes(params[:query])
    else
      @arts = Art.all
    end
  end

  def show
    @art = Art.find(params[:id])
  end

  def new
    @art = Art.new
  end

  def create
    @art = Art.new(art_params)
    @art.user = current_user
    if @art.save
      redirect_to art_path(@art), notice: "Art piece was successfully created."
    else
      # Rails.logger.debug { "Rental save failed: #{@art.errors.full_messages}" }
      # flash[:alert] = "Erreur : #{@art.errors.full_messages.join(', ')}"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @art = Art.find(params[:id])
  end

  def update
    @art = Art.find(params[:id])
    @art.update(art_params)
    redirect_to art_path(@art)
  end

  private

  def art_params
    params.require(:art).permit(:title, :price, :category, :name, :creation_date, :photo)
  end
end
