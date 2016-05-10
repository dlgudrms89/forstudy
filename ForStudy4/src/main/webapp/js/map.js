   
AddtoXY atx=new AddtoXY();
AcinfoDAO dao = AcinfoDAO.newInstance();
var locationList=dao.allData();

var locations = [
  ['<b>Name 1</b><br>Address Line 1<br>Bismarck, ND 58501<br>Phone: 701-555-1234<br><a href="#" >Link<a> of some sort.', 46.8133, -100.7790, 4],
  ['<b>Name 2</b><br>Address Line 1<br>Fargo, ND 58103<br>Phone: 701-555-4321<br><a href="#" target="_blank">Link<a> of some sort.', 46.8772, -96.7894, 5]
/*
 * Next point on map
 *   -Notice how the last number within the brackets incrementally increases from the prior marker
 *   -Use http://itouchmap.com/latlong.html to get Latitude and Longitude of a specific address
 *   -Follow the model below:
 *      ['<b>Name 3</b><br>Address Line 1<br>City, ST Zipcode<br>Phone: ###-###-####<br><a href="#" target="_blank">Link<a> of some sort.', ##.####, -##.####, #]
 */
];

var map = new google.maps.Map(document.getElementById('map'), {
  zoom: 7,
  /* Zoom level of your map */
  center: new google.maps.LatLng(47.47021625, -100.47173475),
  /* coordinates for the center of your map */
  mapTypeId: google.maps.MapTypeId.ROADMAP
});

var infowindow = new google.maps.InfoWindow();

var marker, i;

for (i = 0; i < locations.length; i++) {
  marker = new google.maps.Marker({
    position: new google.maps.LatLng(locations[i][1], locations[i][2]),
    map: map
  });

  google.maps.event.addListener(marker, 'click', (function(marker, i) {
    return function() {
      infowindow.setContent(locations[i][0]);
      infowindow.open(map, marker);
    }
  })(marker, i));
}