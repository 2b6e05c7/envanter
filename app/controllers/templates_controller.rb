class TemplatesController < ApplicationController
  before_action :set_template, only: %i[show edit update destroy]

  def index
    @templates = Template.page(params[:page])
    @products_count = @templates.map { |t| t.products.size }
    authorize @templates
  end

  def show; end

  def new
    @template = Template.new
    authorize @template
  end

  def edit; end

  def create
    @template = Template.new(template_params)
    authorize @template
    if @template.save
      redirect_to @template, notice: t(:created, model: t(:template))
    else
      render :new
    end
  end

  def update
    if @template.update(template_params)
      redirect_to @template, notice: t(:updated, model: t(:template))
    else
      render :edit
    end
  end

  def destroy
    if @template.destroyable?
      @template.destroy
      redirect_to templates_path, notice: t(:destroyed, model: t(:template))
    else
      redirect_to templates_path, alert: t(:destroy_error)
    end
  end

  private

  def set_template
    @template = Template.find(params[:id])
    authorize @template
  end

  def template_params
    params.require(:template).permit(:name, :properties)
  end
end
