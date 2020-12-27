/*!

=========================================================
* Vue Argon Design System - v1.1.0
=========================================================

* Product Page: https://www.creative-tim.com/product/argon-design-system
* Copyright 2019 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://github.com/creativetimofficial/argon-design-system/blob/master/LICENSE.md)

* Coded by www.creative-tim.com

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

*/
import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import Argon from "./plugins/argon-kit";
import "./registerServiceWorker";
import store from "../src/store/store.js";
import vSelect from "vue-select";
import VueDaumPostcode from "vue-daum-postcode";
import * as VueGoogleMaps from 'vue2-google-maps'
import GmapCluster from 'vue2-google-maps/src/components/cluster' 

Vue.config.productionTip = false;
Vue.use(Argon);
Vue.component("v-select", vSelect);
Vue.component("GmapCluster", GmapCluster);
Vue.use(VueDaumPostcode);

Vue.use(VueGoogleMaps, {
  load: {
    key: "AIzaSyCoCKddu6mtYaf4MJGtUwKVU_Uu7s9_gwM",
  },
  installComponents: true
})

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");
