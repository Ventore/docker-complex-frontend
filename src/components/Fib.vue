<template>
  <div>
    <form @submit="handleSubmit">
      <label for="">Enter your index</label>
      &nbsp;
      <input type="text" v-model="index" />
      &nbsp;
      <button>Submit</button>
    </form>

    <h3>Indexes I have seen:</h3>
    {{ renderSeenIndexes }}

    <h3>Calculated Values:</h3>
    <div v-for="(value, key, i) in values" :key="i">
      For index {{ key }} I calculated {{ value }}
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'Fib',
  data() {
    return {
      seenIndexes: [],
      values: [],
      index: '',
    };
  },
  computed: {
    renderSeenIndexes() {
      return this.seenIndexes.map(({ number }) => number).join(', ');
    },
  },
  methods: {
    async fetchValues() {
      const values = await axios.get('/api/values/current');

      this.values = values.data;
    },
    async fetchIndexes() {
      const seenIndexes = await axios.get('/api/values/all');

      this.seenIndexes = seenIndexes.data;
    },
    async handleSubmit(event) {
      event.preventDefault();

      await axios.post('/api/values', {
        index: this.index,
      });

      this.index = '';
    },
  },
  mounted() {
    this.fetchIndexes();
    this.fetchValues();
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped></style>
