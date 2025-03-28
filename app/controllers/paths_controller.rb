class PathsController < ApplicationController
  before_action :set_path, only: [:edit, :update, :show]

  def new
    @path = Path.new
  end

  def create
    @path = Path.new(path_params)
    if @path.save
      redirect_to @path, notice: "Path was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @path.update(path_params)
      redirect_to root_path, notice: "Path atualizado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @paths = Path.all
    @journey = Journey.new
  end

  def show
    @path = Path.find(params[:id])
    @worlds = World.where(path: params[:id])

    @worlds.each_with_index do |world, index|
      previous_world_completed = index.zero? || @worlds[index - 1].tasks.all? { |task| current_user.reviews.exists?(task: task) }
      world.define_singleton_method(:locked?) { !previous_world_completed }
    end
  end

  def destroy
    @path = Path.find(params[:id])
    @path.destroy!
    redirect_to root_path
  end

private

  def set_path
    @path = Path.find(params[:id])
  end

  def path_params
    params.require(:path).permit(:title, :description)
  end
end
