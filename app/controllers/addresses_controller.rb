class AddressesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @addresses = Address.all
  end

  def show
    @user = User.find(params[:user_id])
    @address = Address.find(params[:id])
  end

  def new
    @address = Address.new(user: @user)

    @user = User.find(params[:user_id])
    # @address = @user.addresses.new
  end

  def edit
    @user = User.find(params[:user_id])
    @address = @user.address.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @address = Address.new(address_params)
    @address.user = @user
    if @address.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:user_id])
    @address = @user.addresses.find(params[:id])
    if @address.update(address_params)
      redirect_to user_addresses_path(@user)
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @address = @user.addresss.find(params[:id])

    if @address.destroy
      redirect_to user_addresses_path(@user)
    else
      redirect_to user_address_path(@user, @address)

    end
  end

private
  def address_params
    params.require(:address).permit(:number, :street, :suburb, :city)
  end
end
