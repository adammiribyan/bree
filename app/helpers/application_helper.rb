# encoding: utf-8

module ApplicationHelper
  def title(page_title)
    if pjax?
      concat(content_tag(:title, page_title))
    else
      content_for(:title) { page_title }
    end
  end  
  
  def body_classes
    @body_classes ||= [controller.controller_name]
    
    if controller.action_name == "new"  || 
       controller.action_name == "edit" || 
       controller.controller_name == "categories" ||
       controller.controller_name == "doctors" ||
       controller.controller_name == "templates" ||
       controller.controller_name == "appointments" ||
       controller.controller_name == "reminders" ||
       controller.controller_name == "sessions" ||
       controller.controller_name == "statistics" ||
       (controller.controller_name == "patients" && controller.action_name == "index")
      
      @body_classes << "form"
    end    
  end
  
  def focus_only_new
    unless controller.action_name == "new"
      false
    else
      true
    end
  end  
  
  def submit_label
    case controller.action_name
      when "new" 
        "Добавить"
      when "edit" 
        "Изменить"
      else
        "Сохранить"
    end
  end
  
  def link_to_delete(object)
    content_tag :span, :class => "delete" do
      link_to content_tag(:span, "", :class => "icon"), object, :confirm => 'Вы уверены?', :method => :delete
    end
  end
  
  def link_to_edit(model, object)
    link_to "Правка", send("edit_#{model}_path", object), :class => "admin"
  end
end
