<template>
  <div>
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
    <div align="right">
      <div class="m-2" style="display: inline-block;">
        <v-select v-on:input="check1($event)" placeholder="카테고리" :options="['전체', '잡담', '질문']" style="width:150px;"></v-select>
      </div>
      <div class="m-2" style="display: inline-block;">
        <v-select v-on:input="check2($event)" placeholder="검색조건" :options="['제목', '아이디']" style="width:150px;"></v-select>
      </div>
      <div class="col-md-6 w-25" style="display: inline-block;">
        <div class="form-group">
          <div class="input-group input-group-alternative mb-4">
            <input
              v-on:keyup.enter="search($event)"
              type="email"
              class="form-control form-control-alternative"
              id="exampleFormControlInput1"
              placeholder="검색어를 입력해주세요"
            />
            <div class="input-group-append">
              <span class="input-group-text"><i class="ni ni-zoom-split-in"></i></span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <table class="table">
      <thead>
        <tr>
          <th class="text-center">#</th>
          <th>제목</th>
          <th>아이디</th>
          <th>작성일</th>
          <th>조회수</th>
          <th>카테고리</th>
          <th class="text-right">조작</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in boardStatus.board.slice((boardStatus.pageCurCount - 1) * 5, (boardStatus.pageCurCount - 1) * 5 + 5)" :key="index">
          <td class="text-center">{{ index + (boardStatus.pageCurCount - 1) * 5 + 1 }}</td>
          <td>
            <router-link :to="`board/${item.no}`">{{ item.title }}</router-link>
          </td>
          <td>{{ item.id }}</td>
          <td>{{ item.wdate }}</td>
          <td>{{ item.count }}</td>
          <td>{{ item.category }}</td>
          <td class="td-actions text-right">
            <button disabled type="button" rel="tooltip" class="btn btn-success btn-icon btn-sm " data-original-title="" title="">
              <i class="ni ni-settings-gear-65 pt-1"></i>
              수정
            </button>
            <button disabled type="button" rel="tooltip" class="btn btn-danger btn-icon btn-sm " data-original-title="" title="">
              <i class="ni ni-fat-remove pt-1"></i>
              삭제
            </button>
          </td>
        </tr>
      </tbody>
    </table>
    <div class="mt-5 py-5 border-top text-center">
      <div class="row justify-content-center">
        <div class="col-lg-9">
          <button class="btn btn-primary mt-2" v-on:click="goBoardForm">글 작성</button>
        </div>
      </div>
    </div>
    <div>
      <base-pagination
        :page-count="boardStatus.pageMaxCount"
        align="center"
        v-model="boardStatus.pagination.default"
        v-on:input="changePage($event)"
      ></base-pagination>
    </div>
  </div>
</template>

<script>
import axios from "axios";
// import { mapGetters } from "vuex";
import "vue-select/dist/vue-select.css";
const SERVER_URL = process.env.VUE_APP_SERVER_URL;

