<template>
	<div class="card" style="width: 18rem;">
		<router-link to="/serie-creation" class="black btn btn-primary">Ajouter une série</router-link>
		<router-link to="/photo-creation" class="black btn btn-primary">Ajouter une photo</router-link>
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
		logOut() {
      		window.bus.$emit('logout');
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