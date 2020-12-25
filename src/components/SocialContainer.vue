<template>
  <div class="socialContainer">
    <a href="https://twitter.com/TribecampStatus" target="_blank" class="btnTwitter">
      <i class="fab fa-twitter" />
    </a>
    <a href="https://instagram.com/tribecampofficial" target="_blank" class="btnInstagram">
      <i class="fab fa-instagram" />
    </a>
    <a href="https://github.com/tribecamp" target="_blank" class="btnGitHub">
      <i class="fab fa-github" />
    </a>
    <a href="https://www.linkedin.com/company/tribecamp" target="_blank" class="btnLinkedIn">
      <i class="fab fa-linkedin" />
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
      @media (prefers-color-scheme: dark) {
        color: white;
      }
    }
    &.fa-linkedin {
      color: #0a66c2;
    }
  }
}
</style>
