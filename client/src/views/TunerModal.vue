<template>
  <ion-modal>
    <ion-page>
      <Head>Tuner</Head>
      <ion-header translucent>
        <ion-toolbar>
          <ion-buttons slot="start">
            <ion-back-button
              text=""
              default-href="/"
            />
          </ion-buttons>
          <ion-title>Tuner</ion-title>
        </ion-toolbar>
      </ion-header>

      <ion-content class="flex place-content-center">
        <tuner />
      </ion-content>
    </ion-page>
  </ion-modal>
</template>

<script setup>
import Tuner from '@/components/Tuner.vue'
</script>
