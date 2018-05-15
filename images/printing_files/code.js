if(typeof yiel === 'undefined'){
  var yiel = {};
  var _snaq = _snaq || []; //Analytic requests handler

  yiel = {"website":{"id":3094,"name":"istockphoto.com","track_yieldify_only":"false","use_snowplow":"","infrequent_basket_updates":"","shopping_class":"","shopping_selector":"","shopping_cart_multiple":"","shopping_initial":-1,"coupon_selector":"","submit_coupon_selector":"","submit_coupon_just_click":"","shopping_cart_seperator":".","track_visited_pages":"","track_visited_pages_expire":2592000000,"sign_out_class":"","campaigns_protocol":"//","watchdogs":"","cam_ids":"44523,40447,40007,39961,35028,39207","campaigns":"44523,40447,40007,39961,35028,39207","track_products":"","products_url_pattern":"","product_image_css_path":"","form_targeting":"","afiliate_block":"","cookie_block":"","cookie_block_expire":"","referring_traffic_block":"","referring_traffic_expire":"","text_grabb_condition":"no","text_grabb_options":"","track_sale":"true","track_sale_expire":2592000000,"track_impression_sale":"true","track_impression_sales_expire":0,"thanks_page_pattern":"yithankyou,,false,,,,,,;;","sales_extra_details":"url,,Order ID,,yithankyou,,;;url,,Email,,email,,;;url,,Number of Stock cretids,,numberStock,,;;url,,Visitor Number,,visitorNumber,,;;","sale_ajax_update":"true","track_sale_ajax":"","sub_domains":"secure","track_purchases":"","last_price_pattern":"checkout/credits","last_price_selector":"#grand-total","sale_value_multiplier":1.0,"browser_not_target":"","browser_target":"msie|chrome|firefox|safari|opera","delayed_start":500,"iv_delay":10000,"iv_delay_all":"","mouse_hh":0,"aa_delay":0,"bbb_margin":null,"bbb_ratio":8,"bbb_all_location":"","bbb_all_margin":"","bbb_all_ratio":"","exit_margin":"","exit_margin_right":"true","exit_margin_left":"true","exit_margin_right_val":null,"exit_margin_left_val":null,"exit_margin_right_unit":"px","exit_margin_left_unit":"px","show_powerd_by":"","close_image":"","delay":1209600000,"encrypt_userinfo":"true","inactivity_period":15,"sale_display_type":"sale","website_sale_display_value":"1.5","block_script":"","heatmap_script":"window.setInterval(function(){\t\t\r\n\r\n\tvar url = (window.location.href).indexOf('checkout/credits');\r\n\r\n\tif(url > -1) {\r\n\r\n                var fbValue = yiel.md.currencies.parseValue(yiel.$(\"#grand-total .ng-scope.ng-binding\").text());\r\n                var shortCode = yiel.$(\"#grand-total .total span[ng-show='showShortName']\").text();\r\n\t\tvar currency = shortCode + fbValue;\r\n\t\tyiel.fn.setYieldifyCookie('fb', currency);\r\n\t}\r\n}, 1000);\r\n\r\nif (window.location.href.match(/checkout/)){\r\n\t\tvar thankyou = setInterval(function(){\r\n\t\t\tif (yiel.$(\"#thankyou-content\").text()){\r\n                                var vn = yiel.fn.getSpecialCookie(\"s_vnum\").match(/vn\\=([0-9]+)/)[1] || 'n';\r\n\t\t\t\tvar orderID = yiel.$(\"#ty-order-id\").text();\r\n\t\t\t\tvar email = yiel.$(\"#ty-user-email\").text();\r\n                                var numberStock = yiel.$(\"#ty-credits-quantity\").text() || 'n';\r\n\t\t\t\tyiel.$('<iframe src=\"https://www.istockphoto.com/?yithankyou=' + orderID + '&email=' + email + '&numberStock=' + numberStock + '&visitorNumber=' + vn + '\" style=\"display:none !important;\"></iframe>').appendTo(yiel.$(\"body\"));\r\n\t\t\t\tclearInterval(thankyou);\r\n\t\t\t}\r\n\t\t}, 500);\r\n\t}\r\n\r\nfunction bindEvent(element, type, handler) {\r\n    if (element.addEventListener) {\r\n        element.addEventListener(type, handler, false);\r\n    } else {\r\n        element.attachEvent(\"on\" + type, handler);\r\n    }\r\n}\r\n\r\nbindEvent(window, \"message\", function(event) {\r\n    var data = event.data.split(\",\");\r\n    if (data[0] === \"pong\") {\r\n        if (data[1] === \"29698\") {\r\n        \t//overlayA\r\n        \ts.eVar65 = 'Yieldify_Checkout_PopupExpA';\r\n\t\t\ts.prop65 = 'Yieldify_Checkout_PopupExpA';\r\n\t\t\ts.tl(true,'o','Yieldify_AdLoad');\r\n    \t}\r\n        if (data[1] === \"29700\") {\r\n        \t//overlayB\r\n        \ts.eVar65 = 'Yieldify_Checkout_PopupExpB';\r\n\t\t\ts.prop65 = 'Yieldify_Checkout_PopupExpB';\r\n\t\t\ts.tl(true,'o','Yieldify_AdLoad');\r\n    \t}\r\n\t}\r\nif (data[0] === \"nooverlay\") {\r\n        if (data[1] === \"29699\") {\r\n        \t//no overlay\r\nconsole.log(\"Control data fired\");\r\n        \ts.eVar65 = 'Yieldify_Checkout_Control';\r\n\t\t\ts.prop65 = 'Yieldify_Checkout_Control';\r\n\t\t\ts.tl(true,'o','Yieldify_AdLoad');\r\n    \t}\r\n}\r\n});","ajax_coupon_selector":"","max_products_store":5,"analytics_events":"","analytics_events_category_name":"Yieldify","affiliate_blocker":"","affiliate_block_expire":2592000000,"form_refill":"","url_pattern":"","form_refill_fields":"","form_refill_expire":null,"website_version":0,"shopping_item_selector":"","data_fields":[],"data_events":[],"basket_fields":[],"form_fields":[]},"info":{"request_host_with_port":"app.yieldify.com","src":"//d33wq5gej88ld6.cloudfront.net/code_revisions/000/000/098/original/yieldify_1433780351.js?1433780355"}};

  yiel.md = {};

  //load Yieldify here
  if (yiel.info.src) {
    var e = document.createElement('script');
    e.src = yiel.info.src;
    e.async = true;
    document.getElementsByTagName("head")[0].appendChild(e);
  }
}