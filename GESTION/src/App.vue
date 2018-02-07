<template>
  <div id="app">
    <navBar v-if="this.$store.state.member"></navBar>
    <router-view/>
  </div>
</template>

<script>

import Navbar from '@/components/Navbar'

export default {
	name: 'app',
	components: {Navbar},
	mounted(){
		if (!this.$store.state.member) {
			this.$router.push({path: '/connexion'});
		} else{
			this.$router.push({path: '/bienvenue'});
		}
		window.bus.$on('logout', () => {
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
