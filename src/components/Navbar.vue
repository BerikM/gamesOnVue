<template>
  <div id="navbar">
    <div>
      <b-navbar class="bg-color-grey" toggleable="lg">
        <b-navbar-brand href="#">
          <img
            src="../assets/logo_tou.png"
            class="d-inline-block align-top"
            alt="TOU logo"
            height="50px"
          />
        </b-navbar-brand>
        <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>
        <b-collapse id="nav-collapse" is-nav>
          <b-navbar-nav>
            <b-nav-item disable>КНБ</b-nav-item>
            <b-nav-item to="/">Главная</b-nav-item>
          </b-navbar-nav>
        </b-collapse>
      </b-navbar>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style>
.nav-label {
  color: black;
}
.navbar-brand {
  margin-left: 2%;
}

.nav-link a {
  position: relative;
  padding: 10px 30px;
  width: 100vw;
  color: #007bff;
  text-decoration: none;
  text-transform: uppercase;
  transition: 0.5s;
}
.nav-link a::before {
  content: " ";
  position: absolute;
  top: -1px;
  left: -1px;
  width: 10px;
  height: 10px;
  border-top: 2px solid #007bff;
  border-left: 2px solid #007bff;
  transition: 0.5s;
  transition-delay: 0.5s;
}
.nav-link a::after {
  content: " ";
  position: absolute;
  bottom: -1px;
  right: -1px;
  width: 10px;
  height: 10px;
  border-bottom: 2px solid #007bff;
  border-right: 2px solid #007bff;
  transition: 0.5s;
  transition-delay: 0.5s;
}
.nav-link a:hover::before,
a:hover::after {
  width: 100%;
  height: 100%;
  transition-delay: 0s;
}
.nav-link a:hover {
  background: #007bff;
  color: #000;
  box-shadow: 0 0 50px #007bff;
  transition-delay: 0.5s;
}
</style>