<template>
	<div class="card" style="width: 18rem;">
		<form @submit="creerSerie">
			<div class="form-group">
				<label for="Ville">Ville</label>
				<input type="text" v-model="ville" class="form-control" id="ville" placeholder="Ville">
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
		}
	},
	methods: {
		creerSerie(){
			window.axios.post('series', {
				ville: this.ville,
			}).then(response => {
	        //this.$router.push({path: '/series'});  
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