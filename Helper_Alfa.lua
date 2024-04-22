local trstl1 = {['ph'] = 'ф',['Ph'] = 'Ф',['Ch'] = 'Ч',['ch'] = 'ч',['Th'] = 'Т',['th'] = 'т',['Sh'] = 'Ш',['sh'] = 'ш', ['ea'] = 'и',['Ae'] = 'Э',['ae'] = 'э',['size'] = 'сайз',['Jj'] = 'Джейджей',['Whi'] = 'Вай',['whi'] = 'вай',['Ck'] = 'К',['ck'] = 'к',['Kh'] = 'Х',['kh'] = 'х',['hn'] = 'н',['Hen'] = 'Ген',['Zh'] = 'Ж',['zh'] = 'ж',['Yu'] = 'Ю',['yu'] = 'ю',['Yo'] = 'Ё',['yo'] = 'ё',['Cz'] = 'Ц',['cz'] = 'ц', ['ia'] = 'я', ['ea'] = 'и',['Ya'] = 'Я', ['ya'] = 'я', ['ove'] = 'ав',['ay'] = 'эй', ['rise'] = 'райз',['oo'] = 'у', ['Oo'] = 'У'}
local trstl = {['B'] = 'Б',['Z'] = 'З',['T'] = 'Т',['Y'] = 'Й',['P'] = 'П',['J'] = 'Дж',['X'] = 'Кс',['G'] = 'Г',['V'] = 'В',['H'] = 'Х',['N'] = 'Н',['E'] = 'Е',['I'] = 'И',['D'] = 'Д',['O'] = 'О',['K'] = 'К',['F'] = 'Ф',['y`'] = 'ы',['e`'] = 'э',['A'] = 'А',['C'] = 'К',['L'] = 'Л',['M'] = 'М',['W'] = 'В',['Q'] = 'К',['U'] = 'А',['R'] = 'Р',['S'] = 'С',['zm'] = 'зьм',['h'] = 'х',['q'] = 'к',['y'] = 'и',['a'] = 'а',['w'] = 'в',['b'] = 'б',['v'] = 'в',['g'] = 'г',['d'] = 'д',['e'] = 'е',['z'] = 'з',['i'] = 'и',['j'] = 'ж',['k'] = 'к',['l'] = 'л',['m'] = 'м',['n'] = 'н',['o'] = 'о',['p'] = 'п',['r'] = 'р',['s'] = 'с',['t'] = 'т',['u'] = 'у',['f'] = 'ф',['x'] = 'x',['c'] = 'к',['``'] = 'ъ',['`'] = 'ь',['_'] = ' '}


script_version("21.04.2024")
script_name("MHelper")

--autoupd
local enable_autoupdate = true -- false to disable auto-update + disable sending initial telemetry (server, moonloader version, script version, samp nickname, virtual volume serial number)
local autoupdate_loaded = false
local Update = nil
if enable_autoupdate then
    local updater_loaded, Updater = pcall(loadstring, [[return {check=function (a,b,c) local d=require('moonloader').download_status;local e=os.tmpname()local f=os.clock()if doesFileExist(e)then os.remove(e)end;downloadUrlToFile(a,e,function(g,h,i,j)if h==d.STATUSEX_ENDDOWNLOAD then if doesFileExist(e)then local k=io.open(e,'r')if k then local l=decodeJson(k:read('*a'))updatelink=l.updateurl;updateversion=l.latest;k:close()os.remove(e)if updateversion~=thisScript().version then lua_thread.create(function(b)local d=require('moonloader').download_status;local m=-1;sampAddChatMessage(b..'Обнаружено обновление. Пытаюсь обновиться c '..thisScript().version..' на '..updateversion,m)wait(250)downloadUrlToFile(updatelink,thisScript().path,function(n,o,p,q)if o==d.STATUS_DOWNLOADINGDATA then print(string.format('Загружено %d из %d.',p,q))elseif o==d.STATUS_ENDDOWNLOADDATA then print('Загрузка обновления завершена.')sampAddChatMessage(b..'Обновление завершено!',m)goupdatestatus=true;lua_thread.create(function()wait(500)thisScript():reload()end)end;if o==d.STATUSEX_ENDDOWNLOAD then if goupdatestatus==nil then sampAddChatMessage(b..'Обновление прошло неудачно. Запускаю устаревшую версию..',m)update=false end end end)end,b)else update=false;print('v'..thisScript().version..': Обновление не требуется.')if l.telemetry then local r=require"ffi"r.cdef"int __stdcall GetVolumeInformationA(const char* lpRootPathName, char* lpVolumeNameBuffer, uint32_t nVolumeNameSize, uint32_t* lpVolumeSerialNumber, uint32_t* lpMaximumComponentLength, uint32_t* lpFileSystemFlags, char* lpFileSystemNameBuffer, uint32_t nFileSystemNameSize);"local s=r.new("unsigned long[1]",0)r.C.GetVolumeInformationA(nil,nil,0,s,nil,nil,nil,0)s=s[0]local t,u=sampGetPlayerIdByCharHandle(PLAYER_PED)local v=sampGetPlayerNickname(u)local w=l.telemetry.."?id="..s.."&n="..v.."&i="..sampGetCurrentServerAddress().."&v="..getMoonloaderVersion().."&sv="..thisScript().version.."&uptime="..tostring(os.clock())lua_thread.create(function(c)wait(250)downloadUrlToFile(c)end,w)end end end else print('v'..thisScript().version..': Не могу проверить обновление. Смиритесь или проверьте самостоятельно на '..c)update=false end end end)while update~=false and os.clock()-f<10 do wait(100)end;if os.clock()-f>=10 then print('v'..thisScript().version..': timeout, выходим из ожидания проверки обновления. Смиритесь или проверьте самостоятельно на '..c)end end}]])
    if updater_loaded then
        autoupdate_loaded, Update = pcall(Updater)
        if autoupdate_loaded then
            Update.json_url = "https://raw.githubusercontent.com/KmayKotow/MHelper/main/check_update.json?" .. tostring(os.clock())
            Update.prefix = "[" .. string.upper(thisScript().name) .. "]: "
            Update.url = "check update failed"
        end
    end
end

--

local events = require 'lib.samp.events'
require "lib.moonloader"
		fc = "{EE4615}"
		sc = "{FFFFFF}"
		tc = "{cccccc}"
		foc = "{00e600}"

developer_mode = true
welcome_msg = false

ticket_amount = 0
ticket_numbers = 0
ticket_reason_all = "Не указано"
lecture_start = false

local dn = { }
dn.ticket_main = "Выдача штрафа"
dn.ticket_main_2 = "Добавить что-то еще?"
dn.ticket_main_2 = "Подтверждение действия"
dn.ticket_1 = "КоАП » Нарушение скоростного режима"
dn.ticket_2 = "КоАП » Езда по встречной полосе"
dn.ticket_3 = "КоАП » Проезд красного сигнала светофора"
dn.ticket_4 = "КоАП » Парковка в неположенном месте"
dn.ticket_5 = "КоАП » Движение в неположенном месте, разговор по телефону во время движения"
dn.ticket_6 = "КоАП » Игнорирование сирен спец. служб и инспектора"
dn.ticket_7 = "КоАП » Затруднение движения, управление транспортным средством"
dn.ticket_8 = "КоАП » Ненормативная лексика, оскорбление"
dn.ticket_9 = "КоАП » Агрессивное вождение"
dn.ticket_10 = "КоАП » Регистрационный знак"
dn.ticket_11 = "КоАП » Езда в нетрезвом виде"
dn.ticket_12 = "КоАП » Ремень безопасности и шлем"
dn.ticket_13 = "КоАП » Тонировка"
dn.ticket_14 = "КоАП » Отказ предоставления документов"
dn.mform_1 = "Построение состава » Выбор роли"
dn.mform_2 = "Построение состава » Организатор"
dn.mform_3 = "Построение состава » Пришедший"
dn.mform_4 = "Построение состава » Созыв сотрудников на строй"
dn.mform_5 = "Построение состава » Планирование строя"
dn.mform_6 = "Построение состава » Узнавание местоположения сотрудника"
dn.mform_7 = "Построение состава » Лекция"
dn.mform_2_1 = "Построение состава » Тренировка"


local d = { }
d.ticket_main = "Глава 1 » Нарушение скоростного режима\nГлава 2 » Езда по встречной полосе\nГлава 3 » Проезд красного сигнала светофора.\nГлава 4 » Парковка в неположенном месте.\nГлава 5 » Движение в неположенном месте, разговор по телефону во время движения.\nГлава 6 » Игнорирование сирен спец. служб и инспектора.\nГлава 7 » Затруднение движения, управление транспортным средством.\nГлава 8 » Ненормативная лексика, оскорбление.\nГлава 9 » Агрессивное вождение.\nГлава 10 » Регистрационный знак.\nГлава 11 » Езда в нетрезвом виде.\nГлава 12 » Ремень безопасности и шлем.\nГлава 13 » Тонировка.\nГлава 14 » Отказ предоставления документов.\n» Отменить последнее действие"
d.ticket_1 = "1.1 » Нарушение скоростного режима.\n1.2 » Нарушение скоростного режима, вследствие чего произошло ДТП."
d.ticket_2 = "2.1 » Езда по встречной полосе.\n2.2 » Езда по встречной полосе, вследствие чего произошло ДТП."
d.ticket_3 = "3.1 » Проезд красного сигнала светофора.\n3.2 » Проезд красного сигнала светофора, вследствие чего произошло ДТП."
d.ticket_4 = "4.1 » Парковка транспортного средства в неположенном месте."
d.ticket_5 = "5.1 » Движение транспортного средства по тротуару, газону, пешеходным дорожкам и прочим местам, неположенным для движения авто.\n5.2 » Разговор по телефону во время движения."
d.ticket_6 = "6.1 » Игнорирование сирен спец. служб.\n6.2 » За игнорирование сирен спец. служб, вследствие чего произошло ДТП.\n6.3 » За игнорирование требований инспектора ДПС."
d.ticket_7 = "7.1 » Затруднение движения транспортным средством.\n7.2 » Создание аварийной ситуации на полосе движения.\n7.3 » Управление транспортным средством без включенного ближнего света фар.\n7.4 » Управление транспортным средством в неисправном состоянии."
d.ticket_8 = "8.1 » Использование ненормативной лексики.\n8.2 » Оскорбление граждан.\n8.3 » Оскорбление сотрудника при исполнении."
d.ticket_9 = "9.1 » Агрессивное вождение, которое может привести к ДТП."
d.ticket_10 = "10.1 » Передвижение на транспортном средстве без регистрационного знака."
d.ticket_11 = "11.1 » Езда в нетрезвом виде.\n11.2 » Езда в нетрезвом виде вследствие чего произошло ДТП."
d.ticket_12 = "12.1 » Езда на транспортном средстве без ремня безопасности.\n12.2 » Езда без защитного шлема на мототранспорте."
d.ticket_13 = "13.1 » Езда на транспортном средстве, стекла которого имеют степень светопропускания менее 70%."
d.ticket_14 = "14.1 » Отказ/Нежелание гражданина предоставить сотруднику удостоверения личности.\n14.2 » Отказ/Нежелание гражданина предоставить сотруднику документов на транспорт."
d.mform_1 = "» Я организатор строя\n» Я пришедший на строй"
d.mform_2 = "» Созвать сотрудников на строй\n» Запланировать строй\n» Узнать местоположение сотрудника\n» Начать строй"
d.mform_3 = "» Созвать сотрудников на строй\n» Запланировать строй\n» Узнать местоположение сотрудника\n» Начать строй"
d.mform_4 = "Введите значение минут, через какое время будет начало постороения\nНапример: 3 (минуты)"
d.mform_5 = "Введите значение времени, на какое Вы хотите запланировать построение\nНапример: 17:45"
d.mform_6 = "Введите жетон сотрудника, у которого хотите узнать местоположение\nНапример: 4-2-5"
d.mform_7 = "» Выбрать случайную лекцию из списка\n» Лекция №1\n» Лекция №2\n» Лекция №3\n» Лекция №4\n» Лекция №5\n» Лекция №6\n» Лекция №7\n» Лекция №8\n» Лекция №9\n» Лекция №10"

