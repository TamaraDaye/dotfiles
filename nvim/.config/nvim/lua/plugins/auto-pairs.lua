local autopairs = require("nvim-autopairs") -- import nvim-autopairs
autopairs.setup({
    check_ts = true,
    ts_config = {
        lua = { "string" } ,
        java = false,
    },
})
