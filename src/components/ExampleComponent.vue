<template>
  <div style='width: 300px'>
    <p>"A beautiful select"</p>
    <q-select :options='["a","b","c"]' v-model='selectValue' label='click to break CSP'></q-select>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';

export default defineComponent({
  name: 'ExampleComponent',
  data: () => ({
    selectValue: 'a'
  })
});
</script>
