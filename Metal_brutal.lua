
-- =================================
-- METAL BRUTAL
-- Primeiro prototipo
-- =================================

local x = 100
local y = 300
local velocidade = 3

while true do
    local pad = Pads.get()

    if Pads.check(pad, PAD_LEFT) then
        x = x - velocidade
    end

    if Pads.check(pad, PAD_RIGHT) then
        x = x + velocidade
    end

    -- Limites da tela
    if x < 0 then
        x = 0
    end

    if x > 600 then
        x = 600
    end

    Screen.clear()

  Font.fmPrint(20, 20, 0.7, "METAL BRUTAL", Color.new(255, 255, 255))
   
  -- Ceu
    Graphics.drawRect(
        0, 0, 640, 448,
        Color.new(70, 130, 190)
    )

    -- Chao
    Graphics.drawRect(
        0, 370, 640, 78,
        Color.new(60, 100, 40)
    )

    -- Soldado provisório
    Graphics.drawRect(
        x, y, 20, 36,
        Color.new(30, 70, 180)
    )

    Screen.flip()
    Screen.waitVblankStart()
end
