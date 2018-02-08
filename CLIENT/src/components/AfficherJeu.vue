<template>
	<div class="w-75">
		<img v-bind:src="url" class="w-50" v-if="!ok">
		<div id="mapid" class="float-right" style="height:500px; width:500px;"></div>
		<button @click="setMap" v-if="ok">Clique</button>
		<div v-model="score" class="">{{score}}</div>
		<button @click="suivant">suivant</button>
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
			temps : 0
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
			this.marker = L.marker().setLatLng(e.latlng).addTo(this.mymap).bindPopup("Tu as cliqué la").openPopup();
			this.marker2 = L.marker([this.photos[this.i].latitude,this.photos[this.i].longitude]).addTo(this.mymap).bindPopup("La bonne réponse était ici").openPopup();
			var distance = L.latLng([this.photos[this.i].latitude,this.photos[this.i].longitude]).distanceTo(e.latlng);
			//calcul de distance
			if(this.count < 20){
				if(distance < 400){
					if(this.count<5)this.score = this.score + 5*4
					else if(this.count<10)this.score = this.score + 5*2
					else if(this.count<20)this.score = this.score + 5
				}
				else if(distance < 800){
					if(this.count<5)this.score = this.score + 3*4
					else if(this.count<10)this.score = this.score + 3*2
					else if(this.count<20)this.score = this.score + 3
				}
				else if(distance < 1200){
					if(this.count<5)this.score = this.score + 1*4
					else if(this.count<10)this.score = this.score + 1*2
					else if(this.count<20)this.score = this.score + 1
				}
				else{
					console.log("T'es naze !")
				}
			}
			else{
				console.log(" pas de point")
			}
		},
		setInter(){
			console.log(this.marker)
			this.inter = setInterval(this.timer,1000);
		},
		timer(){
			if(!this.marker){
				this.count ++;
				console.log("Count :"+this.count);
			}
			else{
				this.temps = this.count
				console.log(this.temps)
				console.log("ok ca s'arrete");
			}
		},
		suivant(){
			if(this.i === this.photos.length-1){
				clearInterval(this.inter)
				console.log('cest fini')
			}
			else{
				this.i++;
				this.url = this.photos[this.i].url
				this.mymap.removeLayer(this.marker)
				this.mymap.removeLayer(this.marker2)
				this.marker=null
				this.marker2=null
				this.count=null
			}
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
</style>