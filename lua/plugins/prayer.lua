return {
  "hakimajaman/nvim-muslim-prayer",
  name = "muslim-prayer",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Utility functions
  },
  lazy = false,
  config = function()
    require("muslim-prayer").setup({
      -- Aladhan API Settings
      latitude = "1.1425",
      longitude = "104.0125",
      method = "3",
      shafaq = "general",
      timezonestring = "Asia/Jakarta",
      calendarMethod = "UAQ",
      location = "Default City",
      lang = "id", -- or "en"
      alwaysResync = false,
      notification_style = "box", -- "box" or "notify"
      getScheduleBy = "month",
      notify_before = 10,
    })
  end,
}
