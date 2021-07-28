local data = webclient.downloadString('https://random-data-api.com/api/color/random_color')
--downloadString(value) - it`s Platform method for upload body of response from RestAPI, equals GET-request of HTTP protocol.

function update_data(_response)
	_response = _response:gsub("%{", "")
	_response = _response:gsub("%}", "")
	t = {}
	for str in _response.gmatch(_response, '[^,%s]+') do
		table.insert(t, str)
	end
	for i=1,4 do
	    _path_data = '/Tags/Json/json'..i
		_path_key = '/Tags/Json/key'..i
		_data_tag = Context:GetTag(_path_data)
		_key_tag = Context:GetTag(_path_key)
		_value = tostring(t[i])
		_value = _value:gsub('%"','')	
		one, two = _value:match("([^:]+):([^:]+)")
		_key_tag:SetValue(one)
		_data_tag:SetValue(two)
	end
end
update_data(data)