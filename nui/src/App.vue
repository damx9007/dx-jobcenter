<template>
    <div class="w-screen h-screen flex items-center justify-center" v-show="settings.display">
        <div class="w-[80vw] h-[75vh] bg-slate-800 text-slate-100  overflow-auto">
            <div class="flex min-h-5 items-center justify-center mb-3 py-5 border-b-[3px] border-b-slate-500 bg-slate-900">
                <h2 class="text-3xl font-thin text-slate-400">Munkaügyi központ</h2>
            </div>
            <div class="grid grid-cols-4 gap-4 py-5 px-2">
                <div v-for="job in jobs" :key="job.id">
                    <div class="w-full min-h-[250px] py-3 bg-slate-900 shadow-lg rounded-md border border-slate-500">
                        <h3 class="text-3xl font-thin text-center">
                            {{ job.label }}
                        </h3>
                        <div class="flex flex-col justify-center items-center">
                            <Icon :icon="'mdi-'+job.name" :width="50"></Icon>
                            <!-- <img src="https://cfx-nui-ox_inventory/web/images/WEAPON_PISTOL.png" alt=""> -->
                            <div :class="jobs.description ? '' : 'text-slate-500 pointer-events-none'">
                                Részletek
                            </div>
                            <button class="border rounded-md bg-slate-600 hover:bg-slate-700 py-4 px-2" @click="setjob(job.name)">Munkát felveszem</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import axios from 'axios';
import { onMounted, ref } from 'vue';
import { subscribeToNuiEvents, registerCloseHandler } from './services/NuiProxy';
import { useSettingsStore } from './stores/settings';
import { Icon } from '@iconify/vue'

const settings = useSettingsStore()

const jobs = ref(null)

async function getAllJobs() {
    const fetchedJobs = await axios.post(`https://${GetParentResourceName()}/GetAllJobs`)
    if (fetchedJobs.status == 200) {
        jobs.value = JSON.parse(fetchedJobs.data)
    }
}

const setjob = (jobname) => {
    if (jobname != undefined || jobname != '') {
        axios.post(`https://${GetParentResourceName()}/SetMeJob`, {
            job : jobname
        })
    }
}

onMounted(() => {
    subscribeToNuiEvents()
    registerCloseHandler()
    getAllJobs()
})

</script>
