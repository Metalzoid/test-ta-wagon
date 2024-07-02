class PartiesController < ApplicationController
  def create
    @party = Party.new(party_params)
    @party.ten_letters_list = params[:party][:ten_letters_list]
    @game = Game.find(params[:game_id])
    @party.game = @game
    if @party.verify
      @party.available = true
      @solution = Solution.create!(party: @party, word: @party.word)
      if @party.save
        redirect_to game_path(@game)
      else
        render_partial "game/show", locals: { game: @game, party: @party }, status: :unprocessable_entity
      end
    end
  end

  private

  def party_params
    params.require(:party).permit(:word, :ten_letters_list)
  end
end
