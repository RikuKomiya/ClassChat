<template>
  <v-card>
    <v-card-text> 
      <!-- <p >{{ user.email }}</p> -->
      <p>user</p>
      <v-card-actions>
        <v-btn @click="logout">logout</v-btn>
      </v-card-actions>
    </v-card-text>
  </v-card>
</template>

<script>
export default {
  middleware({ store, redirect }) {
    if(!store.$auth.loggedIn) {
      redirect('/login');
    }
  },
  data() {
    return {
      user: this.$auth.user
    }
  },
  methods: {
    logout() {
      this.$auth.logout();
    },
  }
}
</script>