// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import store from './store.js'
import axios from 'axios'
import Vue2Leaflet from 'vue2-leaflet';

Vue.config.productionTip = false

window.axios = axios.create({
	baseURL: 'http://gest.geoquizz.local:10111'
});

store.subscribe((mutation, state) => {
	localStorage.setItem('store', JSON.stringify(state));
});

window.bus = new Vue();

Vue.component('v-map', Vue2Leaflet.Map);
Vue.component('v-tilelayer', Vue2Leaflet.TileLayer);
Vue.component('v-marker', Vue2Leaflet.Marker);

/* eslint-disable no-new */
new Vue({
	el: '#app',
	router,
	store,
	beforeCreate(){
		this.$store.commit('initialiseStore');
	},
	template: '<App/>',
	components: { App }
})
