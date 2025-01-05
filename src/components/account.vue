<template>
<div class="account" 
    :class="{
        'falseKit': !account.haveKit,
        'trueKit': account.haveKit
    }">
    <div class="accountName">{{ account.name }}</div>
    <div class="haveKit">Наличие: {{ account.haveKit }}</div>   
    <button class="giveKit" :disabled="!account.haveKit" @click="$emit('take-kit', account)">Выдал</button>
    <button class="delete"  @click="$emit('delete-account', account)">Удалить</button>
</div>
</template>

<script>
export default {
    props: {
        account: {
            type: Object,
            required: false
        }
    }
}
</script>

<style scoped>
.account {
    width: 170px;
    margin: 10px;
    padding: 15px;
    border: solid black 2px;
    border-radius: 10px;
    display: flex;
    flex-direction: column;
    align-items: center;
}
.accountName {
    font-size: 30px;
    text-align: center;
}
.haveKit {
    margin-top: 10px;
    font-size: 25px;
    text-align: center;
}
.falseKit {
    background-color: rgb(236, 103, 103);
}
.trueKit {
    background-color: rgb(79, 245, 79);
}
.giveKit {
    width: 100%;
    margin: 10px 0px;
    padding: 3px;
    text-align: center;
    font-size: 15px;
    background-color: rgb(255, 255, 77);
}
.delete {
    width: 50%;
    margin: 10px 0px;
    padding: 3px;
    text-align: center;
    font-size: 15px;
    background-color: rgb(183, 183, 183);
}
</style>