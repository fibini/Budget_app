class EntitiesController < ApplicationController
  def index
    @group = current_user.groups.find(params[:group_id])
    @entities = @group.entities.order(created_at: :desc)
    @amount = @entities.sum(:amount)
  end

  def new
    @entity = Entity.new
  end

  def create
    @group = Group.find(params[:group_id])
    @entity = Entity.new(entity_params)
    @entity.user = current_user
    @entity.groups.push(@group)

    respond_to do |format|
      if @entity.save
        format.html { redirect_to group_entities_path, notice: 'Entity was successfully created.' }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to entities_url, notice: 'Entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
