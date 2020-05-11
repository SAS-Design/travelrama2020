# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :find_game

  def index
    redirect_to @game if @game
  end

  def show
    return redirect_to errors_not_found_url unless @game

    unless @game.password&.== game_params[:password]
      redirect_to errors_unauthorized
    end
  end

  def create
    return redirect_to @game if @game

    @game = Game.new(game_params.except(:authenticity_token, :commit))
    if @game.save
      redirect_to game_url(@game.name)
    else
      redirect_to errors_rejected_url
    end
  end

  private

  def find_game
    @game = Game.find_by(name: game_params[:name])
  end

  def game_params
    params.fetch(:game, {}).permit(:name, :password, :deck_id, :map_id)
  end
end
