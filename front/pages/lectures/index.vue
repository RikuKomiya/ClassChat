<template>
  <v-simple-table>
    <thead>
      <tr>
        <th>講義名</th>
        <th>教授名</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="lecture in lectures" :key="lecture.id">
        <td><nuxt-link :to="`lectures/` + lecture.id">{{ lecture.name }}</nuxt-link></td>
        <td>{{ lecture.professor_name}}</td>
      </tr>
    </tbody>
  </v-simple-table>
</template>

<script>
export default {
  data () {
    return {
      lectures: {}
    }
  },
  async asyncData({ app }) {
    try {
      const response = await app.$axios.$get('/api/lectures');
      console.log(response)
      return { lectures: response.lectures };
    } catch (err) {
      console.log(err)
    }
    
  },
  created() {
    console.log(process.env.API_URL)
  }
}

</script>