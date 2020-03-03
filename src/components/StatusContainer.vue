<template>
  <div class="statusContainer">
    <div class="endpoint" :class="{ loading: !i.status }"
         v-for="(i, index) in endpoints" :key="index"
    >
      <div class="left">
        <i class="statusIcon" :class="{
          'fas fa-dot-circle': !i.status,
          'fas fa-check-circle': i.status && i.status === 200,
          'fas fa-times-circle': i.status && i.status !== 200
        }" />
        <span class="serviceName">{{ i.name }}</span>
      </div>
      <div class="right">
        <span class="serviceUrl">{{ i.url }}</span>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      endpoints: [
        {
          name: 'Tribecamp Web',
          url: '/',
        },
        {
          name: 'Tribecamp Core (API)',
          url: '/api',
        },
        {
          name: 'Tribecamp Authentication',
          url: '/api/auth',
        },
      ],
    };
  },
  created() {
    this.endpoints.forEach((endpoint, index) => {
      this.checkStatus(endpoint, index);
    });
  },
  methods: {
    checkStatus(endpoint, index) {
      axios.get(`https://tribecamp.com${endpoint.url}`)
        .then((result) => {
          this.$set(this.endpoints[index], 'status', result.status);
        })
        .catch((error) => {
          this.$set(this.endpoints[index], 'status', error.response
            ? error.response.status
            : 'errored');
        });
    },
  },
};
</script>

<style lang="scss" scoped>
.statusContainer {
  padding: 0 10%;

  .endpoint {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 12px;
    margin-bottom: 15px;
    font-size: 22px;
    box-shadow: 0 0 30px rgba(0, 0, 0, 0.12);
    border-radius: 4px;
    transition: opacity 0.5s;

    &.loading {
      opacity: 0.5;
    }

    .statusIcon,
    .serviceName {
      vertical-align: middle;
    }

    .statusIcon {
      font-size: 24px;
      margin-right: 10px;

      &.fa-dot-circle {
        color: rgb(59, 162, 247);
      }

      &.fa-check-circle {
        color: rgb(42, 211, 79);
      }

      &.fa-times-circle {
        color: rgb(255, 100, 100);
      }
    }

    .serviceName {
      font-weight: bolder;
      margin-right: 5px;
    }

    .serviceUrl {
      font-family: monospace;
      font-size: 16px;
      color: gray;
    }
  }
}
</style>
