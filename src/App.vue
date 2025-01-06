<template>
<div>
  <div class="addAcc">
    <input type="text" class="inpAdd" v-model="accountName">
    <button class="butAdd" @click="addAccount">Добавить Аккаунт</button>
  </div>

  <div class="buffer"></div>
  <div class="flex">
    <account v-for="(acc, index) in accounts" :key="index" :account="acc" @take-kit="takeKits" @delete-account="deleteAcc"/>
  </div>
</div>
</template>

<script>
import account from "./components/account.vue"
export default {
  components: {
    account
  },

  created() {
    let storageData = JSON.parse(localStorage.getItem("saveAccounts"))
    if (storageData) {
      this.accounts = storageData
    }
    setInterval(this.checkCoolDown, 1000);
  },

  data() {
    return {
      accountName: "",
      accounts: []
    }
  },

  methods: {
    deleteAcc(account) {
      let indexCurrentAccount = this.accounts.indexOf(account, 0);
      this.accounts.splice(indexCurrentAccount, 1)
    },

    checkCoolDown() {
      if (this.accounts.length < 1) {return}
      this.accounts.forEach(acc => {
        if (Date.now() - acc.dateTakeKit > 129600000) {
          acc.haveKit = true;
          acc.dateTakeKit = null;
        }
      });
    },
    addAccount() {
      let newAccount = {
        name: this.accountName,
        haveKit: true,
        dateTakeKit: null
      };
      this.accounts.push(newAccount);
      this.accountName = "";
    },

    takeKits(account) {
      let currentAccount = this.accounts.find(acc => acc == account)
      currentAccount.dateTakeKit = Date.now();
      currentAccount.haveKit = false;
    }
  },

  watch: {
    accounts: {
      handler() {
        localStorage.setItem("saveAccounts", JSON.stringify(this.accounts))
      },
      deep: true
    }
  }
}
</script>

<style scoped>
.flex {
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
}
.addAcc {
  margin: 10px;
}
/* .textAdd {
  font-size: 25px;
  margin: 0px;
} */
.inpAdd {
  margin-top: 5px;
  padding: 2px;
  font-size: 15px;
}
.butAdd {
  padding: 2px;
  font-size: 15px;
}
.buffer {
  margin: 15px 0px;
  border-bottom: solid gray 2px;
}
</style>