class ParagraphsController < ApplicationController
  before_action :set_paragraph, only: [:show, :edit, :update, :destroy]

  # GET /paragraphs
  # GET /paragraphs.json
  def index
    @paragraphs = Paragraph.all
  end

  # GET /paragraphs/1
  # GET /paragraphs/1.json
  def show
    redirect_to @paragraph.document, notice: 'occhio, redirect inutile'
  end

  # GET /paragraphs/new; Puo' essere invocata senza paragraph padre o con
  def new
    @section = Section.find(params[:section_id])
    @parent = Paragraph.find_by_id(params[:parent])
    @paragraph = Paragraph.new(parent: @parent,
                               section: @section)
  end

  # GET /paragraphs/1/edit
  def edit
  end

  # POST /paragraphs
  # POST /paragraphs.json
  def create
    @paragraph = Paragraph.new(paragraph_params)

    respond_to do |format|
      if @paragraph.save
        format.html { redirect_to @paragraph, notice: 'Paragraph was successfully created.' }
        format.json { render :show, status: :created, location: @paragraph }
        format.js
      else
        format.html { render :new }
        format.json { render json: @paragraph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paragraphs/1
  # PATCH/PUT /paragraphs/1.json
  def update
    respond_to do |format|
      if @paragraph.update(paragraph_params)
        format.html { redirect_to @paragraph, notice: 'Paragraph was successfully updated.' }
        format.json { render :show, status: :ok, location: @paragraph }
      else
        format.html { render :edit }
        format.json { render json: @paragraph.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paragraphs/1
  # DELETE /paragraphs/1.json
  def destroy
    @paragraph.destroy
    respond_to do |format|
      format.html { redirect_to paragraphs_url, notice: 'Paragraph was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paragraph
      @paragraph = Paragraph.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paragraph_params
      params.require(:paragraph).permit(:content, :order, :section_id, :paragraph_id)
    end
end
