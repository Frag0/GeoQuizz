<template>
	<div id="app">
		<router-view/>
	</div>
</template>

<script>

export default {
	name: 'app',
	components: {},
	mounted(){
		if (!this.$store.state.member) {
			this.$router.push({path: '/connexion'});
		} else{
			this.$router.push({path: '/menu'});
		}
		window.bus.$on('logout', () => {
			window.axios.delete('members/signout');
			this.$store.commit('setMember', false);
			this.$store.commit('setToken', false);
			this.$router.push({path: '/connexion'});
		})
	}
}
</script>

<style>
@import 'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'
</style>
