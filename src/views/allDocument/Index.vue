<template>
    <div class="content">
        <doc-table ref="docTable" type="ALL" cateId="" @removeDoc="removeDoc" @on-page-change="queryTable"></doc-table>
    </div>

</template>

<script>
import DocumentRequest from "@/api/document"
import DocTable from "@/views/category/DocTable";

export default {
    data() {
        return {
            columns: [
                {
                    title: '名称',
                    // width: 260,
                    slot: 'name',
                    // key: "title"
                },
                // {
                //     title: '摘要',
                //     key: 'abstract'
                // },
                {
                    title: '大小',
                    width: 120,
                    key: 'size',
                    align: 'center'
                },
                {
                    title: '分类',
                    width: 240,
                    key: 'categoryVO',
                    align: 'center',
                    // slot: 'category'
                    render: (h, params) => {
                        return h('div', [
                            h('Icon', {
                                props: {
                                    type: 'person'
                                }
                            }),
                            h('strong', params.row.categoryVO.name)
                        ]);
                    }
                },
                {
                    title: '创建人',
                    width: 120,
                    key: 'userName',
                    align: 'center'
                },
                {
                    title: '创建时间',
                    width: 220,
                    key: 'createTime',
                    align: 'center'
                },
                {
                    title: 'Action',
                    slot: 'action',
                    width: 150,
                    align: 'center'
                }
            ],
            data: [
                {
                    name: 'John Brown',
                    size: "120MB",
                    category: "罗佳瑞的电子书",
                    createUser: "罗佳瑞",
                    createTime: "2022年1月12日 12：00：23"
                },
                {
                    name: 'Jim Green',
                    size: "120MB",
                    category: "罗佳瑞的电子书",
                    createUser: "罗佳瑞",
                    createTime: "2022年1月12日 12：00：23"
                },
                {
                    name: 'Joe Black',
                    size: "120MB",
                    category: "罗佳瑞的电子书",
                    createUser: "罗佳瑞",
                    createTime: "2022年1月12日 12：00：23"
                },
                {
                    name: 'Jon Snow这个世界是怎么了啊啊啊啊.mp4',
                    size: "120MB",
                    category: "罗佳瑞的电子书",
                    createUser: "罗佳瑞",
                    createTime: "2022年1月12日 12：00：23"
                }
            ]
        }
    },
    components: {
        DocTable
    },
    props: {
        type: {type: String, requires: true},
        keyword: {type: String, requires: false}
    },
    mounted() {

    },
    computed: {
        filterColumns() {
            //根据自己的要求去显示和隐藏某一列  我这里想要隐藏操作列
            if (this.type !== "ALL") {
                return this.columns.filter(col => col.key !== 'categoryVO');
            }
        }
    },
    methods: {
        /**
         * 发起删除该篇文档的请求
         * @param docItem
         */
        removeDoc(docItem) {
            if (docItem === null || docItem.id == null) {
                return
            }
            let params = {
                id: docItem.id
            }
            DocumentRequest.deleteData(params).then(response => {
                // 删除以后再发起请求
                this.queryTable()
            })
        },
        queryTable() {
            this.$refs.docTable.getListData();
        }
    }
}
</script>

<style scoped>
.content {
    width: calc(100% - 16px);
    height: calc(100% - 16px);
    background-color: #ffffff;
    margin: 8px;
    box-sizing: border-box;
    border-radius: 4px;
    padding: 16px;
    text-align: left;
}
</style>