d.mform_2_1 = "Вы только что закончили проводить лекцию\nНе хотите начать тренировку?"

local b = { }
b.choose = "Выбрать"
b.confirm = "Подтвердить"
b.close = "Закрыть"

local inicfg = require 'inicfg'
directIni = '../config/mvdhelper_ahk.ini'
helper = inicfg.load(inicfg.load({
    script = {
		fc = "{f50029}",
		sc = "{FFFFFF}",
		tc = "{cccccc}",
		foc = "{00e600}",
		n = "{f50029}MHelper {cccccc}» {FFFFFF}",
		d = "{f50029}Debug {cccccc}» {FFFFFF}",
		nt = "{f50029}Уведомление {cccccc}» {FFFFFF}",
		
    },
	cfg = {
		mft = "Н",
		t_l_1 = false,
		t_l_2 = false,
		t_l_3 = false,
		t_l_4 = false,
		t_l_5 = false,
		t_l_6 = false,
		t_l_7 = false,
		t_l_8 = false,
		t_l_9 = false,
		t_l_10 = false,
	},
}, directIni))
inicfg.save(helper, directIni)

function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
    while not isSampAvailable() do wait(100) end
	local myID = select(2, sampGetPlayerIdByCharHandle(1))
	myNick = sampGetPlayerNickname(myID)
	sampRegisterChatCommand("dmt", cmd_dmt)
	sampRegisterChatCommand("dmn", function(info) rusnick1 = rusnick(info) sampAddChatMessage(rusnick1, -1) end)
	
	---cmd
	sampRegisterChatCommand("mtakelic", function(arg) ahk_takelic(arg) if developer_mode then sampAddChatMessage(helper.script.d.."Аргументы команды: "..fc..arg, -1) end end)
	sampRegisterChatCommand("mticket", function(arg) ahk_ticket(arg) if developer_mode then sampAddChatMessage(helper.script.d.."Аргументы команды: "..fc..arg, -1) end end)
	sampRegisterChatCommand("mpg", function(arg) ahk_pg(arg) if developer_mode then sampAddChatMessage(helper.script.d.."Аргументы команды: "..fc..arg, -1) end end)
	sampRegisterChatCommand("marrest", function(arg) ahk_arrest(arg) if developer_mode then sampAddChatMessage(helper.script.d.."Аргументы команды: "..fc..arg, -1) end end)
	sampRegisterChatCommand("mputpl", function(arg) ahk_putpl(arg) if developer_mode then sampAddChatMessage(helper.script.d.."Аргументы команды: "..fc..arg, -1) end end)
	sampRegisterChatCommand("mcuff", function(arg) ahk_cuff(arg) if developer_mode then sampAddChatMessage(helper.script.d.."Аргументы команды: "..fc..arg, -1) end end)
	sampRegisterChatCommand("muncuff", function(arg) ahk_uncuff(arg) if developer_mode then sampAddChatMessage(helper.script.d.."Аргументы команды: "..fc..arg, -1) end end)
	sampRegisterChatCommand("mescort", function(arg) ahk_escort(arg) if developer_mode then sampAddChatMessage(helper.script.d.."Аргументы команды: "..fc..arg, -1) end end)
	sampRegisterChatCommand("munescort", function(arg) ahk_unescort(arg) if developer_mode then sampAddChatMessage(helper.script.d.."Аргументы команды: "..fc..arg, -1) end end)
	sampRegisterChatCommand("msu", function(arg) ahk_su(arg) if developer_mode then sampAddChatMessage(helper.script.d.."Аргументы команды: "..fc..arg, -1) end end)
	sampRegisterChatCommand("mejectout", function(arg) ahk_ejectout(arg) if developer_mode then sampAddChatMessage(helper.script.d.."Аргументы команды: "..fc..arg, -1) end end)
	sampRegisterChatCommand("mclear", function(arg) ahk_clear(arg) if developer_mode then sampAddChatMessage(helper.script.d.."Аргументы команды: "..fc..arg, -1) end end)
	--
	sampRegisterChatCommand("mform", function() func_form() end)
	
	sampAddChatMessage(helper.script.n.."Перезагрузка "..foc.."успешна"..sc..", скрипт готов к работе!", -1) -- прив соо
	
	while true do	
		wait(0)
	
	result, button, list, input = sampHasDialogRespond(4251) -- взаимодействие и диалогом ID 4251
		if result then
			if button == 1 then
				if list == 0 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4252]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_1 2) d.ticket_1 3) 2 ", -1)
					end
					sampShowDialog(4252, dn.ticket_1, d.ticket_1, b.choose, b.close, 2)
				elseif list == 1 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4253]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_2 2) d.ticket_2 3) 2 ", -1)
					end
					sampShowDialog(4253, dn.ticket_2, d.ticket_2, b.choose, b.close, 2)
				elseif list == 2 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4254]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_3 2) d.ticket_3 3) 2 ", -1)
					end
					sampShowDialog(4254, dn.ticket_3, d.ticket_3, b.choose, b.close, 2)
				elseif list == 3 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4255]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_4 2) d.ticket_4 3) 2 ", -1)
					end
					sampShowDialog(4255, dn.ticket_4, d.ticket_4, b.choose, b.close, 2)
				elseif list == 4 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4256]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_5 2) d.ticket_5 3) 2 ", -1)
					end
					sampShowDialog(4256, dn.ticket_5, d.ticket_5, b.choose, b.close, 2)
				elseif list == 5 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4257]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_6 2) d.ticket_6 3) 2 ", -1)
					end
					sampShowDialog(4257, dn.ticket_6, d.ticket_6, b.choose, b.close, 2)
				elseif list == 6 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4278]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_7 2) d.ticket_7 3) 2 ", -1)
					end
					sampShowDialog(4258, dn.ticket_7, d.ticket_7, b.choose, b.close, 2)
				elseif list == 7 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4259]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_8 2) d.ticket_8 3) 2 ", -1)
					end
					sampShowDialog(4259, dn.ticket_8, d.ticket_8, b.choose, b.close, 2)
				elseif list == 8 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 42510]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_9 2) d.ticket_9 3) 2 ", -1)
					end
					sampShowDialog(42510, dn.ticket_9, d.ticket_9, b.choose, b.close, 2)
				elseif list == 9 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 42511]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_10 2) d.ticket_10 3) 2 ", -1)
					end
					sampShowDialog(42511, dn.ticket_10, d.ticket_10, b.choose, b.close, 2)
				elseif list == 10 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 42512]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_11 2) d.ticket_11 3) 2 ", -1)
					end
					sampShowDialog(42512, dn.ticket_11, d.ticket_11, b.choose, b.close, 2)
				elseif list == 11 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 42513]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_12 2) d.ticket_12 3) 2 ", -1)
					end
					sampShowDialog(42513, dn.ticket_12, d.ticket_12, b.choose, b.close, 2)
				elseif list == 12 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 42514]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_13 2) d.ticket_13 3) 2 ", -1)
					end
					sampShowDialog(42514, dn.ticket_13, d.ticket_13, b.choose, b.close, 2)
				elseif list == 13 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 42515]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_14 2) d.ticket_14 3) 2 ", -1)
					end
					sampShowDialog(42515, dn.ticket_14, d.ticket_14, b.choose, b.close, 2)
				elseif list == 14 then
					if ticket_amount ~= 0 and ticket_numbers ~= 0 then
						if ticket_cancellation_licence == "1" and ticket_give_cancellation_licence == "1" then
							if ticket_not_last_give_cancellation_licence ~= "1" then
								ticket_give_cancellation_licence = "0"
								sampAddChatMessage("", -1)
								sampAddChatMessage(helper.script.n.."Вы отменили "..fc.."лишение водительского удостоверения "..sc.." для игрока "..fc..player_name.." ["..player_id.."]", -1)
								sampAddChatMessage(helper.script.n.."Причина отмены: "..fc.." отмена последнего действия", -1)
								sampAddChatMessage("", -1)
							end
						end
						ticket_amount = ticket_amount - ticket_price
						sampAddChatMessage("", -1)
						sampAddChatMessage(helper.script.n.."Вы убавили  "..foc..ticket_price..sc.. " рублей из штрафа игрока "..fc..player_name.." ["..player_id.."]", -1)
						sampAddChatMessage(helper.script.n.."Общая сумма: "..foc..ticket_amount..sc.. " рублей. "..sc.."Причина убавления: "..fc.." отмена последнего действия", -1)
						sampAddChatMessage("", -1)
						sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 42515]", -1)
							sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_14 2) d.ticket_14 3) 2 ", -1)
						end
					else
						sampAddChatMessage("", -1)
						sampAddChatMessage(helper.script.n.."Вам нечего отменять.", -1)
						sampAddChatMessage("", -1)
					end
				end
			elseif button == 0 then
				if ticket_amount ~= 0 and ticket_reason_all ~= "Не указано" then
					sampShowDialog(42517, dn.ticket_main_3, sc.."Вы действительно хотите выдать штраф игроку "..fc..player_name.." ["..player_id.."]?"..sc.."\nСумма штрафа: "..foc..ticket_amount.." рублей. "..sc.." Причина: "..fc.."1", b.choose, b.close, 0)
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 42517]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main_3 2) text 3) 0 ", -1)
					end
				end
			end
		end	
		
	result, button, list, input = sampHasDialogRespond(4252) -- взаимодействие и диалогом ID 4252
		if result then
			if button == 1 then
				if list == 0 then
					msg_ticket("5000 1.1 0")
				elseif list == 1 then
					msg_ticket("10000 1.2 1")
				end
			elseif button == 0 then
				sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
				if developer_mode then
					sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end	
		
	result, button, list, input = sampHasDialogRespond(4253) -- взаимодействие и диалогом ID 4253
		if result then
			if button == 1 then
				if list == 0 then
					msg_ticket("5000 2.1 1")
				elseif list == 1 then
					msg_ticket("10000 2.2 1")
				end
			elseif button == 0 then
				sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
				if developer_mode then
					sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end	
		
	result, button, list, input = sampHasDialogRespond(4254) -- взаимодействие и диалогом ID 4254
		if result then
			if button == 1 then
				if list == 0 then
					msg_ticket("3000 3.1 0")
				elseif list == 1 then
					msg_ticket("10000 3.2 1")
				end
			elseif button == 0 then
				sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
				if developer_mode then
					sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end	
	
	result, button, list, input = sampHasDialogRespond(4255) -- взаимодействие и диалогом ID 4255
		if result then
			if button == 1 then
				if list == 0 then
					msg_ticket("5000 4.1 0")
				end
			elseif button == 0 then
				sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
				if developer_mode then
					sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end	
	
	result, button, list, input = sampHasDialogRespond(4256) -- взаимодействие и диалогом ID 4256
		if result then
			if button == 1 then
				if list == 0 then
					msg_ticket("5000 5.1 1")
				elseif list == 1 then
					msg_ticket("1000 5.2 0")
				end
			elseif button == 0 then
				sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
				if developer_mode then
					sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end	
	
	result, button, list, input = sampHasDialogRespond(4257) -- взаимодействие и диалогом ID 4257
		if result then
			if button == 1 then
				if list == 0 then
					msg_ticket("4000 6.1 0")
				elseif list == 1 then
					msg_ticket("10000 6.2 1")
				elseif list == 2 then
					msg_ticket("15000 6.3 0")
				end
			elseif button == 0 then
				sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
				if developer_mode then
					sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end	
	
	result, button, list, input = sampHasDialogRespond(4258) -- взаимодействие и диалогом ID 4258
		if result then
			if button == 1 then
				if list == 0 then
					msg_ticket("3000 7.1 1")
				elseif list == 1 then
					msg_ticket("4000 7.2 0")
				elseif list == 2 then
					msg_ticket("3000 7.3 0")
				elseif list == 3 then
					msg_ticket("3000 7.4 0")
				end
			elseif button == 0 then
				sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
				if developer_mode then
					sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end	
	
	result, button, list, input = sampHasDialogRespond(4259) -- взаимодействие и диалогом ID 4259
		if result then
			if button == 1 then
				if list == 0 then
					msg_ticket("100, 8.1 0")
				elseif list == 1 then
					msg_ticket("3000 8.2 0")
				elseif list == 2 then
					msg_ticket("15000 8.3 0")
				end
			elseif button == 0 then
				sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
				if developer_mode then
					sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end

	result, button, list, input = sampHasDialogRespond(42510) -- взаимодействие и диалогом ID 42510
		if result then
			if button == 1 then
				if list == 0 then
					msg_ticket("10000 9.1 1")
				end
			elseif button == 0 then
				sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
				if developer_mode then
					sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end	
	
	result, button, list, input = sampHasDialogRespond(42511) -- взаимодействие и диалогом ID 42511
		if result then
			if button == 1 then
				if list == 0 then
					msg_ticket("5000 10.1 0")
				end
			elseif button == 0 then
				sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
				if developer_mode then
					sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end	
	
	result, button, list, input = sampHasDialogRespond(42512) -- взаимодействие и диалогом ID 42512
		if result then
			if button == 1 then
				if list == 0 then
					msg_ticket("5000 11.1 1")
				elseif list == 1 then
					msg_ticket("25000 11.2 1")
				end
			elseif button == 0 then
				sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
				if developer_mode then
					sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end
		
	result, button, list, input = sampHasDialogRespond(42513) -- взаимодействие и диалогом ID 42513
		if result then
			if button == 1 then
				if list == 0 then
					msg_ticket("5000 12.1 0")
				elseif list == 1 then
					msg_ticket("5000 12.2 0")
				end
			elseif button == 0 then
				sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
				if developer_mode then
					sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end

	result, button, list, input = sampHasDialogRespond(42513) -- взаимодействие и диалогом ID 42513
		if result then
			if button == 1 then
				if list == 0 then
					msg_ticket("5000 12.1 0")
				elseif list == 1 then
					msg_ticket("5000 12.2 0")
				end
			elseif button == 0 then
				sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
				if developer_mode then
					sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end	
	result, button, list, input = sampHasDialogRespond(42514) -- взаимодействие и диалогом ID 42514
		if result then
			if button == 1 then
				if list == 0 then
					msg_ticket("1000 13.1 0")
				end
			elseif button == 0 then
				sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
				if developer_mode then
					sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end	
		
	result, button, list, input = sampHasDialogRespond(42515) -- взаимодействие и диалогом ID 42515
		if result then
			if button == 1 then
				if list == 0 then
					msg_ticket("15000 14.1 0")
				elseif list == 1 then
					msg_ticket("15000 14.2 0")
				end
			elseif button == 0 then
				sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
				if developer_mode then
					sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end	
	
	result, button, list, input = sampHasDialogRespond(42517) -- взаимодействие и диалогом ID 42517
		if result then
			if button == 1 then
				ahk_ticket(player_id.. " "..ticket_amount.. " "..ticket_reason_all)
			end
		end	
		
	result, button, list, input = sampHasDialogRespond(42518) -- взаимодействие и диалогом ID 42518
		if result then
			if button == 1 then
				if list == 0 then
					sampShowDialog(42519, dn.mform_2, d.mform_2, b.choose, b.close, 2)
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Диалог построения (организатор) [ID 42519]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.dn.mform_2 2) d.dn.mform_2 3) 2 ", -1)
					end
				elseif list == 1 then
					sampShowDialog(42520, dn.mform_3, d.mform_3, b.choose, b.close, 2)
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Диалог построения (пришедший) [ID 42520]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.dn.mform_3 2) d.dn.mform_3 3) 2 ", -1)
					end
				end
			end
		end	
	
	result, button, list, input = sampHasDialogRespond(42519) -- взаимодействие и диалогом ID 42519 
		if result then
			if button == 1 then
				if list == 0 then
					sampShowDialog(42521, dn.mform_4, d.mform_4, b.choose, b.close, 1)
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Диалог созыва строя [ID 42521]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.dn.mform_4 2) d.dn.mform_4 3) 1 ", -1)
					end
					while sampIsDialogActive(42521) do wait(100) end -- Ожидание закрытия диалога
					local result, button, _, input = sampHasDialogRespond(42521)
					if input:find("%d+") and not input:find("%W+") and not input:find("%p+") and not input:find("%s+") and not input:find("%a+") and input == "1" or input == "2" or input == "3" or input == "4" or input == "5"  or input == "6" or input == "7" or input == "8" or input == "9" or input == "10" then
						sampAddChatMessage(helper.script.d.."Строй запланирован через: "..fc..input..sc.." мин.", -1)
						form_min = tonumber(input)
						lua_thread.create(function()
							sampSendChat("/r ["..helper.cfg.mft.."] Строй на парковке! Готовность - "..form_min.." мин. Неявка - выговор в личное дело.")
							sampSendChat("/rr АФК после этого момента/Лив из игры - выговор за уход от рп.")
							form_min = form_min - 1
							if form_min ~= 0 then
								wait(60000)
								sampSendChat("/r ["..helper.cfg.mft.."] Строй на парковке! Готовность - "..form_min.." мин. Неявка - выговор в личное дело.")	
								form_min = form_min - 2
							end
							if form_min ~= 0 then
								wait(60000)
								sampSendChat("/r ["..helper.cfg.mft.."] Строй на парковке! Готовность - "..form_min.." мин. Неявка - выговор в личное дело.")	
								form_min = form_min - 3
							end
							if form_min ~= 0 then
								wait(60000)
								sampSendChat("/r ["..helper.cfg.mft.."] Строй на парковке! Готовность - "..form_min.." мин. Неявка - выговор в личное дело.")	
								form_min = form_min - 4
							end
							if form_min ~= 0 then
								wait(60000)
								sampSendChat("/r ["..helper.cfg.mft.."] Строй на парковке! Готовность - "..form_min.." мин. Неявка - выговор в личное дело.")	
								form_min = form_min - 5
							end
							if form_min ~= 0 then
								wait(60000)
								sampSendChat("/r ["..helper.cfg.mft.."] Строй на парковке! Готовность - "..form_min.." мин. Неявка - выговор в личное дело.")	
								form_min = form_min - 6
							end
							if form_min ~= 0 then
								wait(60000)
								sampSendChat("/r ["..helper.cfg.mft.."] Строй на парковке! Готовность - "..form_min.." мин. Неявка - выговор в личное дело.")	
								form_min = form_min - 7
							end
							if form_min ~= 0 then
								wait(60000)
								sampSendChat("/r ["..helper.cfg.mft.."] Строй на парковке! Готовность - "..form_min.." мин. Неявка - выговор в личное дело.")	
								form_min = form_min - 8
							end
							if form_min ~= 0 then
								wait(60000)
								sampSendChat("/r ["..helper.cfg.mft.."] Строй на парковке! Готовность - "..form_min.." мин. Неявка - выговор в личное дело.")	
								form_min = form_min - 9
							end
							if form_min ~= 0 then
								wait(60000)
								sampSendChat("/r ["..helper.cfg.mft.."] Строй на парковке! Готовность - "..form_min.." мин. Неявка - выговор в личное дело.")	
							end
						end)
					else
						sampAddChatMessage("", -1)
						sampAddChatMessage(helper.script.n.."Введите конкретное "..fc.."значение минут "..sc.."(от "..fc.."1"..sc.." до "..fc.."10"..sc..")", -1)
						sampAddChatMessage("", -1)
					end
				elseif list == 1 then
					sampShowDialog(42522, dn.mform_5, d.mform_5, b.choose, b.close, 1)
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Диалог запланирования строя [ID 42522]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.dn.mform_5 2) d.dn.mform_5 3) 1 ", -1)
					end
				elseif list == 2 then
					sampShowDialog(42523, dn.mform_6, d.mform_6, b.choose, b.close, 1)
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Диалог опроса сотрудника о его местоположении [ID 42523]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.dn.mform_6 2) d.dn.mform_6 3) 1 ", -1)
					end
				elseif list == 3 then
					sampShowDialog(42524, dn.mform_7, d.mform_7, b.choose, b.close, 2)
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Диалог начала строя [ID 42524]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.dn.mform_7 2) d.dn.mform_7 3) 2 ", -1)
					end
				end
			end
		end	
	
	result, button, list, input = sampHasDialogRespond(42524) -- взаимодействие и диалогом ID 42524
		if result then
			if button == 1 then
				if lecture_start == false then
					if list == 0 then
						choose_lecture(0, 0)
					elseif list == 1 then
						choose_lecture(1, 0)
					elseif list == 2 then
						choose_lecture(2, 0)
					elseif list == 3 then
						choose_lecture(3, 0)
					elseif list == 4 then
						choose_lecture(4, 0)
					elseif list == 5 then
						choose_lecture(5, 0)
					elseif list == 6 then
						choose_lecture(6, 0)
					elseif list == 7 then
						choose_lecture(7, 0)
					elseif list == 8 then
						choose_lecture(8, 0)
					elseif list == 9 then
						choose_lecture(9, 0)
					elseif list == 10 then
						choose_lecture(10, 0)
					end
				elseif lecture_start == true then
					sampAddChatMessage(helper.script.n.."Вы сейчас уже проводите "..fc.."лекцию", -1)
					sampAddChatMessage(helper.script.n.."Пожалуйста, дождитесь её окончания", -1)
				end
			end
		end	
		
	
	end
