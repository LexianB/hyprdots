local map = vim.keymap.set

-- Вставка из буфера прямо в командной строке
map("c", "<C-v>", "<C-r>+")

map("n", "<leader>x", "<C-W>c", { desc = "Delete Window", remap = true })

map("v", "<Tab>", ">gv", { noremap = true, silent = true })
map("v", "<S-Tab>", "<gv", { noremap = true, silent = true })

vim.cmd([[
augroup FileTypeBash
  autocmd!
  autocmd FileType bash setlocal shiftwidth=8 tabstop=3 expandtab
augroup END
]])

-- Переход в режим вставки на клавишу "ш"
map("n", "ш", "i", { noremap = true, silent = true })
map("v", "ш", "i", { noremap = true, silent = true })
map("c", "ш", "<C-c>i", { noremap = true, silent = true })
--map("t", "ш", "<C-\\><C-n>i", { noremap = true, silent = true })

-- Копирование в режимах Normal и Visual
map("v", "<C-c>", '"+y', { noremap = true, silent = true })
map("n", "<C-с>", '"+y', { noremap = true, silent = true })
map("v", "<C-с>", '"+y', { noremap = true, silent = true })
map("n", "<C-с>", '"+y', { noremap = true, silent = true })

-- Вставка в режимах Normal и Insert
map("n", "<C-v>", '"+p', { noremap = true, silent = true })
map("n", "<C-м>", '"+p', { noremap = true, silent = true })
map("i", "<C-v>", '<Esc>"+p', { noremap = true, silent = true })
map("i", "<C-м>", '<Esc>"+p', { noremap = true, silent = true })
map("v", "<C-v>", '"_d"+P', { noremap = true, silent = true })
map("v", "<C-м>", '"_d"+P', { noremap = true, silent = true })
map("t", "<C-v>", '<C-\\><C-n>"+p', { noremap = true, silent = true })
map("t", "<C-м>", '<C-\\><C-n>"+p', { noremap = true, silent = true })

-- Для нормального режима (вырезать строку)
map("n", "<C-x>", "dd", { noremap = true, silent = true })
map("n", "<C-я>", "dd", { noremap = true, silent = true })
map("v", "<C-x>", "d", { noremap = true, silent = true })
map("v", "<C-я>", "d", { noremap = true, silent = true })

-- Удаление без добавления в буфер для Backspace в визуальном режиме
map("x", "<BS>", '"_d', { noremap = true, silent = true }) -- удаление с помощью Backspace
map("v", "<Del>", '"_d', { noremap = true, silent = true }) -- удаление с помощью Delete

-- Настройка отмены и возврата изменений
map("n", "<C-z>", "u", { noremap = true, silent = true }) -- Отмена изменений
map("n", "<C-я>", "u", { noremap = true, silent = true })
map("i", "<C-z>", "<Esc>ua", { noremap = true, silent = true }) -- Прерывание вставки, отмена, возврат к вставке
map("i", "<C-я>", "<Esc>ua", { noremap = true, silent = true })

-- Сохранение файла из режима вставки
map("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true, silent = true })
map("i", "<C-ы>", "<Esc>:w<CR>a", { noremap = true, silent = true })
map("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
map("n", "<C-ы>", ":w<CR>", { noremap = true, silent = true })

-- Выделение всего файла
map("n", "<C-a>", "ggVG", { noremap = true, silent = true })
map("i", "<C-a>", "<Esc>ggVG", { noremap = true, silent = true })
map("n", "<C-ф>", "ggVG", { noremap = true, silent = true })
map("i", "<C-ф>", "<Esc>ggVG", { noremap = true, silent = true })

map("n", "<F5>", ":lua require'dapui'.toggle()<CR>", { noremap = true, silent = true })
map("n", "<F2>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("i", "<F2>", "<Esc><cmd>NvimTreeToggle<CR>", { silent = true, noremap = true })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

map("n", "<C-`>", function()
  Snacks.terminal.toggle(nil, { win = { position = "float" } })
end)
map("i", "<C-`>", function()
  Snacks.terminal.toggle(nil, { win = { position = "float" } })
end)
map("t", "<C-`>", "<cmd>close<cr>", { desc = "Hide Terminal" })

map("n", "<F3>", function()
  Snacks.terminal.open({ "zsh" }, { win = { position = "bottom" }, interactive = false })
end)
map("i", "<F3>", function()
  Snacks.terminal.open({ "zsh" }, { win = { position = "bottom" }, interactive = false })
end)

-- local api = require("nvim-tree.api")
-- map("n", "<C-c>", api.tree.change_root_to_node)
-- map("n", "<BS>", api.tree.change_root_to_parent)

map("n", "<F1>", "<Nop>", { noremap = true, silent = true })
map("i", "<F1>", "<Nop>", { noremap = true, silent = true })

--Zen mode
map("n", "<F4>", function()
  Snacks.zen.zen()
end)
map("i", "<F4>", function()
  Snacks.zen.zen()
end)

--Explorer
map("n", "<F2>", function()
  Snacks.explorer()
end)
map("i", "<F2>", function()
  Snacks.explorer()
end)
