<template>
	<div>
		<div id="mapid" style="width: 60%; height: 400px;"></div>
	</div>
</template>

<script>
export default {
	name:'AfficherJeu',
	data () {
		return {
			long : 48.8534100,
			lat : 2.3488000
		}
	},
	mounted(){
		this.setMap();
	},
	methods : {
		setMap(){
			var mymap = L.map('mapid').setView([this.long, this.lat], 11);
			var $message = "Bienvenue sur le premier jeu au monde intéractif avec des monuments";
			L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
				maxZoom: 25,
				attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
				'<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
				'Imagery © <a href="http://mapbox.com">Mapbox</a>',
				id: 'mapbox.streets'
			}).addTo(mymap);
			L.marker([48.8534100,2.3488000], {draggable : true}).addTo(mymap).bindPopup($message).openPopup();
		}
	}
}
</script>

<style scoped>
#mapid{
  margin-left : 20%;
}
h1{
  text-align: center;
}
</style>