<template>
	<div class="card" style="width: 18rem;">
		<form @submit="creerSerie">
			<div class="form-group">
				<label for="Ville">Ville</label>
				<input type="text" v-model="ville" class="form-control" id="ville" placeholder="Ville">
			</div>
			<div class="form-group">
				<label for="Longitude">Longitude</label>
				<input type="text" v-model="longitude" class="form-control" id="longitude" placeholder="Longitude">
			</div>
			<div class="form-group">
				<label for="Latitude">Latitude</label>
				<input type="text" v-model="latitude" class="form-control" id="latitude" placeholder="Latitude">
			</div>
			<center><button type="submit" class="btn btn-outline-primary">Créer</button></center>
		</form>
		<div>
			<v-map :zoom=13 :center="[47.413220, -1.219482]">
				<v-tilelayer url="http://{s}.tile.osm.org/{z}/{x}/{y}.png"></v-tilelayer>
				<v-marker :lat-lng="[47.413220, -1.219482]"></v-marker>
			</v-map>
		</div>
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
			latitude: null,
		}
	},
	methods: {
		creerSerie(){
			window.axios.post('series', {
		        ville: this.ville,
		        longitude: this.longitude,
		        latitude: this.latitude
	      }, {headers:  {'Authorization': 'Bearer ' + this.$store.state.member.token }}).then(response => {
	        this.$router.push({path: '/bienvenue'});  
	      })
		}
	}
}
</script>

<style scoped>
@import "https://unpkg.com/leaflet@1.3.1/dist/leaflet.css";
.card {
	top: 30vh;
	padding: 10px;
	margin: 0 auto;
	float: none;
	margin-bottom: 10px;
}
</style>