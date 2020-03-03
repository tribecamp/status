<template>
  <div id="app">
    <branding-container />
    <status-container class="statusContainer" />
    <social-container class="socialContainer" />
    <div class="openSourceContainer">
      <span>
        This project is open source and licensed under the MIT license!
        <br>
        Contributions can be made to <a href="https://github.com/tribecamp/status" target="_blank">tribecamp/status</a> on GitHub.
      </span>
    </div>
  </div>
</template>

<script>
import BrandingContainer from './components/BrandingContainer.vue';
import StatusContainer from './components/StatusContainer.vue';
import SocialContainer from './components/SocialContainer.vue';

export default {
  components: {
    BrandingContainer,
    StatusContainer,
    SocialContainer,
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

<style lang="scss" scoped>
.statusContainer,
.socialContainer {
  margin-top: 60px;
}

.openSourceContainer {
  text-align: center;
  font-family: monospace;
  font-size: 14px;
  margin-top: 30px;
  color: gray;

  a {
    color: #ffa500;
  }
}
</style>
