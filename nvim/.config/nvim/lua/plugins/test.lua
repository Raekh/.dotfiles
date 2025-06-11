return {
  {
    "klen/nvim-test",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("nvim-test").setup {
        -- The command to run the tests
        run = true, -- run tests (using for debug)
        commands_create = true, -- create commands (TestFile, TestLast, ...)
        filename_modifier = ":.", -- modify filenames before tests run(:h filename-modifiers)
        silent = false, -- less notifications
        term = "terminal", -- a terminal to run ("terminal"|"toggleterm")
        termOpts = {
          direction = "vertical", -- terminal's direction ("horizontal"|"vertical"|"float")
          width = 96, -- terminal's width (for vertical|float)
          height = 24, -- terminal's height (for horizontal|float)
          go_back = false, -- return focus to original window after executing
          stopinsert = "auto", -- exit from insert mode (true|false|"auto")
          keep_one = true, -- keep only one terminal for testing
        },
        runners = {
          typescript = "nvim-test.runners.jest",
          typescriptreact = "nvim-test.runners.jest",
        },
        -- The command arguments to run the tests
      }

      require("nvim-test.runners.jest"):setup {
        command = "docker",
        args = { "compose", "exec", "node", "yarn", "test-api", "--watch" },
        env = { CUSTOM_VAR = "value" }, -- custom environment variables

        file_pattern = "\\v(__tests__/.*|(spec|api|test))\\.(js|jsx|coffee|ts|tsx)$", -- determine whether a file is a testfile
        find_files = { "{name}.test.{ext}", "{name}.spec.{ext}" }, -- find testfile for a file

        filename_modifier = nil, -- modify filename before tests run (:h filename-modifiers)
        working_directory = nil, -- set working directory (cwd by default)
      }
    end,
  },
}
