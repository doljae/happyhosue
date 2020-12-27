<template>
    <section class="section-hero section-shaped my-0">
        <div class="shape shape-style-1 shape-primary"/>

        <div class="container shape-container d-flex align-items-center"
            style="width: 90%; margin-right:5%; margin-left:5%; max-width: 1920px;">
            <div class="row justify-content-center align-items-center"
                style="width:100%; height:100%; max-width:1920px;">
                <div class="col-xs-9 col-sm-9 justify-content-center align-items-center" style="height:100%">
                    <GmapMap
                        :center="{lat:37.500921169061506, lng:127.03956058956464}"
                        :zoom="15"
                        ref="map"
                        map-type-id="roadmap"
                        style="width: 100%; height: 100%"
                        @tilesloaded="addMarkerWithBound"
                    >
                        <GmapCluster
                            :zoomOnClick="true"
                            :minimumClusterSize=3
                        >
                            <GmapMarker
                                :key="index"
                                v-for="(m, index) in markers"
                                    :position="m.position"
                                    :clickable="true"
                                    :draggable="false"
                                @click="showMarkerDetail(m)"
                            >
                            </GmapMarker>
                        </GmapCluster>
                    </GmapMap>
                </div>
                <div v-if="true" tmp_if="deals.length > 0" class="col-xs-10 col-sm-3"
                    style="background-color: white; background-color: rgba(255, 255, 255, 0.3 ); overflow: auto; height:100%">
                    <div class="card border-1 p-2 my-3 justify-content-center">
                        <form @submit.prevent="getDataByKeyword">
                        <base-input id="search_input" placeholder="검색"
                            addon-left-icon="ni ni-zoom-split-in">
                        </base-input>
                        </form>
                    </div>
                    <div class="card border-1 p-2 my-3 justify-content-center">
                        <div><strong>검색 결과 : </strong>{{deals.length}}개</div>
                    </div>
                    <div :key="deal.no" v-for="deal in deals"
                        class="card shadow border-1 p-2 my-3 justify-content-center"
                        style="background-color: rgba(255, 255, 255, 0.7 );"
                        @click="test"
                        >
                        <h4>{{deal.aptName}}</h4>
                        <div>
                            <strong>매매{{deal.dealAmount}}</strong>
                        </div>
                        <div class="text-right">{{deal.area}}m<sup>2</sup>, {{deal.floor}}층</div>
                        <div class="text-right">{{deal.dealYear}}.{{deal.dealMonth}}.{{deal.dealDay}}</div>
                    </div>
        <modal :show="modalFlag" :showClose="modalFlag"></modal>
                </div>
            </div>
        </div>
    </section>
</template>
<script>
import BasicElements from '../../views/components/BasicElements.vue';
import * as VueGoogleMaps from 'vue2-google-maps'
import GmapCluster from 'vue2-google-maps/src/components/cluster' 
import Modal from "./Modal.vue";
import axios from "axios";

export default {
    components: { BasicElements, VueGoogleMaps, Modal },
    data () {
        return {
            markers: [],
            deals: [],
            search_keyword: "",
      modalFlag: false,
        }
    },
    methods: {// 카드를 누르면 모달창이 뜸
    test() {
      this.modalFlag = !this.modalFlag;
    },
        addMarkerByClick (e) {
            var pos = {position:{lat: e.latLng.lat(), lng: e.latLng.lng()}};
            this.markers.push(pos);
        },
        addMarkerByPosition (data) {
            var result = {  position:   {lat: parseFloat(data.lat),
                                        lng: parseFloat(data.lng)},
                            customInfo: {name: data.aptName,
                                        dongcode: data.dongcode}
                        };
            this.markers.push(result);
        },
        removeAllMarker () {
            this.markers = [];
        },
        getBound () {
            var bounds = this.$refs.map.$mapObject.getBounds();
            //console.log([bounds.Wa.i, bounds.Sa.i, bounds.Wa.j, bounds.Sa.j]);
            return [bounds.Wa.i, bounds.Sa.i,
                    bounds.Wa.j, bounds.Sa.j];
        },
        addMarkerWithBound () {
            this.removeAllMarker();
            var bounds = this.getBound();
            axios.get(`http://localhost/house/info/swLat/${bounds[0]}/swLng/${bounds[1]}/neLat/${bounds[2]}/neLng/${bounds[3]}`)
                .then(res => {
                    console.log("num_marker:" + res.data.length);
                    for (var i = 0; i < res.data.length; i++)
                        this.addMarkerByPosition(res.data[i]);
                });
        },
        showMarkerDetail (marker) {
            var dongcode = marker.customInfo.dongcode;
            var aptname = marker.customInfo.name;
            axios.get(`http://localhost/house/deal/dongcode/${dongcode}/aptname/${aptname}`)
                .then(res => {
                    console.log(res.data.length);
                    this.deals = res.data;
                });
        },
        getDataByKeyword (e) {
            var keyword= document.getElementById("search_input").value;
            //console.log(keyword);
            var query = `http://localhost/map/keyword/${keyword}`;
            //console.log(query);
            axios.get(query)
                .then(res=> {
                    var result = res.data.candidates;
                    if (result.length > 0)
                    {
                        var lat = parseFloat(result[0].geometry.location.lat);
                        var lng = parseFloat(result[0].geometry.location.lng);
                        //console.log(lat, lng);
                        this.$refs.map.$mapObject.setCenter({lat: lat, lng: lng});
                    }
                })
                .catch(function(error) {
                    console.log(error);
                });
        }
    }
}
</script>
<style>
</style>