export default {
  data() {
    return {
      boardStatus: {
        board: [],
        boardTemp: [],
        // 한 페이지에 몇 개의 게시글을 보여줄 것인가
        numPerPage: 5,
        pageMaxCount: 0,
        pageCurCount: 1,
        pagination: {
          default: 1,
        },
        searchCategory: null,
        searchTarget: null,
        searchValue: null,
      },
    };
  },
  methods: {
    goBoardForm() {
      this.$router.push(`/boardForm`);
    },
    changePage(e) {
      this.boardStatus.pageCurCount = e;
    },
    categoryBoard() {},
    check1(e) {
      this.boardStatus.board = JSON.parse(JSON.stringify(this.$store.state.boardStatus.board));
      this.boardStatus.searchCategory = e;
      // console.log(e);
      if (this.boardStatus.searchCategory === "잡담") {
        this.boardStatus.board = this.boardStatus.board.filter((item) => item.category == "잡담");
        this.boardStatus.pageMaxCount = parseInt(this.boardStatus.board.length / this.boardStatus.numPerPage) + 1;
        this.boardStatus.pageCurCount = 1;
        this.boardStatus.pagination.default = 1;
      } else if (this.boardStatus.searchCategory === "질문") {
        this.boardStatus.board = this.boardStatus.board.filter((item) => item.category == "질문");
        this.boardStatus.pageMaxCount = parseInt(this.boardStatus.board.length / this.boardStatus.numPerPage) + 1;
        this.boardStatus.pageCurCount = 1;
        this.boardStatus.pagination.default = 1;
      } else if (this.boardStatus.searchCategory === "전체" || this.boardStatus.searchCategory == null) {
        this.boardStatus.board = JSON.parse(JSON.stringify(this.$store.state.boardStatus.board));
        this.boardStatus.searchCategory = e;
        this.boardStatus.pageMaxCount = parseInt(this.boardStatus.board.length / this.boardStatus.numPerPage) + 1;
        this.boardStatus.pageCurCount = 1;
        this.boardStatus.pagination.default = 1;
      }
    },
    check2(e) {
      this.boardStatus.searchTarget = e;
      console.log(e);
      this.boardStatus.boardTemp = JSON.parse(JSON.stringify(this.boardStatus.board));
      if (this.boardStatus.searchTarget == null) {
        this.boardStatus.board = JSON.parse(JSON.stringify(this.$store.state.boardStatus.board));
        this.boardStatus.searchTarget = e;
        this.boardStatus.pageMaxCount = parseInt(this.boardStatus.board.length / this.boardStatus.numPerPage) + 1;
        this.boardStatus.pageCurCount = 1;
        this.boardStatus.pagination.default = 1;
      }
    },
    search(e) {
      this.boardStatus.searchValue = e.target.value;
      this.boardStatus.board = JSON.parse(JSON.stringify(this.boardStatus.boardTemp));
      console.log(this.boardStatus.searchCategory, this.boardStatus.searchTarget, this.boardStatus.searchValue);
      if (this.boardStatus.searchTarget === "제목") {
        this.boardStatus.board = this.boardStatus.board.filter((item) => item.title.indexOf(this.boardStatus.searchValue) >= 0);
        this.boardStatus.pageMaxCount = parseInt(this.boardStatus.board.length / this.boardStatus.numPerPage) + 1;
        this.boardStatus.pageCurCount = 1;
        this.boardStatus.pagination.default = 1;
      } else if (this.boardStatus.searchTarget === "아이디") {
        this.boardStatus.board = this.boardStatus.board.filter((item) => item.id.indexOf(this.boardStatus.searchValue) >= 0);
        this.boardStatus.pageMaxCount = parseInt(this.boardStatus.board.length / this.boardStatus.numPerPage) + 1;
        this.boardStatus.pageCurCount = 1;
        this.boardStatus.pagination.default = 1;
      }
    },
  },
  created() {
    if (this.$store.state.boardStatus == null || this.$store.state.boardUpdateFlag == true) {
      console.log("값이 변경되서 재호출함");
      axios
        .get(`${SERVER_URL}/board`)
        .then((res) => {
          this.boardStatus.board = res.data;
          this.boardStatus.pageMaxCount = parseInt(res.data.length / this.boardStatus.numPerPage) + 1;
          this.$store.state.boardUpdateFlag = false;
          this.$store.state.boardStatus = JSON.parse(JSON.stringify(this.boardStatus));
        })
        .catch((err) => {
          console.error(err);
        });
    } else {
      console.log("값이 변경되지 않아서 있던거 씀");
      this.boardStatus = JSON.parse(JSON.stringify(this.$store.state.boardStatus));
    }
  },
  beforeDestroy() {
    this.$store.state.boardStatus = JSON.parse(JSON.stringify(this.boardStatus));
  },
};
</script>

<style></style>
