<template>
	<div>
		<div class="mt-5" v-if="this.$store.getters.getToken">
			<center><button class="btn btn-outline-success btn-lg btn-block w-75" @click="setMap" v-if="ok">Démarrer la partie</button></center>
			<div class="card card-border float-left" v-if="!ok" style="height: 75vh; width: 40vw">
				<img v-bind:src="url" style="max-witdh: 100%">
			</div>
			<div class="card p-5 float-left" v-if="!ok" style="height: 35vh; width: 20vw">
				<h1>Score : </h1>
				<h1 v-model="score">{{score}}</h1>
				<button class="btn btn-outline-success mt-5" @click="suivant" v-if="!ok">Suivant</button>
				<div v-model="count" class="rounded mt-3" style="background-color:blue;color:white;"><center>{{count}}</center></div>
			</div>
			<div class="card card-border" style="height: 75vh; width: 40vw">
				<div id="mapid" class="float-right" style="height:100%; width:100%;"></div>
			</div>
			<center><button class="btn btn-outline-success btn-lg btn-block w-75" v-if="this.i === this.photos.length-1" @click="envoyer">Partie finie</button></center>
		</div>
		<div class="jumbotron" v-if="!this.$store.getters.getToken">
			<h2 class="display-4">Attention petit malin !</h2>
			<hr class="my-4">
			<p>Pour démarrer une partie, il faut définir ton pseudo et une ville :)</p>
			<router-link to="/" class="btn btn-outline-success">Aller à l'accueil !</router-link>
		</div>
		<div class="card-footer text-muted fixed-bottom">
			<center>{{this.message}}</center>
		</div>
	</div>

</template>

<script>
export default {
	name:'AfficherJeu',
	data () {
		return {
			photos : [],
			ok : true,
			mymap: 0,
			score : 0,
			url : '',
			i : 0,
			marker : 0,
			marker2 : 0,
			count : 0,
			inter : 0,
			temps : 0,
			message: null
		}
	},
	methods : {
		setMap(){
			window.axios.get('series/'+this.$store.getters.getId+'/photos' , {headers: {'Authorization': 'Bearer '+this.$store.getters.getToken}}).then(response => {
				this.photos = response.data.photos;
				this.url = this.photos[this.i].url;
				this.ok = false;
				var lat = this.$store.getters.getLatitude;
				var lng = this.$store.getters.getLongitude;

				this.mymap = L.map('mapid').setView([lat,lng], 13);
				L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
					maxZoom: 25,
					id: 'mapbox.streets'
				}).addTo(this.mymap);

				this.mymap.on('click', this.onMapClick);
				this.setInter();
			});
		},
		onMapClick(e){
			if(!this.marker){
				this.marker = L.marker().setLatLng(e.latlng).addTo(this.mymap).bindPopup("Tu as cliqué la").openPopup();
				this.marker2 = L.marker([this.photos[this.i].latitude,this.photos[this.i].longitude]).addTo(this.mymap).bindPopup("La bonne réponse était ici").openPopup();
				var distance = L.latLng([this.photos[this.i].latitude,this.photos[this.i].longitude]).distanceTo(e.latlng);
			//calcul de distance
			if(this.count < 20){
				if(distance < 400){
					if(this.count<5){
						this.score = this.score + 5*4;
						this.message = "Vous avez marqué : 20 points !";
					}
					else if(this.count<10){
						this.score = this.score + 5*2;
						this.message = "Vous avez marqué : 10 points !";
					}
					else if(this.count<20){
						this.score = this.score + 5;
						this.message = "Vous avez marqué : 5 points !";
					}
				}
				else if(distance < 800){
					if(this.count<5){
						this.score = this.score + 3*4;
						this.message = "Vous avez marqué : 12 points !";
					}
					else if(this.count<10){
						this.score = this.score + 3*2;
						this.message = "Vous avez marqué : 6 points !";
					}
					else if(this.count<20){
						this.score = this.score + 3;
						this.message = "Vous avez marqué : 3 points !";
					}
				}
				else if(distance < 1200){
					if(this.count<5){
						this.score = this.score + 1*4;
						this.message = "Vous avez marqué : 4 points !";
					}
					else if(this.count<10){
						this.score = this.score + 1*2;
						this.message = "Vous avez marqué : 2 points !";
					}
					else if(this.count<20){
						this.score = this.score + 1;
						this.message = "Vous avez marqué : 1 points !";
					}
				}
				else{
					this.message = "Vous n'avez pas marqué de points ! "
				}
			}
			else{
				this.message = "Vous avez mis trop de temps à répondre !"
			}
		}
	},
	setInter(){
		console.log(this.marker)
		this.inter = setInterval(this.timer,1000);
	},
	timer(){
		if(!this.marker){
			this.count ++;
		}
		else{
			this.temps = this.count
		}
	},
	suivant(){
		if(this.marker){
			if(this.i == this.photos.length -1){
				clearInterval(this.inter)
			}
			else{
				console.log(this.i)
				this.i++;
				this.url = this.photos[this.i].url
				this.mymap.removeLayer(this.marker)
				this.mymap.removeLayer(this.marker2)
				this.marker=null
				this.marker2=null
				this.count=0
			}
		}
	},
	envoyer(){
		window.axios.put('parties',{
			score : this.score,
			statut : 1,
		},{headers: {'Authorization': 'Bearer '+this.$store.getters.getToken}}).then(response =>{
			this.$router.push({path: '/scores/'+this.$store.getters.getId});
		})
	}
}
}

</script>

<style scoped>
#mapid{
}
h1{
	text-align: center;
}
.card-border{
	border:none;
}
</style>