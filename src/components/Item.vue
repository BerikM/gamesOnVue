<template>
  <div class="item">
    <img
      class="choice-item"
      :src="setUrl(type)"
      height="160px"
      :alt="`${title}`"
      @click="select"
    />
  </div>
</template>

<script>
export default {
  watch: {
  },
  name: "Item",
  props: {
    title: String,
    type: String,
    symbol: String,
  },
  data() {
    return {
      result: null,
      countPC: 0,
      countUser: 0,
      countC: 0,
    };
  },
  methods: {
    setUrl(type) {
      // Присваивание изображения с папки
      // assets по получаемому props
      return require("../assets/" + type + ".png");
    },
    select() {
      this.$emit("selected", this.symbol);
    },
  },
};
</script>

<style scoped>
.choice-item {
  border: 4px solid, white;
  margin: 0 20px;
  padding: 5px;
  display: inline-block;
  border-radius: 90px;
}

.choice-item:hover {
  cursor: pointer;
  background: red;
  border-radius: 90px;
}
</style>
