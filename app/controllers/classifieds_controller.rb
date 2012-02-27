class ClassifiedsController < ApplicationController
  def index
    @classifieds = Classified.find(:all)
  end
  
  def show
    @classified = Classified.find(params[:id])
  end
  
  def new
    @classified = Classified.new
  end
  
  def edit
    @classified = Classified.find(params[:id])
  end
  
  def destroy
    Classified.find(params[:id]).destroy
    flash[:notice] = "Successfully destroyed classified ad."
    redirect_to(:action => 'index')
    #@classified.destroy
  end
  
  def update
    @classified = Classified.find(params[:id])
    if @classified.update_attributes(params[:classified])
      #redirect_to(:action => 'show', :id => @classified)
      flash[:notice] = "Classified ad updated successfully."
      redirect_to classifieds_path
    else
      render :action => 'edit'
    end
  end
  
  def create
    @classified = Classified.new(params[:classified])
    if @classified.save
      redirect_to(@classified, :notice => "Classified saved.")
    else
      render :action => 'new'
    end
  end
  
  def complete
    #my stuff here
    Classified.update_all(["created_at" => Time.now], :id => params[:classified_ids])
    redirect_to classifieds_path
  end
end
