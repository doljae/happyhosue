import Vue from "vue";
import Router from "vue-router";
import AppHeader from "./layout/AppHeader";
import AppFooter from "./layout/AppFooter";
import Home from "./views/Home.vue";
import Login from "./views/Login.vue";
import Register from "./views/Register.vue";
import Profile from "./views/Profile.vue";
import Update from "./views/Update.vue";
import Board from "./views/Board.vue";
import Detail from "./views/Detail.vue";
import DetailUpdate from "./views/DetailUpdate.vue";
import BoardForm from "./views/BoardForm.vue";
import Map from "./views/Map.vue"
Vue.use(Router);

export default new Router({
  linkExactActiveClass: "active",
  mode: "history",
  routes: [
    {
      path: "/map",
      name: "map",
      components: {
        header: AppHeader,
        default: Map,
        footer: AppFooter,
      },
    },
    {
      path: "/",
      name: "home",
      components: {
        header: AppHeader,
        default: Home,
        footer: AppFooter,
      },
    },
    {
      path: "/login",
      name: "login",
      components: {
        header: AppHeader,
        default: Login,
        footer: AppFooter,
      },
    },
    {
      path: "/register",
      name: "register",
      components: {
        header: AppHeader,
        default: Register,
        footer: AppFooter,
      },
    },
    {
      path: "/update",
      name: "update",
      components: {
        header: AppHeader,
        default: Update,
        footer: AppFooter,
      },
    },
    {
      path: "/profile",
      name: "profile",
      components: {
        header: AppHeader,
        default: Profile,
        footer: AppFooter,
      },
    },
    {
      path: "/board",
      name: "board",
      components: {
        header: AppHeader,
        default: Board,
        footer: AppFooter,
      },
    },
    {
      path: "/board/:id",
      name: "detail",
      components: {
        header: AppHeader,
        default: Detail,
        footer: AppFooter,
      },
    },
    {
      path: "/board/update/:id",
      name: "detailUpdate",
      components: {
        header: AppHeader,
        default: DetailUpdate,
        footer: AppFooter,
      },
    },
    {
      path: "/boardForm",
      name: "boardForm",
      components: {
        header: AppHeader,
        default: BoardForm,
        footer: AppFooter,
      },
    },
  ],
  scrollBehavior: (to) => {
    if (to.hash) {
      return { selector: to.hash };
    } else {
      return { x: 0, y: 0 };
    }
  },
});
