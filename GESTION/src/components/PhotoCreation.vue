<template>
	<div class="card" style="width: 18rem;">
		<form @submit="ajouterPhoto">
			<div class="form-group">
				<label for="url">URL</label>
				<input type="text" v-model="url" class="form-control" id="url" placeholder="URL">
			</div>
			<div class="form-group">
				<select v-model="ville">
      				<option v-for="serie in series" v-bind:value="serie.id">{{serie.ville}}</option>
      			</select>
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
	name: 'PhotoCreation',
	data () {
		return {
			url: '',
			series: [],
			serie: '',
			ville: '',
			longitude: null,
			latitude: null
		}
	},
	mounted() {
		window.axios.get('series').then(response => {
			this.series = response.data.series			
		})
	},
	methods: {
		ajouterPhoto(){
			window.axios.post('series/'+this.serie.id+'/photos', {
	        url: this.url,
	        longitude: this.longitude,
	        latitude: this.latitude,
	        id_ville: this.ville
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