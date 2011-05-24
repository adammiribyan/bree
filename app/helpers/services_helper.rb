module ServicesHelper
  def category_id
    if @service.category.present?
      @service.category.id
    else
      params[:id].to_s
    end
  end
end
