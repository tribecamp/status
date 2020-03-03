<template>
  <div class="statusContainer">
    <div class="endpoint" v-for="(i, index) in endpoints" :key="index">
      <span class="serviceName">{{ i.name }}</span>
      <span class="serviceUrl">{{ i.url }}</span>
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

    .serviceName {
      font-weight: bolder;
    }

    .serviceUrl {
      font-family: monospace;
      font-size: 16px;
      color: gray;
    }
  }
}
</style>
