json.array! @ads do |ad|
	json.id ad.id
	json.city ad.city
	json.car_make ad.car_make
	json.price ad.price
	json.milage ad.milage
	json.transmission_type ad.transmission_type
	json.assembly_type ad.assembly_type
	json.engine_capacity ad.engine_type
	json.color ad.color
	json.add_description ad.add_description
	json.primary_contact ad.primary_contact
	json.secondary_contact ad.secondary_contact

 end