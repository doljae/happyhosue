import Vue from "vue";
import Vuex from "vuex";
import axios from "../axios/axios-common.js";

const SERVER_URL = process.env.VUE_APP_SERVER_URL;

Vue.use(Vuex);
const store = new Vuex.Store({
  state: {
    accessToken: localStorage.getItem("loginAuth") == null ? null : JSON.parse(localStorage.getItem("loginAuth")).accessToken,
    userId: localStorage.getItem("loginAuth") == null ? null : JSON.parse(localStorage.getItem("loginAuth")).userId,
    userName: localStorage.getItem("loginAuth") == null ? null : JSON.parse(localStorage.getItem("loginAuth")).userName,
    // board: [],
    boardStatus: null,
    boardUpdateFlag: false,
  },
  getters: {
    //state값을 단순히 가져가기만 하는 것이라서 component 안의 computed에서 사용.param 사용 불가
    getAccessToken(state) {
      return state.accessToken;
    },
    getUserId(state) {
      return state.userId;
    },
    getUserName(state) {
      return state.userName;
    },

    // getBoard(state) {
    //   return state.board;
    // },
    // getOneBoard(state, index) {
    //   return state.board.filter((i) => i.no == index);
    // },
  },
  actions: {
    // 외부와의 통신을 통해 데이터 처리 dispath에 의해 호출됨.
    login(context, loginInfo) {
      console.log(loginInfo);
      console.log(11);
      console.log(`${SERVER_URL}/loginCheck`);
      return axios.post(`${SERVER_URL}/loginCheck`, loginInfo).then((response) => {
        context.commit("login", response.data);
        // axios.defaults.headers.common["auth-token"] = `${response.data["auth-token"]}`;
      });
    },
    logout(context) {
      context.commit("logout");
      // axios.defaults.headers.common["auth-token"] = undefined;
    },
    // getBoard(context) {
    //   return axios
    //     .get(`${SERVER_URL}/board`)
    //     .then((res) => {
    //       console.log(res.data);
    //       context.commit("getBoard", res.data);
    //     })
    //     .catch((err) => {
    //       console.error(err);
    //     });
    // },
    // updateDetail(context, user) {
    //   return axios
    //     .put(`${SERVER_URL}/board`, user)
    //     .then((res) => {
    //       console.log(res.data);
    //       console.log(this);
    //     })
    //     .catch((err) => {
    //       console.error(err);
    //     });
    // },
  },

  mutations: {
    // 저장소에 데이터 실제 반영(commit시 호출됨)
    login(state, payload) {
      state.accessToken = payload["auth-token"];
      state.userId = payload["user-id"];
      state.userName = payload["user-name"];

      localStorage.setItem("loginAuth", JSON.stringify(state));
    },
    logout(state) {
      state.accessToken = null;
      state.userId = "";
      state.userName = "";

      localStorage.removeItem("loginAuth");
    },
    // getBoard(state, payload) {
    //   console.log(payload);
    //   state.board = payload;
    // },
  },
});

export default store;
