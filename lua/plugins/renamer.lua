return {
  {
    "filipdutescu/renamer.nvim",
    branch = "master", -- Sicherstellen, dass der korrekte Branch verwendet wird
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("renamer").setup({
        -- Optionale Konfiguration: Anpassen, wenn nötig
        title = "Rename",         -- Titel des Popups
        padding = { 0, 1, 0, 1 }, -- Padding im Popup
        border = true,            -- Rahmen anzeigen
        min_width = 15,           -- Minimale Breite
        max_width = 45,           -- Maximale Breite
        show_refs = true,         -- Zeige Referenzen
        prefix = "",              -- Kein Präfix
      })
    end,
    keys = { -- Keybindings für renamer.nvim
      { "<leader>rn", function() require("renamer").rename() end, desc = "Rename Symbol" },
    },
  },
}
