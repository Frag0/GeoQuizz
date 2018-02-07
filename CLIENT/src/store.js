import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex);

export default new Vuex.Store({
	state : {
		pseudo : '',
		serie : []
	},
	mutations: {
    	putPseudo (state, p) {
      		state.pseudo = p
    	},
    	putSerie (state, s) {
    		state.serie = s
    	}
    },
    getters: {
    	getPseudo: state => {
    		return state.pseudo
    	},
    	getSerie: state => {
    		return state.serie
    	},
    	getId: state => {
    		return state.serie.id
    	},
    	getLongitude: state => {
    		return state.serie.longitude
    	},
    	getLatitude: state => {
    		return state.serie.latitude
    	}
    }
})
