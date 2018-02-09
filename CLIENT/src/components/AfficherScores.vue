<template>
	<div>
		<div class="jumbotron">
			<h1 class="display-4">Meilleurs scores</h1>
			<div v-for="serie in series">
				<h1 v-if="serie.id == $route.params.id" class="display-5">{{serie.ville}}</h1>
			</div>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Pseudo</th>
					<th scope="col">Score</th>
				</tr>
			</thead>
			<tbody>
				<tr v-for="(partie,i) in parties">
					<th scope="row">{{i+1}}</th>
					<td>{{partie.pseudo}}</td>
					<td>{{partie.score}}</td>
				</tr>
			</tbody>
		</table>
		<center><router-link to="/">Retour à l'accueil</router-link></center>
	</div>
</template>

<script>
export default {
	name:'AfficherScores',
	data (){
		return {
			parties: [],
			partie: '',
			series: [],
			serie: ''
		}
	},
	mounted(){
		window.axios.get('series/'+this.$route.params.id+'/parties').then(response => {
			this.parties = response.data.parties
		})
		window.axios.get('series/').then(response => {
			this.series = response.data.series
		})
	},
	methods:{		
	}
}

</script>

<style scoped>
</style>
