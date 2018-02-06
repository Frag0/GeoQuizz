<template>
	<div>
		<img src="../assets/adt.jpg" class="w-50" v-if="!ok">
		<div id="mapid" class="float-right" style="height:500px; width:500px;"></div>
		<button @click="setMap"></button>
	</div>
</template>

<script>
export default {
	name:'AfficherJeu',
	data () {
		return {
			long : 2.3488000,
			lat : 48.8534100,
			series : {Ville : 'Paris', longitude : 2.3488, latitude : 48.8534},
			ok : true
		}
	},
	methods : {
		setMap(){

			this.ok = true;
			var mymap = L.map('mapid').setView([this.lat,this.long], 11);
			var $message = "Bienvenue sur le premier jeu au monde intéractif avec des monuments";
			L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
				maxZoom: 25,
				id: 'mapbox.streets'
			}).addTo(mymap);
			L.marker([48.8534100,2.3488000], {draggable : true}).addTo(mymap).bindPopup($message).openPopup();

			var lat = this.lat;
			var lng = this.long;

			function onMapClick(e) {
				L.marker().setLatLng(e.latlng).addTo(mymap).bindPopup("Tu as cliqué la").openPopup();

				var distance = L.latLng([lat,lng]).distanceTo(e.latlng);

				if(distance < 3000){
					alert("Bien joué poto");
				}
			}

			mymap.on('click', onMapClick);
		}
	}
}
</script>

<style scoped>
#mapid{
}
h1{
  text-align: center;
}
</style>