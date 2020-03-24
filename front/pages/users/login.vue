<template>
  <v-card>
    <v-card-text> 
      <div v-for="error in errors" :key="error" class="error-text">
        <p >{{error}}</p>
      </div>
      <v-form v-model="valid">
        <v-text-field 
        v-model="email" 
        label="Email"
        :rules="emailRules"
        required/>
        <v-text-field 
        v-model="password" 
        label="Password" 
        type="password" 
        :rules="passwordRules"
        required/>
      </v-form>
      <v-card-actions>
        <v-btn 
        @click="login" 
        :disabled="!valid"
        >login</v-btn>
        <v-spacer/>
        <nuxt-link to="/users/sign_up">新規登録はこちら</nuxt-link>
      </v-card-actions>
    </v-card-text>
  </v-card>
</template>

<script>
export default {
  middleware({ store, redirect }) {
    if(store.$auth.loggedIn) {
      redirect('/dashbord');
    }
  },
  data () {
    return {
        valid: false,
        email: '',
        emailRules: [
          v => !!v || 'Emailを入力してください',
          v => /.+@.+/.test(v) || '正しいEmailを入力してください'
        ],
        password: '',
        passwordRules: [
          v => !!v || 'Passwordを入力してください',
          v => v.length >= 6 || 'Passwordが短すぎます'
        ],
        errors: []
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
         })
      // ここでホームへリダイレクトする前に行いたい処理
      this.$router.replace({ path: '/' }); // 任意のタイミングでリダイレクト
    } catch(error) {
      var error = error.response.data.error
      this.errors = []
      this.errors.push(error)
      console.log(error);
    }
  }
}
}
</script>