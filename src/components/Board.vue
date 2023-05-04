<template>
  <div class="main">
    <h1 class="h1">Крестики-Нолики</h1>
    <div class="Board" >
        <Cell :currentPlayer="currentPlayer" :symbolObject="cell" v-for="cell in cells"  @select="handleItemSelect"/>
    </div>
    <div class="step">
      <h1 class="title_step">Ходит игрок: {{ currentPlayer }}</h1>
      <h3 @click="changePlayer()">Сменить</h3>
    </div>
    <div class="score">
      <b class="player_score">Счет игрока X: {{ playerXScore }}</b>
      <b class="player_score">Ничья: {{ drawScore }}</b>
      <b class="player_score">Счет игрока O: {{ playerOScore }}</b>
    </div>
    <div class="buttons">
      <button class="button reset" @click="reset()">Сбросить счет</button>
      <button class="button restart" @click="clear()">Рестарт</button>
    </div>
  </div>
    
    
  </template>
  
  <script>
  import Cell from "../components/Cell.vue";
  
  export default {
    name: "Board",
    components: {
      Cell,
    },
    data() {
      return {
        currentPlayer: "x",
        playerXScore: 0,
        playerOScore: 0,
        drawScore: 0,
        cells: [
          {symbol: "n", id: 0, clicked: false},
          {symbol: "n", id: 1, clicked: false},
          {symbol: "n", id: 2, clicked: false},
          {symbol: "n", id: 3, clicked: false},
          {symbol: "n", id: 4, clicked: false},
          {symbol: "n", id: 5, clicked: false},
          {symbol: "n", id: 6, clicked: false},
          {symbol: "n", id: 7, clicked: false},
          {symbol: "n", id: 8, clicked: false},
        ],
        winPatterns: [
          [0,1,2],
          [3,4,5],
          [6,7,8],
          [0,3,6],
          [1,4,7],
          [2,5,8],
          [0,4,8],
          [2,4,6],
        ]
      };
    },
    methods: {
      handleItemSelect(data) {
        this.changePlayer();
        this.checkWin();
        const isFull = this.checkDraw();
        if(isFull){
          alert("Ничья");
          this.drawScore +=1;
        }
      },

      checkDraw(){
        const clickedCells = [];
        this.cells.forEach(cell=>{
          if(cell.clicked){
            clickedCells.push(true);
          }
        });
        if(clickedCells.length === 9){
          return true; 
        }
        else{
          return false;
        }
      },

      checkWin(){
        const playerXCells = [];
        const playerOCells = [];
        this.cells.forEach(cell=>{
          if(cell.symbol == "x"){
            playerXCells.push(cell.id);
          }
          else if(cell.symbol == "o"){
            playerOCells.push(cell.id);
          }
        })
        const playerXIsWin = this.checkPlayerPatternWin(playerXCells);
        const playerOIsWin = this.checkPlayerPatternWin(playerOCells);
        if(playerXIsWin){
          alert("Игрок X победил");
          this.playerXScore +=1;
          this.clear();
        }
        else if(playerOIsWin){
          alert("Игрок O победил");
          this.playerOScore +=1;
          this.clear();
        }
      }, 


      checkPlayerPatternWin(playerCells){
        const wins = [];
        let win = false;
        this.winPatterns.some(pattern => {
        wins.push(pattern.every(index => playerCells.includes(index)));
        })
        wins.forEach(patternisWin=>{
          if(patternisWin){
            win = patternisWin;
          }
        })
        return win;
      },

      changePlayer(){
        if(this.currentPlayer == "x"){
          this.currentPlayer = "o";
        }else{
          this.currentPlayer = "x";
        }
      },
      clear(){
        this.cells.forEach(cell=>{
          cell.symbol = "n";
          cell.clicked = false;
        })
      },
      reset(){
        this.drawScore = 0;
        this.playerOScore = 0;
        this.playerXScore = 0;
      }
    }, 
  };
  </script>
  
  <style scoped>
  .main{
    display: flex;
    flex-direction: column;
  }
    .Board{
      height: 400px;
      width: 400px;
      margin: 0 auto;
      margin-top: 50px;

      display: grid;
      grid-template-columns: 1fr 1fr 1fr;
      grid-gap: 2px;
    }
    .h1{
      margin-top: 10px;
    }
    .title_step{
      margin-top: 20px;
    }

    .score{
      margin-top: 25px;
      display: flex;
      justify-content: space-between;
    }
    .player_score{
      font-size: 25px;
    }
    .buttons{
      margin: 0 auto;
      margin-top: 25px;
    }
    .button{
      width: 150px;
      height: 75px;
      margin-left: 100px;
      margin-right: 100px;
      border-radius: 30%;
      background-color: rgb(178, 252, 182);
    }

  </style>
  