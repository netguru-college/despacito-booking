class ResourcesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_post, only: [:show]

  def index
    @resources = Resource.all
  end

  def show
  end

  def new
    @resource = Resource.new()
    authorize! @resource

  rescue ActionPolicy::Unauthorized
    redirect_to resources_path, danger: t('.not_atuhorized')
  end

  def create
    @resource = Resource.new(resource_params)
    authorize! @resource

    if @resource.save
      redirect_to resources_path,
                  success: t('.created_resource', resource_name: @resource.name)
    else
      flash.now[:danger] = t('.failed_to_create')
      render :new
    end
  end

  private
    def resource_params
      params.require(:resource).permit(:name, :description, :image)
    end

    def set_post
      @resource = Resource.find(params[:id])
    end
end
