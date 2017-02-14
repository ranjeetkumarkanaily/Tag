class TagsController < ApplicationController
  def create
    begin
      entity_type, entity_id, tags = params[:entity_type], params[:entity_id], params[:tags]
      if entity_type and entity_id and tags
        tag = Tag.where(entity_type: entity_type, entity_id: entity_id).first_or_initialize
        tag.tags = tags
        tag.save!
        render json: {tag: tag.as_json(only: [:entity_type, :entity_id, :tags])}, status: :ok
      else
        render json: {error: "Please provide entity_type, entity_id and tags"}, status: :not_acceptable
      end
    rescue Exception => e
      render json: {error: e.message}, status: :internal_server_error
    end
  end

  def show
    begin
      entity_type, entity_id = params[:entity_type], params[:entity_id]
      if entity_type and entity_id
        render json: {tag: (Tag.tags entity_type, entity_id)}, status: :ok
      else
        render json: {error: "Please provide entity_type and entity_id"}, status: :not_acceptable  
      end
    rescue Exception => e
      render json: {error: e.message}, status: :internal_server_error
    end
  end

  def stats
    begin
      entity_type, entity_id = params[:entity_type], params[:entity_id]
      stats = Tag.stats entity_type, entity_id
      render json: {stats: stats}, status: :ok
    rescue Exception => e
      render json: {error: e.message}, status: :internal_server_error
    end
  end

  def destroy
    begin
      entity_type, entity_id = params[:entity_type], params[:entity_id]
      if entity_type and entity_id
        tag = Tag.where(entity_type: entity_type, entity_id: entity_id)
        tag.destroy_all
        render json: {message: 'Tags were deleted successfull'}, status: :ok
      else
        render json: {error: "Please provide entity_type and entity_id"}, status: :not_acceptable  
      end  
    rescue Exception => e
      render json: {error: e.message}, status: :internal_server_error
    end
  end
end
