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
	</div>
</template>

<script>

export default {
	name: 'SerieCreation',
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
.card {
	top: 30vh;
	padding: 10px;
	margin: 0 auto;
	float: none;
	margin-bottom: 10px;
}
</style>