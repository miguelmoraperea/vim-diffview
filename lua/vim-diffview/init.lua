local M = {}

M.diff_commit = nil
M.diff_qflist_bufnr = nil
M.qf_win = nil
M.qf_height = nil
M.qf_width = nil

M.diff = function(commitHash)
    diff_commit = commitHash
    vim.g.gitgutter_diff_base = commitHash
    local cmd = "Git difftool --name-only " .. commitHash
    vim.cmd(cmd)
    save_qf_bufnr()
    save_qf_win_size()
    generate_diff_view()
end

M.diffNext = function()
    close_all_buf_except_qf()
    vim.cmd([[cn]])
    resize_qf_win()
    generate_diff_view()
end

M.diffPrev = function()
    close_all_buf_except_qf()
    vim.cmd([[cp]])
    resize_qf_win()
    generate_diff_view()
end

function save_qf_bufnr()
    bufInfo = vim.fn.getbufinfo()
    for index, data in ipairs(bufInfo) do
        if data.name == "" then
            diff_qflist_bufnr = data.bufnr
        end
    end
end

function save_qf_win_size()
    for index, data in ipairs(bufInfo) do
        if data.name == "" then
            for index, win in ipairs(data.windows) do
                qf_win = win
                qf_height = vim.api.nvim_win_get_height(win)
                qf_width = vim.api.nvim_win_get_height(win)
            end
        end
    end
end

function resize_qf_win()
    vim.api.nvim_win_set_height(qf_win, qf_height)
    vim.api.nvim_win_set_height(qf_win, qf_width)
end

function close_all_buf_except_qf()
    bufInfo = vim.fn.getbufinfo()
    for index, data in ipairs(bufInfo) do
        if not (data.bufnr == diff_qflist_bufnr) then
            if data.hidden == 0 then
                for index, win in ipairs(data.windows) do
                    vim.api.nvim_win_close(win, {force = true})
                end
            end
        end
    end
end

function generate_diff_view()
    vim.cmd(string.format("Gdiffsplit! %s", diff_commit))
end

return M
