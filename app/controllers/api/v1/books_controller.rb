class Api::V1::BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]
  respond_to :json

  # GET /books
  def index
    respond_with Book.all
  end

  # GET /books/1
  def show
    respond_with @book
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      respond_with @book, status: :created, location: [:api, :v1, @book]
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      respond_with @book, status: :ok, location: [:api, :v1, @book]
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_params
    params.require(:book).permit(:title, :author, :url)
  end
end
