class AwardsController < ApplicationController
  def index
    @awards = Award.all
  end

  def show
    @award = Award.find(params[:id])
  end

  def new
    @award = Award.new
  end

  def create
    @award = Award.new(params[:award])
    if @award.save
      redirect_to @award, :notice => "Successfully created award."
    else
      render :action => 'new'
    end
  end

  def edit
    @award = Award.find(params[:id])
  end

  def update
    @award = Award.find(params[:id])
    if @award.update_attributes(params[:award])
      redirect_to @award, :notice  => "Successfully updated award."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @award = Award.find(params[:id])
    @award.destroy
    redirect_to awards_url, :notice => "Successfully destroyed award."
  end
end
