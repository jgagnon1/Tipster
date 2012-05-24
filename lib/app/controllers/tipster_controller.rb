class TipsterController < ApplicationController
    
    def hide
        if !params[:id].blank?
            begin
                UserTipHide.create(:user => current_user, :tip_id => params[:id])
            rescue
                # Do nothing since we don't want to crash for tips only.
            end
            
            respond_to do |format|
                format.html { redirect_to :back }
                format.json { render :json => {:status => :ok}.to_json }
            end
        end
    end
    
end