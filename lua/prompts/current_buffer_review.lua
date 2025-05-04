return {
    strategy    = "chat",
    description = "Review the entire current buffer, point out issues, and suggest improvements",
    opts        = {
        mapping                = "<LocalLeader>cr",
        modes                  = { "n" },
        short_name             = "cr",
        auto_submit            = true,
        stop_context_insertion = true,
        user_prompt            = false,
    },
    prompts     = {
        {
            role    = "system",
            content = function(context)
                return string.format(
                    "You are a senior software architect and expert code reviewer. Review the current %s buffer thoroughly, identify any potential bugs or anti-patterns, and suggest improvements and best practices.",
                    context.filetype
                )
            end,
        },
        {
            role    = "user",
            content = function(context)
                local lines = vim.api.nvim_buf_get_lines(context.bufnr, 0, -1, false)
                local text = table.concat(lines, "\n")
                return "Here is the full content of the buffer:\n\n```"
                    .. context.filetype
                    .. "\n"
                    .. text
                    .. "\n```"
            end,
            opts    = { contains_code = true },
        },
    },
}
