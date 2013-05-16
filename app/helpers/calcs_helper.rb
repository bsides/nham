module CalcsHelper

	def hinted_text_field_tag(name, value = nil, hint = "Click and enter text", options={})
  value = value.nil? ? hint : value
  text_field_tag name, value, {:onclick => "if($(this).value == '#{hint}'){$(this).value = ''}", :onblur => "if($(this).value == ''){$(this).value = '#{hint}'}" }.update(options.stringify_keys)
	end

	# inside form_for example

	#hinted_text_field_tag :search, params[:search], "Enter name, brand or mfg.", :size => 30  
	# => <input id="search" name="search" onblur="if($(this).value == ''){$(this).value = 'Enter name, brand or mfg.'}" onclick="if($(this).value == 'Enter name, brand or mfg.'){$(this).value = ''}" size="30" type="text" value="Enter name, brand or mfg." />

end
