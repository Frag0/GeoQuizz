<template>
  <div>
    <div class="page-header bg-primary pt-3 pb-3 mb-2">
      <h1 class="display-3">Bienvenue sur GeoQuizz!</h1>
    </div>

    <form>
      <p>Votre pseudo :<p><input type="text" name="pseudo" v-model="pseudo" placeholder="Pseudo">
      <p>Series :</p>
      <select name="ville">
        <option v-for="serie in series" v-bind:value="serie.id">{{serie.ville}}</option>
      </select>
      <select name="level">
        <option>1</option><option>2</option><option>3</option>
      </select>
      <button @click="demarrerPartie">Accès au jeu.</button>
    </form>
    
  </div>
  
</template>

<script>
export default {
  name:'Accueil',
  data (){
    return {
      series : [],
      pseudo : '',
      level : '',
      serie : '',
    }
  },
  created(){
    window.axios.get('series').then(response => {
      this.series = response.data.series
    })
  },
  methods : {
    demarrerPartie(){
      window.axios.post('partie',{
        pseudo : this.pseudo,

      })
    }
  }
}

</script>

<style scoped>
</style>
