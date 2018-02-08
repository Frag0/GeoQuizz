import Vue from 'vue'
import Router from 'vue-router'
import Accueil from '@/components/Accueil'
import AfficherJeu from '@/components/AfficherJeu'
import AfficherScores from '@/components/AfficherScores'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Accueil',
      component: Accueil
    },
    {
      path: '/jeu',
      name: 'AfficherJeu',
      component: AfficherJeu
    },
    {
      path: '/scores',
      name: 'AfficherScores',
      component: AfficherScores
    }
  ]
})
