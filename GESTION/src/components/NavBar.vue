<template>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="#">GeoQuizz</a>
      </div>
      <ul class="nav navbar-nav">
        <router-link to="/serie-creation" class="white btn btn-primary">Ajouter une série</router-link>
      </ul>
      <ul class="nav navbar-nav">
       <router-link to="/photo-creation" class="white btn btn-primary">Ajouter une photo</router-link>
     </ul>
    <ul class="nav navbar-nav navbar-right">
      <button @click="logOut" class="btn btn-outline-danger deconnexion ">Se déconnecter</button>
    </ul>
  </div>
</nav> 
</template>

<script>
export default {
  name: 'NavBar',
  data(){
    return {}
  },
  methods: {
    logOut() {
      window.bus.$emit('logout');
    }
  }
}
</script>

<style scoped>

.black{

  color : black;


}


</style>