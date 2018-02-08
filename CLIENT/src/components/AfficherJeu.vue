<template>
	<div class="w-75">
		<img v-bind:src="url" class="w-50" v-if="!ok">
		<div id="mapid" class="float-right" style="height:500px; width:500px;"></div>
		<button @click="setMap" v-if="ok">Clique</button>
		<div v-model="score">{{score}}</div>
	</div>
</template>

<script>
export default {
	name:'AfficherJeu',
	data () {
		return {
			photos : [],
			ok : true,
			mymap: 0,
			score : 0,
			url : '',
			i : 0
		}
	},
	mounted(){
		window.axios.get('series/'+this.$store.getters.getId+'/photos',{headers:  {'Authorization': 'Bearer ' + this.$store.getters.getToken}}).then(response => {
			this.photos = response.data.photos;
		});	
	},
	methods : {
		setMap(){
			this.url = this.photos[this.i].url
			this.ok = false;
			var lat = this.$store.getters.getLatitude;
			var lng = this.$store.getters.getLongitude;

			this.mymap = L.map('mapid').setView([lat,lng], 13);
			L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
				maxZoom: 25,
				id: 'mapbox.streets'
			}).addTo(this.mymap);

			this.mymap.on('click', this.onMapClick);
		},
		onMapClick(e){
			L.marker().setLatLng(e.latlng).addTo(this.mymap).bindPopup("Tu as cliqué la").openPopup();
			L.marker([this.photos[this.i].latitude,this.photos[this.i].longitude]).addTo(this.mymap).bindPopup("La bonne réponse était ici").openPopup();
			var distance = L.latLng([this.photos[this.i].latitude,this.photos[this.i].longitude]).distanceTo(e.latlng);
			//calcul de distance

			if(distance < 300){
				this.score = this.score + 10
				if(confirm("bieng +10 points, on continue ?")){
					this.i++;
					this.url = this.photos[this.i].url
				}
			}
			else if(distance < 600){
				this.score = this.score + 5
				if(confirm("bieng +5 points, on continue ?")){
					this.i++;
					this.url = this.photos[this.i].url
				}
			}
			else if(distance < 1000){
				this.score = this.score + 1
				if(confirm("bieng +1, on continue ?")){
					this.i++;
					this.url = this.photos[this.i].url
				}
			}
			else{
				if(confirm("Pas de point désolé, on continue ?")){
					this.i++;
					this.url = this.photos[this.i].url
				}
			}
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