<template>
  <div id="app">
    <navBar v-if="this.$store.state.member"></navBar>
    <router-view/>
  </div>
</template>

<script>

import NavBar from './components/NavBar.vue'

export default {
  name: 'app',
  components: {
    NavBar
  },
  mounted(){
    if (!this.$store.state.member) {
      this.$router.push({path: '/connexion'});
    } else{
      this.$router.push({path: '/menu'});
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