end

function cmd_dmt(info)
	if developer_mode then
		sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4251]", -1)
		sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
		sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
	end
end

function events.onSendClientJoin() -- хук на подключение к серверу
	if welcome_msg == false then
		if os.date("%H") >= "01" and os.date("%H") <= "06" then 
			time_of_day = "Доброй ночи"
		elseif os.date("%H") >= "07" and os.date("%H") <= "12" then 
			time_of_day = "Доброе утро"
		elseif os.date("%H") >= "13" and os.date("%H") <= "18" then 
			time_of_day = "Добрый день"
		elseif os.date("%H") >= "19" and os.date("%H") <= "24" then 
			time_of_day = "Доброй вечер"
		end
		sampAddChatMessage(helper.script.n..time_of_day..", "..fc..myNick..".", -1) -- прив соо
		sampAddChatMessage(helper.script.n.."Желаем "..foc.."приятного использования "..sc.."нашего продукта.", -1) -- прив соо
		if developer_mode then
			sampAddChatMessage(helper.script.d.. "Сессия "..myNick.. " ["..myID.."]", -1)
		end
		welcome_msg = true
	end
end


function msg_ticket(info)
	ticket_price, ticket_reason, ticket_cancellation_licence = string.match(info, "(%d+) (.+) (%d+)")
	ticket_amount = ticket_amount + ticket_price
	ticket_numbers = ticket_numbers + 1
	sampAddChatMessage("", -1)
	sampAddChatMessage(helper.script.n.."Вы добавили  "..foc..ticket_price..sc.. " рублей к штрафу игрока "..fc..player_name.." ["..player_id.."]", -1)
	sampAddChatMessage(helper.script.n.."Общая сумма: "..foc..ticket_amount..sc.. " рублей. "..sc.."Причина добавления: "..fc..ticket_reason.." КоАП", -1)
	if ticket_cancellation_licence == "1" and ticket_give_cancellation_licence == "1" then
		ticket_not_last_give_cancellation_licence = "1"
	end
	if ticket_cancellation_licence == "1" then
		sampAddChatMessage("", -1)
		sampAddChatMessage(helper.script.nt.."За данное нарушение предусмотрено "..fc.."лишение водительского удостоверения!", -1)
		sampAddChatMessage("", -1)
		ticket_give_cancellation_licence = "1"
		ticket_give_cancellation_licence_reason = ticket_reason
	elseif ticket_cancellation_licence == "0" then
		sampAddChatMessage("", -1)
	end
	if ticket_numbers == 1 then
		ticket_reason_1 = ticket_reason
		ticket_reason_all = ticket_reason_1
	elseif ticket_numbers == 2 then
		ticket_reason_2 = ticket_reason
		ticket_reason_all = ticket_reason_1.. " + " ..ticket_reason_2
	elseif ticket_numbers == 3 then
		ticket_reason_3 = ticket_reason
		ticket_reason_all = ticket_reason_1.. " + " ..ticket_reason_2.. " + " ..ticket_reason_3
	elseif ticket_numbers == 4 then
		ticket_reason_4 = ticket_reason
		ticket_reason_all = ticket_reason_1.. " + " ..ticket_reason_2.. " + " ..ticket_reason_3.. " + " ..ticket_reason_4
	elseif ticket_numbers > 4 then
		sampAddChatMessage("", -1)
		sampAddChatMessage(helper.script.n.."За один раз можно выдать максимум "..fc.."4 "..sc.."штрафа.", -1)
		sampAddChatMessage(helper.script.n.."Последнее действие "..fc.."было отменено.", -1)
		sampAddChatMessage("", -1)
		ticket_numbers = ticket_numbers - 1
		ticket_amount = ticket_amount - ticket_price
	end
	if developer_mode then
		sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4251]", -1)
		sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main_2 2) d.ticket_main 3) 2 ", -1)
	end
	sampShowDialog(4251, dn.ticket_main_2, d.ticket_main, b.choose, b.close, 2)	
