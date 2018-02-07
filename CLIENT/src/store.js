import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex);

export default new Vuex.Store({
	state : {
		pseudo : '',
		ville : ''
	},
	mutations: {
    	putPseudo (state, p) {
      		state.pseudo = p
    	},
    	putVille (state, v) {
    		state.ville = v
    	}
    },
    getters: {
    	getPseudo: state => {
    		return state.pseudo
    	},
    	getVille: state => {
    		return state.ville
    	}
    }
})
