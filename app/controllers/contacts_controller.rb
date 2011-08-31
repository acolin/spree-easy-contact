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
      ContactMailer.message_email(@contact).deliver if @contact.valid? &&  @contact.save
      format.js
    end
  end
  
  private
  def load_topics
    @topics = Topic.all
  end
end