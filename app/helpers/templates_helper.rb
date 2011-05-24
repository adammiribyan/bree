module TemplatesHelper
  def highlight_when_changed
    if flash[:updated_id].present?
      content_tag :script, :type => "text/javascript" do
        render :partial => "highlight.js"
      end
    end
  end
end
