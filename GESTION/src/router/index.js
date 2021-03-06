import Vue from 'vue'
import Router from 'vue-router'
import Connexion from '@/components/Connexion'
import Bienvenue from '@/components/Bienvenue'
import MembreCreation from '@/components/MembreCreation'
import SerieCreation from '@/components/SerieCreation'
import PhotoCreation from '@/components/PhotoCreation'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/connexion',
      component: Connexion
    },
    {
      path: '/bienvenue',
      component: Bienvenue
    },
    {
      path: '/membre-creation',
      component: MembreCreation
    },
    {
      path: '/serie-creation',
      component: SerieCreation
    },
    {
      path: '/photo-creation',
      component: PhotoCreation
    }
  ]
})
