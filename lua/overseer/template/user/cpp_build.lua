-- Demo file for building C++ files using g++
return {
    name = "g++ build",
    builder = function()
        -- Full path to current file (see :help expand())
        -- if windows use cl.exe instead of g++

        local file = vim.fn.expand("%:p")
        if vim.fn.has("win32") == 1 then
            return {
                cmd = { "cl.exe" },
                args = { file },
                components = { { "on_output_quickfix", open = true }, "default" },
            }
        else
            return {
                cmd = { "g++" },
                args = { file },
                components = { { "on_output_quickfix", open = true }, "default" },
            }
        end
    end,
    condition = {
        filetype = { "cpp" },
    },
}
