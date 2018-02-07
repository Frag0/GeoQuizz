<template>
	<div class="card" style="width: 18rem;">
		<button type="button" class="btn btn-success" @click="seConnecter">Ajouter une serie</button>
		<button type="button" class="btn btn-success" @click="seConnecter">Ajouter une photo</button>
		<button type="button" class="btn btn-danger" @click="deconnection">Déconnexion</button>
	</div>
</template>

<script>

export default {
	name: 'Menu',
	data () {
		return {
		}
	},
	methods: {
		seConnecter(){
			console.log("coucou")
		},
		deconnection(){
			console.log("coucou");
			window.bus.$emit("logout");
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