<template>
  <div class="div">
    <img class="item" :src="setUrl(symbolObject.symbol)"  @click="select()">
  </div>
  </template>
  
  <script>
  export default {
    watch: {
    },
    name: "Item",
    props: {
      currentPlayer: String,
      symbolObject: Object,
      required: true,
    },
    data() {
      return {
      };
    },
    methods: {
      setUrl(symbol){
        if(symbol=="x")
          return require("../assets/" + "cross" + ".png");
        else if(symbol=="o")
          return require("../assets/" + "zero" + ".png");
        else{
          return require("../assets/" + "empty" + ".png");
        }
      },
      select() {
        if(!this.symbolObject.clicked){
          this.symbolObject.clicked = true;
          this.symbolObject.symbol = this.currentPlayer;
          this.$emit("select", this.symbolObject);
        }
      },
    },
  };
  </script>
  
  <style scoped>
    .item{
        height: 130px;
        width: 130px;
        background-color: rgb(178, 252, 182);
    }
  </style>
  