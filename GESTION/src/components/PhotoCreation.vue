<template>
	<div class="card" style="width: 40rem;">
		<form @submit="ajouterPhoto">
			<div class="form-group">
				<label for="url">URL</label>
				<input type="text" v-model="url" class="form-control" id="url" placeholder="URL">
			</div>
			<div class="form-group">
				<label for="ville">Ville</label>
				<select id="ville" v-model="ville" class="custom-select">
					<option v-for="serie in series" v-bind:value="serie.id" @click="setMap(serie.latitude, serie.longitude)">{{serie.ville}}</option>
				</select>
			</div>
			<div id="mapid" style="width: 100%; height: 400px;"></div>
			<center><button type="submit" class="btn btn-outline-primary">Créer</button></center>

		</form>
	</div>
</template>

<script>

export default {
	name: 'PhotoCreation',
	data () {
		return {
			url: '',
			series: [],
			serie: '',
			ville: '',
			longitude: null,
			latitude: null,
			map_init: false,
			mymap: 0,
			marker: false
		}
	},
	mounted() {
		window.axios.get('series').then(response => {
			this.series = response.data.series		
		})
	},
	methods: {
		ajouterPhoto(){
			if (window.bus.longitude != null && window.bus.latitude != null && this.ville != '' && this.url) {
				window.axios.post('series/'+this.serie.id+'/photos', {
					url: this.url,
					longitude: window.bus.longitude,
					latitude: window.bus.latitude,
					id_ville: this.ville
				}, {headers:  {'Authorization': 'Bearer ' + this.$store.state.member.token }}).then(response => {
					window.bus.longitude = null
					window.bus.latitude = null
					this.$router.push({path: '/bienvenue'});  
				})
			}else{
				alert('Veuillez placer un marqueur et remplir le champ URL')
			}
		},
		setMap(lat, lng){
			if (!this.map_init) {
				this.map_init = true
				this.mymap = L.map('mapid').setView([lat,lng], 13);
				L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
					maxZoom: 18,
					attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
					'<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
					'Imagery © <a href="http://mapbox.com">Mapbox</a>',
					id: 'mapbox.streets'
				}).addTo(this.mymap);
				var marker = 0;
				this.mymap.on('click', this.onMapClick);
			}else{
				this.mymap.flyTo([lat,lng])
			}
		},
		onMapClick(e) {
			if (!this.marker) {
				this.marker = L.marker().setLatLng(e.latlng).addTo(this.mymap)
				window.bus.longitude = this.marker.getLatLng().lng
				window.bus.latitude = this.marker.getLatLng().lat
			}else{
				this.marker.setLatLng(e.latlng)
				window.bus.longitude = this.marker.getLatLng().lng
				window.bus.latitude = this.marker.getLatLng().lat
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