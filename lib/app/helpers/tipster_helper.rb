require 'app/models/user_tip_hide.rb'

module TipsterHelper
    
    # tip(title, object_id = nil)
    def tip(*token, &block)
        controller = params[:controller]
        action = params[:action]
            
        raise ArgumentError("Controller (%s) - action (%s) tips take at least 1 argument (title)" % [controller, action]) if token.size < 1
        
        if block_given?
            title = token[0]
            
            object_id = token[1] || nil
            
            tip_id = if object_id.nil?
                "#{controller}-#{action}".hash
            else
                "#{controller}-#{action}-#{object_id}".hash
            end
            
            if UserTipHide.find(:first, :conditions => {:user_id => current_user.id, :tip_id => tip_id}).nil?
                link_close = link_to("", url_for(:controller => :tipster, :action => :hide, :id => tip_id), :class => :close)
                
                title_content = content_tag(:h3, title) + link_close
                title_div = content_tag(:div, title_content, :class => :title)
                
                content_div = content_tag(:div, capture(&block), :class => :content)
                
                tip_div = content_tag(:div, title_div + content_div, :class => :tip)            
                
                concat(tip_div)
            end
        end
    end    
end
