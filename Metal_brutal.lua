
-- =================================
-- METAL BRUTAL
-- Primeiro prototipo
-- =================================

local x = 100
local y = 300
local velocidade = 3
local altura = 36
local balas = {}
local velocidadeBala = 7
local atirando = false

while true do
    local pad = Pads.get()

    if Pads.check(pad, PAD_LEFT) then
        x = x - velocidade
    end

    if Pads.check(pad, PAD_RIGHT) then
        x = x + velocidade
    end

  -- Disparar uma bala
if Pads.check(pad, PAD_CROSS) and not atirando then
    table.insert(balas, {
        x = x + 20,
        y = yAtual + 10
    })
    atirando = true
end

if not Pads.check(pad, PAD_CROSS) then
    atirando = false
  end
  
  local alturaAtual = altura
  local yAtual = y
  
    if Pads.check(pad, PAD_DOWN) then
    alturaAtual = 18
    yAtual = y + 18
  end
  
    -- Limites da tela
    if x < 0 then
        x = 0
    end

    if x > 600 then
        x = 600
    end

-- Atualizar as balas
for i = #balas, 1, -1 do
    balas[i].x = balas[i].x + velocidadeBala

    if balas[i].x > 640 then
        table.remove(balas, i)
    end
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
        x, yAtual, 20,  alturaAtual,
        Color.new(30, 70, 180)
    )

-- Desenhar as balas
for i = 1, #balas do
    Graphics.drawRect(
        balas[i].x,
        balas[i].y,
        12, 4,
        Color.new(255, 255, 0)
    )
  end

    Screen.flip()
    Screen.waitVblankStart()
end
