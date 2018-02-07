<template>
  <div class="page-header bg-primary pt-3 pb-3 mb-2">
    <h1 class="display-3">Bienvenue sur GeoQuizz!</h1>
    <h2>Villes</h2>
    <form>
      <label>Pseudo :</label><input type="text" v-model="pseudo" >
      <label>Ville :</label>
      <select v-model="ville">
      <option v-for="serie in series" v-bind:value="serie.id">{{serie.ville}}</option>
      </select>
    <button @click="commencerPartie">Commencer</button>
  </form>    
</div>

</template>

  <script>
export default {
  	name:'Accueil',
  	data (){
   		return {
    		series : [],
        ville : '',
    		pseudo : '',
   		}
  	},
  	created(){
		window.axios.get('series').then(response => {
			this.series = response.data.series
		})
	},
	methods:{
		commencerPartie(){
			window.axios.post('parties', {
				pseudo : this.pseudo,
				id_serie : this.ville
			}).then(response => {
        this.$store.commit('setPseudo',this.pseudo)
        //this.$router.push({path: '/jeu'});
			})
		}
	}
}

</script>

<style scoped>
</style>
