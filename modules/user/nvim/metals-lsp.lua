-- Set variable so other plugins can register mappings
local wk = require("which-key")

require'lspkind'.init()

-- highlight error: https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
vim.wo.colorcolumn = "99999"
vim.opt.list = true





require("ibl").setup {
  scope = {
    enabled = true;
    char = "│",
    injected_languages = true,
    show_end = true,
  }
}


vim.g.cursorline_timeout = 0


wk.register({
  ["<leader>n"] = {
    name = "Noice",
    d = { "<cmd> NoiceDismiss <CR>", "Dismiss notifications" },
  },
})


require("noice").setup({
  cmdline = {
    enabled = true, -- enables the Noice cmdline UI
    view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
    opts = {}, -- global options for the cmdline. See section on views
    format = {
      cmdline = { pattern = "^:", icon = "", lang = "vim" },
      search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
      filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
      lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
      help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
      input = {}, -- Used by input()
    },
  },
  messages = {
    enabled = false, -- enables the Noice messages UI
    view = "notify", -- default view for messages
    view_error = "notify", -- view for errors
    view_warn = "notify", -- view for warnings
    view_history = "messages", -- view for :messages
    view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
  },
  popupmenu = {
    enabled = true, -- enables the Noice popupmenu UI
    backend = "nui", -- backend to use to show regular cmdline completions
    kind_icons = {}, -- set to `false` to disable icons
  },
  lsp = {
    progress = {
      enabled = true,
      format = "lsp_progress",
      format_done = "lsp_progress_done",
      throttle = 1000 / 30, -- frequency to update lsp progress message
      view = "mini",
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
      ["vim.lsp.util.stylize_markdown"] = false,
      ["cmp.entry.get_documentation"] = false,
    },
    hover = {
      enabled = true,
      silent = false, -- set to true to not show a message if hover is not available
      view = nil, -- when nil, use defaults from documentation
      opts = {}, -- merged with defaults from documentation
    },
    signature = {
      enabled = false,
      auto_open = {
        enabled = true,
        trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
        luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
        throttle = 50, -- Debounce lsp signature help request by 50ms
      },
      view = nil, -- when nil, use defaults from documentation
      opts = {}, -- merged with defaults from documentation
    },
    message = {
      enabled = true,
      view = "notify",
      opts = {},
    },
    documentation = {
      view = "hover",
      opts = {
        lang = "markdown",
        replace = true,
        render = "plain",
        format = { "{message}" },
        win_options = { concealcursor = "n", conceallevel = 3 },
      },
    },
  },
  markdown = {
    hover = {
      ["|(%S-)|"] = vim.cmd.help, -- vim help links
      ["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
    },
    highlights = {
      ["|%S-|"] = "@text.reference",
      ["@%S+"] = "@parameter",
      ["^%s*(Parameters:)"] = "@text.title",
      ["^%s*(Return:)"] = "@text.title",
      ["^%s*(See also:)"] = "@text.title",
      ["{%S-}"] = "@parameter",
    },
  },
})


-- Treesitter Context config
require'treesitter-context'.setup {
  enable = true,
  throttle = true,
  max_lines = 0
}

-- Treesitter config
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

  indent = {
    enable = true,
  },

  textobjects = {
  enable = true,
  swap = {
    enable = true,
    swap_next = {
      ["<leader>la"] = "@parameter.inner",
    },
    swap_previous = {
      ["<leader>lA"] = "@parameter.inner",
    },
  },
  select = {
    enable = true,
    lookahead = true,
    keymaps = {
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
      ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
    },
    selection_modes = {
      ['@parameter.outer'] = 'v', -- charwise
      ['@function.outer'] = 'V',  -- linewise
      ['@class.outer'] = '<c-v>', -- blockwise
    },
    include_surrounding_whitespace = true,
  },
},


  autotag = {
  enable = true,
},

}

require('todo-comments').setup {
  highlight = {
    before = "", -- "fg" or "bg" or empty
    keyword = "bg", -- "fg", "bg", "wide" or empty
    after = "fg", -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)(\([^\)]*\))?:]],
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = {}, -- list of file types to exclude highlighting
  },

  search = {
    command = "/nix/store/63d409ifkiy1sqmcgiig4dh0pxr0r3zn-ripgrep-14.1.0/bin/rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    pattern = [[\b(KEYWORDS)(\([^\)]*\))?:]],
  },
}



