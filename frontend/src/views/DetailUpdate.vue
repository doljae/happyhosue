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
                      <input v-model="user.title" type="text" class="form-control" id="exampleFormControlInput1" placeholder="" />
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
                      <button type="button" rel="tooltip" class="btn btn-danger btn-icon btn-sm " data-original-title="" title="">
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
                  class="form-control form-control-alternative"
                  rows="3"
                  placeholder="Write a large text here ..."
                ></textarea>
              </form>
            </div>

            <div class="mt-5 py-5 border-top text-center">
              <div class="row justify-content-center">
                <div class="col-lg-9">
                  <button class="btn btn-primary mt-2" v-on:click="goBack">뒤로가기</button>
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
// import { mapGetters } from "vuex";

const SERVER_URL = process.env.VUE_APP_SERVER_URL;

export default {
  data() {
    return {
      user: [],
    };
  },
  // computed: {
  //   ...mapGetters(["getAccessToken", "getUserId", "getUserName", "getBoard", "getOneBoard"]),
  // },
  created() {
    axios
      .get(`${SERVER_URL}/board/${this.$router.currentRoute.params.id}`)
      .then((res) => {
        console.log(res.data);
        // context.commit("getBoard", res.data);
        this.user = res.data;
      })
      .catch((err) => {
        console.error(err);
      });
  },
  methods: {
    goBack() {
      window.history.length > 1 ? this.$router.go(-1) : this.$router.push("/");
    },
    updateDetail() {
      axios
        .put(`${SERVER_URL}/board`, this.user)
        .then((res) => {
          console.log(res.data);
          console.log(this);
          alert("수정 완료!");
          this.$store.state.boardUpdateFlag = true;
          this.$router.push(`/board/${this.$router.currentRoute.params.id}`);
        })
        .catch((err) => {
          console.error(err);
        });
    },
  },
};
</script>
<style></style>
