-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

valor1 = "0"
valor2 = "0"
operacao = ""
operador = false
resultado = false
pontodecimal = false
pontodecimal_valor1 = false

local function calculadora(botao)
    texto = campoResultado.text
	rotulo = labelParcial.text
	if(texto == "0") then
		texto = ""
	end
	
	if(botao == "+" or botao == "-" or botao == "*" or botao == "/") then
		if( (not operador) or resultado ) then
			valor1 = texto
			if(string.sub(valor1, -1) == ",") then
				valor1 = valor1 .. "0"
			end
			rotulo = valor1 .. botao
			texto = "0"
			operador = true
			operacao = botao
			resultado = false
			pontodecimal_valor1 = pontodecimal
			pontodecimal = false
		end
	elseif(botao == "C") then
		texto = "0"
		rotulo = texto
		operador = false
		resultado = false
		pontodecimal = false
		pontodecimal_valor1 = false
	elseif(botao == "=") then
		if(operador) then
			valor2 = texto
			if(string.sub(valor2, -1) == ",") then
				valor2 = valor2 .. "0"
			end
			if(operacao == "+") then
				rotulo = rotulo .. valor2
				valor1 = string.gsub(valor1, ",", ".")
				valor2 = string.gsub(valor2, ",", ".")
				texto = tostring(tonumber(valor1) + tonumber(valor2))
				resultado = true
				texto = string.gsub(texto, "%.", ",")
			elseif(operacao == "-") then
				rotulo = rotulo .. valor2
				valor1 = string.gsub(valor1, ",", ".")
				valor2 = string.gsub(valor2, ",", ".")
				texto = tostring(tonumber(valor1) - tonumber(valor2))
				resultado = true
				texto = string.gsub(texto, "%.", ",")
			elseif(operacao == "*") then
				rotulo = rotulo .. valor2
				valor1 = string.gsub(valor1, ",", ".")
				valor2 = string.gsub(valor2, ",", ".")
				texto = tostring(tonumber(valor1) * tonumber(valor2))
				resultado = true
				texto = string.gsub(texto, "%.", ",")
			elseif(texto ~= "") then
				rotulo = rotulo .. valor2
				valor1 = string.gsub(valor1, ",", ".")
				valor2 = string.gsub(valor2, ",", ".")
				texto = tostring(tonumber(valor1) / tonumber(valor2))
				resultado = true
				texto = string.gsub(texto, "%.", ",")
			end
		end
	elseif(botao == "D") then
		if(not resultado) then
			if(texto ~= "") then
				tamanho = #texto
				texto = string.sub(texto, 1, tamanho - 1)
				posicao = string.find(texto, ",")
				if(posicao == nil) then
					pontodecimal = false
					if(not operador) then
						pontodecimal_valor1 = pontodecimal
					end
				end
				if(not operador) then
					rotulo = texto
				end
			elseif(operador) then
				operador = false
				operacao = ""
				texto = valor1
				rotulo = texto
				pontodecimal = pontodecimal_valor1
			end
		end
	elseif(botao == ",") then
		if(not pontodecimal) then
			if(texto == "") then
				texto = "0"
			end
			texto = texto .. botao
			rotulo = texto
			pontodecimal = true
			if(not operador) then
				pontodecimal_valor1 = pontodecimal
			end
		end
	else 
		if(not resultado) then
			texto = texto .. botao
			if(texto ~= "0") then
				rotulo = texto
			end
		end
	end

	if(texto == "") then
		texto = "0"
		pontodecimal = false
		if(not operador) then
			pontodecimal_valor1 = false
			rotulo = texto
		end
	end
	
	campoResultado.text = texto
	if( (not operador) or (operador and texto == "0") or resultado) then
		labelParcial.text = rotulo
	end
end

local function handleButtonEvent0( event )
 
    if ( "ended" == event.phase ) then
        calculadora("0")
    end
end

local function handleButtonEvent1( event )
 
    if ( "ended" == event.phase ) then
        calculadora("1")
    end
end

local function handleButtonEvent2( event )
 
    if ( "ended" == event.phase ) then
        calculadora("2")
    end
end

