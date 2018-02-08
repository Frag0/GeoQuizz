<template>
  <div class="page-header bg-primary pt-3 pb-3 mb-2">
    <h1>Meilleurs scores</h1>
    <table v-for="partie in parties">
      <tr>
        <td>{{partie.pseudo}}</td>
        <td>{{partie.score}}</td>
      </tr>
    </table>
  </form>    
</div>

</template>

  <script>
export default {
  	name:'AfficherScores',
  	data (){
   		return {
    		parties: [],
        partie: ''
   		}
  	},
  	mounted(){
		window.axios.get('parties').then(response => {
			this.parties = response.data.parties
		})
	},
	methods:{		
	}
}

</script>

<style scoped>
</style>
