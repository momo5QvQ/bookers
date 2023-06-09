class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @new_book = Book.new(book_params)
    if @new_book.save
      flash[:notice] = "Book was successfully create!"
     redirect_to book_path(@new_book.id)
    else
     @books = Book.all
     render :index 
    end
  end

  def index
    @books = Book.all
    @new_book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully update!"
       redirect_to book_path(@book.id)
    else
      render :edit
    end 
  end 
  
  def destroy
    book = Book.find(params[:id])#データ（レコード）を取得
    book.destroy #データ（レコード）を削除
    redirect_to '/books'
  end
  
  private
   def book_params
    params.require(:book).permit(:title,:body)
   end 
  end
