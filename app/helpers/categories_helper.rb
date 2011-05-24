# encoding: utf-8

module CategoriesHelper
  def parent_category_name
    content_tag :p, :class => "parent-category" do
      "<span>#{@parent_category.name}</span>".html_safe if @parent_category
    end
  end
  
  def child_categories
    if @category.has_children?
      @categories = @category.children
      render @categories
    else
      render "blank_state"
    end
  end
  
  def services
    if @category.services.any?
      render @category.services
    else
      render "services/blank_state"
    end
  end
  
  def parent_path
    if @category.parent.present?
      @category.parent
    else
      categories_path
    end
  end
  
  def breadcrumbs_for(object)    
    path = object.path if object.present?
  end  
end
