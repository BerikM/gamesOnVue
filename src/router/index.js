import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";
import CrossZero from "../views/CrossZero.vue";
Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/x",
    name: "CrossZero",
    component: CrossZero,
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
