class GamesController < ApplicationController
  def create
    @game = Game.create(user: current_user)
    redirect_to game_path(@game)
  end

  def show
    @game = Game.find(params[:id])
    @party = Party.new if @game.parties.size <= 5
  end

  def update
  end
end
