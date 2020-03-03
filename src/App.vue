<template>
  <div id="app">
    <branding-container />
    <status-container />
  </div>
</template>

<script>
import BrandingContainer from './components/BrandingContainer.vue';
import StatusContainer from './components/StatusContainer.vue';

export default {
  components: {
    BrandingContainer,
    StatusContainer,
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
