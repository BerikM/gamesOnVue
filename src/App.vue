<template>
  <div id="app">
    <Header></Header>
    <b-container>
      <router-view />
    </b-container>
    <Footer class="footer"></Footer>
  </div>
</template>

<style scoped>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}
.footer{
  position: absolute;
  width: 100vw;
  bottom: 0;
  left: 0;
}
</style>

<script>
import Header from "./components/Header.vue"
import Footer from "./components/Footer.vue"
export default {
  name: "Home",
  components: {
    Header,
    Footer,
  },
};
</script>
