<template>
	<div class="card" style="width: 18rem;">
		<form @submit="creerSerie">
			<div class="form-group">
				<label for="Ville">Ville</label>
				<input type="text" v-model="ville" class="form-control" id="ville" placeholder="Ville">
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
.card {
	top: 30vh;
	padding: 10px;
	margin: 0 auto;
	float: none;
	margin-bottom: 10px;
}
</style>