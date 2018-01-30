class ProductsController < ApplicationController
  before_action(
    :set_product,
    only: %i[
      show edit update destroy
      debit_to_group debit_to_user remove_debit cancel_debit_request
    ]
  )
  before_action :set_templates, only: %i[new edit]
  before_action :check_to_debit, only: %i[debit_to_user debit_to_group]

  # GET /products
  # GET /products.json
  def index
    @products = Product.page(params[:page])
    authorize @products
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @debits = @product.debits.page(params[:page])
    @current_debit = @product.debits.last
    @groups = Group.all # FIXME: HIGH SYSTEM RESOURCE USAGE
    @users = User.all # FIXME: HIGH SYSTEM RESOURCE USAGE
  end

  # GET /products/new
  def new
    @product = Product.new
    authorize @product
  end

  # GET /products/1/edit
  def edit; end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    authorize @product
    respond_to do |format|
      if @product.save
        format.html do
          redirect_to @product, notice: t(:created, model: t(:product))
        end
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: t(:updated, model: t(:product)) }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    return redirect_to products_path, alert: t(:destroy_error) unless
    @product.destroy

    respond_to do |format|
      format.html do
        redirect_to(
          products_url, notice: t(:destroyed, model: t(:product))
        )
      end
      format.json { head :no_content }
    end
  end

  def debit_to_group
    return redirect_to @product, alert: t(:debit_save_error) if
    Group.find(params[:group_id]).nil?
    create_debit_for_group
    redirect_to @product, notice: t(:debit_save_success)
  end

  def debit_to_user
    return redirect_to @product, alert: t(:debit_save_error) if
    User.find(params[:user_id]).nil?
    create_debit_for_user
    redirect_to @product, notice: t(:debit_save_success)
  end

  def remove_debit
    current_debit = @product.debits.last
    return redirect_to @product, alert: t(:debit_remove_error) unless
    current_debit.active?
    current_debit.status = :pending
    current_debit.save
    redirect_to @product
  end

  def cancel_debit_request
    current_debit = @product.debits.last
    return redirect_to @product, alert: t(:debit_cancel_error) unless
    current_debit.pending?
    if current_debit.start?
      current_debit.status = :active
      current_debit.save
    else
      current_debit.destroy
    end
    redirect_to @product
  end

  private

  def set_product
    @product = Product.find(params[:id])
    authorize @product
  end

  def set_templates
    @templates = Template.all
  end

  def check_to_debit
    return redirect_to @product, alert: t(:debit_save_error) if
    !@product.free? ||
    @product.any_pending_debit?
  end

  def create_debit_for_user
    Debit.create(
      user_id: params[:user_id].to_i,
      product: @product,
      status: :pending
    )
  end

  def create_debit_for_group
    Debit.create(
      group_id: params[:group_id].to_i,
      product: @product,
      status: :pending
    )
  end

  def product_params
    params.require(:product).permit(
      :name,
      :template_id,
      :company,
      :properties,
      :year,
      :warranty,
      :warranty_end
    )
  end
end
