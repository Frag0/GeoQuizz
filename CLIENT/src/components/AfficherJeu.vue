<template>
	<div>
		<img v-bind:src="url" class="w-50" v-if="!ok">
		<div id="mapid" class="float-right" style="height:500px; width:500px;"></div>
		<button @click="setMap" v-if="ok">Clique</button>
	</div>
</template>

<script>
export default {
	name:'AfficherJeu',
	data () {
		return {
			long : 2.3488000,
			lat : 48.8534100,
			series : [],
			photos : [],
			ok : true,
			url : 'https://www.novap.fr/media/catalog/product/cache/1/image/650x650/9df78eab33525d08d6e5fb8d27136e95/p/n/4160306-330x200-en-reparation-pas-mettre-marche.jpg'
		}
	},
	created(){
		window.axios.get('series').then(response => {
			this.series = response.data.series			
		})
		window.axios.get('series/e8724b30-1c7b-44b3-a144-3602e542add0/photos').then(response => {
			this.photos = response.data.photos
		})
		console.log(this.photos)
	},

	

	methods : {
		setMap(){
			window.axios.get('series/'+this.series[0].id+'/photos').then(response => {
				this.photos = response.data.photos,
				console.log(this.photos)
			})

			this.url= this.photos[0].url;
			this.ok = false;

			var mymap = L.map('mapid').setView([this.series[0].longitude,this.series[0].latitude], 11);
			var $message = "Bienvenue sur le premier jeu au monde intéractif avec des monuments";
			L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
				maxZoom: 25,
				id: 'mapbox.streets'
			}).addTo(mymap);
			L.marker([this.series[0].longitude,this.series[0].latitude], {draggable : true}).addTo(mymap).bindPopup($message).openPopup();

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