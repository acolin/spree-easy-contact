class SpreeEasyContactHooks < Spree::ThemeSupport::HookListener
  # custom hooks go here
  insert_after :admin_tabs do
    %(<%= tab(:contacts) %>)
  end
  
  insert_after :inside_head, :partial => 'contacts/content_for_head'
  
  insert_before :inside_footer, :partial => 'contacts/contact_us_holder'
  
  insert_after :admin_configurations_menu do
    "<%= configurations_menu_item(I18n.t('topics'), admin_topics_path, I18n.t('topics_description')) %>"
  end
  
  insert_after :outside_footer do
    '<a href="#" id="contact-us" data-reveal-id="contact-us-modal"><%= t("contact_us") %></a>'
  end
  
end