<template>
    <Card style="width:320px; margin-left: 5px; cursor: pointer;">
        <div style="text-align:center">
            <div class="number">
                <h1>{{ number }}</h1>
            </div>
            <h3>{{ title }}</h3>
        </div>
    </Card>
</template>
<script>

export default {
    name: "StatsCard",
    data() {
        return {}
    },
    props: {
        number: {
            type: Number,
            require: true,
            default: 0,
        },
        title: {
            type: String,
            require: true,
            default: "--"
        }
    }
}
</script>

<style scoped>
.number {
    height: 120px;
    line-height: 120px;
    font-size: 36px;
    font-weight: 100;
    color: #f4d057;
}
</style>