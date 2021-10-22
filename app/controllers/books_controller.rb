class BooksController < ApplicationController
  def available
    @books = Book.where(state: 0)
  end

  def reserved
    @books = Book.where(state: 1)
  end

  def bought
    @books = Book.where(state: 2)
  end

  def getbook
    @book = Book.find(params[:book_id])
    respond_to do |format|
      format.js
    end
  end

  def changestatebook
    @mensaje = ''

    @book = Book.find(params[:book_id])
    original_state = @book.state
    if original_state == 0
      sleep 5
    end

    if (params[:new_state] == "2" && (Time.now.utc - @book.updated_at.utc).to_i > 10)
      @mensaje = 'El tiempo de reserva ha caducado'
    else
      @book.state = params[:new_state]
      @book.save
    end
  
    @books =Book.where(state: original_state)
    respond_to do |format|
      format.js
    end
  end
  def destroy
    @book = Book.find(params[:book_id])
    if @book.destroy
      redirect_to books_bought_path
    end
  end
end
