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
                    <!-- <img v-lazy="'img/theme/team-4-800x800.jpg'" class="rounded-circle" /> -->
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
              <table class="table">
                <thead>
                  <tr>
                    <th class="text-center">#</th>
                    <th>제목</th>
                    <th>아이디</th>
                    <th>작성일</th>
                    <th>조회수</th>
                    <th class="text-right">조작</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="text-center">{{ user.no }}</td>
                    <td>
                      {{ user.title }}
                    </td>
                    <td>{{ user.id }}</td>
                    <td>{{ user.wdate }}</td>
                    <td>{{ user.count }}</td>
                    <td class="td-actions text-right">
                      <button
                        v-on:click="updateDetail"
                        type="button"
                        rel="tooltip"
                        class="btn btn-success btn-icon btn-sm "
                        data-original-title=""
                        title=""
                      >
                        <i class="ni ni-settings-gear-65 pt-1"></i>
                        수정
                      </button>
                      <button
                        v-on:click="deleteBoard"
                        type="button"
                        rel="tooltip"
                        class="btn btn-danger btn-icon btn-sm "
                        data-original-title=""
                        title=""
                      >
                        <i class="ni ni-fat-remove pt-1"></i>
                        삭제
                      </button>
                    </td>
                  </tr>
                </tbody>
              </table>
              <form>
                <textarea
                  v-model="user.content"
                  disabled
                  class="form-control form-control-alternative"
                  rows="3"
                  placeholder="Write a large text here ..."
                ></textarea>
              </form>
            </div>
            <vue-livere uid="MTAyMC81MjAzMS8yODUxMg==" :refer="this.refer"></vue-livere>
            <div class="py-5 border-top text-center">
              <div class="row justify-content-center">
                <div class="col-lg-9">
                  <button class="btn btn-primary" v-on:click="goBack">뒤로가기</button>
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
import VueLivere from "vue-livere/VueLivere.vue";
const SERVER_URL = process.env.VUE_APP_SERVER_URL;

export default {
  data() {
    return {
      user: [],
      refer: `${SERVER_URL}/board/${this.$router.currentRoute.params.id}`,
    };
  },
  components: {
    VueLivere,
  },
  created() {
    axios
      .get(`${SERVER_URL}/board/${this.$router.currentRoute.params.id}`)
      .then((res) => {
        console.log(res.data);
        this.user = res.data;
        this.refer = `http://192.168.0.2:8080/board/${this.$router.currentRoute.params.id}`;
      })
      .catch((err) => {
        console.error(err);
      });
  },
  methods: {
    goBack() {
      this.$router.push(`/board`);
    },
    updateDetail() {
      this.$router.push(`/board/update/${this.$router.currentRoute.params.id}`);
    },
    deleteBoard() {
      axios
        .delete(`${SERVER_URL}/board/${this.user.no}`)
        .then((res) => {
          console.log(res);
          console.log("정상적으로 삭제됨");
          alert("삭제되었습니다!");
          this.$store.state.boardUpdateFlag = true;
          this.$router.push("/board");
        })
        .catch((err) => {
          console.error(err);
          console.log("등록 중 에러 발생");
        });
    },
  },
};
</script>
<style></style>
