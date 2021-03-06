class PostitsController < ApplicationController

  def index
    @postits = Postit.all
  end

  def show
    @postit = Postit.find(params[:id])
  end

  def new
    @postit = Postit.new
    render partial: "form"
  end

  def edit
    @postit = Postit.find(params[:id])
    render partial: "form"
  end

  def update
    @postit = Postit.find(params[:id])
    if @postit.update(postit_params)
      redirect_to postits_path
    else
      render :new
    end
  end

  def create
    @postit = Postit.new(postit_params)
    if @postit.save
      redirect_to postits_path
    else
      render :new
    end
  end

  def destroy
    @postit = Postit.find(params[:id]).destroy
    redirect_to postits_path
  end


  private

  def postit_params
    params.require(:postit).permit(:title, :author, :body)
  end
end
