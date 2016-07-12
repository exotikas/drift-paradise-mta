TuningConfig = {}

local tuningConfig = {}
TuningConfig.config = tuningConfig

-- Получение цены и уровня для компонента
function TuningConfig.getComponentConfig(model, name, id)
	if id == 0 then
		return {price = 0, level = 0}
	end
	local conf = tuningConfig[model]
	if not conf then
		conf = tuningConfig.default
	end
	local componentsList = conf.components[name]
	if not componentsList then
		componentsList = {}
	end
	if name == "WheelsR" or name == "WheelsF" then
		componentsList = tuningConfig.Wheels
	end
	if name == "Spoilers" then
		componentsList = {}
		for i, v in ipairs(tuningConfig.Spoilers) do
			table.insert(componentsList, v)
		end
		if conf.components[name] then
			for i, v in ipairs(conf.components[name]) do
				table.insert(componentsList, v)
			end
		end
	end
	return {price = componentsList[id], level = 0}
end

function TuningConfig.getComponentsCount(model, name)
	local conf = tuningConfig[model]
	if not conf then
		conf = tuningConfig.default
	end
	local componentsList = conf.components[name]
	if not componentsList then
		componentsList = {}
	end
	if name == "WheelsR" or name == "WheelsF" then
		componentsList = tuningConfig.Wheels
	end
	if name == "Spoilers" then
		componentsList = {}
		for i, v in ipairs(tuningConfig.Spoilers) do
			table.insert(componentsList, v)
		end
		if conf.components[name] then
			for i, v in ipairs(conf.components[name]) do
				table.insert(componentsList, v)
			end
		end
	end	
	return #componentsList
end

-- Цены на колёса
-- 17 стандартных колёс
tuningConfig.Wheels = {
	100,
	200,
	300,
	400,
	500,
	600,
	700,
	800,
	900,
	1000,
	1100,
	1200,
	1300,
	1400,
	1500,
	1600,
	1700
}

-- Цены на спойлеры
-- 20 стандартных спойлеров + спойлеры, уникальные для некоторых авто 
tuningConfig.Spoilers = {
	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20
}

-- Настройки по умолчанию
-- используются, если для автомобиля не прописаны настройки
tuningConfig.default = {
	-- Стоковые компоненты всегда бесплатные
	components = {
		FrontBump 	= {},
		RearBump 	= {},
		SideSkirts 	= {},
		FrontLights = {},
		RearLights  = {},
		Bonnets 	= {},
		RearFends 	= {},
		FrontFends 	= {},
		-- Указываются цены только на уникальные для машины спойлеры
		-- цены на общие для всех машин спойлеры указываются выше 
		Spoilers = {},
	}
}

----------------------------------- Настройки для отдельных машин -------------------------------------

-- 240sx
tuningConfig[602] = {
	components = {
		FrontBump 	= {100, 100, 100},
		RearBump 	= {100, 100, 100},
		SideSkirts 	= {100, 100, 100},
		Spoilers 	= {100, 100, 100, 100},
		FrontFends 	= {100, 100},
		RearFends 	= {100, 100},
		Bonnets		= {100},
		RearLights 	= {100, 100, 100},
		Exhaust 	= {100, 100, 100},
	}
}

-- Miata
tuningConfig[411] = {
	components = {
		FrontBump 	= {100, 100, 100},
		RearBump 	= {100, 100, 100, 100},
		SideSkirts 	= {100, 100, 100},
		Spoilers 	= {100, 100, 100},
		FrontFends 	= {100},
		RearFends 	= {100},
		Bonnets		= {100},
		RearLights 	= {100, 100},
		Exhaust 	= {100},
	}
}

-- AE86
tuningConfig[589] = {
	components = {
		FrontBump 	= {100, 100, 100},
		RearBump 	= {100, 100, 100, 100},
		SideSkirts 	= {100, 100, 100, 100},
		FrontFends 	= {100, 100},
		RearFends 	= {100},
		Bonnets		= {100, 100, 100, 100},
		Exhaust 	= {100, 100},
	}
}

-- GTR
tuningConfig[558] = {
	components = {
		FrontBump 	= {100, 100, 100},
		RearBump 	= {100, 100, 100},
		SideSkirts 	= {100, 100, 100},
		Spoilers 	= {100, 100, 100, 100},
		FrontFends 	= {100, 100},
		RearFends 	= {100, 100},
		Bonnets		= {100},
		RearLights 	= {100},
		Exhaust 	= {100, 100},
	}
}