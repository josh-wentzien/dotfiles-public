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

-- Helper to get the base name without suffixes
local function get_base_name()
  local current = vim.fn.expand("%:p")
  local rel = vim.fn.fnamemodify(current, ":.:r") -- relative path no extension

  -- strip build/debug/
  rel = rel:gsub("^build/debug/", "")
  -- strip .h.gen
  rel = rel:gsub("%.h%.gen$", "")
  -- strip _test
  rel = rel:gsub("_test$", "")

  return rel
end

-- Open a specific variant based on base name
local function open_variant(variant, ext)
  local base = get_base_name()

  if variant == "c" then
    vim.cmd("edit " .. base .. ".c")
  elseif variant == "h" then
    vim.cmd("edit " .. base .. ".h")
  elseif variant == "test" then
    vim.cmd("edit " .. base .. "_test.c")
  elseif variant == "genc" then
    vim.cmd("edit build/debug/" .. base .. ".h.gen.c")
  elseif variant == "genh" then
    vim.cmd("edit build/debug/" .. base .. ".h.gen.h")
  end
end

-- Keymaps for all variants
vim.keymap.set("n", "<leader>oc", function() open_variant("c") end, { desc = "Open .c file" })
vim.keymap.set("n", "<leader>oh", function() open_variant("h") end, { desc = "Open .h file" })
vim.keymap.set("n", "<leader>ot", function() open_variant("test") end, { desc = "Open _test.c file" })
vim.keymap.set("n", "<leader>ogc", function() open_variant("genc") end, { desc = "Open .h.gen.c file" })
vim.keymap.set("n", "<leader>ogh", function() open_variant("genh") end, { desc = "Open .h.gen.h file" })


-- -- Open .h, .c files
-- -- Helper to swap extensions or suffix
-- local function open_variant(suffix, ext)
--   local file_root = vim.fn.expand("%:p:r") -- full path without extension
--   local base = file_root:gsub("_test$", "") -- remove _test if present
-- 
--   local target
--   if suffix == "_test" then
--     target = base .. "_test." .. ext
--   else
--     target = base .. "." .. ext
--   end
-- 
--   vim.cmd("edit " .. target)
-- end
-- 
-- -- Open .c
-- vim.keymap.set("n", "<leader>oc", function()
--   open_variant("", "c")
-- end, { desc = "Open corresponding .c file" })
-- 
-- -- Open .h
-- vim.keymap.set("n", "<leader>oh", function()
--   open_variant("", "h")
-- end, { desc = "Open corresponding .h file" })
-- 
-- -- Open _test.c
-- vim.keymap.set("n", "<leader>ot", function()
--   open_variant("_test", "c")
-- end, { desc = "Open corresponding _test.c file" })
-- 
