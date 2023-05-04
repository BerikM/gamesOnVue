<template>
  <div class="item">
    <b-alert
      :show="!countDown"
      fade
      :variant="type"
    >
      {{ message }}
    </b-alert>
  </div>
</template>

<script>
export default {
  name: "Alert",
  props: {
    message: {
      type: String,
      required: true,
    },
    type: {
      type: String,
      required: true,
    },
  },
  data() {
    return {
    };
  },
  methods: {
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