-- OneDark theme
require('onedark').setup {
  style = "deep",
  transparent = "1",
}
require('onedark').load()






require("bufferline").setup{
   options = {
      numbers = "both",
      close_command = function(bufnum)
  require("bufdelete").bufdelete(bufnum, false)
end
,
      right_mouse_command = 'vertical sbuffer %d',
      indicator = {
        icon = '▎',
        style = 'icon'
      },
      buffer_close_icon = '',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      separator_style = "thin",
      max_name_length = 18,
      max_prefix_length = 15,
      tab_size = 18,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "left"}},
      sort_by = 'extension',
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = true,
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
         local s = ""
         for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and ""
               or (e == "warning" and "" or "" )
            if(sym ~= "") then
            s = s .. " " .. n .. sym
            end
         end
         return s
      end,
      numbers = function(opts)
        return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
      end,
   }
}

wk.register({
  ["<leader>b"] = {
    name = "Buffers",
  },
})


require'lualine'.setup {
  options = {
    icons_enabled = 1,
    theme = "onedark",
    component_separators = {"⏽","⏽"},
    section_separators = {"",""},
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
  {
    "branch",
    separator = '',
  },
  "diff",
}
,
    lualine_c = {'filename'},
    lualine_x = {
  {
    "diagnostics",
    sources = {'nvim_lsp'},
    separator = '',
    symbols = {error = '', warn = '', info = '', hint = ''},
  },
  {
    "filetype",
  },
  "fileformat",
  "encoding",
}
,
    lualine_y = {'progress'},
    lualine_z = {'location'},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {"nvim-tree"},
}

require('glow').setup({
  glow_path = "/nix/store/ddw0vkb1x8ddwgsp25dp3ngd1xgmw9mw-glow-1.5.1/bin/glow",
  border = "shadow", 
  pager = false,
  width = 120,
})

-- Enable trouble diagnostics viewer
require'nvim-lightbulb'.setup()

-- Enable lsp signature viewer
require("lsp_signature").setup()

-- Enable trouble diagnostics viewer
require("trouble").setup {}

wk.register({
  ["<leader>x"] = {
    name = "Troubles",
  },
})


wk.register({
  ["<leader>a"] = {
    name = "Code actions",
  },
})


local attach_keymaps = function(client, bufnr)
  local opts = { noremap=true, silent=true }

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)

  -- Alternative keybinding for code actions for when code-action-menu does not work as expected.
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lsh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ln', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'F', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', opts)

  -- Metals specific
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lmc', '<cmd>lua require("metals").commands()<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lmi', '<cmd>lua require("metals").toggle_setting("showImplicitArguments")<CR>', opts)

end

vim.g.formatsave = false;

-- Enable formatting
format_callback = function(client, bufnr)
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    buffer = bufnr,
    callback = function()
      if vim.g.formatsave then
          local params = require'vim.lsp.util'.make_formatting_params({})
          client.request('textDocument/formatting', params, nil, bufnr)
      end
    end
  })
end

default_on_attach = function(client, bufnr)
  attach_keymaps(client, bufnr)
  format_callback(client, bufnr)
end

-- Enable lspconfig
local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

-- Display number of folded lines
local ufo_handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = ('  %d '):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
        chunkText = truncate(chunkText, targetWidth - curWidth)
        local hlGroup = chunk[2]
        table.insert(newVirtText, {chunkText, hlGroup})
        chunkWidth = vim.fn.strdisplaywidth(chunkText)
        -- str width returned from truncate() may less than 2nd argument, need padding
        if curWidth + chunkWidth < targetWidth then
          suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
        end
        break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, {suffix, 'MoreMsg'})
  return newVirtText
end

require('ufo').setup({
   fold_virt_text_handler = ufo_handler
})

-- Using ufo provider needs a large value
vim.o.foldlevel = 99 
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith)


capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
;

wk.register({
  ["<leader>l"] = {
    name = "LSP",
  },
})

wk.register({
  ["<leader>m"] = {
    name = "Metals",
    w = { "<cmd>lua require'metals'.worksheet_hover()<CR>", "Worksheet hover" },
    d = { "<cmd>lua require'metals'.open_all_diagnostics()<CR>", "Open all diagnostics" },
  },
})









