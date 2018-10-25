class ChannelSubscriptionsController < ApplicationController
  before_action :set_channel_subscription, only: [:show, :update, :destroy]

  # GET /channel_subscriptions
  def index
    @channel_subscriptions = ChannelSubscription.all

    render json: @channel_subscriptions
  end

  # GET /channel_subscriptions/1
  def show
    render json: @channel_subscription
  end

  # POST /channel_subscriptions
  def create
    @channel_subscription = ChannelSubscription.new(channel_subscription_params)

    if @channel_subscription.save
      render json: @channel_subscription, status: :created, location: @channel_subscription
    else
      render json: @channel_subscription.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /channel_subscriptions/1
  def update
    if @channel_subscription.update(channel_subscription_params)
      render json: @channel_subscription
    else
      render json: @channel_subscription.errors, status: :unprocessable_entity
    end
  end

  # DELETE /channel_subscriptions/1
  def destroy
    @channel_subscription.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel_subscription
      @channel_subscription = ChannelSubscription.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def channel_subscription_params
      params.require(:channel_subscription).permit(:user_id, :channel_id)
    end
end