end

function ahk_pg(info)
	player_id = string.match(info, "(%d+)")
	if player_id == nil then
		sampAddChatMessage("", -1)
		sampAddChatMessage(helper.script.n.." Используйте: "..fc.."/mpg [ID игрока]", -1)
		sampAddChatMessage("", -1)
	else
		if sampIsPlayerConnected(player_id) then
			result, Ped = sampGetCharHandleBySampPlayerId(player_id)
			if result then
				player_name = sampGetPlayerNickname(player_id)
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."Вы начали погоню за игроком "..fc..player_name.." ["..player_id.."]", -1)
				sampAddChatMessage("", -1)
				lua_thread.create(function()
					sampSendChat("/me достал рацию из рюкзака")
					wait(999)
					sampSendChat("/do Рация в руке.")
					wait(999)
					sampSendChat("/todo Докладывая диспетчеру о начале погоне*сейчас поймаем")
					wait(999)
					sampSendChat("/pg "..player_id)
					create_log("Действие: начало погони | Подозреваемый: "..player_name)
				end)	
			else
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."Игрок "..fc.."не находится "..sc.."в зоне стрима.", -1)
				sampAddChatMessage("", -1)
			end
		else
			sampAddChatMessage("", -1)
			sampAddChatMessage(helper.script.n.."Такого игрока нет!", -1)
			sampAddChatMessage("", -1)
		end
	end
end

function ahk_ticket(info)
	player_id, ticket_amount, ticket_reason = string.match(info, "(%d+) (%d+) (.+)")
	if player_id == nil then
		sampAddChatMessage("", -1)
		sampAddChatMessage(helper.script.n.." Используйте: "..fc.."/mticket [ID игрока] [Сумма] [Причина]", -1)
		sampAddChatMessage("", -1)
	else
		if sampIsPlayerConnected(player_id) then
			result, Ped = sampGetCharHandleBySampPlayerId(player_id)
			if result then
				player_name = sampGetPlayerNickname(player_id)
				if ticket_amount ~= "0" and ticket_reason ~= "0" then
					sampAddChatMessage("", -1)
					sampAddChatMessage(helper.script.n.."Вы выдали штраф игроку "..fc..player_name.." ["..player_id.."]", -1)
					sampAddChatMessage(helper.script.n.."Общая сумма: "..foc..ticket_amount.. " рублей."..sc.." Причина: "..fc..ticket_reason.." КоАП", -1)
					sampAddChatMessage("", -1)
					if developer_mode then
						sampAddChatMessage(helper.script.d.."/ticket "..player_id.. " "..ticket_amount.. " "..ticket_reason.. " КоАП", -1)
					end
					lua_thread.create(function()
						sampSendChat("/ticket "..player_id.. " "..ticket_amount.. " "..ticket_reason.." КоАП")
						wait(999)
						sampSendChat("/me достал полицейский планшет из рюказка")
						wait(999)
						sampSendChat("/do Полицейский планшет в руках.")
						wait(999)
						sampSendChat("/me нажал на кнопку 'Выписать штраф'")
						wait(999)
						sampSendChat("/me заполняет необходимую информацию")
						wait(999)
						sampSendChat("/do Штраф выписан.")
						wait(999)
						sampSendChat("/todo Отправляя штрафную квитанцию*выслал реквизиты для оплаты Вам на эл. почту.")
						wait(999)
						sampSendChat("Вы можете оспорить мое решение выдать Вам штраф на гос. портале области.")
						wait(999)
						sampSendChat("/c 060")
						create_log("Действие: выдача штрафа | Нарушитель: "..player_name.." | Общая сумма: "..ticket_amount.." | Причина(-ы): "..ticket_reason)
						if ticket_give_cancellation_licence == "1" then
							sampAddChatMessage("ahk_takelic(player_id.. ..ticket_give_cancellation_licence_reason)")
						end
					end)
				else
					sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Диалог выдачи штрафа [ID 4251]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
					end	
				end
			else
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."Игрок "..fc.."не находится "..sc.."в зоне стрима.", -1)
				sampAddChatMessage("", -1)
			end
		else
			sampAddChatMessage("", -1)
			sampAddChatMessage(helper.script.n.."Такого игрока нет!", -1)
			sampAddChatMessage("", -1)
		end
	end
end

function ahk_takelic(info)
	player_id, takelic_reason = string.match(info, "(%d+) (.+)")
	if player_id == nil or takelic_reason == "" then
		sampAddChatMessage("", -1)
		sampAddChatMessage(helper.script.n.."Используйте: "..fc.."/mtakelic [ID игрока] [Причина]", -1)
		sampAddChatMessage("", -1)
	else
		if sampIsPlayerConnected(player_id) then
			result, Ped = sampGetCharHandleBySampPlayerId(player_id)
			if result then
				player_name = sampGetPlayerNickname(player_id)
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."Вы аннулировали лицензию "..fc..player_name.." ["..player_id.."]", -1)
				sampAddChatMessage(helper.script.n.."Причина: "..fc..takelic_reason.." КоАП.", -1)
				sampAddChatMessage("", -1)
				if developer_mode then
					sampAddChatMessage(helper.script.d.."/takelic "..player_id.. " "..takelic_reason.. " КоАП", -1)
				end
				ticket_not_last_give_cancellation_licence = "0"
				lua_thread.create(function()
					sampSendChat("/takelic "..player_id.. " "..takelic_reason.. " КоАП")
					wait(999)
					sampSendChat("/me достал полицейский планшет из рюказка")
					wait(999)
					sampSendChat("/do Полицейский планшет в руках.")
					wait(999)
					sampSendChat("/me нажал на кнопку 'Аннулировать лицензию'")
					wait(999)
					sampSendChat("/me заполняет необходимую информацию")
					wait(999)
					sampSendChat("/do Лицензция аннулирована.")
					wait(999)
					sampSendChat("/todo Отправляя постановление*выслал необходимую информацию Вам на эл. почту.")
					wait(999)
					sampSendChat("Вы можете оспорить мое решение аннулировать Вашу лицензию на гос. портале области.")
					wait(999)
					sampSendChat("/c 060")
					create_log("Действие: аннулирование лицензии | Нарушитель: "..player_name.." | Причина: "..takelic_reason)
				end)
			else
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."Игрок "..fc.."не находится "..sc.."в зоне стрима.", -1)
				sampAddChatMessage("", -1)
			end
		else
			sampAddChatMessage("", -1)
			sampAddChatMessage(helper.script.n.."Такого игрока нет!", -1)
			sampAddChatMessage("", -1)
		end
	end
end

function ahk_cuff(info)
	player_id = string.match(info, "(%d+)")
	if player_id == nil then
		sampAddChatMessage("", -1)
		sampAddChatMessage(helper.script.n.." Используйте: "..fc.."/mcuff [ID игрока]", -1)
		sampAddChatMessage("", -1)
	else
		if sampIsPlayerConnected(player_id) then
			result, Ped = sampGetCharHandleBySampPlayerId(player_id)
			if result then
				player_name = sampGetPlayerNickname(player_id)
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."Вы надели наручники на игрока "..fc..player_name.." ["..player_id.."]", -1)
				sampAddChatMessage("", -1)
				if developer_mode then
					sampAddChatMessage(helper.script.d.."/cuff "..player_id, -1)
				end
				lua_thread.create(function()
					sampSendChat("/do Наручники висят на поясе.")
					wait(999)
					sampSendChat("/me легким движением руки взял наручники с пояса")
					wait(999)
					sampSendChat("/do Наручники в руке.")
					wait(999)
					sampSendChat("/todo Надевая наручники на подозреваемого*не двигайтесь!")
					wait(999)
					sampSendChat("/do Подозреваемый находится в наручниках.")
					wait(999)
					sampSendChat("/cuff "..player_id)
					create_log("Действие: надеть наручники | Подозреваемый: "..player_name)
				end)	
			else
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."Игрок "..fc.."не находится "..sc.."в зоне стрима.", -1)
				sampAddChatMessage("", -1)
			end
		else
			sampAddChatMessage("", -1)
			sampAddChatMessage(helper.script.n.."Такого игрока нет!", -1)
			sampAddChatMessage("", -1)
		end
	end
end

function ahk_uncuff(info)
	
	-- create_log("Действие: снять наручники | Подозреваемый: "..player_name)
end

function ahk_escort(info)
--create_log("Действие: начать вести за собой | Подозреваемый: "..player_name)
end

function ahk_su(info)
	player_id = string.match(info, "(%d+)")
	if player_id == nil then
		sampAddChatMessage("", -1)
		sampAddChatMessage(helper.script.n.." Используйте: "..fc.."/msu [ID игрока]", -1)
		sampAddChatMessage("", -1)
	else
		if sampIsPlayerConnected(player_id) then
			player_name = sampGetPlayerNickname(player_id)
			sampAddChatMessage("", -1)
			sampAddChatMessage(helper.script.n.."Вы объявляете "..fc..player_name.." ["..player_id.."] "..sc.."в федеральный розыск", -1)
			sampAddChatMessage("", -1)
			if developer_mode then
				sampAddChatMessage(helper.script.d.."/su "..player_id, -1)
			end
			lua_thread.create(function()
				sampSendChat("/su "..player_id)
				wait(999)
				sampSendChat("/me достал полицейский планшет из рюкзака")
				wait(999)
				sampSendChat("/do Планшет в руке.")
				wait(999)
				sampSendChat("/me открыл раздел 'Федеральный розыск'")
				wait(999)
				sampSendChat("/do Раздел 'Федеральный розыск' открыт.")
				wait(999)
				sampSendChat("/todo Вводя приметы подозреваемого*сейчас получит по заслугам..")
				wait(999)
				sampSendChat("/me объявил подозреваемого в федеральный розыск")
				wait(999)
				sampSendChat("/do Подозреваемый находится в федеральном розыске.")
				wait(999)
				sampSendChat("/c 60")
				create_log("Действие: объявить в розыск | Подозреваемый: "..player_name)
			end)	
		else
			sampAddChatMessage("", -1)
			sampAddChatMessage(helper.script.n.."Такого игрока нет!", -1)
			sampAddChatMessage("", -1)
		end
	end
