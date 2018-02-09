<template>
	<div class="jumbotron">
		<h1 class="display-4">Bienvenue sur GeoQuizz!</h1>
		<hr class="my-4">
		<p>Bienvenue sur le meilleur jeu de positionnement géographique</p>
		<form>
			<label>Pseudo :</label><input type="text" v-model="pseudo" >
			<label>Ville :</label>
			<select v-model="ville" class="custom-select w-25">
				<option v-for="serie in series" v-bind:value="serie.id">{{serie.ville}}</option>
			</select>
			<button class="btn btn-outline-success" @click="commencerPartie">Commencer</button>
		</form>
		<hr class="my-4">
		<p>Classement</p>
		<div v-for="serie in series">
			<router-link :to="{ name: 'AfficherScores', params: {id:serie.id}}"><strong>{{serie.ville}}</strong></router-link>
		</div>
	</div>

</template>

<script>
export default {
    name:'Accueil',
    data (){
        return {
          series : [],
          ville : '',
          pseudo : ''
        }
    },
    mounted(){
      this.$store.commit('putToken', false)
    },
    created(){
      window.axios.get('series').then(response => {
         this.series = response.data.series
        })
    },
    methods:{
        commencerPartie(){
            if(this.ville === "" || this.pseudo === ""){
              alert("Veuillez remplir les champs")
            }else{
               window.axios.post('parties',{
                  pseudo : this.pseudo,
                  id_serie : this.ville
              }).then(response => {
                  window.axios.get('series/'+this.ville).then(response => {
                     this.$store.commit('putSerie', response.data.serie)
             })
              this.$store.commit('putPseudo', this.pseudo);
              this.$store.commit('putToken', response.data.token)
              this.$router.push({path: '/jeu'});
                })
            }   
        }
    }
}

</script>

<style scoped>
</style>
