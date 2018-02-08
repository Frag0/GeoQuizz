<template>
	<div>
		<div class="jumbotron">
			<h1 class="display-4">Meilleurs scores</h1>
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
	</div>
</template>

<script>
export default {
	name:'AfficherScores',
	data (){
		return {
			parties: [],
			partie: ''
		}
	},
	mounted(){
		window.axios.get('series/'+this.$route.params.id+'/parties').then(response => {
			this.parties = response.data.parties
		})
	},
	methods:{		
	}
}

</script>

<style scoped>
</style>
