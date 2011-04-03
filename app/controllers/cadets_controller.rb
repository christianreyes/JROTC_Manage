class CadetsController < ApplicationController
  def index
    @cadets = Cadet.all
  end

  def show
    @cadet = Cadet.find(params[:id])
    @awards = @cadet.awards
  end

  def new
    @cadet = Cadet.new
  end

  def create
    @cadet = Cadet.new(params[:cadet])
    if @cadet.save
      redirect_to @cadet, :notice => "Successfully created cadet."
    else
      render :action => 'new'
    end
  end

  def edit
    @cadet = Cadet.find(params[:id])
  end

  def update
    @cadet = Cadet.find(params[:id])
    if @cadet.update_attributes(params[:cadet])
      redirect_to @cadet, :notice  => "Successfully updated cadet."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @cadet = Cadet.find(params[:id])
    @cadet.destroy
    redirect_to cadets_url, :notice => "Successfully destroyed cadet."
  end
end
