class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # GET /movies
  # GET /movies.json
  respond_to :html, :js, :json
  def index
    @movies = Movie.all
    @movie = current_user.movies.build
    
end

  # GET /movies/1
  # GET /movies/1.json
  def show

    
   end

  # GET /movies/new
  def new
    @movie = current_user.movies.build
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = current_user.movies.build(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
         format.json { render :show, status: :created, location: @movie }
         format.js 
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :description, :movie_length, :director, :rating)
    end
end
