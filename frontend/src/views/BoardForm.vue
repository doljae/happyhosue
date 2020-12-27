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
                    <th>제목</th>
                    <th>아이디</th>
                    <th>카테고리</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>
                      <input v-model="user.title" type="text" class="form-control" id="exampleFormControlInput1" placeholder="" />
                    </td>
                    <td>
                      <input v-model="user.id" type="text" class="form-control" id="exampleFormControlInput1" placeholder="" />
                    </td>
                    <td>
                      <v-select v-on:input="check1($event)" placeholder="카테고리" :options="['잡담', '질문']" style="width:200px;"></v-select>
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
                  <button v-on:click="register" class="btn btn-primary mt-2">등록하기</button>
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

const SERVER_URL = process.env.VUE_APP_SERVER_URL;

export default {
  data() {
    return {
      user: {
        title: "",
        id: "",
        content: "",
        category: "",
      },
    };
  },

  created() {},
  methods: {
    check1(e) {
      this.user.category = e;
    },
    goBack() {
      window.history.length > 1 ? this.$router.go(-1) : this.$router.push("/");
    },
    clear() {
      this.user.title = "";
      this.user.id = "";
      this.user.content = "";
    },
    register() {
      console.log("register");
      if (this.user.title == "" || this.user.id == "" || this.user.content == "") {
        alert("모든 항목을 기입해주세요!");
        return;
      }

      axios
        .post(`${SERVER_URL}/board`, this.user)
        .then((res) => {
          console.log(res);
          console.log("정상적으로 등록됨");
          alert("글 등록 완료!");
          this.clear();
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
