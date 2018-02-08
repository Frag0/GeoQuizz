import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex);

export default new Vuex.Store({
	state : {
		pseudo : '',
		serie : [],
        token : ''
	},
	mutations: {
    	putPseudo (state, p) {
      		state.pseudo = p
    	},
    	putSerie (state, s) {
    		state.serie = s
    	},
    	putToken (state, t) {
    		state.token = t
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
    	},
    	getToken: state => {
    		return state.token
    	}
    }
})
