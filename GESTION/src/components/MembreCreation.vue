<template>
	<div class="card" style="width: 18rem;">
		<form @submit="creerMembre">
			<div class="form-group">
				<label for="Identifiant">Identifiant</label>
				<input type="text" v-model="identifiant" class="form-control" id="identifiant" placeholder="Identifiant">
			</div>
			<div class="form-group">
				<label for="password">Mot de passe</label>
				<input type="password" v-model="password" class="form-control" id="password" placeholder="Mot de passe">
			</div>
			<div class="form-group">
				<label for="password">Vérifier le mot de passe</label>
				<input type="password" v-model="verif" class="form-control" id="verif" placeholder="Vérifier le mot de passe">
			</div>
			<center><button type="submit" class="btn btn-outline-primary">Valider</button></center>
			<center><router-link to="/connexion">Se connecter</router-link></center>
		</form>
	</div>
</template>

<script>

export default {
	name: 'MembreCreation',
	data () {
		return {
		  identifiant: '',
	      password: '',
	      verif:''
		}
	},
	methods: {
		creerMembre() {
	      if (this.verif!==this.password) {
	        alert('Les mots de passe ne correspondent pas')
	      }
	      else {
	        window.axios.post('users', {
	          identifiant: this.identifiant,
	          password: this.password,
	        }).then(response => {
	          this.$router.push({path: '/connexion'})
	        }).catch((error) => {
	          alert(error.response.data.error.join("\n"))
	        })
	      }
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