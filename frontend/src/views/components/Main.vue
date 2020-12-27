<template>
<div>
    <div class="position-relative">
        <section class="section-shaped my-0">
            <div class="shape shape-style-1 shape-primary">
            </div>
        </section>
    </div>
    <section class="section-shaped my-0">
        <div class="container shape-container d-flex align-items-center">
            <div class="col px-0">
                <div class="row align-items-center justify-content-around">
                    <div class="col-lg-7">
                        <base-input placeholder="검색"
                                addon-left-icon="ni ni-zoom-split-in">
                        </base-input>
                    </div>
                </div>

                <div class="row align-items-center justify-content-around stars-and-coded">
                    <div class="col-md-6 mb-5 mb-md-0">
                        <a href="https://post.naver.com/viewer/postView.nhn?volumeNo=30006876&memberNo=51578577">
                        <div class="card card-lift--hover shadow border-0">
                            <img v-lazy="'https://s.pstatic.net/dthumb.phinf/?src=%22https%3A%2F%2Fs.pstatic.net%2Fstatic%2Fwww%2Fmobile%2Fedit%2F2020%2F1120%2Fupload_21764069955287082rqlT8.jpg%22&type=nf340_228'"
                                class="card-img">
                            <div class="text-center">
                                    취향 좋은 디자이너들이 추천한 '포인트' 조명
                            </div>
                        </div>
                        </a>
                    </div>
                    <div class="col-md-6 mb-5 mb-md-0">
                        <a href="https://blog.naver.com/designpress2016/222145578631">
                        <div class="card card-lift--hover shadow border-0">
                            <img v-lazy="'https://s.pstatic.net/dthumb.phinf/?src=%22https%3A%2F%2Fs.pstatic.net%2Fstatic%2Fwww%2Fmobile%2Fedit%2F2020%2F1119%2Fupload_21682103139304036bLylM.jpg%22&amp;type=nf340_228'"
                                class="card-img">
                            <div class="text-center">
                                    취향 좋은 디자이너들이 추천한 '포인트' 조명
                            </div>
                        </div>
                        </a>
                    </div>
                </div>
                
                <br> <!-- really? -->

                <div class="row align-items-center justify-content-around">
                    <div class="col-md-10 text-center">
                        <table class="table table-white">
                            <thead class="thead-light">
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>날짜</th>
                                    <th>조회수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th>123</th>
                                    <td>qwe</td>
                                    <td>박성원</td>
                                    <td>2020.11.20</td>
                                    <td>1235312</td>
                                </tr>
                                <tr>
                                    <th>123</th>
                                    <td>qwe</td>
                                    <td>박성원</td>
                                    <td>2020.11.20</td>
                                    <td>1235312</td>
                                </tr>
                                <tr>
                                    <th>123</th>
                                    <td>qwe</td>
                                    <td>박성원</td>
                                    <td>2020.11.20</td>
                                    <td>1235312</td>
                                </tr>
                                <tr>
                                    <th>123</th>
                                    <td>qwe</td>
                                    <td>박성원</td>
                                    <td>2020.11.20</td>
                                    <td>1235312</td>
                                </tr>
                                <tr>
                                    <th>123</th>
                                    <td>qwe</td>
                                    <td>박성원</td>
                                    <td>2020.11.20</td>
                                    <td>1235312</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
</div>
</template>
<script>
import BasicElements from '../../views/components/BasicElements.vue';
export default {
    components: { BasicElements },};
</script>
<style>
</style>
