<template>
  <div id="app">
    <branding-container />
  </div>
</template>

<script>
import BrandingContainer from './components/BrandingContainer.vue';

export default {
  components: {
    BrandingContainer,
  },
};
</script>

<style lang="scss">
#app {
  font-family: Nunito, Helvetica, Arial, sans-serif;
  padding-top: 100px;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
</style>
