import Vue from 'vue';
import VueI18n from 'vue-i18n';
import App from './App.vue';
import store from './store';
import en from './locales/en.json';

Vue.config.productionTip = false;

Vue.use(VueI18n);

new Vue({
  store,
  i18n: new VueI18n({
    fallbackLocale: 'en',
    messages: {
      en,
    },
  }),
  render: (h) => h(App),
}).$mount('#app');
