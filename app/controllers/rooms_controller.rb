class RoomsController < ApplicationController

  before_action :set_room, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show, :index]
  
  def index
    @rooms = current_user.id
    if params[:search].present?
      @rooms = Room.near(params[:search], 50)
    else 
      @rooms = Room.all
    end
  end 

  def show
     @rooms = Room.all
     @booking = Booking.new

     @photos = @room.photos

    @reviews = @room.reviews.to_a
    @avg_rating = if @reviews.blank?
    0
    else
    @room.reviews.average(:rating).round(2)
  end


  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)

    if @room.save!

      if params[:images]
        params[:images].each do |image|
          @room.photos.create!(image: image)
        end
      end

      @photos = @room.photos
      redirect_to edit_room_path(@room), notice: "Saved..."
    else
      render :new
      flash[:alert] = "Please provide all information for this room."
    end
  end

  def edit
    if current_user.id == @room.user.id
      @photos = @room.photos
    else
      redirect_to root_path, notice: "You don't have permission."
    end
  end


  def update
    if @room.update(room_params)

      if params[:images]
        params[:images].each do |image|
          @room.photos.create(image: image)
        end
      end

    redirect_to edit_room_path(@room), notice: "Updated..."
    
    else
      render :edit
    end
  end


  def destroy
    if current_user.id == @room.user.id
     @room.destroy
      respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
      end
    else
      redirect_to root_path, notice: "You don't have permission."
    end 
  
  end


  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:name, :description, :rating_id, :host, :location, :price)
    end
end