local function handleButtonEvent3( event )
 
    if ( "ended" == event.phase ) then
        calculadora("3")
    end
end

local function handleButtonEvent4( event )
 
    if ( "ended" == event.phase ) then
        calculadora("4")
    end
end

local function handleButtonEvent5( event )
 
    if ( "ended" == event.phase ) then
        calculadora("5")
    end
end

local function handleButtonEvent6( event )
 
    if ( "ended" == event.phase ) then
        calculadora("6")
    end
end

local function handleButtonEvent7( event )
 
    if ( "ended" == event.phase ) then
        calculadora("7")
    end
end

local function handleButtonEvent8( event )
 
    if ( "ended" == event.phase ) then
        calculadora("8")
    end
end

local function handleButtonEvent9( event )
 
    if ( "ended" == event.phase ) then
        calculadora("9")
    end
end

local function handleButtonEventSoma( event )
 
    if ( "ended" == event.phase ) then
        calculadora("+")
    end
end

local function handleButtonEventSubtracao( event )
 
    if ( "ended" == event.phase ) then
        calculadora("-")
    end
end

local function handleButtonEventMultiplicacao( event )
 
    if ( "ended" == event.phase ) then
        calculadora("*")
    end
end

local function handleButtonEventDivisao( event )
 
    if ( "ended" == event.phase ) then
        calculadora("/")
    end
end

local function handleButtonEventLimpar( event )
 
    if ( "ended" == event.phase ) then
        calculadora("C")
    end
end

local function handleButtonEventApagar( event )
 
    if ( "ended" == event.phase ) then
        calculadora("D")
    end
end

local function handleButtonEventIgual( event )
 
    if ( "ended" == event.phase ) then
        calculadora("=")
    end
end

local function handleButtonEventPontoDecimal( event )
 
    if ( "ended" == event.phase ) then
        calculadora(",")
    end
end

widget = require("widget")

VERMELHO = {1, 0, 0, 1}
AZUL = {0, 0, 1, 1}
VERDE = {0, 1, 0, 1}
BRANCO = {1, 1, 1, 1}
PRETO = {0, 0, 0, 1}

maxX = display.actualContentWidth
maxY = display.actualContentHeight

retanguloTela = display.newRect(0, 0, maxX*2, maxY*2)
retanguloTela:setFillColor(unpack(PRETO, 1, 3))

laguraTexto = maxX
alturaTexto = 60

campoResultado = native.newTextBox(maxX/2, 0, laguraTexto, alturaTexto)
labelParcial = native.newTextBox(maxX/2, alturaTexto, laguraTexto, alturaTexto)

campoResultado.text = "0"
campoResultado.align = "right"
campoResultado.isEditable  = false
campoResultado.size  = 40

labelParcial.isEditable  = false
labelParcial.size  = 20
labelParcial.text = "0"

larguraBotao = maxX/4
alturaBotao = 40

coluna1Botao = maxX/8
coluna2Botao = coluna1Botao + larguraBotao
coluna3Botao = coluna2Botao + larguraBotao
coluna4Botao = coluna3Botao + larguraBotao
colunaCentral = coluna2Botao + larguraBotao/2
larguraBotaoCentral = maxX

linha1Botao = alturaTexto * 2
linha2Botao = linha1Botao + alturaBotao
linha3Botao = linha2Botao + alturaBotao
linha4Botao = linha3Botao + alturaBotao
linha5Botao = linha4Botao + alturaBotao
linha6Botao = linha5Botao + alturaBotao

botao1 = widget.newButton(
   {
		label = "1",
		x = coluna1Botao,
		y = linha1Botao,
		onEvent = handleButtonEvent1,
		shape = "roundedRect",
		width = larguraBotao,
		height = alturaBotao,
		cornerRadius = 2,
		fillColor = { default={unpack(VERMELHO)}, over={unpack(PRETO)} },
		strokeColor = { default={unpack(AZUL)}, over={unpack(VERDE)} },
		strokeWidth = 4
	})
	
