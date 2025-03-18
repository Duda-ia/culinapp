class WorldsController < ApplicationController
  before_action :set_world, only: [:show]

  def show
    @tasks = Task.where(world: @world.id)
  end

  def destroy
    # @world = World.find(params[:id])
    # @world.destroy
  end

  private

  def set_world
    @world = World.find(params[:id])
  end

  def world_params
    params.require(:world).permit(:title, :done)
  end
end
