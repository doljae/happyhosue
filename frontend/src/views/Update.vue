<template>
  <section class="section section-shaped section-lg my-0">
    <div class="shape shape-style-1 bg-gradient-default">
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
    </div>
    <div class="container pt-lg-md">
      <div class="row justify-content-center">
        <div class="col-lg-5">
          <card type="secondary" shadow header-classes="bg-white pb-5" body-classes="px-lg-5 py-lg-5" class="border-0">
            <template>
              <form role="form">
                <base-input disabled v-model="member.id" alternative class="mb-3" placeholder="아이디" addon-left-icon="ni ni-hat-3"> </base-input>
                <base-input v-model="member.pw" alternative type="password" placeholder="암호" addon-left-icon="ni ni-lock-circle-open"> </base-input>
                <div class="text-muted font-italic">
                  <small
                    >password strength:
                    <span class="text-success font-weight-700">strong</span>
                  </small>
                </div>
                <base-input v-model="member.email" alternative class="mb-3" placeholder="Email" addon-left-icon="ni ni-email-83"> </base-input>
                <base-input disabled v-model="member.lastName" alternative class="mb-3" placeholder="성" addon-left-icon="ni ni-single-02">
                </base-input>
                <base-input disabled v-model="member.firstName" alternative class="mb-3" placeholder="이름" addon-left-icon="ni ni-single-02">
                </base-input>
                <base-input v-model="member.nickname" alternative class="mb-3" placeholder="닉네임" addon-left-icon="ni ni-single-02"> </base-input>
                <base-input v-model="member.address" alternative class="mb-3" placeholder="주소" addon-left-icon="ni ni-email-83"> </base-input>
                <base-input v-model="member.phone" alternative class="mb-3" placeholder="전화번호" addon-left-icon="ni ni-headphones"> </base-input>
                <base-input
                  disabled
                  v-model="member.birthday"
                  alternative
                  class="mb-3"
                  placeholder="생년월일"
                  addon-left-icon="ni ni-headphones"
                ></base-input>
                <base-input
                  disabled
                  v-model="member.favoriteAddress"
                  alternative
                  class="mb-3"
                  placeholder="관심지역"
                  addon-left-icon="ni ni-email-83"
                >
                </base-input>
                <vue-daum-postcode @complete="fillFavorite($event)" v-if="favoriteFlag" />

                <div class="text-center">
                  <base-button v-on:click="update" type="primary" class="my-4">update</base-button>
                </div>
              </form>
            </template>
          </card>
        </div>
      </div>
    </div>
  </section>
</template>
<script>
import axios from "../axios/axios-common.js";
import { mapGetters } from "vuex";

const SERVER_URL = process.env.VUE_APP_SERVER_URL;

export default {
  data() {
    return {
      favoriteFlag: true,
      member: {
        id: null,
        pw: null,
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
        this.member = response.data;
        this.getAge();
      })
      .catch(() => {});
  },
  methods: {
    fillFavorite(e) {
      console.log(e.address);
      console.log(e.bcode);
      this.member.favorite = e.bcode;
      this.member.favoriteAddress = e.address;
      this.favoriteFlag = false;
    },
    getAge() {
      let birthday = new Date(this.user.birthday);
      let today = new Date();
      let age = today.getFullYear() - birthday.getFullYear();
      console.log(age);
      this.user.age = age;
    },
    update() {
      console.log("update");
      console.log(this.member.pw);
      if (
        // this.member.id == "" ||
        this.member.pw == "" ||
        this.member.pw == null ||
        this.member.email == "" ||
        this.member.email == null ||
        this.member.address == "" ||
        this.member.address == null ||
        this.member.phone == "" ||
        this.member.phone == null ||
        this.member.nickname == "" ||
        this.member.nickname == null
        // this.member.birthday == "" ||
        // this.member.lastName == "" ||
        // this.member.firstName == ""
      ) {
        alert("모든 항목을 기입해주세요!");
        return;
      }
      axios
        .put("/update", this.member)
        .then((res) => {
          console.log(res);
          console.log("정상적으로 등록됨");
          alert("회원정보 수정 완료!");
          this.$router.push("/profile");
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
