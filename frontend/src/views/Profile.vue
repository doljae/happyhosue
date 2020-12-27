<template>
  <div class="profile-page">
    <section class="section-profile-cover section-shaped my-0">
      <div class="shape shape-style-1 shape-primary shape-skew alpha-4">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
      </div>
    </section>
    <section class="section section-skew">
      <div class="container">
        <card shadow class="card-profile mt--300" no-body>
          <div class="px-4">
            <div class="row justify-content-center">
              <div class="col-lg-3 order-lg-2">
                <div class="card-profile-image">
                  <a href="#">
                    <img v-lazy="'img/theme/team-4-800x800.jpg'" class="rounded-circle" />
                  </a>
                </div>
              </div>
              <div class="col-lg-4 order-lg-3 text-lg-right align-self-lg-center">
                <div class="card-profile-actions py-4 mt-lg-0">
                  <base-button type="info" size="sm" class="mr-4">Connect</base-button>
                  <base-button type="default" size="sm" class="float-right">Message</base-button>
                </div>
              </div>
              <div class="col-lg-4 order-lg-1">
                <div class="card-profile-stats d-flex justify-content-center">
                  <div>
                    <span class="heading">22</span>
                    <span class="description">Friends</span>
                  </div>
                  <div>
                    <span class="heading">10</span>
                    <span class="description">Photos</span>
                  </div>
                  <div>
                    <span class="heading">89</span>
                    <span class="description">Comments</span>
                  </div>
                </div>
              </div>
            </div>
            <div class="text-center mt-5 ">
              <h3>이름: {{ user.lastName }} {{ user.firstName }}</h3>
              <div class="h6 font-weight-300"><i class="ni location_pin mr-2"></i>주소: {{ user.address }}</div>
              <div class="h6 mt-4"><i class="ni business_briefcase-24 mr-2"></i>이메일: {{ user.email }}</div>
              <div><i class="ni education_hat mr-2"></i>아이디: {{ user.id }}</div>
              <div><i class="ni education_hat mr-2"></i>닉네임: {{ user.nickname }}</div>
              <div><i class="ni education_hat mr-2"></i>나이: {{ user.age }}</div>
              <div><i class="ni education_hat mr-2"></i>생년월일: {{ user.birthday }}</div>
              <div><i class="ni education_hat mr-2"></i>전화번호: {{ user.phone }}</div>
              <div><i class="ni education_hat mr-2"></i>가입일: {{ user.rdate }}</div>
              <div><i class="ni education_hat mr-2"></i>선호 지역: {{ user.favoriteAddress }}</div>
              <button v-on:click="update($event)" class="btn btn-primary mt-5">update</button>
            </div>

            <div class="mt-5 py-5 border-top text-center">
              <div class="row justify-content-center">
                <div class="col-lg-9">
                  <p>
                    An artist of considerable range, Ryan — the name taken by Melbourne-raised, Brooklyn-based Nick Murphy — writes, performs and
                    records all of his own music, giving it a warm, intimate feel with a solid groove structure. An artist of considerable range.
                  </p>
                  <a href="#">Show more</a>
                </div>
              </div>
            </div>
          </div>
        </card>
      </div>
    </section>
  </div>
</template>
<script>
import axios from "axios";
import { mapGetters } from "vuex";

const SERVER_URL = process.env.VUE_APP_SERVER_URL;

export default {
  data() {
    return {
      user: {
        id: null,
        email: null,
        lastName: null,
        firstName: null,
        nickname: null,
        address: null,
        phone: null,
        birthday: null,
        rdate: null,
        age: null,
        favorite: null,
        favoriteAddress: null,
      },
    };
  },
  computed: {
    ...mapGetters(["getAccessToken", "getUserId", "getUserName"]),
  },
  created() {
    const body = {
      id: this.$store.state.userId,
      userName: this.$store.state.userName,
      token: this.$store.state.accessToken,
    };
    // console.log(body);
    axios
      .post(`${SERVER_URL}/profile`, body)
      .then((response) => {
        console.log(response.data);
        this.user = response.data;
        this.getAge();
      })
      .catch(() => {});
  },
  methods: {
    getAge() {
      let birthday = new Date(this.user.birthday);
      let today = new Date();
      let age = today.getFullYear() - birthday.getFullYear();
      console.log(age);
      this.user.age = age;
    },
    update(e) {
      // console.log(e.target.childNodes[0].data);
      this.$router.push("/update");
    },
  },
};
</script>
<style></style>
