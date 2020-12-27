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
              <div class="text-muted text-center mb-3">
                <small>Sign in with</small>
              </div>
              <div class="btn-wrapper text-center">
                <base-button type="neutral">
                  <img slot="icon" src="img/icons/common/github.svg" />
                  Github
                </base-button>

                <base-button type="neutral">
                  <img slot="icon" src="img/icons/common/google.svg" />
                  Google
                </base-button>
              </div>
            </template>
            <template>
              <div class="text-center text-muted mb-4">
                <small>Or sign up with credentials</small>
              </div>
              <form role="form">
                <base-input v-model="member.id" alternative class="mb-3" placeholder="아이디" addon-left-icon="ni ni-hat-3"> </base-input>
                <base-input v-model="member.pw" alternative type="password" placeholder="암호" addon-left-icon="ni ni-lock-circle-open"> </base-input>
                <div class="text-muted font-italic">
                  <small
                    >password strength:
                    <span class="text-success font-weight-700">strong</span>
                  </small>
                </div>
                <base-input v-model="member.email" alternative class="mb-3" placeholder="이메일" addon-left-icon="ni ni-email-83"> </base-input>
                <base-input v-model="member.lastName" alternative class="mb-3" placeholder="성" addon-left-icon="ni ni-single-02"> </base-input>
                <base-input v-model="member.firstName" alternative class="mb-3" placeholder="이름" addon-left-icon="ni ni-single-02"> </base-input>
                <base-input v-model="member.nickname" alternative class="mb-3" placeholder="닉네임" addon-left-icon="ni ni-single-02"> </base-input>
                <base-input disabled v-model="member.address" alternative class="mb-3" placeholder="주소" addon-left-icon="ni ni-email-83">
                </base-input>
                <vue-daum-postcode @complete="fillAddress($event)" v-if="addressFlag" />
                <base-input v-model="member.phone" alternative class="mb-3" placeholder="전화번호" addon-left-icon="ni ni-headphones"> </base-input>
                <base-input v-model="member.birthday" alternative class="mb-3" placeholder="생년월일" addon-left-icon="ni ni-headphones">
                </base-input>
                <base-input disabled v-model="favoriteQuery" alternative class="mb-3" placeholder="관심지역" addon-left-icon="ni ni-email-83">
                </base-input>
                <vue-daum-postcode @complete="fillFavorite($event)" v-if="favoriteFlag" />
                <!-- 관심지역1:
                <div class="m-2" style="display: inline-block;">
                  <v-select v-on:input="check1($event)" placeholder="특별시/도" :options="['서울특별시']" style="width:200px;"></v-select>
                </div>
                <div></div>
                관심지역2:
                <div class="m-2" style="display: inline-block;">
                  <v-select v-on:input="check2($event)" placeholder="시/구/군" :options="['종로구']" style="width:200px;"></v-select>
                </div>
                <div></div>
                관심지역3:
                <div class="m-2" style="display: inline-block;">
                  <v-select v-on:input="check3($event)" placeholder="동" :options="['청운동']" style="width:200px;"></v-select>
                </div> -->

                <base-checkbox>
                  <span
                    >I agree with the
                    <a href="#">Privacy Policy</a>
                  </span>
                </base-checkbox>
                <div class="text-center">
                  <base-button v-on:click="clear" type="primary" class="my-4">초기화</base-button>
                  <base-button v-on:click="register" type="primary" class="my-4">계정 생성</base-button>
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
import { mapActions } from "vuex";
import axios from "../axios/axios-common.js";

export default {
  data() {
    return {
      temp: ["apple"],
      addressFlag: true,
      favoriteFlag: true,
      favoriteQuery: null,
      member: {
        id: "",
        pw: "",
        email: "",
        lastName: "",
        firstName: "",
        address: "",
        phone: "",
        nickname: "",
        birthday: "",
      },
    };
  },
  methods: {
    check1(e) {
      console.log(e);
    },
    check2(e) {
      console.log(e);
    },
    check3(e) {
      console.log(e);
    },
    fillAddress(e) {
      console.log(e.address);
      this.member.address = e.address;
      this.addressFlag = false;
    },
    fillFavorite(e) {
      console.log(e.address);
      this.member.favorite = e.bcode;
      this.favoriteQuery = e.address;
      this.favoriteFlag = false;
    },
    clear() {
      this.member.id = "";
      this.member.pw = "";
      this.member.email = "";
      this.member.lastName = "";
      this.member.firstName = "";
      this.member.address = "";
      this.member.phone = "";
      this.member.nickname = "";
      this.member.birthday = "";
    },
    register() {
      console.log("register");
      if (
        this.member.id == "" ||
        this.member.pw == "" ||
        this.member.email == "" ||
        this.member.address == "" ||
        this.member.phone == "" ||
        this.member.nickname == "" ||
        this.member.birthday == "" ||
        this.member.lastName == "" ||
        this.member.firstName == ""
      ) {
        alert("모든 항목을 기입해주세요!");
        return;
      }
      axios
        .post("/register", this.member)
        .then((res) => {
          console.log(res);
          console.log("정상적으로 등록됨");
          alert("회원가입 완료!");
          this.clear();
          this.$router.push("/login");
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
