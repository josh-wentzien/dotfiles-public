-- Run the `lint/all -a` on a file
vim.api.nvim_create_user_command("RunLint", function()
  vim.system({ "/home/jwentzien/src/lint/all", "-a", vim.fn.expand("%:p") }, { text = true }, function(obj)
    print("lint/all exited with code: " .. obj.code)
    -- Reload file if linter modified it
    vim.schedule(function()
      vim.cmd("checktime")
    end)
  end)
end, {})


vim.keymap.set("n", "<leader>l", ":RunLint<CR>", { desc = "Run lint.py" })

-- Open .h, .c files
-- Helper to swap extensions or suffix
local function open_variant(suffix, ext)
  local file_root = vim.fn.expand("%:p:r") -- full path without extension
  local base = file_root:gsub("_test$", "") -- remove _test if present

  local target
  if suffix == "_test" then
    target = base .. "_test." .. ext
  else
    target = base .. "." .. ext
  end

  vim.cmd("edit " .. target)
end

-- Open .c
vim.keymap.set("n", "<leader>oc", function()
  open_variant("", "c")
end, { desc = "Open corresponding .c file" })

-- Open .h
vim.keymap.set("n", "<leader>oh", function()
  open_variant("", "h")
end, { desc = "Open corresponding .h file" })

-- Open _test.c
vim.keymap.set("n", "<leader>ot", function()
  open_variant("_test", "c")
end, { desc = "Open corresponding _test.c file" })