botao2 = widget.newButton(
   {
		label = "2",
		x = coluna2Botao,
		y = linha1Botao,
		onEvent = handleButtonEvent2,
		shape = "roundedRect",
		width = larguraBotao,
		height = alturaBotao,
		cornerRadius = 2,
		fillColor = { default={unpack(VERMELHO)}, over={unpack(PRETO)} },
		strokeColor = { default={unpack(AZUL)}, over={unpack(VERDE)} },
		strokeWidth = 4
	})
	
botao3 = widget.newButton(
   {
		label = "3",
		x = coluna3Botao,
		y = linha1Botao,
		onEvent = handleButtonEvent3,
		shape = "roundedRect",
		width = larguraBotao,
		height = alturaBotao,
		cornerRadius = 2,
		fillColor = { default={unpack(VERMELHO)}, over={unpack(PRETO)} },
		strokeColor = { default={unpack(AZUL)}, over={unpack(VERDE)} },
		strokeWidth = 4
	})
	
botaoSoma = widget.newButton(
   {
		label = "+",
		x = coluna4Botao,
		y = linha1Botao,
		onEvent = handleButtonEventSoma,
		shape = "roundedRect",
		width = larguraBotao,
		height = alturaBotao,
		cornerRadius = 2,
		fillColor = { default={unpack(VERMELHO)}, over={unpack(PRETO)} },
		strokeColor = { default={unpack(AZUL)}, over={unpack(VERDE)} },
		strokeWidth = 4
	})
	
botao4 = widget.newButton(
   {
		label = "4",
		x = coluna1Botao,
		y = linha2Botao,
		onEvent = handleButtonEvent4,
		shape = "roundedRect",
		width = larguraBotao,
		height = alturaBotao,
		cornerRadius = 2,
		fillColor = { default={unpack(VERMELHO)}, over={unpack(PRETO)} },
		strokeColor = { default={unpack(AZUL)}, over={unpack(VERDE)} },
		strokeWidth = 4
	})
	
botao5 = widget.newButton(
   {
		label = "5",
		x = coluna2Botao,
		y = linha2Botao,
		onEvent = handleButtonEvent5,
		shape = "roundedRect",
		width = larguraBotao,
		height = alturaBotao,
		cornerRadius = 2,
		fillColor = { default={unpack(VERMELHO)}, over={unpack(PRETO)} },
		strokeColor = { default={unpack(AZUL)}, over={unpack(VERDE)} },
		strokeWidth = 4
	})
	
botao6 = widget.newButton(
   {
		label = "6",
		x = coluna3Botao,
		y = linha2Botao,
		onEvent = handleButtonEvent6,
		shape = "roundedRect",
		width = larguraBotao,
		height = alturaBotao,
		cornerRadius = 2,
		fillColor = { default={unpack(VERMELHO)}, over={unpack(PRETO)} },
		strokeColor = { default={unpack(AZUL)}, over={unpack(VERDE)} },
		strokeWidth = 4
	})
	
botaoSubtracao = widget.newButton(
   {
		label = "-",
		x = coluna4Botao,
		y = linha2Botao,
		onEvent = handleButtonEventSubtracao,
		shape = "roundedRect",
		width = larguraBotao,
		height = alturaBotao,
		cornerRadius = 2,
		fillColor = { default={unpack(VERMELHO)}, over={unpack(PRETO)} },
		strokeColor = { default={unpack(AZUL)}, over={unpack(VERDE)} },
		strokeWidth = 4
	})
	
botao7 = widget.newButton(
   {
		label = "7",
		x = coluna1Botao,
		y = linha3Botao,
		onEvent = handleButtonEvent7,
		shape = "roundedRect",
		width = larguraBotao,
		height = alturaBotao,
		cornerRadius = 2,
		fillColor = { default={unpack(VERMELHO)}, over={unpack(PRETO)} },
		strokeColor = { default={unpack(AZUL)}, over={unpack(VERDE)} },
		strokeWidth = 4
	})
	
botao8 = widget.newButton(
   {
		label = "8",
		x = coluna2Botao,
		y = linha3Botao,
		onEvent = handleButtonEvent8,
		shape = "roundedRect",
		width = larguraBotao,
		height = alturaBotao,
		cornerRadius = 2,
		fillColor = { default={unpack(VERMELHO)}, over={unpack(PRETO)} },
		strokeColor = { default={unpack(AZUL)}, over={unpack(VERDE)} },
		strokeWidth = 4
	})
	
