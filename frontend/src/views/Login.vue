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
                <small>Or sign in with credentials</small>
              </div>
              <form role="form">
                <base-input v-model="loginInfo.id" alternative class="mb-3" placeholder="아이디" addon-left-icon="ni ni-hat-3"> </base-input>
                <base-input v-model="loginInfo.pw" alternative type="password" placeholder="암호" addon-left-icon="ni ni-lock-circle-open">
                </base-input>
                <base-checkbox>
                  Remember me
                </base-checkbox>
                <div class="text-center">
                  <base-button v-on:click="clear" type="primary" class="my-4">초기화</base-button>
                  <base-button v-on:click="login" type="primary" class="my-4">로그인</base-button>
                </div>
              </form>
            </template>
          </card>
          <div class="row mt-3">
            <div class="col-6">
              <a href="#" class="text-light">
                <small>Forgot password?</small>
              </a>
            </div>
            <div class="col-6 text-right">
              <a href="#" class="text-light">
                <small>Create new account</small>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
<script>
export default {
  data() {
    return {
      loginInfo: {
        id: "",
        pw: "",
      },
    };
  },
  methods: {
    login() {
      console.log(this.loginInfo);
      if (this.loginId == "" || this.loginPw == "") {
        alert("모든 항목을 입력해주세요");
        return;
      }
      console.log(this.loginInfo.loginId, this.loginInfo.loginPw);
      this.$store
        .dispatch("login", this.loginInfo)
        .then(() => {
          console.log("로그인이 성공함");
          this.clear();
          this.$router.push("/");
        })
        .catch(() => {
          console.log("로그인 에러 발생");
        });
    },
    clear() {
      (this.loginId = ""), (this.loginPw = "");
    },
  },
};
</script>
<style></style>
