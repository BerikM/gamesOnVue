<template>
  <div class="choice_item">
    <b-container class="mt-4">
      <Alert
        :type="alertType"
        :message="alertMessage"
        :dismissCountDown="alertDismissCountDown"
      />
      <b-col cols="12" class="mb-0">
        <b-row>
          <b-jumbotron
            bg-variant="info"
            text-variant="black"
            border-variant="dark"
            header="Игра за TBNB"
            :lead="`Баланс ${accountAddress}`"
          >
            <p>{{ balance }} TBNB</p>
          </b-jumbotron>
          <b-row>
            <b-col cols="6">
              <b-input-group prepend="price" class="mt-3">
                <b-form-input v-model="price"></b-form-input>
              </b-input-group>
            </b-col>
            <b-col cols="6">
              <b-input-group prepend="limit gas" class="mt-3">
                <b-form-input v-model="gas"></b-form-input>
              </b-input-group>
            </b-col>
          </b-row>
          <b-col v-for="item in gameRemoteConfig" :key="item.type">
            <Item
              :type="item.type"
              :symbol="item.symbol"
              :title="item.type"
              @selected="handleMetaMaskMove"
            />
          </b-col>
        </b-row>
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
import Web3 from "web3";
import KNBGame from "../contract/artifacts/KNBGame.json";
import Alert from "../components/Alert.vue";
let web3 = new Web3(window.ethereum);

export default {
  name: "ChoiceItem",
  components: {
    Item,
    Alert,
  },
  data() {
    return {
      gas: 50000,
      price: "0",
      acc: null,
      result: null,
      gameLocalConfig: [
        { type: "rock", symbol: "r" },
        { type: "paper", symbol: "p" },
        { type: "scissors", symbol: "s" },
      ],
      countPC: 0,
      countUser: 0,
      countDraw: 0,
      gameRemoteConfig: [
        { type: "rock", symbol: "0" },
        { type: "paper", symbol: "1" },
        { type: "scissors", symbol: "2" },
      ],
      contractAddress: "0xa2b69fd6b4f32970c05555b6c83ca564a46cab0c",
      contractABI: KNBGame.abi,
      contractInstance: null,
      accountAddress: "",
      balance: 0,
      account: null,
      lastBlockNumber: null,
      alertType: "",
      alertMessage: "",
      alertDismissCountDown: 0,
      currentHash: "",
      pcWin: null,
      pcOption: null,
    };
  },
  mounted() {
    // Производим инициализацию на
    // этапе монтирование DOM-дереве
    this.loadWeb3();
    this.loadContract();
  },
  methods: {
    handleMetaMaskMove(step) {
      let contract = new web3.eth.Contract(
        this.contractABI,
        this.contractAddress
      );
      const self = this;
      contract.methods
        .game(step)
        .send({
          from: this.accountAddress,
          value: web3.utils.toWei(this.price, "ether"),
          gas: this.gas,
        })
        .on("transactionHash", function (hash) {
          console.log(hash);
          self.currentHash = hash;
          // транзакция отправлена, получен хеш транзакции
        })
        .on("receipt", function (receipt) {
          let returnValues = receipt.events["GameResult"].returnValues;
          self.pcOption = returnValues.computerOption; // Выбор компьютера
          self.getGameResult(returnValues.result);
          self.updateBalance();
          // транзакция была успешно выполнена, получен receipt
        })
        .on("error", function (error) {
          console.log(error);
          // ошибка выполнения транзакции
        });
    },
    updateBalance() {
      web3.eth.getBalance(this.accountAddress, (error, balance) => {
        if (error) {
          console.error(error);
        } else {
          this.balance = web3.utils.fromWei(balance, "ether");
        }
      });
    },
    getGameResult(result) {
      if (result == "0") {
        this.alertType = "primary";
        this.alertMessage = "Ничья!";
        console.log("result = " + result + "; Ничья!");
      } else if (result == "1") {
        this.alertType = "success";
        this.alertMessage = "Ваша Победа!";
        console.log("result = " + result + "; Вы победили!");
      } else {
        this.alertType = "danger";
        this.alertMessage = "Вы проиграли! Беда!";
        console.log("result = " + result + "; Вы проиграли!");
      }
      this.alertDismissCountDown = 10;
    },
    handleItemSelect(playerChoice) {
      const choices = ["r", "s", "p"];
      const computerChoice = choices[Math.floor(Math.random() * 3)];
      if (playerChoice === computerChoice) {
        this.result = "Ничья!";
        this.countDraw++;
      } else if (
        (playerChoice === "r" && computerChoice === "s") ||
        (playerChoice === "s" && computerChoice === "p") ||
        (playerChoice === "p" && computerChoice === "r")
      ) {
        this.result = "Вы победили!";
        this.countUser++;
      } else {
        this.result = "Вы проиграли!";
        this.countPC++;
      }
    },
    async loadWeb3() {
      if (typeof window.ethereum !== 'undefined') {
        try {
          // Получаем массив аккаунтов MetaMask
          this.account = await window.ethereum.request({
            method: "eth_requestAccounts",
          });
          // Присваиваем адрес аккаунта
          this.accountAddress = this.account[0];
          //Получаем баланс аккаунта
          this.updateBalance();
        } catch (error) {
          console.error(error);
        }
      }
    },
    async loadContract() {
      try {
        // Получаем кземпляр контракта
        // и присваиваем его в contractInstance
        this.contractInstance = new web3.eth.Contract(
          this.contractABI,
          this.contractAddress
        );
        console.log("Контракт успешно загружен.");
      } catch (error) {
        console.error("Ошибка загрузки контракта:", error);
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
