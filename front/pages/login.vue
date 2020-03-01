<template>
  <v-card>
    <v-card-text> 
      <v-form>
        <v-text-field v-model="email" label="Email"/>
        <v-text-field v-model="password" label="Password" type="password" />
      </v-form>
      <v-card-actions>
        <v-btn @click="login">login</v-btn>
      </v-card-actions>
    </v-card-text>
  </v-card>
</template>

<script>
export default {
  middleware({ store, redirect }) {
    if(store.$auth.loggedIn) {
      redirect('/');
    }
  },
  data () {
    return {
        email: '',
        password: '',
        error: null
    }
  },
 methods: {
  async login() {
    try {
      await this.$auth.loginWith('local', {
         data: { user: {
           email: this.email,
           password: this.password
         }
         }
         });
      // ここでホームへリダイレクトする前に行いたい処理
      this.$router.replace({ path: '/' }); // 任意のタイミングでリダイレクト
    } catch(error) {
      console.log(error);
    }
  }
}
}
</script>