class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully create."
      redirect_to book_path(@book.id)
    else
      @books = Book.all.order(id: :asc)
      render :index
    end
  end
  
  def index
    @books = Book.all
    @book = Book.new
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
      flash[:notice] = "Book was successfully update."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end


#モデル名を付けるとき→単数形＆先頭は大文字(Book)
#モデルのファイル名→book(単数＆先頭小文字)
#テーブル名→books(複数形＆先頭小文字)
