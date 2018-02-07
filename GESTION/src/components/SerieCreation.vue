<template>
	<div class="card" style="width: 40rem;">
		<form @submit="creerSerie">
			<div class="form-group">
				<label for="Ville">Ville</label>
				<input type="text" v-model="ville" class="form-control" id="ville" placeholder="Ville">
			</div>
			<label for="mapid">Veuillez positionnez le marqueur sur la carte</label>
			<div id="mapid" style="width: 100%; height: 400px;"></div>
			<center><button type="submit" class="btn btn-outline-primary">Créer</button></center>
		</form>
	</div>
</template>

<script>

export default {
	name: 'SerieCreation',
	components: {},
	data () {
		return {
			ville: '',
			longitude: null,
			latitude: null
		}
	},
	mounted(){
		var mymap = L.map('mapid').setView([48.8589507,2.2770204], 5);
		L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
		maxZoom: 18,
		attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
			'<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
			'Imagery © <a href="http://mapbox.com">Mapbox</a>',
		id: 'mapbox.streets'
		}).addTo(mymap);
		var marker = 0;
		function onMapClick(e) {
			if (marker == 0) {
				marker = L.marker().setLatLng(e.latlng).addTo(mymap)
				window.bus.longitude = marker.getLatLng().lng
				window.bus.latitude = marker.getLatLng().lat
			}else{
				marker.setLatLng(e.latlng)
				window.bus.longitude = marker.getLatLng().lng
				window.bus.latitude = marker.getLatLng().lat
			}
		};
		mymap.on('click', onMapClick)
	},
	methods: {
		creerSerie(){
			if (window.bus.longitude != null && window.bus.latitude != null && this.ville != '') {
				window.axios.post('series', {
		        	ville: this.ville,
		        	longitude: window.bus.longitude,
		        	latitude: window.bus.latitude
	    		}, {headers:  {'Authorization': 'Bearer ' + this.$store.state.member.token }})
	    		.then(response => {
	    			window.bus.longitude = null
	    			window.bus.latitude = null
	        		this.$router.push({path: '/bienvenue'});  
	      		})
			}else{
				alert("Veuillez placer le marqueur et remplir le champ ville ! ")
			}
			
		}
	}
}
</script>

<style scoped>
.card {
	top: 15vh;
	padding: 10px;
	margin: 0 auto;
	float: none;
	margin-bottom: 10px;
}
</style>