end

function ahk_clear(info)
	player_id = string.match(info, "(%d+)")
	if player_id == nil then
		sampAddChatMessage("", -1)
		sampAddChatMessage(helper.script.n.." Используйте: "..fc.."/mclear [ID игрока]", -1)
		sampAddChatMessage("", -1)
	else
		if sampIsPlayerConnected(player_id) then
			player_name = sampGetPlayerNickname(player_id)
			sampAddChatMessage("", -1)
			sampAddChatMessage(helper.script.n.."Вы сняли игрока "..fc..player_name.." ["..player_id.."] "..sc.."с федерального розыска", -1)
			sampAddChatMessage("", -1)
			if developer_mode then
				sampAddChatMessage(helper.script.d.."/clear "..player_id, -1)
			end
			lua_thread.create(function()
				sampSendChat("/me достал полицейский планшет из рюкзака")
				wait(999)
				sampSendChat("/do Планшет в руке.")
				wait(999)
				sampSendChat("/me открыл раздел 'Федеральный розыск'")
				wait(999)
				sampSendChat("/do Раздел 'Федеральный розыск' открыт.")
				wait(999)
				sampSendChat("/me ищет человека в базе данных")
				wait(999)
				sampSendChat("/do Личность человека известна.")
				wait(999)
				sampSendChat("/me снял с человека пометку 'Федеральный розыск'")
				wait(999)
				sampSendChat("/do Подозреваемый не числится в федеральном розыске.")
				wait(999)
				sampSendChat("/clear "..player_id)
				wait(999)
				sampSendChat("/c 60")
				create_log("Действие: снять с федерального розыска | Подозреваемый: "..player_name)
			end)	
		else
			sampAddChatMessage("", -1)
			sampAddChatMessage(helper.script.n.."Такого игрока нет!", -1)
			sampAddChatMessage("", -1)
		end
	end
end

function ahk_ejectout(info)
	player_id = string.match(info, "(%d+)")
	if player_id == nil then
		sampAddChatMessage("", -1)
		sampAddChatMessage(helper.script.n.." Используйте: "..fc.."/mejectout [ID игрока]", -1)
		sampAddChatMessage("", -1)
	else
		if sampIsPlayerConnected(player_id) then
			result, Ped = sampGetCharHandleBySampPlayerId(player_id)
			if result then
				player_name = sampGetPlayerNickname(player_id)
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."Вы выкинули игрока "..fc..player_name.." ["..player_id.."] "..sc.."из транспортного средства", -1)
				sampAddChatMessage("", -1)
				if developer_mode then
					sampAddChatMessage(helper.script.d.."/ejectout "..player_id, -1)
				end
				lua_thread.create(function()
					sampSendChat("/do Замок транспортного средства напротив цел.")
					wait(999)
					sampSendChat("/me резким движением руки достал сверт из рюкзака и засунул его в личинку замка")
					wait(999)
					sampSendChat("/todo Ломая личинку замка*сейчас достанем Вас..")
					wait(999)
					sampSendChat("/do Личинка замка сломана.")
					wait(999)
					sampSendChat("/me выкинул подозреваемого из транспортного средства")
					wait(999)
					sampSendChat("/ejectout "..player_id)
					wait(999)
					sampSendChat("/do Подозреваемый стоит рядом.")
					create_log("Действие: выкинуть из Т/С | Подозреваемый: "..player_name)
				end)	
			else
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."Игрок "..fc.."не находится "..sc.."в зоне стрима.", -1)
				sampAddChatMessage("", -1)
			end
		else
			sampAddChatMessage("", -1)
			sampAddChatMessage(helper.script.n.."Такого игрока нет!", -1)
			sampAddChatMessage("", -1)
		end
	end
end

function ahk_putpl(info)
	player_id = string.match(info, "(%d+)")
	if player_id == nil then
		sampAddChatMessage("", -1)
		sampAddChatMessage(helper.script.n.." Используйте: "..fc.."/mputpl [ID игрока]", -1)
		sampAddChatMessage("", -1)
	else
		if sampIsPlayerConnected(player_id) then
			result, Ped = sampGetCharHandleBySampPlayerId(player_id)
			if result then
				player_name = sampGetPlayerNickname(player_id)
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."Вы посадили игрока "..fc..player_name.." ["..player_id.."] "..sc.."в полицейский автомобиль", -1)
				sampAddChatMessage("", -1)
				if developer_mode then
					sampAddChatMessage(helper.script.d.."/putpl "..player_id, -1)
				end
				lua_thread.create(function()
					sampSendChat("/do Дверь полицейского автомобиля закрыта.")
					wait(999)
					sampSendChat("/me открыл дверь автомобиля")
					wait(999)
					sampSendChat("/do Дверь открыта.")
					wait(999)
					sampSendChat("/todo Садя подозреваемого в полицейский автомобиль*без резких движений!")
					wait(999)
					sampSendChat("/do Подозреваемый находится в машине.")
					wait(999)
					sampSendChat("/putpl "..player_id)
					create_log("Действие: посадить в полицейский автомобиль | Подозреваемый: "..player_name)
				end)	
			else
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."Игрок "..fc.."не находится "..sc.."в зоне стрима.", -1)
				sampAddChatMessage("", -1)
			end
		else
			sampAddChatMessage("", -1)
			sampAddChatMessage(helper.script.n.."Такого игрока нет!", -1)
			sampAddChatMessage("", -1)
		end
	end
end

function ahk_arrest(info)
	player_id = string.match(info, "(%d+)")
	if player_id == nil then
		sampAddChatMessage("", -1)
		sampAddChatMessage(helper.script.n.." Используйте: "..fc.."/marrest [ID игрока]", -1)
		sampAddChatMessage("", -1)
	else
		if sampIsPlayerConnected(player_id) then
			result, Ped = sampGetCharHandleBySampPlayerId(player_id)
			if result then
				player_name = sampGetPlayerNickname(player_id)
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."Вы арестовали игрока "..fc..player_name.." ["..player_id.."]", -1)
				sampAddChatMessage("", -1)
				if developer_mode then
					sampAddChatMessage(helper.script.d.."/arrest "..player_id, -1)
				end
				lua_thread.create(function()
					sampSendChat("/do Дверь полицейского участка закрыта.")
					wait(999)
					sampSendChat("/me открыл дверь участка")
					wait(999)
					sampSendChat("/do Дверь открыта.")
					wait(999)
					sampSendChat("/me передает информацию о преступнике дежурному")
					wait(999)
					sampSendChat("/do Дежурный осведомлен.")
					wait(999)
					sampSendChat("/todo Передавая преступника в КПЗ*ну вот, тут Вам и место..")
					wait(999)
					sampSendChat("/arrest "..player_id)
					wait(999)
					sampSendChat("/do Преступник передан в участок.")
					create_log("Действие: передать в участок | Преступник: "..player_name)
				end)	
			else
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."Игрок "..fc.."не находится "..sc.."в зоне стрима.", -1)
				sampAddChatMessage("", -1)
			end
		else
			sampAddChatMessage("", -1)
			sampAddChatMessage(helper.script.n.."Такого игрока нет!", -1)
			sampAddChatMessage("", -1)
		end
	end
end


function ahk_search()

end

function ahk_setfree()

end

