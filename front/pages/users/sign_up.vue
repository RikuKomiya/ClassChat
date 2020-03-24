<template>
  <v-card>
    <v-card-text>
      <v-form v-model="valid">
        <v-text-field 
        v-model="email" 
        label="Email"
        :rules="emailRules"
        required
        :error-messages="errors.email"
        @input="onChage"/>
        <v-text-field 
        v-model="password" 
        label="Password" 
        type="password" 
        :rules="passwordRules"
        required/>
      </v-form>
      <v-card-actions>
        <v-btn 
        @click="sign_up" 
        :disabled="!valid"
        >新規登録</v-btn>
        <v-spacer/>
        <nuxt-link to="/users/login">ログインはこちら</nuxt-link>
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
        errors: {
          email: [],
        }
    }
  },
 methods: {
  async sign_up() {
    try {
      await this.$axios.post("/api/users", {
          user: {
            email: this.email,
           password: this.password
          }
      })
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
      // var error = error.response.data.errors
      this.errors.email = error.response.data.errors.email
      console.log(error.response.data.errors);
    }
  },
  onChage: function() {
    this.errors.email = []
  }
}
}
</script>