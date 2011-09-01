class Admin::ContactsController < Admin::BaseController
  resource_controller
  
  def mark_as_read
    @contact = Contact.find(params[:id])
    @contact.mark_as_read
    
    redirect_to :action => "index"
  end
end