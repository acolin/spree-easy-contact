require 'spree_core'
require 'honeypot-captcha'
require 'spree_easy_contact_hooks'

module SpreeEasyContact
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end

# Load contact instance and topics for contact form
module SpreeBase
  module InstanceMethods
    protected
    def load_contact_instance
      @contact = Contact.new
    end
    
    def load_topics
      @topics = Topic.all
    end
  end
  
  class << self
    def included_with_easy_contact(receiver)
      included_without_easy_contact(receiver)
      receiver.send :before_filter, 'load_contact_instance'
      receiver.send :before_filter, 'load_topics'
    end
    
    alias_method_chain :included, :easy_contact
  end
end

