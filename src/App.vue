<template>
  <div id="app">
    <branding-container />
    <status-container class="statusContainer" />
    <social-container class="socialContainer" />
    <div class="openSourceContainer">
      <span>
        {{ $t("open_source.license_message") }}
        <br>
        {{ $t("open_source.contributions_0") }} <a href="https://github.com/tribecamp/status" target="_blank">tribecamp/status</a> {{ $t("open_source.contributions_1") }}.
      </span>
    </div>
    <div class="goToTribecamp">
      <a href="https://tribecamp.com">{{ $t("go_to_tribecamp") }}</a>
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

.statusContainer {
  width: 80%;
  max-width: 800px;
  margin: auto;
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

.goToTribecamp {
  text-align: center;
  margin-top: 25px;

  a {
    color: #ffa500;
  }
}
</style>
