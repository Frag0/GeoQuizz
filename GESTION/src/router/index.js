import Vue from 'vue'
import Router from 'vue-router'
import Connexion from '@/components/Connexion'
import Menu from '@/components/Menu'
import MembreCreation from '@/components/MembreCreation'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/connexion',
      component: Connexion
    },
    {
      path: '/menu',
      component: Menu
    },
    {
      path: '/membre-creation',
      component: MembreCreation
    }
  ]
})