botao9 = widget.newButton(
   {
		label = "9",
		x = coluna3Botao,
		y = linha3Botao,
		onEvent = handleButtonEvent9,
		shape = "roundedRect",
		width = larguraBotao,
		height = alturaBotao,
		cornerRadius = 2,
		fillColor = { default={unpack(VERMELHO)}, over={unpack(PRETO)} },
		strokeColor = { default={unpack(AZUL)}, over={unpack(VERDE)} },
		strokeWidth = 4
	})
	
botaoMultiplicacao = widget.newButton(
   {
		label = "*",
		x = coluna4Botao,
		y = linha3Botao,
		onEvent = handleButtonEventMultiplicacao,
		shape = "roundedRect",
		width = larguraBotao,
		height = alturaBotao,
		cornerRadius = 2,
		fillColor = { default={unpack(VERMELHO)}, over={unpack(PRETO)} },
		strokeColor = { default={unpack(AZUL)}, over={unpack(VERDE)} },
		strokeWidth = 4
	})
	
botaoLimpar = widget.newButton(
   {
		label = "C",
		x = coluna1Botao,
		y = linha4Botao,
		onEvent = handleButtonEventLimpar,
		shape = "roundedRect",
		width = larguraBotao,
		height = alturaBotao,
		cornerRadius = 2,
		fillColor = { default={unpack(VERMELHO)}, over={unpack(PRETO)} },
		strokeColor = { default={unpack(AZUL)}, over={unpack(VERDE)} },
		strokeWidth = 4
	})
	
botao0 = widget.newButton(
   {
		label = "0",
		x = coluna2Botao,
		y = linha4Botao,
		onEvent = handleButtonEvent0,
		shape = "roundedRect",
		width = larguraBotao,
		height = alturaBotao,
		cornerRadius = 2,
		fillColor = { default={unpack(VERMELHO)}, over={unpack(PRETO)} },
		strokeColor = { default={unpack(AZUL)}, over={unpack(VERDE)} },
		strokeWidth = 4
	})
	
botaoDel = widget.newButton(
   {
		label = "DEL",
		x = coluna3Botao,
		y = linha4Botao,
		onEvent = handleButtonEventApagar,
		shape = "roundedRect",
		width = larguraBotao,
		height = alturaBotao,
		cornerRadius = 2,
		fillColor = { default={unpack(VERMELHO)}, over={unpack(PRETO)} },
		strokeColor = { default={unpack(AZUL)}, over={unpack(VERDE)} },
		strokeWidth = 4
	})
	
botaoDivisao = widget.newButton(
   {
		label = "/",
		x = coluna4Botao,
		y = linha4Botao,
		onEvent = handleButtonEventDivisao,
		shape = "roundedRect",
		width = larguraBotao,
		height = alturaBotao,
		cornerRadius = 2,
		fillColor = { default={unpack(VERMELHO)}, over={unpack(PRETO)} },
		strokeColor = { default={unpack(AZUL)}, over={unpack(VERDE)} },
		strokeWidth = 4
	})

	
botaoIgual = widget.newButton(
   {
		label = "=",
		x = colunaCentral,
		y = linha5Botao,
		onEvent = handleButtonEventIgual,
		shape = "roundedRect",
		width = larguraBotaoCentral,
		height = alturaBotao,
		cornerRadius = 2,
		fillColor = { default={unpack(VERMELHO)}, over={unpack(PRETO)} },
		strokeColor = { default={unpack(AZUL)}, over={unpack(VERDE)} },
		strokeWidth = 4
	})
	
botaoPontoDecimal = widget.newButton(
   {
		label = ",",
		x = colunaCentral,
		y = linha6Botao,
		onEvent = handleButtonEventPontoDecimal,
		shape = "roundedRect",
		width = larguraBotaoCentral,
		height = alturaBotao,
		cornerRadius = 2,
		fillColor = { default={unpack(VERMELHO)}, over={unpack(PRETO)} },
		strokeColor = { default={unpack(AZUL)}, over={unpack(VERDE)} },
		strokeWidth = 4
	})

			
			