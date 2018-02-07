<template>
	<div class="card" style="width: 18rem;">
		<form @submit="creerSerie">
			<div class="form-group">
				<label for="Lien">Lien</label>
				<input type="text" v-model="ville" class="form-control" id="lien" placeholder="Lien">
			</div>
			<div class="form-group">
				<label for="Serie">Lien</label>
				<input type="text" v-model="ville" class="form-control" id="lien" placeholder="Lien">
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
			lien: '',
		}
	},
	methods: {
		ajouterPhoto(){
			window.axios.post('series/'+this.$route.params.id+'/photos', {
	        lien: this.lien,
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