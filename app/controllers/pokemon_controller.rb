class PokemonController < ApplicationController
  before_action :set_pokemon, only: %i[ show edit update destroy ]

  # GET
  def index
    @pokemons = Pokemon.search(params[:search])
  end

  # GET
  def show
  end

  # GET
  def new
    @pokemon = Pokemon.new
  end

  # GET
  def edit
  end

  # POST
  def create
    @pokemon = Pokemon.new(pokemon_params)

    respond_to do |format|
      if @pokemon.save
        format.html { redirect_to @pokemon, notice: "Pokemon was successfully created." }
        format.json { render :show, status: :created, location: @pokemon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT
  def update
    respond_to do |format|
      if @pokemon.update(pokemon_params)
        format.html { redirect_to @pokemon, notice: "Pokemon was successfully updated." }
        format.json { render :show, status: :ok, location: @pokemon }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE 
  def destroy
    @pokemon.destroy
    respond_to do |format|
      format.html { redirect_to pokemon_index_url, notice: "Pokemon was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    def pokemon_params
      params.require(:pokemon).permit(:name, :type, :region)
    end
end
