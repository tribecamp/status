<template>
  <div class="socialContainer">
    <a href="https://twitter.com/TribecampStatus" target="_blank" class="btnTwitter">
      <i class="fab fa-twitter"></i>
    </a>
    <a href="https://instagram.com/tribecamp_intl" target="_blank" class="btnInstagram">
      <i class="fab fa-instagram"></i>
    </a>
    <a href="https://github.com/tribecamp" target="_blank" class="btnGitHub">
      <i class="fab fa-github"></i>
    </a>
  </div>
</template>

<script>
export default {

};
</script>

<style lang="scss" scoped>
.socialContainer {
  text-align: center;

  a {
    margin-right: 10px;

    &:last-of-type {
      margin-right: 0;
    }
  }

  i {
    font-size: 24px;

    &.fa-twitter {
      color: #1DA1F2;
    }

    &.fa-instagram {
      color: #e35ef5;
    }

    &.fa-github {
      color: black;
    }
  }
}
</style>
