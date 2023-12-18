return {
  "j-hui/fidget.nvim",
  tag = "legacy",
  event = "LspAttach",
  config = function()
    local fidget_status_ok, fidget = pcall(require, "fidget")
    if not fidget_status_ok then
      print("fidget not found!")
    end
    fidget.setup({
      text = {
        spinner = {
          "⣷",
          "⣯",
          "⣟",
          "⡿",
          "⢿",
          "⣻",
          "⣽",
          "⣾",
        },
      },
      timer = {
        spinner_rate = 100,
        fidget_decay = 3000,
        task_decay = 3000,
      },
      window = {
        relative = "editor",
        blend = 0,
        border = "rounded",
      },
      debug = {
        logging = true,
        strict = true,
      },
    })
  end,
}