-- Nix config
lspconfig.nil_ls.setup{
  capabilities = capabilities;
  on_attach = function(client, bufnr)
    attach_keymaps(client, bufnr)
  end,
  settings = {
    ['nil'] = {
      formatting = {
        command = {"/nix/store/wm6bijk3g5hrp4lwsiy1djkimhqm4n3s-nixpkgs-fmt-1.3.0/bin/nixpkgs-fmt"}
      },
      diagnostics = {
        ignored = { "uri_literal" },
        excludedFiles = { }
      }
    }
  };
  cmd = {"/nix/store/kdzvwh8bkznska9jlczsz6aqkjpym5ys-nil-2023-08-09/bin/nil"}
}
















-- Scala nvim-metals config
metals_config = require('metals').bare_config()
metals_config.capabilities = capabilities
metals_config.on_attach = default_on_attach

metals_config.settings = {
   metalsBinaryPath = "/nix/store/7ck1zj874v10dmraly8sndgnvmc4fl79-metals-1.2.0/bin/metals",
   showImplicitArguments = true,
   showImplicitConversionsAndClasses = true,
   showInferredType = true,
   excludedPackages = {
     "akka.actor.typed.javadsl",
     "com.github.swagger.akka.javadsl"
   }
}

metals_config.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      prefix = '',
    }
  }
)

-- without doing this, autocommands that deal with filetypes prohibit messages from being shown
vim.opt_global.shortmess:remove("F")

vim.cmd([[augroup lsp]])
vim.cmd([[autocmd!]])
vim.cmd([[autocmd FileType java,scala,sbt lua require('metals').initialize_or_attach(metals_config)]])
vim.cmd([[augroup end]])


-- Nix formatter






-- Set up which-key
require("which-key").setup {}

-- GitSigns setup
require('gitsigns').setup {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    local function nextHunk()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end

    local function prevHunk()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end

    -- Actions
    wk.register({
  ["<leader>g"] = {
    name = "Gitsigns",
    b = { function() gs.blame_line{full=true} end, "Blame (full)" },
    tb = { gs.toggle_current_line_blame, "Toggle blame" },
    td = { gs.toggle_deleted, "Toggle deleted" },
    d = { gs.diffthis, "Diff current file" },
    D = { function() gs.diffthis('~') end, "Diff file" },
    h = {
      name = "Hunks",
      n = { nextHunk, "Next hunk" },
      p = { prevHunk, "Previous hunk" },
      r = { gs.reset_hunk, "Reset hunk" },
      s = { gs.stage_hunk, "Stage hunk" },
      u = { gs.undo_stage_hunk, "Undo stage hunk" },
    },
    w = {
      name = "Write",
    },
    S = { gs.stage_buffer, "Stage buffer" },
    R = { gs.reset_buffer, "Reset buffer" },
  },
})


    -- Text object
    map({'o', 'x'}, 'ih', '<cmd><C-U>Gitsigns select_hunk<CR>')
  end
}


-- Neogit setup
require('neogit').setup {}

  wk.register({
  ["<leader>gn"] = { "<cmd> Neogit kind=auto<CR>", "Open neogit" },
})




require'nvim-tree'.setup({
  disable_netrw = false,
  hijack_netrw = true,
  open_on_tab = false,
  diagnostics = {
    enable = true,
  },
  view  = {
    width = 25,
    side = 'left',
  },
  renderer = {
    add_trailing = true,
    group_empty = true,
    indent_markers = {
      enable = true,
    },
  },
  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = false
    },
  },
  git = {
    enable = true,
    ignore = false,
  },
  filters = {
    dotfiles = false,
    custom = {
      "node_modules",
".cache",
    },
  },
})

local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })


wk.register({
  ["<leader>t"] = {
    name = "Tree & Todo",
  },
})


require("nvim-autopairs").setup{}



require('zen-mode').setup()



local builtin = require('telescope.builtin')
require("search").setup({
  append_tabs = {
    {
      name = "Scala files",
      tele_func = function()
        builtin.fd({ find_command = { "/nix/store/rym51bxaidl738b2nmxsd1hzr83wkk9a-fd-9.0.0/bin/fd", "-e", "scala" } })
      end,
      available = function()
        local scalaFiles = vim.fn.glob("*.scala", ".") .. vim.fn.glob("*.sbt", ".")
        return not (scalaFiles == "")
      end
    }
  },
})


