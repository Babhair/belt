class ProductsController < ApplicationController
  def index
  	@product = Product.all
  end

  def show
  	@my_products = Product.where(user_id: session[:current_user])
  	@sold = Sold.where(user_id: session[:current_user])
  	@bought = Bought.where(user_id: session[:current_user])

  end

  def create
  	Product.create(name: params[:name], amount: params[:amount], user_id: session[:current_user])
  
  	return redirect_to '/products/'
  end

  def buy
  	Bought.create(user_id: session[:current_user], product_id: params["product_id"], name: params["name"], amount: params["amount"])

  	Sold.create(user_id: params['user_id'], product_id: params["product_id"], name: params["name"], amount: params["amount"])

  	Product.destroy(params[:product_id])

  	return redirect_to '/products/<%= current_user.id %>'

  end

  def remove
  	Product.destroy(params[:product_id])

  	return redirect_to '/products/'
  end
end
