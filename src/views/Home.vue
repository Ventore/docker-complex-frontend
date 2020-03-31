<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png" />
    <Fib msg="Welcome to Your Vue.js App" />
  </div>
</template>

<script>
// @ is an alias to /src
import Fib from '@/components/Fib.vue';

export default {
  name: 'Home',
  components: {
    Fib,
  },
};
</script>
