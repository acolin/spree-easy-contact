class SpreeEasyContactHooks < Spree::ThemeSupport::HookListener
  # custom hooks go here
  insert_after :admin_tabs do
    %(<%= tab(:contacts) %>)
  end
  
  insert_after :inside_head do
    'contacts/content_for_head'
  end
  
  insert_after :inside_head do
    'contacts/contact_us_holder'
  end
  
  insert_after :admin_configurations_menu do
    "<%= configurations_menu_item(I18n.t('topics'), admin_topics_path, I18n.t('topics_description')) %>"
  end
  
end