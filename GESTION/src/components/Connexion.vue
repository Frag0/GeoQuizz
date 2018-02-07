<template>
	<div class="card " style="width: 18rem;">
		<form @submit="seConnecter">
			<div class="form-group">
				<label for="Identifiant">Identifiant</label>
				<input type="text" v-model="identifiant" class="form-control" id="identifiant" placeholder="Identifiant">
			</div>
			<div class="form-group">
				<label for="password">Mot de passe</label>
				<input type="password" v-model="password" class="form-control" id="password" placeholder="Mot de passe">
			</div>
			<center><button type="submit" class="btn btn-outline-primary">Connexion</button></center>
			<center><router-link to="/membre-creation">Créer un compte</router-link></center>
		</form>
	</div>
</template>

<script>

export default {
	name: 'Connexion',
	data () {
		return {
			identifiant: '',
			password: ''
		}
	},
	methods: {
		seConnecter(){
			window.axios.post('users/signin', {
				identifiant: this.identifiant,
				password: this.password,
			}).then((response) => {
				this.$store.commit('setMember', response.data);
				this.$store.commit('setToken', response.data.token);
				this.$router.push({path: '/menu'});
			}).catch((error) => {
				console.log(error)
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