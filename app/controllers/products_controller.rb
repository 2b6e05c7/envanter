class ProductsController < ApplicationController
  before_action(
    :set_product,
    only: %i[
      show edit update destroy change_status confirm
    ]
  )
  before_action :set_templates, only: %i[new edit]

  def index
    @products = Product.page(params[:page])
    authorize @products
  end

  def filtered
    @status = params[:status] # Used in view.
    @products = Product.where(status: @status).order(id: :desc).page(params[:page])
    authorize @products
  end

  def confirmation_operations
    @products = Product.where(confirmation: false).page(params[:page])
    authorize @products
  end

  def show
    @debits = @product.debits.order(id: :desc).page(params[:page])
    @current_debit = @product.debits.last
    @groups = Group.all
    @users = User.all
  end

  def new
    @product = Product.new
    authorize @product
  end

  def edit; end

  def create
    @product = Product.new(product_params)
    authorize @product
    if @product.save
      redirect_to @product, notice: t(:created, model: t(:product))
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: t(:updated, model: t(:product))
    else
      render :edit
    end
  end

  def destroy
    if @product.destroyable?
      @product.destroy
      redirect_to products_url, notice: t(:destroyed, model: t(:product))
    else
      redirect_to products_path, alert: t(:destroy_error)
    end
  end

  def change_status
    return nil if @product.any_pending_debit?
    return nil unless @product.free?
    @product.status = params[:status]
    @product.confirmation = false
    @product.save
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  def confirm
    @product.confirmation = true
    @product.save
    redirect_to confirmation_operations_products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
    authorize @product
  end

  def set_templates
    @templates = Template.all
  end

  def product_params
    params.require(:product).permit(
      :name, :description, :template_id, :company,
      :properties, :year, :warranty, :warranty_end, :bill
    )
  end
end
