class TemplatesController < ApplicationController
  before_action :set_template, only: %i[show edit update destroy]

  # GET /templates
  # GET /templates.json
  def index
    @templates = Template.page(params[:page])
    authorize @templates
  end

  # GET /templates/1
  # GET /templates/1.json
  def show; end

  # GET /templates/new
  def new
    @template = Template.new
    authorize @template
  end

  # GET /templates/1/edit
  def edit; end

  # POST /templates
  # POST /templates.json
  def create
    @template = Template.new(template_params)
    authorize @template
    respond_to do |format|
      if @template.save
        format.html { redirect_to @template, notice: t(:created_message, something: t(:template)) }
        format.json { render :show, status: :created, location: @template }
      else
        format.html { render :new }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /templates/1
  # PATCH/PUT /templates/1.json
  def update
    respond_to do |format|
      if @template.update(template_params)
        format.html { redirect_to @template, notice: t(:updated_message, something: t(:template)) }
        format.json { render :show, status: :ok, location: @template }
      else
        format.html { render :edit }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /templates/1
  # DELETE /templates/1.json
  def destroy
    begin
      @template.destroy
    rescue ActiveRecord::StatementInvalid
      return redirect_to templates_path, alert: t(:destroy_error_message)
    end
    respond_to do |format|
      format.html { redirect_to templates_url, notice: t(:destroyed_message, something: t(:template)) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_template
    @template = Template.find(params[:id])
    authorize @template
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def template_params
    params.require(:template).permit(:name, :properties)
  end
end