function choose_lecture(lecture_number, lecture_type)
	if developer_mode then
		sampAddChatMessage(helper.script.d.." lecture_number = "..lecture_number, -1)
		sampAddChatMessage(helper.script.d.." lecture_type = "..lecture_type, -1)
	end
	if lecture_start == false then
		if helper.cfg.t_l_1 == true and helper.cfg.t_l_2 == true and helper.cfg.t_l_3 == true and helper.cfg.t_l_4 == true and helper.cfg.t_l_5 == true and helper.cfg.t_l_6 == true and helper.cfg.t_l_7 == true and helper.cfg.t_l_8 == true and helper.cfg.t_l_9 == true and helper.cfg.t_l_10 == true then 
			if developer_mode then
				sampAddChatMessage(helper.script.d.." Все лекции были сделаны, начинаю их по новой.")
			end
			helper.cfg.t_l_1 = false
			helper.cfg.t_l_2 = false
			helper.cfg.t_l_3 = false
			helper.cfg.t_l_4 = false
			helper.cfg.t_l_5 = false
			helper.cfg.t_l_6 = false
			helper.cfg.t_l_7 = false
			helper.cfg.t_l_8 = false
			helper.cfg.t_l_9 = false
			helper.cfg.t_l_10 = false
			choose_lecture(0, 1)
		else
			if lecture_number == 0 then
				lecture_number = random_number(1, 10)
				if developer_mode then
					sampAddChatMessage(helper.script.d.." Выбор пал на лекцию "..fc.."#"..lecture_number)
				end
				choose_lecture(lecture_number, 1)
			elseif lecture_number == 1 then
				if helper.cfg.t_l_1 == true and lecture_type ~= 0 then
					lua_thread.create(function()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Данная лекция была недавно, перевыбор..", -1)
						end
						wait(222)
						choose_lecture(2, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Начинаю воспроизводить лекцию "..fc.."#"..lecture_number, -1)
					end
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("Здравия желаю, бойцы. Сейчас пройдет лекция на тему 'Рация'.", -1)
						wait(1111)
						sampSendChat("Рация используется для передачи важной информации между сотрудниками.", -1)
						wait(1111)
						sampSendChat("Например, для доклада о состоянии на посту, или же в патруле или погоне.", -1)
						wait(1111)
						sampSendChat("Также её можно использовать для связи с другими сотрудниками.", -1)
						wait(1111)
						sampSendChat("При использоваии рации запрещено:", -1)
						wait(1111)
						sampSendChat("Нарушать субординацию.", -1)
						wait(1111)
						sampSendChat("Использовать рацию для маркетинга (покупка/продажа/реклама).", -1)
						wait(1111)
						sampSendChat("/n В /rr так же запрещено писать о покупке/продаже чего-либо.", -1)
						wait(1111)	
						sampSendChat("В рацию запрещены разговоры не по теме и выяснение личных отношений.", -1)
						wait(1111)
						sampSendChat("Использовать нецензурную лексику и повторять сообщения более 2-х раз.", -1)
						wait(1111)
						sampSendChat("За любой из выше перечисленных пунктов Вы будете наказаны выговором.", -1)
						wait(1111)
						sampSendChat("На этом лекция окончена. Вопросы есть?", -1)
						wait(1111)
						sampSendChat("/c 60", -1)
						wait(1111)
						screenshot()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = false", -1)
						end
						lecture_start = false
						wait(4444)
						sampShowDialog(42525, dn.mform_2_1, d.mform_2_1, b.confirm, b.close, 0)
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Диалог ацепт трени [ID 42525]", -1)
							sampAddChatMessage(helper.script.d.." INFO: 1) dn.mform_2_1 2) d.mform_2_1 3) 0 ", -1)
						end
					end)
					helper.cfg.t_l_1 = true
					if inicfg.save(helper, directIni) then					
						if developer_mode then
							sampAddChatMessage(helper.script.d.." helper.cfg.t_l_1 = true", -1)
						end
						helper = inicfg.load(nil, directIni)
					end
				end
			elseif lecture_number == 2 then
				if helper.cfg.t_l_2 == true and lecture_type ~= 0 then
					lua_thread.create(function()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Данная лекция была недавно, перевыбор..", -1)
						end
						wait(222)
						choose_lecture(3, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Начинаю воспроизводить лекцию "..fc.."#"..lecture_number, -1)
					end		
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("Здравия желаю, бойцы. Сейчас пройдет лекция на тему 'Построение'.", -1)
						wait(1111)
						sampSendChat("Сотрудникам запрещено вставать в строй без разрешения если строй начался.", -1)
						wait(1111)
						sampSendChat("Если Вы опоздали, то Вы обязаны отдать честь и спросить разрешения встать в строй.", -1)
						wait(1111)
						sampSendChat("Покидать строй без разрешения так же запрещено.", -1)
						wait(1111)
						sampSendChat("За это можно получить дисцилинарное взыскание или выговор.", -1)
						wait(1111)
						sampSendChat("Находять в строю запрещено:", -1)
						wait(1111)
						sampSendChat("Разговаривать, пользоваться мобильными устройствами, есть и пить.", -1)
						wait(1111)
						sampSendChat("Доставать и использовать вооружение.", -1)
						wait(1111)
						sampSendChat("Засыпать более чем на 60 секунд.", -1)
						wait(1111)
						sampSendChat("Чтобы что-то сказать из строя требуется спросить разрешение: 'Разрешите спросить?'.", -1)
						wait(1111)
						sampSendChat("В строю все обязаны стоять в стойке 'Смирно'.", -1)
						wait(1111)
						sampSendChat("За любые другие движения и стойки Вы будете наказаны.", -1)
						wait(1111)
						sampSendChat("Также запрещено мешать проводить строй.", -1)
						wait(1111)
						sampSendChat("За это Вы будете сильно наказаны.", -1)
						wait(1111)
						sampSendChat("На этом моменте лекция подошла к концу. Вопросы есть?", -1)
						wait(1111)
						sampSendChat("/c 60", -1)
						wait(1111)
						screenshot()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = false", -1)
						end
						lecture_start = false
						wait(4444)
						sampShowDialog(42525, dn.mform_2_1, d.mform_2_1, b.confirm, b.close, 0)
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Диалог ацепт трени [ID 42525]", -1)
							sampAddChatMessage(helper.script.d.." INFO: 1) dn.mform_2_1 2) d.mform_2_1 3) 0 ", -1)
						end
					end)
					helper.cfg.t_l_2 = true
					if inicfg.save(helper, directIni) then					
						if developer_mode then
							sampAddChatMessage(helper.script.d.." helper.cfg.t_l_2 = true", -1)
						end
						helper = inicfg.load(nil, directIni)
					end
				end
			elseif lecture_number == 3 then
				if helper.cfg.t_l_3 == true and lecture_type ~= 0 then
					lua_thread.create(function()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Данная лекция была недавно, перевыбор..", -1)
						end
						wait(222)
						choose_lecture(4, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Начинаю воспроизводить лекцию "..fc.."#"..lecture_number, -1)
					end	
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("Здравия желаю, бойцы. Сейчас будет лекция. Тема: 'Пост'.", -1)
						wait(1111)
						sampSendChat("Существует несколько типов постов: для Академии, ДПС и ППС.", -1)
						wait(1111)
						sampSendChat("Для подразделения академия посты 'Вход' и 'КПП'.", -1)
						wait(1111)
						sampSendChat("Для подразделения ДПС, МБ, СЭ посты на трассах с будками и шлагбаумами.", -1)
						wait(1111)
						sampSendChat("Для подразделения ППС, ОМОН, ОКН посты на вокзалах, общественных местах.", -1)
						wait(1111)
						sampSendChat("В одиночку стоять на постах нежелательно, нужен напарник.", -1)
						wait(1111)
						sampSendChat("Исключение: с 00:00 до 6:00.", -1)
						wait(1111)
						sampSendChat("Доклады в рацию должны звучать каждые 10 минут и включать в себя:", -1)
						wait(1111)
						sampSendChat("1. В начале должно прозвучать Звание и Имя Фамилия докладчика", -1)
						wait(1111)
						sampSendChat("2. Дальше необходимо должить о напарнике или напарниках. Называете номер жетона.", -1)
						wait(1111)
						sampSendChat("3. В заключении, доложить о состоянии: стабильное, ЧП.", -1)
						wait(1111)
						sampSendChat("На этом лекция окончена. Вопросы есть?", -1)
						wait(1111)
						sampSendChat("/c 60", -1)
						wait(1111)
						screenshot()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = false", -1)
						end
						lecture_start = false
						wait(4444)
						sampShowDialog(42525, dn.mform_2_1, d.mform_2_1, b.confirm, b.close, 0)
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Диалог ацепт трени [ID 42525]", -1)
							sampAddChatMessage(helper.script.d.." INFO: 1) dn.mform_2_1 2) d.mform_2_1 3) 0 ", -1)
						end
					end)
					helper.cfg.t_l_3 = true
					if inicfg.save(helper, directIni) then					
						if developer_mode then
							sampAddChatMessage(helper.script.d.." helper.cfg.t_l_3 = true", -1)
						end
						helper = inicfg.load(nil, directIni)
					end
				end
			elseif lecture_number == 4 then 
				if helper.cfg.t_l_4 == true and lecture_type ~= 0 then
					lua_thread.create(function()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Данная лекция была недавно, перевыбор..", -1)
						end
						wait(222)
						choose_lecture(5, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Начинаю воспроизводить лекцию "..fc.."#"..lecture_number, -1)
					end		
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("/c 60", -1)
						wait(1111)
						screenshot()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = false", -1)
						end
						lecture_start = false
						wait(4444)
						sampShowDialog(42525, dn.mform_2_1, d.mform_2_1, b.confirm, b.close, 0)
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Диалог ацепт трени [ID 42525]", -1)
							sampAddChatMessage(helper.script.d.." INFO: 1) dn.mform_2_1 2) d.mform_2_1 3) 0 ", -1)
						end
					end)
					helper.cfg.t_l_4 = true
					if inicfg.save(helper, directIni) then					
						if developer_mode then
							sampAddChatMessage(helper.script.d.." helper.cfg.t_l_4 = true", -1)
						end
						helper = inicfg.load(nil, directIni)
					end
				end
			elseif lecture_number == 5 then
				if helper.cfg.t_l_5 == true and lecture_type ~= 0 then
					lua_thread.create(function()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Данная лекция была недавно, перевыбор..", -1)
						end
						wait(222)
						choose_lecture(6, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Начинаю воспроизводить лекцию "..fc.."#"..lecture_number, -1)
					end		
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("/c 60", -1)
						wait(1111)
						screenshot()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = false", -1)
						end
						lecture_start = false
						wait(4444)
						sampShowDialog(42525, dn.mform_2_1, d.mform_2_1, b.confirm, b.close, 0)
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Диалог ацепт трени [ID 42525]", -1)
							sampAddChatMessage(helper.script.d.." INFO: 1) dn.mform_2_1 2) d.mform_2_1 3) 0 ", -1)
						end
					end)
					helper.cfg.t_l_5 = true
					if inicfg.save(helper, directIni) then					
						if developer_mode then
							sampAddChatMessage(helper.script.d.." helper.cfg.t_l_5 = true", -1)
						end
						helper = inicfg.load(nil, directIni)
					end					
				end
			elseif lecture_number == 6 then
				if helper.cfg.t_l_6 == true and lecture_type ~= 0 then
					lua_thread.create(function()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Данная лекция была недавно, перевыбор..", -1)
						end
						wait(222)
						choose_lecture(7, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Начинаю воспроизводить лекцию "..fc.."#"..lecture_number, -1)
					end		
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("/c 60", -1)
						wait(1111)
						screenshot()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = false", -1)
						end
						lecture_start = false
						wait(4444)
						sampShowDialog(42525, dn.mform_2_1, d.mform_2_1, b.confirm, b.close, 0)
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Диалог ацепт трени [ID 42525]", -1)
							sampAddChatMessage(helper.script.d.." INFO: 1) dn.mform_2_1 2) d.mform_2_1 3) 0 ", -1)
						end
					end)
					helper.cfg.t_l_6 = true
					if inicfg.save(helper, directIni) then					
						if developer_mode then
							sampAddChatMessage(helper.script.d.." helper.cfg.t_l_6 = true", -1)
						end
						helper = inicfg.load(nil, directIni)
					end				
				end
			elseif lecture_number == 7 then
				if helper.cfg.t_l_7 == true and lecture_type ~= 0 then
					lua_thread.create(function()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Данная лекция была недавно, перевыбор..", -1)
						end
						wait(222)
						choose_lecture(8, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Начинаю воспроизводить лекцию "..fc.."#"..lecture_number, -1)
					end	
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("/c 60", -1)
						wait(1111)
						screenshot()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = false", -1)
						end
						lecture_start = false
						wait(4444)
						sampShowDialog(42525, dn.mform_2_1, d.mform_2_1, b.confirm, b.close, 0)
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Диалог ацепт трени [ID 42525]", -1)
							sampAddChatMessage(helper.script.d.." INFO: 1) dn.mform_2_1 2) d.mform_2_1 3) 0 ", -1)
						end
					end)
					helper.cfg.t_l_7 = true
					if inicfg.save(helper, directIni) then					
						if developer_mode then
							sampAddChatMessage(helper.script.d.." helper.cfg.t_l_7 = true", -1)
						end
						helper = inicfg.load(nil, directIni)
					end					
				end
			elseif lecture_number == 8 then
				if helper.cfg.t_l_8 == true and lecture_type ~= 0 then
					lua_thread.create(function()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Данная лекция была недавно, перевыбор..", -1)
						end
						wait(222)
						choose_lecture(9, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Начинаю воспроизводить лекцию "..fc.."#"..lecture_number, -1)
					end	
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("/c 60", -1)
						wait(1111)
						screenshot()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = false", -1)
						end
						lecture_start = false
						wait(4444)
						sampShowDialog(42525, dn.mform_2_1, d.mform_2_1, b.confirm, b.close, 0)
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Диалог ацепт трени [ID 42525]", -1)
							sampAddChatMessage(helper.script.d.." INFO: 1) dn.mform_2_1 2) d.mform_2_1 3) 0 ", -1)
						end
					end)
					helper.cfg.t_l_8 = true
					if inicfg.save(helper, directIni) then					
						if developer_mode then
							sampAddChatMessage(helper.script.d.." helper.cfg.t_l_8 = true", -1)
						end
						helper = inicfg.load(nil, directIni)
					end				
				end
			elseif lecture_number == 9 then
				if helper.cfg.t_l_9 == true and lecture_type ~= 0 then
					lua_thread.create(function()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Данная лекция была недавно, перевыбор..", -1)
						end
						wait(222)
						choose_lecture(10, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Начинаю воспроизводить лекцию "..fc.."#"..lecture_number, -1)
					end		
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("/c 60", -1)
						wait(1111)
						screenshot()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = false", -1)
						end
						lecture_start = false
						wait(4444)
						sampShowDialog(42525, dn.mform_2_1, d.mform_2_1, b.confirm, b.close, 0)
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Диалог ацепт трени [ID 42525]", -1)
							sampAddChatMessage(helper.script.d.." INFO: 1) dn.mform_2_1 2) d.mform_2_1 3) 0 ", -1)
						end
					end)
					helper.cfg.t_l_9 = true
					if inicfg.save(helper, directIni) then					
						if developer_mode then
							sampAddChatMessage(helper.script.d.." helper.cfg.t_l_9 = true", -1)
						end
						helper = inicfg.load(nil, directIni)
					end				
				end
			elseif lecture_number == 10 then
				if helper.cfg.t_l_10 == true and lecture_type ~= 0 then
					lua_thread.create(function()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Данная лекция была недавно, перевыбор..", -1)
						end
						wait(222)
						choose_lecture(1, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Начинаю воспроизводить лекцию "..fc.."#"..lecture_number, -1)
					end	
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("/c 60", -1)
						wait(1111)
						screenshot()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = false", -1)
						end
						lecture_start = false
						wait(4444)
						sampShowDialog(42525, dn.mform_2_1, d.mform_2_1, b.confirm, b.close, 0)
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Диалог ацепт трени [ID 42525]", -1)
							sampAddChatMessage(helper.script.d.." INFO: 1) dn.mform_2_1 2) d.mform_2_1 3) 0 ", -1)
						end
					end)
					helper.cfg.t_l_10 = true
					if inicfg.save(helper, directIni) then					
						if developer_mode then
							sampAddChatMessage(helper.script.d.." helper.cfg.t_l_10 = true", -1)
						end
						helper = inicfg.load(nil, directIni)
					end			
				end
			end
		end
	elseif lecture_start == true then
		sampAddChatMessage(helper.script.n.."Вы сейчас уже проводите "..fc.."лекцию", -1)
		sampAddChatMessage(helper.script.n.."Пожалуйста, дождитесь её окончания", -1)
	end	
end
function choose_lecture(lecture_number, lecture_type)
	if developer_mode then
		sampAddChatMessage(helper.script.d.." lecture_number = "..lecture_number, -1)
		sampAddChatMessage(helper.script.d.." lecture_type = "..lecture_type, -1)
	end
	if lecture_start == false then
		if helper.cfg.t_l_1 == true and helper.cfg.t_l_2 == true and helper.cfg.t_l_3 == true and helper.cfg.t_l_4 == true and helper.cfg.t_l_5 == true and helper.cfg.t_l_6 == true and helper.cfg.t_l_7 == true and helper.cfg.t_l_8 == true and helper.cfg.t_l_9 == true and helper.cfg.t_l_10 == true then 
			if developer_mode then
				sampAddChatMessage(helper.script.d.." Все лекции были сделаны, начинаю их по новой.")
			end
			helper.cfg.t_l_1 = false
			helper.cfg.t_l_2 = false
			helper.cfg.t_l_3 = false
			helper.cfg.t_l_4 = false
			helper.cfg.t_l_5 = false
			helper.cfg.t_l_6 = false
			helper.cfg.t_l_7 = false
			helper.cfg.t_l_8 = false
			helper.cfg.t_l_9 = false
			helper.cfg.t_l_10 = false
			choose_lecture(0, 1)
		else
			if lecture_number == 0 then
				lecture_number = random_number(1, 10)
				if developer_mode then
					sampAddChatMessage(helper.script.d.." Выбор пал на лекцию "..fc.."#"..lecture_number)
				end
				choose_lecture(lecture_number, 1)
			elseif lecture_number == 1 then
				if helper.cfg.t_l_1 == true and lecture_type ~= 0 then
					lua_thread.create(function()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Данная лекция была недавно, перевыбор..", -1)
						end
						wait(222)
						choose_lecture(2, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Начинаю воспроизводить лекцию "..fc.."#"..lecture_number, -1)
					end
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("Здравия желаю, бойцы. Сейчас пройдет лекция на тему 'Рация'.", -1)
						wait(1111)
						sampSendChat("Рация используется для передачи важной информации между сотрудниками.", -1)
						wait(1111)
						sampSendChat("Например, для доклада о состоянии на посту, или же в патруле или погоне.", -1)
						wait(1111)
						sampSendChat("Также её можно использовать для связи с другими сотрудниками.", -1)
						wait(1111)
						sampSendChat("При использоваии рации запрещено:", -1)
						wait(1111)
						sampSendChat("Нарушать субординацию.", -1)
						wait(1111)
						sampSendChat("Использовать рацию для маркетинга (покупка/продажа/реклама).", -1)
						wait(1111)
						sampSendChat("/n В /rr так же запрещено писать о покупке/продаже чего-либо.", -1)
						wait(1111)	
						sampSendChat("В рацию запрещены разговоры не по теме и выяснение личных отношений.", -1)
						wait(1111)
						sampSendChat("Использовать нецензурную лексику и повторять сообщения более 2-х раз.", -1)
						wait(1111)
						sampSendChat("За любой из выше перечисленных пунктов Вы будете наказаны выговором.", -1)
						wait(1111)
						sampSendChat("На этом лекция окончена. Вопросы есть?", -1)
						wait(1111)
						sampSendChat("/c 60", -1)
						wait(1111)
						screenshot()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = false", -1)
						end
						lecture_start = false
						wait(4444)
						sampShowDialog(42525, dn.mform_2_1, d.mform_2_1, b.confirm, b.close, 0)
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Диалог ацепт трени [ID 42525]", -1)
							sampAddChatMessage(helper.script.d.." INFO: 1) dn.mform_2_1 2) d.mform_2_1 3) 0 ", -1)
						end
					end)
					helper.cfg.t_l_1 = true
					if inicfg.save(helper, directIni) then					
						if developer_mode then
							sampAddChatMessage(helper.script.d.." helper.cfg.t_l_1 = true", -1)
						end
						helper = inicfg.load(nil, directIni)
					end
				end
			elseif lecture_number == 2 then
				if helper.cfg.t_l_2 == true and lecture_type ~= 0 then
					lua_thread.create(function()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Данная лекция была недавно, перевыбор..", -1)
						end
						wait(222)
						choose_lecture(3, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Начинаю воспроизводить лекцию "..fc.."#"..lecture_number, -1)
					end		
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("Здравия желаю, бойцы. Сейчас пройдет лекция на тему 'Построение'.", -1)
						wait(1111)
						sampSendChat("Сотрудникам запрещено вставать в строй без разрешения если строй начался.", -1)
						wait(1111)
						sampSendChat("Если Вы опоздали, то Вы обязаны отдать честь и спросить разрешения встать в строй.", -1)
						wait(1111)
						sampSendChat("Покидать строй без разрешения так же запрещено.", -1)
						wait(1111)
						sampSendChat("За это можно получить дисцилинарное взыскание или выговор.", -1)
						wait(1111)
						sampSendChat("Находять в строю запрещено:", -1)
						wait(1111)
						sampSendChat("Разговаривать, пользоваться мобильными устройствами, есть и пить.", -1)
						wait(1111)
						sampSendChat("Доставать и использовать вооружение.", -1)
						wait(1111)
						sampSendChat("Засыпать более чем на 60 секунд.", -1)
						wait(1111)
						sampSendChat("Чтобы что-то сказать из строя требуется спросить разрешение: 'Разрешите спросить?'.", -1)
						wait(1111)
						sampSendChat("В строю все обязаны стоять в стойке 'Смирно'.", -1)
						wait(1111)
						sampSendChat("За любые другие движения и стойки Вы будете наказаны.", -1)
						wait(1111)
						sampSendChat("Также запрещено мешать проводить строй.", -1)
						wait(1111)
						sampSendChat("За это Вы будете сильно наказаны.", -1)
						wait(1111)
						sampSendChat("На этом моменте лекция подошла к концу. Вопросы есть?", -1)
						wait(1111)
						sampSendChat("/c 60", -1)
						wait(1111)
						screenshot()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = false", -1)
						end
						lecture_start = false
						wait(4444)
						sampShowDialog(42525, dn.mform_2_1, d.mform_2_1, b.confirm, b.close, 0)
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Диалог ацепт трени [ID 42525]", -1)
							sampAddChatMessage(helper.script.d.." INFO: 1) dn.mform_2_1 2) d.mform_2_1 3) 0 ", -1)
						end
					end)
					helper.cfg.t_l_2 = true
					if inicfg.save(helper, directIni) then					
						if developer_mode then
							sampAddChatMessage(helper.script.d.." helper.cfg.t_l_2 = true", -1)
						end
						helper = inicfg.load(nil, directIni)
					end
				end
			elseif lecture_number == 3 then
				if helper.cfg.t_l_3 == true and lecture_type ~= 0 then
					lua_thread.create(function()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Данная лекция была недавно, перевыбор..", -1)
						end
						wait(222)
						choose_lecture(4, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Начинаю воспроизводить лекцию "..fc.."#"..lecture_number, -1)
					end	
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("Здравия желаю, бойцы. Сейчас будет лекция. Тема: 'Пост'.", -1)
						wait(1111)
						sampSendChat("Существует несколько типов постов: для Академии, ДПС и ППС.", -1)
						wait(1111)
						sampSendChat("Для подразделения академия посты 'Вход' и 'КПП'.", -1)
						wait(1111)
						sampSendChat("Для подразделения ДПС, МБ, СЭ посты на трассах с будками и шлагбаумами.", -1)
						wait(1111)
						sampSendChat("Для подразделения ППС, ОМОН, ОКН посты на вокзалах, общественных местах.", -1)
						wait(1111)
						sampSendChat("В одиночку стоять на постах нежелательно, нужен напарник.", -1)
						wait(1111)
						sampSendChat("Исключение: с 00:00 до 6:00.", -1)
						wait(1111)
						sampSendChat("Доклады в рацию должны звучать каждые 10 минут и включать в себя:", -1)
						wait(1111)
						sampSendChat("1. В начале должно прозвучать Звание и Имя Фамилия докладчика", -1)
						wait(1111)
						sampSendChat("2. Дальше необходимо должить о напарнике или напарниках. Называете номер жетона.", -1)
						wait(1111)
						sampSendChat("3. В заключении, доложить о состоянии: стабильное, ЧП.", -1)
						wait(1111)
						sampSendChat("На этом лекция окончена. Вопросы есть?", -1)
						wait(1111)
						sampSendChat("/c 60", -1)
						wait(1111)
						screenshot()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = false", -1)
						end
						lecture_start = false
						wait(4444)
						sampShowDialog(42525, dn.mform_2_1, d.mform_2_1, b.confirm, b.close, 0)
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Диалог ацепт трени [ID 42525]", -1)
							sampAddChatMessage(helper.script.d.." INFO: 1) dn.mform_2_1 2) d.mform_2_1 3) 0 ", -1)
						end
					end)
					helper.cfg.t_l_3 = true
					if inicfg.save(helper, directIni) then					
						if developer_mode then
							sampAddChatMessage(helper.script.d.." helper.cfg.t_l_3 = true", -1)
						end
						helper = inicfg.load(nil, directIni)
					end
				end
			elseif lecture_number == 4 then 
				if helper.cfg.t_l_4 == true and lecture_type ~= 0 then
					lua_thread.create(function()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Данная лекция была недавно, перевыбор..", -1)
						end
						wait(222)
						choose_lecture(5, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Начинаю воспроизводить лекцию "..fc.."#"..lecture_number, -1)
					end		
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("/c 60", -1)
						wait(1111)
						screenshot()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = false", -1)
						end
						lecture_start = false
						wait(4444)
						sampShowDialog(42525, dn.mform_2_1, d.mform_2_1, b.confirm, b.close, 0)
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Диалог ацепт трени [ID 42525]", -1)
							sampAddChatMessage(helper.script.d.." INFO: 1) dn.mform_2_1 2) d.mform_2_1 3) 0 ", -1)
						end
					end)
					helper.cfg.t_l_4 = true
					if inicfg.save(helper, directIni) then					
						if developer_mode then
							sampAddChatMessage(helper.script.d.." helper.cfg.t_l_4 = true", -1)
						end
						helper = inicfg.load(nil, directIni)
					end
				end
			elseif lecture_number == 5 then
				if helper.cfg.t_l_5 == true and lecture_type ~= 0 then
					lua_thread.create(function()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Данная лекция была недавно, перевыбор..", -1)
						end
						wait(222)
						choose_lecture(6, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Начинаю воспроизводить лекцию "..fc.."#"..lecture_number, -1)
					end		
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("/c 60", -1)
						wait(1111)
						screenshot()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = false", -1)
						end
						lecture_start = false
						wait(4444)
						sampShowDialog(42525, dn.mform_2_1, d.mform_2_1, b.confirm, b.close, 0)
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Диалог ацепт трени [ID 42525]", -1)
							sampAddChatMessage(helper.script.d.." INFO: 1) dn.mform_2_1 2) d.mform_2_1 3) 0 ", -1)
						end
					end)
					helper.cfg.t_l_5 = true
					if inicfg.save(helper, directIni) then					
						if developer_mode then
							sampAddChatMessage(helper.script.d.." helper.cfg.t_l_5 = true", -1)
						end
						helper = inicfg.load(nil, directIni)
					end					
				end
			elseif lecture_number == 6 then
				if helper.cfg.t_l_6 == true and lecture_type ~= 0 then
					lua_thread.create(function()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Данная лекция была недавно, перевыбор..", -1)
						end
						wait(222)
						choose_lecture(7, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Начинаю воспроизводить лекцию "..fc.."#"..lecture_number, -1)
					end		
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("/c 60", -1)
						wait(1111)
						screenshot()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = false", -1)
						end
						lecture_start = false
						wait(4444)
						sampShowDialog(42525, dn.mform_2_1, d.mform_2_1, b.confirm, b.close, 0)
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Диалог ацепт трени [ID 42525]", -1)
							sampAddChatMessage(helper.script.d.." INFO: 1) dn.mform_2_1 2) d.mform_2_1 3) 0 ", -1)
						end
					end)
					helper.cfg.t_l_6 = true
					if inicfg.save(helper, directIni) then					
						if developer_mode then
							sampAddChatMessage(helper.script.d.." helper.cfg.t_l_6 = true", -1)
						end
						helper = inicfg.load(nil, directIni)
					end				
				end
			elseif lecture_number == 7 then
				if helper.cfg.t_l_7 == true and lecture_type ~= 0 then
					lua_thread.create(function()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Данная лекция была недавно, перевыбор..", -1)
						end
						wait(222)
						choose_lecture(8, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Начинаю воспроизводить лекцию "..fc.."#"..lecture_number, -1)
					end	
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("/c 60", -1)
						wait(1111)
						screenshot()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = false", -1)
						end
						lecture_start = false
						wait(4444)
						sampShowDialog(42525, dn.mform_2_1, d.mform_2_1, b.confirm, b.close, 0)
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Диалог ацепт трени [ID 42525]", -1)
							sampAddChatMessage(helper.script.d.." INFO: 1) dn.mform_2_1 2) d.mform_2_1 3) 0 ", -1)
						end
					end)
					helper.cfg.t_l_7 = true
					if inicfg.save(helper, directIni) then					
						if developer_mode then
							sampAddChatMessage(helper.script.d.." helper.cfg.t_l_7 = true", -1)
						end
						helper = inicfg.load(nil, directIni)
					end					
				end
			elseif lecture_number == 8 then
				if helper.cfg.t_l_8 == true and lecture_type ~= 0 then
					lua_thread.create(function()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Данная лекция была недавно, перевыбор..", -1)
						end
						wait(222)
						choose_lecture(9, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Начинаю воспроизводить лекцию "..fc.."#"..lecture_number, -1)
					end	
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("/c 60", -1)
						wait(1111)
						screenshot()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = false", -1)
						end
						lecture_start = false
						wait(4444)
						sampShowDialog(42525, dn.mform_2_1, d.mform_2_1, b.confirm, b.close, 0)
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Диалог ацепт трени [ID 42525]", -1)
							sampAddChatMessage(helper.script.d.." INFO: 1) dn.mform_2_1 2) d.mform_2_1 3) 0 ", -1)
						end
					end)
					helper.cfg.t_l_8 = true
					if inicfg.save(helper, directIni) then					
						if developer_mode then
							sampAddChatMessage(helper.script.d.." helper.cfg.t_l_8 = true", -1)
						end
						helper = inicfg.load(nil, directIni)
					end				
				end
			elseif lecture_number == 9 then
				if helper.cfg.t_l_9 == true and lecture_type ~= 0 then
					lua_thread.create(function()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Данная лекция была недавно, перевыбор..", -1)
						end
						wait(222)
						choose_lecture(10, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Начинаю воспроизводить лекцию "..fc.."#"..lecture_number, -1)
					end		
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("/c 60", -1)
						wait(1111)
						screenshot()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = false", -1)
						end
						lecture_start = false
						wait(4444)
						sampShowDialog(42525, dn.mform_2_1, d.mform_2_1, b.confirm, b.close, 0)
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Диалог ацепт трени [ID 42525]", -1)
							sampAddChatMessage(helper.script.d.." INFO: 1) dn.mform_2_1 2) d.mform_2_1 3) 0 ", -1)
						end
					end)
					helper.cfg.t_l_9 = true
					if inicfg.save(helper, directIni) then					
						if developer_mode then
							sampAddChatMessage(helper.script.d.." helper.cfg.t_l_9 = true", -1)
						end
						helper = inicfg.load(nil, directIni)
					end				
				end
			elseif lecture_number == 10 then
				if helper.cfg.t_l_10 == true and lecture_type ~= 0 then
					lua_thread.create(function()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Данная лекция была недавно, перевыбор..", -1)
						end
						wait(222)
						choose_lecture(1, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Начинаю воспроизводить лекцию "..fc.."#"..lecture_number, -1)
					end	
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("", -1)
						wait(1111)
						sampSendChat("/c 60", -1)
						wait(1111)
						screenshot()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = false", -1)
						end
						lecture_start = false
						wait(4444)
						sampShowDialog(42525, dn.mform_2_1, d.mform_2_1, b.confirm, b.close, 0)
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Диалог ацепт трени [ID 42525]", -1)
							sampAddChatMessage(helper.script.d.." INFO: 1) dn.mform_2_1 2) d.mform_2_1 3) 0 ", -1)
						end
					end)
					helper.cfg.t_l_10 = true
					if inicfg.save(helper, directIni) then					
						if developer_mode then
							sampAddChatMessage(helper.script.d.." helper.cfg.t_l_10 = true", -1)
						end
						helper = inicfg.load(nil, directIni)
					end			
				end
			end
		end
	elseif lecture_start == true then
		sampAddChatMessage(helper.script.n.."Вы сейчас уже проводите "..fc.."лекцию", -1)
		sampAddChatMessage(helper.script.n.."Пожалуйста, дождитесь её окончания", -1)
	end	
end


function workout()
	if developer_mode then
		sampAddChatMessage(helper.script.d.." workout = "..lecture_number, -1)
		sampAddChatMessage(helper.script.d.." lecture_type = "..lecture_type, -1)
	end
	if lecture_start == false then
		if helper.cfg.t_l_1 == true and helper.cfg.t_l_2 == true and helper.cfg.t_l_3 == true and helper.cfg.t_l_4 == true and helper.cfg.t_l_5 == true and helper.cfg.t_l_6 == true and helper.cfg.t_l_7 == true and helper.cfg.t_l_8 == true and helper.cfg.t_l_9 == true and helper.cfg.t_l_10 == true then 
			if developer_mode then
				sampAddChatMessage(helper.script.d.." Все лекции были сделаны, начинаю их по новой.")
			end
			helper.cfg.t_l_1 = false
			helper.cfg.t_l_2 = false
			helper.cfg.t_l_3 = false
			helper.cfg.t_l_4 = false
			helper.cfg.t_l_5 = false
			helper.cfg.t_l_6 = false
			helper.cfg.t_l_7 = false
			helper.cfg.t_l_8 = false
			helper.cfg.t_l_9 = false
			helper.cfg.t_l_10 = false
			choose_lecture(0, 1)
		else
			if lecture_number == 0 then
				lecture_number = random_number(1, 10)
				if developer_mode then
					sampAddChatMessage(helper.script.d.." Выбор пал на лекцию "..fc.."#"..lecture_number)
				end
				choose_lecture(lecture_number, 1)
			elseif lecture_number == 1 then
				if helper.cfg.t_l_1 == true and lecture_type ~= 0 then
					lua_thread.create(function()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Данная лекция была недавно, перевыбор..", -1)
						end
						wait(222)
						choose_lecture(2, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." Начинаю воспроизводить лекцию "..fc.."#"..lecture_number, -1)
					end
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("Здравия желаю, бойцы. Сейчас пройдет лекция на тему 'Рация'.", -1)
						wait(1111)
						sampSendChat("Рация используется для передачи важной информации между сотрудниками.", -1)
						wait(1111)
						sampSendChat("Например, для доклада о состоянии на посту, или же в патруле или погоне.", -1)
						wait(1111)
						sampSendChat("Также её можно использовать для связи с другими сотрудниками.", -1)
						wait(1111)
						sampSendChat("При использоваии рации запрещено:", -1)
						wait(1111)
						sampSendChat("Нарушать субординацию.", -1)
						wait(1111)
						sampSendChat("Использовать рацию для маркетинга (покупка/продажа/реклама).", -1)
						wait(1111)
						sampSendChat("/n В /rr так же запрещено писать о покупке/продаже чего-либо.", -1)
						wait(1111)	
						sampSendChat("В рацию запрещены разговоры не по теме и выяснение личных отношений.", -1)
						wait(1111)
						sampSendChat("Использовать нецензурную лексику и повторять сообщения более 2-х раз.", -1)
						wait(1111)
						sampSendChat("За любой из выше перечисленных пунктов Вы будете наказаны выговором.", -1)
						wait(1111)
						sampSendChat("На этом лекция окончена. Вопросы есть?", -1)
						wait(1111)
						sampSendChat("/c 60", -1)
						wait(1111)
						screenshot()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = false", -1)
						end
						lecture_start = false
						wait(4444)
						sampShowDialog(42525, dn.mform_2_1, d.mform_2_1, b.confirm, b.close, 0)
						if developer_mode then
							sampAddChatMessage(helper.script.d.." Диалог ацепт трени [ID 42525]", -1)
							sampAddChatMessage(helper.script.d.." INFO: 1) dn.mform_2_1 2) d.mform_2_1 3) 0 ", -1)
						end
					end)
					helper.cfg.t_l_1 = true
					if inicfg.save(helper, directIni) then					
						if developer_mode then
							sampAddChatMessage(helper.script.d.." helper.cfg.t_l_1 = true", -1)
						end
						helper = inicfg.load(nil, directIni)
					end
				end
			end
		end
	elseif lecture_start == true then
		sampAddChatMessage(helper.script.n.."Вы сейчас уже проводите "..fc.."лекцию", -1)
		sampAddChatMessage(helper.script.n.."Пожалуйста, дождитесь её окончания", -1)
	end	
end

function func_form()
	sampShowDialog(42518, dn.mform_1, d.mform_1, b.choose, b.close, 2)
	if developer_mode then
		sampAddChatMessage(helper.script.d.." Диалог построения [ID 42518]", -1)
		sampAddChatMessage(helper.script.d.." INFO: 1) dn.mform_1 2) d.mform_1 3) 2 ", -1)
	end
end

--d_id
-- 4251 - диалог выдачи штрафа
-- 4252 - 42515 - КоАПы
-- 42517 - ацепт выдачи штрафа
-- 42518-24 /mform
-- 42525 - ацепт на треню
-- 
--
--
--
--
--
--


function create_log(text)
	myServer = string.match(sampGetCurrentServerName(), "RADMIR RolePlay | Сервер: (%d+)")
	file = io.open(getGameDirectory().."//moonloader//MVD//mvd_log.txt", "a")
	time_now = os.date("%x %X")
	file:write(time_now.." | Ваш ник: "..myNick.." | Ваше звание: RANK | Сервер: "..myServer.." | "..text.."\n") 
	file:close()
end

function rusnick(info)
if info:match('%a+') then
        for k, v in pairs(trstl1) do
            info = info:gsub(k, v) 
        end
        for k, v in pairs(trstl) do
            info = info:gsub(k, v) 
        end
        return info
    end
 return info
end 

function screenshot() 
	if developer_mode then
		sampAddChatMessage(helper.script.d.." Вы успешно сделали скриншот экрана.")
	end
	lua_thread.create(function()
		setVirtualKeyDown(119, true)
		wait(10)
		setVirtualKeyDown(119, false)
	end)
end

function random_number(min, max)
    kf = math.random(min, max)
    math.randomseed(os.time() * kf)
    rand = math.random(min, max)
    return tonumber(rand)
end
