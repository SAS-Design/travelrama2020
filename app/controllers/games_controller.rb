# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :find_game, only: :show

  def index; end

  def show
    return redirect_to errors_not_found_url unless @game

    return redirect_to errors_unauthorized_url if @game.password&.!= params[:password]
  end

  def create
    existing_game = find_game_from_name(game_params[:name])
    return redirect_to game_url(existing_game, password: game_params[:password]) if existing_game

    @game = Game.new(game_params.except(:authenticity_token, :commit))
    if @game.save
      redirect_to @game, password: game_params[:password]
    else
      redirect_to errors_rejected_url
    end
  end

  private

  def find_game
    @game = Game.find(params[:id] || params[:game_id] || game_params[:id])
  end

  def find_game_from_name(name)
    Game.find_by(name: name)
  end

  def game_params
    params.fetch(:game, {}).permit(:name, :password, :deck_id, :map_id)
  end
end
