// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import axios from 'axios'
import store from './store.js'	

Vue.config.productionTip = false

window.axios = axios.create({
  baseURL: 'http://api.geoquizz.local:10101',
});


store.subscribe((mutation, state) => {
  localStorage.setItem('store', JSON.stringify(state));
});

window.bus = new Vue();

new Vue({
  el: '#app',
  router,
  store,
  beforeCreate(){
    this.$store.commit('initialiseStore');
  },
  components: { App },
  template: '<App/>'
})
