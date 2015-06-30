For Name and Id of Places in a region : http://localhost/tourepedia/website/api/slim.php/region/places/$place_id

For Place basic info with id known: http://localhost/tourepedia/website/api/slim.php/places/$place_id
For attractions with place id known:  http://localhost/tourepedia/website/api/slim.php/$id/attractions

for example for all places name in north call this method:

http://localhost/tourepedia/website/api/slim.php/region/places/1

it will give all places name and id for that region.


for place data when you click say shimla call this url in http


http://localhost/tourepedia/website/api/slim.php/places/$place_id

it will give place info which need  in the place page right now


now on click proceed attractions..
call http://localhost/tourepedia/website/api/slim.php/$id/attractions

will give all attractions data.