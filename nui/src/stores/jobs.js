import { defineStore } from "pinia";
import { NuiProxy } from "../services/NuiProxy";

export const useJobsStore = defineStore("jobs", {
  state: () => {
    return { jobsData: {} };
  },

  actions: {
    async fetchAllJobs() {
      NuiProxy.call('dx-jobcenter:callback:getJobs', {
        jobsData : this.jobsData
      })
    }
  },
});
