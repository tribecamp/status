<template>
  <div class="statusContainer">
    <span class="statusMessage" :style="{
      opacity: isLoaded ? 1 : 0
    }"
    >
      <span v-if="!amountErrored">
        {{ $t("status.systems_operating_normally") }}
      </span>
      <span v-else-if="amountErrored === endpoints.length">
        {{ $t("status.all_endpoints_errored") }}
      </span>
      <span v-else>
        {{ $t("status.some_endpoints_errored", { amountErrored: amountErrored }) }}
      </span>
    </span>
    <div class="listEndpoints">
      <div v-for="(i, index) in endpoints" :key="index"
           class="endpoint" :class="{ loading: !i.status }"
      >
        <div class="left">
          <i class="statusIcon" :class="{
            'fas fa-dot-circle': !i.status,
            'fas fa-check-circle': i.status && i.status === 200,
            'fas fa-times-circle': i.status && i.status !== 200
          }"
          />
          <span class="serviceName">{{ i.name }}</span>
        </div>
        <div class="right">
          <span class="serviceUrl">{{ i.url }}</span>
        </div>
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
          url: '/'
        },
        {
          name: 'Tribecamp Core (API)',
          url: '/api'
        },
        {
          name: 'Tribecamp Authentication',
          url: '/api/auth'
        }
      ]
    };
  },
  computed: {
    isLoaded() {
      return !this.endpoints.filter((endpoint) => !endpoint.status).length;
    },
    amountErrored() {
      return this.endpoints.filter(((endpoint) => endpoint.status !== 200)).length;
    }
  },
  created() {
    this.endpoints.forEach((endpoint, index) => {
      this.checkStatus(endpoint, index);
    });
  },
  methods: {
    checkStatus(endpoint, index) {
      const url = endpoint.url !== '/'
        ? endpoint.url
        : '';

      axios.head(`https://tribecamp.com${url}/service`)
        .then((result) => {
          this.$set(this.endpoints[index], 'status', result.status);
        })
        .catch((error) => {
          this.$set(this.endpoints[index], 'status', error.response
            ? error.response.status
            : 'errored');
        });
    }
  }
};
</script>

<style lang="scss" scoped>
.statusContainer {
  .statusMessage {
    display: block;
    font-family: monospace;
    font-size: 16px;
    margin-bottom: 10px;
    transition: opacity 1s;
    transition-delay: 0.5s;
  }

  .endpoint {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 12px;
    margin-bottom: 15px;
    font-size: 22px;
    @media (prefers-color-scheme: dark) {
      background-color: #303030;
    }
    background-color: #f0f0f0;
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

  @media (prefers-color-scheme: dark) {
    color: #dfdfdf;
  }
}
</style>
