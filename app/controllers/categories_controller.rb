class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
    @icons = ['house', 'user', 'facebook', 'check', 'download', 'image', 'instagram', 'phone', 'tiktok', 'bars',
              'envelope', 'linkedin', 'star', 'location-do', 'github', 'music', 'wand-magic', 'heart', 'discord',
              'youtube', 'cloud', 'camera-retro', 'truck-fast', 'wordpress', 'pen-nib', 'hippo', 'face-smile',
              'calendar-days', 'paperclip', 'filter', 'cart-shopping', 'bell', 'bolt', 'car ', 'film', 'mug-hot',
              'apple', 'google', 'pen', 'umbrella', 'gift', 'lock', 'camera', 'video', 'fire', 'plane', 'money-bill',
              'dropbox', 'magnet', 'gears', 'city', 'wifi', 'compass', 'briefcase', 'dumper-fire', 'shopify', 'bath',
              'handshake', 'snowflake', 'gamepad', 'earth-americas', 'business-time', 'palette', 'binoculars']
  end

  def create
    @category = current_user.categories.new(category_params)

    if @category.save
      redirect_to categories_path, flash: { success: "#{@category.name} has been successfully created!" }
    else
      redirect_to new_category_path, flash: { error: @category.errors.full_messages }
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
