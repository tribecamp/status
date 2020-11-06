<template>
  <div class="brandingContainer">
    <img src="~@/assets/logo.png" alt="Tribecamp Logo" class="logo">
    <h1 class="header">{{ $t("branding.header")}}</h1>
  </div>
</template>

<script>
export default {

};
</script>

<style lang="scss" scoped>
.brandingContainer {
  text-align: center;

  .logo {
    width: 200px;
  }

  .header {
    font-size: 40px;
    font-weight: bolder;
  }
}
</style>
