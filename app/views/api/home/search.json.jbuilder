json.records do |json|
	json.array! @records do |record|
		json.id record.id
		json.city record.city
	end
end
