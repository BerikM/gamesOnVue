<template>
    <div class="main">
        <div class="game"> <router-link to="/" class="link">Камень-Ножницы</router-link> </div>
        <div class="game"><router-link to="/x" class="link">Крестики-Нолики</router-link></div>
    </div>
</template>

<script>
export default({
    name: "Header",
})
</script>

<style scoped>
.main{
    display: flex;
    justify-content: center;
    background-color: rgb(136, 255, 125);
}
.game{
    padding: 15px;
    font-size: 20px;
}
.game:hover{
    background-color:  rgb(89, 221, 76);
}
.link{
    text-decoration: none;
    color: black;
}

</style>