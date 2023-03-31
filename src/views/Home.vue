<template>
  <div class="home">
    <b-container>
      <b-col cols="6"> </b-col>
      <b-row>
        <b-col cols="7" class="mx-auto">
          <ChoiceItem />
        </b-col>
      </b-row>
    </b-container>
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
