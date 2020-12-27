<template>
  <div>
    <header class="header-global">
      <base-nav class="navbar-main bg-dark" transparent type="" effect="light" expand>
        <div class="row" slot="content-header" slot-scope="{ closeMenu }">
          <div class="col-6 collapse-brand">
            <a href="https://demos.creative-tim.com/vue-argon-design-system/documentation/">
              <img src="img/brand/blue.png" />
            </a>
          </div>
          <div class="col-6 collapse-close">
            <close-button @click="closeMenu"></close-button>
          </div>
        </div>

        <ul class="navbar-nav navbar-nav-hover align-items-lg-center">
          <a slot="title" href="#" class="nav-link" data-toggle="dropdown" role="button">
            <i class="ni ni-ui-04 d-lg-none"></i>
            <router-link to="/"><span class="nav-link-inner--text">Home</span> </router-link>
          </a>
          <a slot="title" href="#" class="nav-link" data-toggle="dropdown" role="button">
            <i class="ni ni-collection d-lg-none"></i>
            <router-link to="/map"><span class="nav-link-inner--text">Map</span></router-link>
          </a>
          <a slot="title" href="#" class="nav-link" data-toggle="dropdown" role="button">
            <i class="ni ni-collection d-lg-none"></i>
            <router-link to="/board"> <span class="nav-link-inner--text">Board</span></router-link>
          </a>
        </ul>
        <ul class="navbar-nav align-items-lg-center ml-lg-auto">
          <li class="nav-item d-none d-lg-block ml-lg-4 btn-wrapper" v-if="getAccessToken">
            <router-link to="/profile" class="btn btn-success">
              My Account
            </router-link>
            <button class="btn btn-success" @click.prevent="logout">Logout</button>
          </li>
          <li class="nav-item d-none d-lg-block ml-lg-4 btn-wrapper" v-else>
            <router-link to="/login" class="btn btn-success">
              Login
            </router-link>
            <router-link to="/register" class="btn btn-success">
              Register
            </router-link>
          </li>
        </ul>
      </base-nav>
    </header>
  </div>
</template>
<script>
import BaseNav from "@/components/BaseNav";
import BaseDropdown from "@/components/BaseDropdown";
import CloseButton from "@/components/CloseButton";
import { mapGetters } from "vuex";

export default {
  components: {
    BaseNav,
    CloseButton,
    BaseDropdown,
  },
  data() {
    return {};
  },
  computed: {
    ...mapGetters(["getAccessToken", "getUserId", "getUserName"]),
  },
  methods: {
    logout() {
      this.$store.dispatch("logout").then(() => {
        this.$router.push("/").catch(() => {});
      });
    },
  },
};
</script>
<style></style>