wk.register({
  ["<leader>f"] = {
    name = "Telescope",
  },
})


require("telescope").setup {
  defaults = {
    vimgrep_arguments = {
      "/nix/store/63d409ifkiy1sqmcgiig4dh0pxr0r3zn-ripgrep-14.1.0/bin/rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    pickers = {
      find_command = {
        "/nix/store/rym51bxaidl738b2nmxsd1hzr83wkk9a-fd-9.0.0/bin/fd",
      },
    },
  },
  extensions = {
    media_files = {
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "/nix/store/rym51bxaidl738b2nmxsd1hzr83wkk9a-fd-9.0.0/bin/fd",
    }
  }
}

require('nvim-surround').setup()

require("notify").setup({
  background_colour = "#000000",
})
vim.notify = require("notify")

require('neoclip').setup({
  history = 200,
  enable_persistent_history = false,
  length_limit = 1048576,
  continuous_sync = false,
  db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
  filter = nil,
  preview = true,
  prompt = nil,
  default_register = '"',
  default_register_macros = 'q',
  enable_macro_history = true,
  content_spec_column = false,
  on_select = {
    move_to_front = false,
    close_telescope = true,
  },
  on_paste = {
    set_reg = false,
    move_to_front = false,
    close_telescope = true,
  },
  on_replay = {
    set_reg = false,
    move_to_front = false,
    close_telescope = true,
  },
  on_custom_action = {
    close_telescope = true,
  },
  keys = {
    telescope = {
      i = {
        select = '<cr>',
        paste = '<c-p>',
        paste_behind = '<c-k>',
        replay = '<c-q>',  -- replay a macro
        delete = '<c-d>',  -- delete an entry
        edit = '<c-e>',  -- edit an entry
        custom = {},
      },
      n = {
        select = '<cr>',
        paste = 'p',
        --- It is possible to map to more than one key.
        -- paste = { 'p', '<c-p>' },
        paste_behind = 'P',
        replay = 'q',
        delete = 'd',
        edit = 'e',
        custom = {},
      },
    },
    fzf = {
      select = 'default',
      paste = 'ctrl-p',
      paste_behind = 'ctrl-k',
      custom = {},
    },
  },
})

require('telescope').load_extension('neoclip')


require('hop').setup()

require('harpoon'):setup()

local themes = require("telescope.themes")
local hm_actions = require("telescope._extensions.harpoon_marks.actions")

vim.keymap.set(
  "n",
  "<leader>hl",
  function()
    require("telescope").extensions.harpoon.marks(themes.get_dropdown({
        previewer = false,
        layout_config = { width = 0.6 },
        path_display = { truncate = 10 },
        attach_mappings = function(_, map)
            map("i", "<c-d>", hm_actions.delete_mark_selections)
            map("n", "<c-d>", hm_actions.delete_mark_selections)
            return true
        end,
    }))
  end,
  { desc = "List" }
)


wk.register({
  ["<leader>h"] = {
    name = "Harpoon",
    a = { "<cmd>lua require('harpoon'):list():add()<CR>", "Add" },
    d = { "<cmd>lua require('harpoon'):list():remove()<CR>", "Del" },
  },
})


local augend = require("dial.augend")
require("dial.config").augends:register_group {
  default = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.constant.alias.bool,
  },
  scala = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.constant.alias.bool,
    augend.constant.new{ elements = {"val", "def"} },
    augend.constant.new{ elements = {"object", "class", "trait", "enum"} },
  },
}

vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), {noremap = true})
vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), {noremap = true})
vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual(), {noremap = true})
vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual(), {noremap = true})
vim.keymap.set("v", "g<C-a>",require("dial.map").inc_gvisual(), {noremap = true})
vim.keymap.set("v", "g<C-x>",require("dial.map").dec_gvisual(), {noremap = true})

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    
    { name = 'vsnip' },
    { name = 'treesitter' },
    { name = 'path' },
    { name = 'buffer' },
  },
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c'}),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c'}),
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
    }),
    ['<Tab>'] = cmp.mapping(function (fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn['vsnip#available'](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function (fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn['vsnip#available'](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { 'i', 's' })
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
})




wk.register({
  ["<leader>c"] = {
    name = "Commenter",
  },
})



