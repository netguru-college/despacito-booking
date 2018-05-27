class ResourcesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_post, only: [:show]

  def index
    @resources = Resource.all
  end

  def show
  end

  private
    def set_post
      @resource = Resource.find(params[:id])
    end
end
