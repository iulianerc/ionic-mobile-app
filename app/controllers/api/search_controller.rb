class Api::SearchController < ApiController
  skip_before_action :authenticate!

  def index
    @results = Search.new(query: params[:q], load: false, models: models, page: params[:page], per_page: 25).results
    attachment_ids = @results.map { |r| r[:attachment_id] }.compact
    @attachments = ActiveStorage::Attachment.includes(:record, blob: :variant_records).where(id: attachment_ids).index_by(&:id)
    set_pagination_header @results
    fresh_when @results
  end

  private

  def models
    params[:type].blank? ?
      Search::MODELS :
      Search::MODELS & params[:type].split(",").map { |type| type.singularize.classify.constantize }
  end
end
