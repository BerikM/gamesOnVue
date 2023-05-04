<template>
  <div class="home">
        <Board />
  </div>
</template>

<script>
import Board from "../components/Board.vue";

export default {
  name: "Home",
  components: {
    Board,
  },
};
</script>


<style>
.home{
  margin: 0 auto;
}
</style>