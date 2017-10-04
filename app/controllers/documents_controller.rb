class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :destroy]
  helper_method :sort_column, :sort_direction

  def index
    @documents = Document.order(sort_column + " " + sort_direction).page(params[:page]).per(params[:limit])
  end

  def show
    send_data(@document.file_contents,
              type: @document.content_type,
              filename: @document.filename)
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        format.js {
          flash[:notice] = 'Document was successfully created.'
        }
        format.html { redirect_to documents_path, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.js
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_document
    @document = Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:file)
  end

  private
  # sort column, default is filename
  def sort_column
    Document.column_names.include?(params[:sort]) ? params[:sort] : "filename"
  end

  # sort direction
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
