import Vue from 'vue';
import Vuex from 'vuex';
import axios from '../axios/axios-common'

Vue.use(Vuex);

const store = new Vuex.Store({
    state: {
        message: 'Hello Vue.js',
        jerry:{
            num:123,
            email: 'jerry@menubar.com',
            tel: '010-2345-6789'
        },
        counter: 0,
        arr:[],
        todolist:[]
    },
    getters: {//작업된 state값을 단순히 가져가기만 하는 것이라서 component 안의 computed에서 사용.param 사용 불가
        doubleCounter: function (state) {
            var tmp = state.counter * 2;           
            console.log(tmp);
            return tmp;
        },

        getTodoList(state){
            return state.todolist;
        }
    },


    actions: {//결과를 받아올 타이밍이 예측되지 않은 로직. 비동기호출. commit으로 mutation call
       'selectAll' : (store) => {
            axios.get('/todos')
                .then(response => store.commit('selectAll', { todolist: response.data }))
                .catch(exp => alert('getTodoList처리에 실패하였습니다.' + exp));
        },
    },

    //mutations:순차적인 로직들만 선언
    //component에서 commit으로 호출
    //payload가 param. setter 기능
    mutations:{
        addCounter: function (state, payload) {
            console.log("addCounter:"+payload);
            state.counter++;
        },

        // payload 가 { value : 10 } 일 경우
        addCounter2: function (state, payload) {
            console.log("addCounter2:" + payload);
            state.counter = payload;           
        },

        addCounter3: function (state, payload) {
            console.log("addCounter3:" + payload);
            state.counter = payload;
            state.arr = payload.arr;
        },
      
        'selectAll': (state, payload) => {
            console.log(payload);
            console.log();
            state.todolist = payload.todolist;
            console.log(state.todolist);
        },
    }
});

export default store;

/* Mutations: 일종의 setter. data setting
Vuex 의 데이터, 즉 state 값을 변경하는 로직들을 의미한다. Getters 와 차이점은

인자를 받아 Vuex 에 넘겨줄 수 있고
computed 가 아닌 methods 에 등록
또한, 다음 챕터에 나올 Actions 와의 차이점이다.

Mutations 는 동기적 로직을 정의
Actions 는 비동기적 로직을 정의*/