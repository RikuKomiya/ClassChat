<template>
  <div>
    <h1>{{lecture.name}}</h1>
    <v-card>
      <v-card-text> 
        <v-form>
          <v-textarea v-model="message" label="Message"/>
        </v-form>
        <v-card-actions>
          <v-btn @click="sendMessage">投稿</v-btn>
        </v-card-actions>
      </v-card-text>
    </v-card>
    <v-card v-for="message in messages" :key="message.id">
      <v-card-text class="message-content"> 
        <p>{{message.text}}</p>
      </v-card-text>
    </v-card>
  </div>

</template>

<script>
export default {
  data () {
    return {
      lecture: {},
      message: '',
      messages: {}
    }
  },
  async asyncData({ app, params }) {
    const response = await app.$axios.$get(`/api/lectures/${params.id}`);
    console.log(response)
    return { lecture: response.lecture,
              messages: response.messages };
  },
  channels: {
    PostChannel: {
      connected() {
        console.log('I am connected.');
      },
      received(data) {
        this.messages.push(data)
      },
    }
  },
  mounted() {
    this.$cable.subscribe({
      channel: 'PostChannel',
      room: this.$nuxt.$route.params.id
    });
  },
   methods: {
    sendMessage() {
      this.$cable.perform({
        channel: 'PostChannel',
        action: 'post',
        data: {
          message: this.message,
          lecture_id: this.$nuxt.$route.params.id
        }
      });
      this.message = ""
    }
  },
}
</script>

<style scoped>
.message-content{
  white-space: pre-wrap;
  margin-top: 15px;
}
</style>