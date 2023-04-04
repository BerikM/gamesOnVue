<template>
  <div id="smartContractInfo" class="mt-4">
    <div class="mt-4">
      <b-card>
        <p class="card-text">Адрес smart-контракта: {{ contractAddress }}</p>
        <p class="card-text">Просмотр транзакций smart-контракта:</p>
        <p class="card-text">
          <a
            :href="`https://testnet.bscscan.com/address/${contractAddress}`"
            target="_blank"
          >
            <b-button variant="success">Перейти</b-button>
          </a>
        </p>
      </b-card>
    </div>
  </div>
</template>

<script>
export default {
  name: "SmartContractInfo",
  data() {
    return {
      contractAddress: "0xA2B69Fd6B4f32970C05555b6C83cA564a46CaB0c",
    };
  },
  methods: {},
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
