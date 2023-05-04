<template>
  <div class="home">
    <b-row>
      <b-col>
        <ChoiceItem />
      </b-col>
    </b-row>
  </div>
</template>

<script>
import ChoiceItem from "@/components/ChoiceItem.vue";

export default {
  name: "Home",
  components: {
    ChoiceItem,
  },
};
</script>
