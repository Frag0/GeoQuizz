<template>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#/bienvenue">Gestion</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-item nav-link" href="#/photo-creation">Création photo</a>
				<a class="nav-item nav-link" href="#/serie-creation">Création série</a>
				<button class="btn btn-outline-danger" @click="logOut">Déconnexion</button>
			</div>
		</div>
	</nav>
</template>

<script>
export default {
	name: 'Navbar',
	data(){
		return {
		}
	},
	methods: {
		logOut(){
			window.bus.$emit("logout");
		}
	}
}
</script>

<style scoped>

</style>