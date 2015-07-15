class MainsController < ApplicationController
  def index
  end

  def show
    @main = Main.find(params[:id])
  end

  def new
    @main = Main.new
  end

  def create
    @main = Main.new(params[:main])
    if @main.save
      redirect_to @main, :notice => "Successfully created main."
    else
      render :action => 'new'
    end
  end

  def edit
    @main = Main.find(params[:id])
  end

  def update
    @main = Main.find(params[:id])
    if @main.update_attributes(params[:main])
      redirect_to @main, :notice  => "Successfully updated main."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @main = Main.find(params[:id])
    @main.destroy
    redirect_to mains_url, :notice => "Successfully destroyed main."
  end

  def get_video_url
    #(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}\/[A-Za-z0-9]+\/[A-Za-z0-9\-\_]+
    begin
      render json: {status: true, embed_url: VideoInfo.new(params[:url]).embed_url}
    rescue 
      render json: {status: false}
    end


  end
end
