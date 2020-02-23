<template>
  <div>
    <ul v-for="example in examples" :key="example.id" :class="example.color">
      <li>{{ example.name }}</li>
    </ul>
  </div>
</template>

<script>
export default {
  data () {
    return {
      examples: []
    }
  },
  mounted () {
    this.updateExamples()
  },
  methods: {
    async updateExamples () {
      this.examples = await this.$axios.$get('examples')
    }
  }
}
</script>
