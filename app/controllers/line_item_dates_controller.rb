class LineItemDatesController < ApplicationController
  before_action :set_quote
  before_action :set_line_item_date, only: [:edit, :update, :destroy]

  def new
    @line_item_date = @quote.line_item_dates.build
  end

  def create
    @line_item_date = @quote.line_item_dates.build(line_item_date_params)
    create_successful_message = "Date was successfully created."

    if @line_item_date.save
      respond_to do |format|
        format.html { redirect_to quote_path(@quote), notice: create_successful_message }
        format.turbo_stream { flash.now[:notice] = create_successful_message }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    update_successful_message = "Date was successfully updated."

    if @line_item_date.update(line_item_date_params)
      respond_to do |format|
        format.html { redirect_to quote_path(@quote), notice: update_successful_message }
        format.turbo_stream { flash.now[:notice] = update_successful_message }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @line_item_date.destroy
    destroy_successful_message = "Date was successfully deleted."

    respond_to do |format|
      format.html { redirect_to quote_path(@quote), notice: destroy_successful_message }
      format.turbo_stream { flash.now[:notice] = destroy_successful_message }
    end

  end

  private

  def line_item_date_params
    params.require(:line_item_date).permit(:date)
  end

  def set_quote
    @quote = current_company.quotes.find(params[:quote_id])
  end

  def set_line_item_date
    @line_item_date = @quote.line_item_dates.find(params[:id])
  end
end
