import { defineStore } from 'pinia';
import { NuiProxy } from '../services/NuiProxy';

export const useSettingsStore = defineStore('settings', {
    state: () => {
        return { display: false, type : null };
    },

    actions: {
        close() {
            NuiProxy.call('close');
        },
    },
});
