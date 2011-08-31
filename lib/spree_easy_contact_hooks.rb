class SpreeEasyContactHooks < Spree::ThemeSupport::HookListener
  # custom hooks go here
  insert_after :admin_tabs do
    %(<%= tab(:contacts) %>)
  end
  
  insert_after :inside_head, :partial => 'contacts/content_for_head'
  
  insert_after :inside_head, :partial => 'contacts/contact_us_holder'
  
  insert_after :admin_configurations_menu do
    "<%= configurations_menu_item(I18n.t('topics'), admin_topics_path, I18n.t('topics_description')) %>"
  end
  
end