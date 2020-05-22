class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  #上4つのアクションはそれぞれのアクションを行う前にset_bookアクションを行う。
  #よって今回は@book = Book.find(params[:id])を4つのアクション内に書く必要がなくなる。

  # GET /books
  # GET /books.json
  def index
    @book = Book.new
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      @books = Book.all
      render :index
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # 一番上のset_bookで定義しているアクションは下に定義した@book = Book.find(params[:id])を書かなくても良い。(省略できる)
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
