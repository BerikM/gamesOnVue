<template>
  <div class="home">
    <b-row>
      <b-col cols="3">
        <SmartContractInfo />
      </b-col>
      <b-col cols="9">
        <ChoiceItem />
      </b-col>
    </b-row>
  </div>
</template>

<script>
import ChoiceItem from "@/components/ChoiceItem.vue";
import SmartContractInfo from "@/components/SmartContractInfo.vue";

export default {
  name: "Home",
  components: {
    ChoiceItem,
    SmartContractInfo,
  },
};
</script>
