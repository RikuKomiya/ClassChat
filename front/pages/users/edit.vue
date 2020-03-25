<template>
 <v-card>
    <v-card-text>
    <v-form>
    <v-text-field
      v-model="name"
      :rules="nameRules"
      :error-messages="nameErrors"
      :counter="10"
      label="Name(ニックネーム)"
      required
    ></v-text-field>
    <v-container>
      <v-row>
        <v-col
        cols="12"
        md="4">
          <v-select
            v-model="selectedUniversity"
            :items="university_names"
            :rules="presentRule"
            label="大学"
            required
            @input="selectUniversity"
          ></v-select>
        </v-col>
        <v-col
        cols="12"
        md="4">
          <v-select
            v-model="selectedFacluty"
            :items="facluty_names"
            :rules="presentRule"
            :error-messages="selectErrors"
            label="学部"
            :disabled="!university"
            @input="selectFacluty"
            required
          ></v-select>
        </v-col>
      </v-row>
    </v-container>
    <!-- <v-checkbox
      v-model="checkbox"
      :error-messages="checkboxErrors"
      label="Do you agree?"
      required
      @change="$v.checkbox.$touch()"
      @blur="$v.checkbox.$touch()"
    ></v-checkbox> -->

    <v-btn class="mr-4" @click="submit">submit</v-btn>
    <v-btn @click="clear">clear</v-btn>
  </v-form>
    </v-card-text>
  </v-card>  
</template>

<script>
export default {
  data() {
    return {
      name: '',
      selectedUniversity: '',
      university: null,
      universities: [],
      selectedFacluty: '',
      facluty: {},
      facluties: [],
      nameRules: [
        v => !!v || "名前を入力してください",
        v => v.length <= 10 || "10文字以内で入力してください"
      ],
      presentRule: [
        v => !!v || "入力してください"
      ]
    }
  },
  async asyncData({ app }) {
    try {
      const response = await app.$axios.$get('/api/university');
      console.log(response)
      return { universities: response.universities };
    } catch (err) {
      console.log(err)
    }
  },
  computed: {
    university_names: function() {
      return this.universities.map(function(v) {
        return v.name
      })
    },
    facluty_names: function() {
      return this.facluties.map(function(v){
        return v.name
      })
    }
  },
  methods: {
    selectUniversity: function() {
      var selectedUniversity = this.universities.find(({name}) => name === this.selectedUniversity)
      this.university = selectedUniversity
      this.facluties = selectedUniversity.facluty
    },
    selectFacluty: function() {
      var selectedFacluty = this.facluties.find(({name}) => name === this.selectedFacluty)
      this.facluty = selectedFacluty
    }
  }
}
</script>