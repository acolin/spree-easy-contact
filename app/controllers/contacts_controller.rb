class ContactsController < Spree::BaseController
  before_filter :load_topics
  
  def new
    @contact = Contact.new
    
    respond_to do |format|
      format.js
    end
  end
  
  def create
    @contact = Contact.new(params[:contact] || {})
    respond_to do |format|
      if @contact.valid? &&  @contact.save
        ContactMailer.message_email(@contact).deliver
        format.js
      else
        format.js
      end
    end
  end
  
  private
  def load_topics
    @topics = Topic.all
  end
end