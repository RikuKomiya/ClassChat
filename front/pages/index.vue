<template>
  <div>
    <bu-title title="ホームページ"/>
    <v-card>
      <v-card-text> 
        <p v-if="this.$auth.loggedIn">{{ user.email }}</p>
        <p>user</p>
        <v-card-actions>
          <v-btn @click="logout">logout</v-btn>
        </v-card-actions>
      </v-card-text>
    </v-card>
  </div>
</template>

<script>
export default {
  middleware({ store, redirect }) {
    if(!store.$auth.loggedIn) {
      redirect('/users/login');
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
  },
  components: {
    BuTitle: () => import('~/components/BuTitle.vue')
  }
}
</script>