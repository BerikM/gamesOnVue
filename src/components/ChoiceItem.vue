<template>
  <div class="choice_item">
    <b-container class="mt-4">
      <Alert
        :type="alertType"
        :message="alertMessage"
      />
      <b-col cols="12" class="mb-0">
        <b-row>
          <b-jumbotron
            class="pt-2 pb-2"
            text-variant="black"
            border-variant="dark"
            lead="Обычная игра"
          >
            <b-row>
              <b-col cols="4">
                <b-button variant="success" disabled>
                  Пользователь
                  <b-badge> {{ countUser }}</b-badge>
                </b-button>
              </b-col>
              <b-col cols="4">
                <b-button variant="primary" disabled>
                  Ничья
                  <b-badge> {{ countDraw }}</b-badge>
                </b-button>
              </b-col>
              <b-col cols="4">
                <b-button variant="danger" disabled>
                  PC
                  <b-badge> {{ countPC }}</b-badge>
                </b-button>
              </b-col>
            </b-row>
          </b-jumbotron>
        </b-row>
        <b-row>
          <b-col v-for="item in gameLocalConfig" :key="item.type">
            <Item
              :type="item.type"
              :symbol="item.symbol"
              :title="item.type"
              @selected="handleItemSelect"
            />
          </b-col>
        </b-row>
      </b-col>
    </b-container>
  </div>
</template>

<script>
import Item from "../components/Item.vue";
import Alert from "../components/Alert.vue";

export default {
  name: "ChoiceItem",
  components: {
    Item,
    Alert,
  },
  data() {
    return {
      gameLocalConfig: [
        { type: "rock", symbol: "r" },
        { type: "paper", symbol: "p" },
        { type: "scissors", symbol: "s" },
      ],
      countPC: 0,
      countUser: 0,
      countDraw: 0,
      alertType: "",
      alertMessage: "",
    };
  },
  methods: {
    handleItemSelect(playerChoice) {
      const choices = ["r", "s", "p"];
      const computerChoice = choices[Math.floor(Math.random() * 3)];
      if (playerChoice === computerChoice) {
        this.alertMessage = "Ничья!";
        this.alertType = "warning";
        this.countDraw++;
      } else if (
        (playerChoice === "r" && computerChoice === "s") ||
        (playerChoice === "s" && computerChoice === "p") ||
        (playerChoice === "p" && computerChoice === "r")
      ) {
        this.alertType = "success";
        this.alertMessage = "Ваша победа!";
        this.countUser++;
      } else {
        this.alertType = "danger";
        this.alertMessage = "Вы проиграли!";
        this.countPC++;
      }
    },
  },
};
</script>

<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}

.choice-item {
  border: 4px solid, white;
  margin: 0 20px;
  padding: 10px;
  display: inline-block;
  border-radius: 90px;
}

.choice-item:hover {
  cursor: pointer;
  background: blue;
  border: 1px solid blue;
  border-radius: 90px;
}
</style>
