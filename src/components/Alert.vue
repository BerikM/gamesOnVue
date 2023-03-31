<template>
  <div class="item">
    <b-alert
      :show="dismissCountDown"
      fade
      :variant="type"
      @dismiss-count-down="countDownChanged"
    >
      {{ message }}
    </b-alert>
  </div>
</template>

<script>
export default {
  name: "Alert",
  props: {
    message: String,
    type: String,
    dismissCountDown: Number
  },
  data() {
    return {
      dismissSecs: 10,
    };
  },
  methods: {
    countDownChanged(dismissCountDown) {
      this.dismissCountDown = dismissCountDown;
    },
    showAlert() {
      this.dismissCountDown = this.dismissSecs;
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
