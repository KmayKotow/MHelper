local trstl1 = {['ph'] = '�',['Ph'] = '�',['Ch'] = '�',['ch'] = '�',['Th'] = '�',['th'] = '�',['Sh'] = '�',['sh'] = '�', ['ea'] = '�',['Ae'] = '�',['ae'] = '�',['size'] = '����',['Jj'] = '��������',['Whi'] = '���',['whi'] = '���',['Ck'] = '�',['ck'] = '�',['Kh'] = '�',['kh'] = '�',['hn'] = '�',['Hen'] = '���',['Zh'] = '�',['zh'] = '�',['Yu'] = '�',['yu'] = '�',['Yo'] = '�',['yo'] = '�',['Cz'] = '�',['cz'] = '�', ['ia'] = '�', ['ea'] = '�',['Ya'] = '�', ['ya'] = '�', ['ove'] = '��',['ay'] = '��', ['rise'] = '����',['oo'] = '�', ['Oo'] = '�'}
local trstl = {['B'] = '�',['Z'] = '�',['T'] = '�',['Y'] = '�',['P'] = '�',['J'] = '��',['X'] = '��',['G'] = '�',['V'] = '�',['H'] = '�',['N'] = '�',['E'] = '�',['I'] = '�',['D'] = '�',['O'] = '�',['K'] = '�',['F'] = '�',['y`'] = '�',['e`'] = '�',['A'] = '�',['C'] = '�',['L'] = '�',['M'] = '�',['W'] = '�',['Q'] = '�',['U'] = '�',['R'] = '�',['S'] = '�',['zm'] = '���',['h'] = '�',['q'] = '�',['y'] = '�',['a'] = '�',['w'] = '�',['b'] = '�',['v'] = '�',['g'] = '�',['d'] = '�',['e'] = '�',['z'] = '�',['i'] = '�',['j'] = '�',['k'] = '�',['l'] = '�',['m'] = '�',['n'] = '�',['o'] = '�',['p'] = '�',['r'] = '�',['s'] = '�',['t'] = '�',['u'] = '�',['f'] = '�',['x'] = 'x',['c'] = '�',['``'] = '�',['`'] = '�',['_'] = ' '}


script_version("0.2")

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
ticket_reason_all = "�� �������"
lecture_start = false

local dn = { }
dn.ticket_main = "������ ������"
dn.ticket_main_2 = "�������� ���-�� ���?"
dn.ticket_main_2 = "������������� ��������"
dn.ticket_1 = "���� � ��������� ����������� ������"
dn.ticket_2 = "���� � ���� �� ��������� ������"
dn.ticket_3 = "���� � ������ �������� ������� ���������"
dn.ticket_4 = "���� � �������� � ������������ �����"
dn.ticket_5 = "���� � �������� � ������������ �����, �������� �� �������� �� ����� ��������"
dn.ticket_6 = "���� � ������������� ����� ����. ����� � ����������"
dn.ticket_7 = "���� � ����������� ��������, ���������� ������������ ���������"
dn.ticket_8 = "���� � ������������� �������, �����������"
dn.ticket_9 = "���� � ����������� ��������"
dn.ticket_10 = "���� � ��������������� ����"
dn.ticket_11 = "���� � ���� � ��������� ����"
dn.ticket_12 = "���� � ������ ������������ � ����"
dn.ticket_13 = "���� � ���������"
dn.ticket_14 = "���� � ����� �������������� ����������"
dn.mform_1 = "���������� ������� � ����� ����"
dn.mform_2 = "���������� ������� � �����������"
dn.mform_3 = "���������� ������� � ���������"
dn.mform_4 = "���������� ������� � ����� ����������� �� �����"
dn.mform_5 = "���������� ������� � ������������ �����"
dn.mform_6 = "���������� ������� � ��������� �������������� ����������"
dn.mform_7 = "���������� ������� � ������"
dn.mform_2_1 = "���������� ������� � ����������"


local d = { }
d.ticket_main = "����� 1 � ��������� ����������� ������\n����� 2 � ���� �� ��������� ������\n����� 3 � ������ �������� ������� ���������.\n����� 4 � �������� � ������������ �����.\n����� 5 � �������� � ������������ �����, �������� �� �������� �� ����� ��������.\n����� 6 � ������������� ����� ����. ����� � ����������.\n����� 7 � ����������� ��������, ���������� ������������ ���������.\n����� 8 � ������������� �������, �����������.\n����� 9 � ����������� ��������.\n����� 10 � ��������������� ����.\n����� 11 � ���� � ��������� ����.\n����� 12 � ������ ������������ � ����.\n����� 13 � ���������.\n����� 14 � ����� �������������� ����������.\n� �������� ��������� ��������"
d.ticket_1 = "1.1 � ��������� ����������� ������.\n1.2 � ��������� ����������� ������, ���������� ���� ��������� ���."
d.ticket_2 = "2.1 � ���� �� ��������� ������.\n2.2 � ���� �� ��������� ������, ���������� ���� ��������� ���."
d.ticket_3 = "3.1 � ������ �������� ������� ���������.\n3.2 � ������ �������� ������� ���������, ���������� ���� ��������� ���."
d.ticket_4 = "4.1 � �������� ������������� �������� � ������������ �����."
d.ticket_5 = "5.1 � �������� ������������� �������� �� ��������, ������, ���������� �������� � ������ ������, ������������ ��� �������� ����.\n5.2 � �������� �� �������� �� ����� ��������."
d.ticket_6 = "6.1 � ������������� ����� ����. �����.\n6.2 � �� ������������� ����� ����. �����, ���������� ���� ��������� ���.\n6.3 � �� ������������� ���������� ���������� ���."
d.ticket_7 = "7.1 � ����������� �������� ������������ ���������.\n7.2 � �������� ��������� �������� �� ������ ��������.\n7.3 � ���������� ������������ ��������� ��� ����������� �������� ����� ���.\n7.4 � ���������� ������������ ��������� � ����������� ���������."
d.ticket_8 = "8.1 � ������������� ������������� �������.\n8.2 � ����������� �������.\n8.3 � ����������� ���������� ��� ����������."
d.ticket_9 = "9.1 � ����������� ��������, ������� ����� �������� � ���."
d.ticket_10 = "10.1 � ������������ �� ������������ �������� ��� ���������������� �����."
d.ticket_11 = "11.1 � ���� � ��������� ����.\n11.2 � ���� � ��������� ���� ���������� ���� ��������� ���."
d.ticket_12 = "12.1 � ���� �� ������������ �������� ��� ����� ������������.\n12.2 � ���� ��� ��������� ����� �� ��������������."
d.ticket_13 = "13.1 � ���� �� ������������ ��������, ������ �������� ����� ������� ���������������� ����� 70%."
d.ticket_14 = "14.1 � �����/��������� ���������� ������������ ���������� ������������� ��������.\n14.2 � �����/��������� ���������� ������������ ���������� ���������� �� ���������."
d.mform_1 = "� � ����������� �����\n� � ��������� �� �����"
d.mform_2 = "� ������� ����������� �� �����\n� ������������� �����\n� ������ �������������� ����������\n� ������ �����"
d.mform_3 = "� ������� ����������� �� �����\n� ������������� �����\n� ������ �������������� ����������\n� ������ �����"
d.mform_4 = "������� �������� �����, ����� ����� ����� ����� ������ �����������\n��������: 3 (������)"
d.mform_5 = "������� �������� �������, �� ����� �� ������ ������������� ����������\n��������: 17:45"
d.mform_6 = "������� ����� ����������, � �������� ������ ������ ��������������\n��������: 4-2-5"
d.mform_7 = "� ������� ��������� ������ �� ������\n� ������ �1\n� ������ �2\n� ������ �3\n� ������ �4\n� ������ �5\n� ������ �6\n� ������ �7\n� ������ �8\n� ������ �9\n� ������ �10"

d.mform_2_1 = "�� ������ ��� ��������� ��������� ������\n�� ������ ������ ����������?"

local b = { }
b.choose = "�������"
b.confirm = "�����������"
b.close = "�������"

local inicfg = require 'inicfg'
directIni = '../config/mvdhelper_ahk.ini'
helper = inicfg.load(inicfg.load({
    script = {
		fc = "{f50029}",
		sc = "{FFFFFF}",
		tc = "{cccccc}",
		foc = "{00e600}",
		n = "{f50029}MHelper {cccccc}� {FFFFFF}",
		d = "{f50029}Debug {cccccc}� {FFFFFF}",
		nt = "{f50029}����������� {cccccc}� {FFFFFF}",
		
    },
	cfg = {
		mft = "�",
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
	sampRegisterChatCommand("mtakelic", function(arg) ahk_takelic(arg) if developer_mode then sampAddChatMessage(helper.script.d.."��������� �������: "..fc..arg, -1) end end)
	sampRegisterChatCommand("mticket", function(arg) ahk_ticket(arg) if developer_mode then sampAddChatMessage(helper.script.d.."��������� �������: "..fc..arg, -1) end end)
	sampRegisterChatCommand("mpg", function(arg) ahk_pg(arg) if developer_mode then sampAddChatMessage(helper.script.d.."��������� �������: "..fc..arg, -1) end end)
	sampRegisterChatCommand("marrest", function(arg) ahk_arrest(arg) if developer_mode then sampAddChatMessage(helper.script.d.."��������� �������: "..fc..arg, -1) end end)
	sampRegisterChatCommand("mputpl", function(arg) ahk_putpl(arg) if developer_mode then sampAddChatMessage(helper.script.d.."��������� �������: "..fc..arg, -1) end end)
	sampRegisterChatCommand("mcuff", function(arg) ahk_cuff(arg) if developer_mode then sampAddChatMessage(helper.script.d.."��������� �������: "..fc..arg, -1) end end)
	sampRegisterChatCommand("muncuff", function(arg) ahk_uncuff(arg) if developer_mode then sampAddChatMessage(helper.script.d.."��������� �������: "..fc..arg, -1) end end)
	sampRegisterChatCommand("mescort", function(arg) ahk_escort(arg) if developer_mode then sampAddChatMessage(helper.script.d.."��������� �������: "..fc..arg, -1) end end)
	sampRegisterChatCommand("munescort", function(arg) ahk_unescort(arg) if developer_mode then sampAddChatMessage(helper.script.d.."��������� �������: "..fc..arg, -1) end end)
	sampRegisterChatCommand("msu", function(arg) ahk_su(arg) if developer_mode then sampAddChatMessage(helper.script.d.."��������� �������: "..fc..arg, -1) end end)
	sampRegisterChatCommand("mejectout", function(arg) ahk_ejectout(arg) if developer_mode then sampAddChatMessage(helper.script.d.."��������� �������: "..fc..arg, -1) end end)
	sampRegisterChatCommand("mclear", function(arg) ahk_clear(arg) if developer_mode then sampAddChatMessage(helper.script.d.."��������� �������: "..fc..arg, -1) end end)
	--
	sampRegisterChatCommand("mform", function() func_form() end)
	
	sampAddChatMessage(helper.script.n.."������������ "..foc.."�������"..sc..", ������ ����� � ������!", -1) -- ���� ���
	
	while true do	
		wait(0)
	
	result, button, list, input = sampHasDialogRespond(4251) -- �������������� � �������� ID 4251
		if result then
			if button == 1 then
				if list == 0 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4252]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_1 2) d.ticket_1 3) 2 ", -1)
					end
					sampShowDialog(4252, dn.ticket_1, d.ticket_1, b.choose, b.close, 2)
				elseif list == 1 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4253]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_2 2) d.ticket_2 3) 2 ", -1)
					end
					sampShowDialog(4253, dn.ticket_2, d.ticket_2, b.choose, b.close, 2)
				elseif list == 2 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4254]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_3 2) d.ticket_3 3) 2 ", -1)
					end
					sampShowDialog(4254, dn.ticket_3, d.ticket_3, b.choose, b.close, 2)
				elseif list == 3 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4255]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_4 2) d.ticket_4 3) 2 ", -1)
					end
					sampShowDialog(4255, dn.ticket_4, d.ticket_4, b.choose, b.close, 2)
				elseif list == 4 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4256]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_5 2) d.ticket_5 3) 2 ", -1)
					end
					sampShowDialog(4256, dn.ticket_5, d.ticket_5, b.choose, b.close, 2)
				elseif list == 5 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4257]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_6 2) d.ticket_6 3) 2 ", -1)
					end
					sampShowDialog(4257, dn.ticket_6, d.ticket_6, b.choose, b.close, 2)
				elseif list == 6 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4278]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_7 2) d.ticket_7 3) 2 ", -1)
					end
					sampShowDialog(4258, dn.ticket_7, d.ticket_7, b.choose, b.close, 2)
				elseif list == 7 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4259]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_8 2) d.ticket_8 3) 2 ", -1)
					end
					sampShowDialog(4259, dn.ticket_8, d.ticket_8, b.choose, b.close, 2)
				elseif list == 8 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 42510]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_9 2) d.ticket_9 3) 2 ", -1)
					end
					sampShowDialog(42510, dn.ticket_9, d.ticket_9, b.choose, b.close, 2)
				elseif list == 9 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 42511]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_10 2) d.ticket_10 3) 2 ", -1)
					end
					sampShowDialog(42511, dn.ticket_10, d.ticket_10, b.choose, b.close, 2)
				elseif list == 10 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 42512]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_11 2) d.ticket_11 3) 2 ", -1)
					end
					sampShowDialog(42512, dn.ticket_11, d.ticket_11, b.choose, b.close, 2)
				elseif list == 11 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 42513]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_12 2) d.ticket_12 3) 2 ", -1)
					end
					sampShowDialog(42513, dn.ticket_12, d.ticket_12, b.choose, b.close, 2)
				elseif list == 12 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 42514]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_13 2) d.ticket_13 3) 2 ", -1)
					end
					sampShowDialog(42514, dn.ticket_13, d.ticket_13, b.choose, b.close, 2)
				elseif list == 13 then
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 42515]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_14 2) d.ticket_14 3) 2 ", -1)
					end
					sampShowDialog(42515, dn.ticket_14, d.ticket_14, b.choose, b.close, 2)
				elseif list == 14 then
					if ticket_amount ~= 0 and ticket_numbers ~= 0 then
						if ticket_cancellation_licence == "1" and ticket_give_cancellation_licence == "1" then
							if ticket_not_last_give_cancellation_licence ~= "1" then
								ticket_give_cancellation_licence = "0"
								sampAddChatMessage("", -1)
								sampAddChatMessage(helper.script.n.."�� �������� "..fc.."������� ������������� ������������� "..sc.." ��� ������ "..fc..player_name.." ["..player_id.."]", -1)
								sampAddChatMessage(helper.script.n.."������� ������: "..fc.." ������ ���������� ��������", -1)
								sampAddChatMessage("", -1)
							end
						end
						ticket_amount = ticket_amount - ticket_price
						sampAddChatMessage("", -1)
						sampAddChatMessage(helper.script.n.."�� �������  "..foc..ticket_price..sc.. " ������ �� ������ ������ "..fc..player_name.." ["..player_id.."]", -1)
						sampAddChatMessage(helper.script.n.."����� �����: "..foc..ticket_amount..sc.. " ������. "..sc.."������� ���������: "..fc.." ������ ���������� ��������", -1)
						sampAddChatMessage("", -1)
						sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
						if developer_mode then
							sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 42515]", -1)
							sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_14 2) d.ticket_14 3) 2 ", -1)
						end
					else
						sampAddChatMessage("", -1)
						sampAddChatMessage(helper.script.n.."��� ������ ��������.", -1)
						sampAddChatMessage("", -1)
					end
				end
			elseif button == 0 then
				if ticket_amount ~= 0 and ticket_reason_all ~= "�� �������" then
					sampShowDialog(42517, dn.ticket_main_3, sc.."�� ������������� ������ ������ ����� ������ "..fc..player_name.." ["..player_id.."]?"..sc.."\n����� ������: "..foc..ticket_amount.." ������. "..sc.." �������: "..fc.."1", b.choose, b.close, 0)
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 42517]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main_3 2) text 3) 0 ", -1)
					end
				end
			end
		end	
		
	result, button, list, input = sampHasDialogRespond(4252) -- �������������� � �������� ID 4252
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
					sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end	
		
	result, button, list, input = sampHasDialogRespond(4253) -- �������������� � �������� ID 4253
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
					sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end	
		
	result, button, list, input = sampHasDialogRespond(4254) -- �������������� � �������� ID 4254
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
					sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end	
	
	result, button, list, input = sampHasDialogRespond(4255) -- �������������� � �������� ID 4255
		if result then
			if button == 1 then
				if list == 0 then
					msg_ticket("5000 4.1 0")
				end
			elseif button == 0 then
				sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
				if developer_mode then
					sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end	
	
	result, button, list, input = sampHasDialogRespond(4256) -- �������������� � �������� ID 4256
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
					sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end	
	
	result, button, list, input = sampHasDialogRespond(4257) -- �������������� � �������� ID 4257
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
					sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end	
	
	result, button, list, input = sampHasDialogRespond(4258) -- �������������� � �������� ID 4258
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
					sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end	
	
	result, button, list, input = sampHasDialogRespond(4259) -- �������������� � �������� ID 4259
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
					sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end

	result, button, list, input = sampHasDialogRespond(42510) -- �������������� � �������� ID 42510
		if result then
			if button == 1 then
				if list == 0 then
					msg_ticket("10000 9.1 1")
				end
			elseif button == 0 then
				sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
				if developer_mode then
					sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end	
	
	result, button, list, input = sampHasDialogRespond(42511) -- �������������� � �������� ID 42511
		if result then
			if button == 1 then
				if list == 0 then
					msg_ticket("5000 10.1 0")
				end
			elseif button == 0 then
				sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
				if developer_mode then
					sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end	
	
	result, button, list, input = sampHasDialogRespond(42512) -- �������������� � �������� ID 42512
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
					sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end
		
	result, button, list, input = sampHasDialogRespond(42513) -- �������������� � �������� ID 42513
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
					sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end

	result, button, list, input = sampHasDialogRespond(42513) -- �������������� � �������� ID 42513
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
					sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end	
	result, button, list, input = sampHasDialogRespond(42514) -- �������������� � �������� ID 42514
		if result then
			if button == 1 then
				if list == 0 then
					msg_ticket("1000 13.1 0")
				end
			elseif button == 0 then
				sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
				if developer_mode then
					sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end	
		
	result, button, list, input = sampHasDialogRespond(42515) -- �������������� � �������� ID 42515
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
					sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4251]", -1)
					sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
				end
			end
		end	
	
	result, button, list, input = sampHasDialogRespond(42517) -- �������������� � �������� ID 42517
		if result then
			if button == 1 then
				ahk_ticket(player_id.. " "..ticket_amount.. " "..ticket_reason_all)
			end
		end	
		
	result, button, list, input = sampHasDialogRespond(42518) -- �������������� � �������� ID 42518
		if result then
			if button == 1 then
				if list == 0 then
					sampShowDialog(42519, dn.mform_2, d.mform_2, b.choose, b.close, 2)
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������ ���������� (�����������) [ID 42519]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.dn.mform_2 2) d.dn.mform_2 3) 2 ", -1)
					end
				elseif list == 1 then
					sampShowDialog(42520, dn.mform_3, d.mform_3, b.choose, b.close, 2)
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������ ���������� (���������) [ID 42520]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.dn.mform_3 2) d.dn.mform_3 3) 2 ", -1)
					end
				end
			end
		end	
	
	result, button, list, input = sampHasDialogRespond(42519) -- �������������� � �������� ID 42519 
		if result then
			if button == 1 then
				if list == 0 then
					sampShowDialog(42521, dn.mform_4, d.mform_4, b.choose, b.close, 1)
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������ ������ ����� [ID 42521]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.dn.mform_4 2) d.dn.mform_4 3) 1 ", -1)
					end
					while sampIsDialogActive(42521) do wait(100) end -- �������� �������� �������
					local result, button, _, input = sampHasDialogRespond(42521)
					if input:find("%d+") and not input:find("%W+") and not input:find("%p+") and not input:find("%s+") and not input:find("%a+") and input == "1" or input == "2" or input == "3" or input == "4" or input == "5"  or input == "6" or input == "7" or input == "8" or input == "9" or input == "10" then
						sampAddChatMessage(helper.script.d.."����� ������������ �����: "..fc..input..sc.." ���.", -1)
						form_min = tonumber(input)
						lua_thread.create(function()
							sampSendChat("/r ["..helper.cfg.mft.."] ����� �� ��������! ���������� - "..form_min.." ���. ������ - ������� � ������ ����.")
							sampSendChat("/rr ��� ����� ����� �������/��� �� ���� - ������� �� ���� �� ��.")
							form_min = form_min - 1
							if form_min ~= 0 then
								wait(60000)
								sampSendChat("/r ["..helper.cfg.mft.."] ����� �� ��������! ���������� - "..form_min.." ���. ������ - ������� � ������ ����.")	
								form_min = form_min - 2
							end
							if form_min ~= 0 then
								wait(60000)
								sampSendChat("/r ["..helper.cfg.mft.."] ����� �� ��������! ���������� - "..form_min.." ���. ������ - ������� � ������ ����.")	
								form_min = form_min - 3
							end
							if form_min ~= 0 then
								wait(60000)
								sampSendChat("/r ["..helper.cfg.mft.."] ����� �� ��������! ���������� - "..form_min.." ���. ������ - ������� � ������ ����.")	
								form_min = form_min - 4
							end
							if form_min ~= 0 then
								wait(60000)
								sampSendChat("/r ["..helper.cfg.mft.."] ����� �� ��������! ���������� - "..form_min.." ���. ������ - ������� � ������ ����.")	
								form_min = form_min - 5
							end
							if form_min ~= 0 then
								wait(60000)
								sampSendChat("/r ["..helper.cfg.mft.."] ����� �� ��������! ���������� - "..form_min.." ���. ������ - ������� � ������ ����.")	
								form_min = form_min - 6
							end
							if form_min ~= 0 then
								wait(60000)
								sampSendChat("/r ["..helper.cfg.mft.."] ����� �� ��������! ���������� - "..form_min.." ���. ������ - ������� � ������ ����.")	
								form_min = form_min - 7
							end
							if form_min ~= 0 then
								wait(60000)
								sampSendChat("/r ["..helper.cfg.mft.."] ����� �� ��������! ���������� - "..form_min.." ���. ������ - ������� � ������ ����.")	
								form_min = form_min - 8
							end
							if form_min ~= 0 then
								wait(60000)
								sampSendChat("/r ["..helper.cfg.mft.."] ����� �� ��������! ���������� - "..form_min.." ���. ������ - ������� � ������ ����.")	
								form_min = form_min - 9
							end
							if form_min ~= 0 then
								wait(60000)
								sampSendChat("/r ["..helper.cfg.mft.."] ����� �� ��������! ���������� - "..form_min.." ���. ������ - ������� � ������ ����.")	
							end
						end)
					else
						sampAddChatMessage("", -1)
						sampAddChatMessage(helper.script.n.."������� ���������� "..fc.."�������� ����� "..sc.."(�� "..fc.."1"..sc.." �� "..fc.."10"..sc..")", -1)
						sampAddChatMessage("", -1)
					end
				elseif list == 1 then
					sampShowDialog(42522, dn.mform_5, d.mform_5, b.choose, b.close, 1)
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������ �������������� ����� [ID 42522]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.dn.mform_5 2) d.dn.mform_5 3) 1 ", -1)
					end
				elseif list == 2 then
					sampShowDialog(42523, dn.mform_6, d.mform_6, b.choose, b.close, 1)
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������ ������ ���������� � ��� �������������� [ID 42523]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.dn.mform_6 2) d.dn.mform_6 3) 1 ", -1)
					end
				elseif list == 3 then
					sampShowDialog(42524, dn.mform_7, d.mform_7, b.choose, b.close, 2)
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������ ������ ����� [ID 42524]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.dn.mform_7 2) d.dn.mform_7 3) 2 ", -1)
					end
				end
			end
		end	
	
	result, button, list, input = sampHasDialogRespond(42524) -- �������������� � �������� ID 42524
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
					sampAddChatMessage(helper.script.n.."�� ������ ��� ��������� "..fc.."������", -1)
					sampAddChatMessage(helper.script.n.."����������, ��������� � ���������", -1)
				end
			end
		end	
		
	
	end
end

function cmd_dmt(info)
	if developer_mode then
		sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4251]", -1)
		sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
		sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
	end
end

function events.onSendClientJoin() -- ��� �� ����������� � �������
	if welcome_msg == false then
		if os.date("%H") >= "01" and os.date("%H") <= "06" then 
			time_of_day = "������ ����"
		elseif os.date("%H") >= "07" and os.date("%H") <= "12" then 
			time_of_day = "������ ����"
		elseif os.date("%H") >= "13" and os.date("%H") <= "18" then 
			time_of_day = "������ ����"
		elseif os.date("%H") >= "19" and os.date("%H") <= "24" then 
			time_of_day = "������ �����"
		end
		sampAddChatMessage(helper.script.n..time_of_day..", "..fc..myNick..".", -1) -- ���� ���
		sampAddChatMessage(helper.script.n.."������ "..foc.."��������� ������������� "..sc.."������ ��������.", -1) -- ���� ���
		if developer_mode then
			sampAddChatMessage(helper.script.d.. "������ "..myNick.. " ["..myID.."]", -1)
		end
		welcome_msg = true
	end
end


function msg_ticket(info)
	ticket_price, ticket_reason, ticket_cancellation_licence = string.match(info, "(%d+) (.+) (%d+)")
	ticket_amount = ticket_amount + ticket_price
	ticket_numbers = ticket_numbers + 1
	sampAddChatMessage("", -1)
	sampAddChatMessage(helper.script.n.."�� ��������  "..foc..ticket_price..sc.. " ������ � ������ ������ "..fc..player_name.." ["..player_id.."]", -1)
	sampAddChatMessage(helper.script.n.."����� �����: "..foc..ticket_amount..sc.. " ������. "..sc.."������� ����������: "..fc..ticket_reason.." ����", -1)
	if ticket_cancellation_licence == "1" and ticket_give_cancellation_licence == "1" then
		ticket_not_last_give_cancellation_licence = "1"
	end
	if ticket_cancellation_licence == "1" then
		sampAddChatMessage("", -1)
		sampAddChatMessage(helper.script.nt.."�� ������ ��������� ������������� "..fc.."������� ������������� �������������!", -1)
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
		sampAddChatMessage(helper.script.n.."�� ���� ��� ����� ������ �������� "..fc.."4 "..sc.."������.", -1)
		sampAddChatMessage(helper.script.n.."��������� �������� "..fc.."���� ��������.", -1)
		sampAddChatMessage("", -1)
		ticket_numbers = ticket_numbers - 1
		ticket_amount = ticket_amount - ticket_price
	end
	if developer_mode then
		sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4251]", -1)
		sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main_2 2) d.ticket_main 3) 2 ", -1)
	end
	sampShowDialog(4251, dn.ticket_main_2, d.ticket_main, b.choose, b.close, 2)	
end

function ahk_pg(info)
	player_id = string.match(info, "(%d+)")
	if player_id == nil then
		sampAddChatMessage("", -1)
		sampAddChatMessage(helper.script.n.." �����������: "..fc.."/mpg [ID ������]", -1)
		sampAddChatMessage("", -1)
	else
		if sampIsPlayerConnected(player_id) then
			result, Ped = sampGetCharHandleBySampPlayerId(player_id)
			if result then
				player_name = sampGetPlayerNickname(player_id)
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."�� ������ ������ �� ������� "..fc..player_name.." ["..player_id.."]", -1)
				sampAddChatMessage("", -1)
				lua_thread.create(function()
					sampSendChat("/me ������ ����� �� �������")
					wait(999)
					sampSendChat("/do ����� � ����.")
					wait(999)
					sampSendChat("/todo ���������� ���������� � ������ ������*������ �������")
					wait(999)
					sampSendChat("/pg "..player_id)
					create_log("��������: ������ ������ | �������������: "..player_name)
				end)	
			else
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."����� "..fc.."�� ��������� "..sc.."� ���� ������.", -1)
				sampAddChatMessage("", -1)
			end
		else
			sampAddChatMessage("", -1)
			sampAddChatMessage(helper.script.n.."������ ������ ���!", -1)
			sampAddChatMessage("", -1)
		end
	end
end

function ahk_ticket(info)
	player_id, ticket_amount, ticket_reason = string.match(info, "(%d+) (%d+) (.+)")
	if player_id == nil then
		sampAddChatMessage("", -1)
		sampAddChatMessage(helper.script.n.." �����������: "..fc.."/mticket [ID ������] [�����] [�������]", -1)
		sampAddChatMessage("", -1)
	else
		if sampIsPlayerConnected(player_id) then
			result, Ped = sampGetCharHandleBySampPlayerId(player_id)
			if result then
				player_name = sampGetPlayerNickname(player_id)
				if ticket_amount ~= "0" and ticket_reason ~= "0" then
					sampAddChatMessage("", -1)
					sampAddChatMessage(helper.script.n.."�� ������ ����� ������ "..fc..player_name.." ["..player_id.."]", -1)
					sampAddChatMessage(helper.script.n.."����� �����: "..foc..ticket_amount.. " ������."..sc.." �������: "..fc..ticket_reason.." ����", -1)
					sampAddChatMessage("", -1)
					if developer_mode then
						sampAddChatMessage(helper.script.d.."/ticket "..player_id.. " "..ticket_amount.. " "..ticket_reason.. " ����", -1)
					end
					lua_thread.create(function()
						sampSendChat("/ticket "..player_id.. " "..ticket_amount.. " "..ticket_reason.." ����")
						wait(999)
						sampSendChat("/me ������ ����������� ������� �� �������")
						wait(999)
						sampSendChat("/do ����������� ������� � �����.")
						wait(999)
						sampSendChat("/me ����� �� ������ '�������� �����'")
						wait(999)
						sampSendChat("/me ��������� ����������� ����������")
						wait(999)
						sampSendChat("/do ����� �������.")
						wait(999)
						sampSendChat("/todo ��������� �������� ���������*������ ��������� ��� ������ ��� �� ��. �����.")
						wait(999)
						sampSendChat("�� ������ �������� ��� ������� ������ ��� ����� �� ���. ������� �������.")
						wait(999)
						sampSendChat("/c 060")
						create_log("��������: ������ ������ | ����������: "..player_name.." | ����� �����: "..ticket_amount.." | �������(-�): "..ticket_reason)
						if ticket_give_cancellation_licence == "1" then
							sampAddChatMessage("ahk_takelic(player_id.. ..ticket_give_cancellation_licence_reason)")
						end
					end)
				else
					sampShowDialog(4251, dn.ticket_main, d.ticket_main, b.choose, b.close, 2)
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������ ������ ������ [ID 4251]", -1)
						sampAddChatMessage(helper.script.d.." INFO: 1) dn.ticket_main 2) d.ticket_main 3) 2 ", -1)
					end	
				end
			else
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."����� "..fc.."�� ��������� "..sc.."� ���� ������.", -1)
				sampAddChatMessage("", -1)
			end
		else
			sampAddChatMessage("", -1)
			sampAddChatMessage(helper.script.n.."������ ������ ���!", -1)
			sampAddChatMessage("", -1)
		end
	end
end

function ahk_takelic(info)
	player_id, takelic_reason = string.match(info, "(%d+) (.+)")
	if player_id == nil or takelic_reason == "" then
		sampAddChatMessage("", -1)
		sampAddChatMessage(helper.script.n.."�����������: "..fc.."/mtakelic [ID ������] [�������]", -1)
		sampAddChatMessage("", -1)
	else
		if sampIsPlayerConnected(player_id) then
			result, Ped = sampGetCharHandleBySampPlayerId(player_id)
			if result then
				player_name = sampGetPlayerNickname(player_id)
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."�� ������������ �������� "..fc..player_name.." ["..player_id.."]", -1)
				sampAddChatMessage(helper.script.n.."�������: "..fc..takelic_reason.." ����.", -1)
				sampAddChatMessage("", -1)
				if developer_mode then
					sampAddChatMessage(helper.script.d.."/takelic "..player_id.. " "..takelic_reason.. " ����", -1)
				end
				ticket_not_last_give_cancellation_licence = "0"
				lua_thread.create(function()
					sampSendChat("/takelic "..player_id.. " "..takelic_reason.. " ����")
					wait(999)
					sampSendChat("/me ������ ����������� ������� �� �������")
					wait(999)
					sampSendChat("/do ����������� ������� � �����.")
					wait(999)
					sampSendChat("/me ����� �� ������ '������������ ��������'")
					wait(999)
					sampSendChat("/me ��������� ����������� ����������")
					wait(999)
					sampSendChat("/do ��������� ������������.")
					wait(999)
					sampSendChat("/todo ��������� �������������*������ ����������� ���������� ��� �� ��. �����.")
					wait(999)
					sampSendChat("�� ������ �������� ��� ������� ������������ ���� �������� �� ���. ������� �������.")
					wait(999)
					sampSendChat("/c 060")
					create_log("��������: ������������� �������� | ����������: "..player_name.." | �������: "..takelic_reason)
				end)
			else
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."����� "..fc.."�� ��������� "..sc.."� ���� ������.", -1)
				sampAddChatMessage("", -1)
			end
		else
			sampAddChatMessage("", -1)
			sampAddChatMessage(helper.script.n.."������ ������ ���!", -1)
			sampAddChatMessage("", -1)
		end
	end
end

function ahk_cuff(info)
	player_id = string.match(info, "(%d+)")
	if player_id == nil then
		sampAddChatMessage("", -1)
		sampAddChatMessage(helper.script.n.." �����������: "..fc.."/mcuff [ID ������]", -1)
		sampAddChatMessage("", -1)
	else
		if sampIsPlayerConnected(player_id) then
			result, Ped = sampGetCharHandleBySampPlayerId(player_id)
			if result then
				player_name = sampGetPlayerNickname(player_id)
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."�� ������ ��������� �� ������ "..fc..player_name.." ["..player_id.."]", -1)
				sampAddChatMessage("", -1)
				if developer_mode then
					sampAddChatMessage(helper.script.d.."/cuff "..player_id, -1)
				end
				lua_thread.create(function()
					sampSendChat("/do ��������� ����� �� �����.")
					wait(999)
					sampSendChat("/me ������ ��������� ���� ���� ��������� � �����")
					wait(999)
					sampSendChat("/do ��������� � ����.")
					wait(999)
					sampSendChat("/todo ������� ��������� �� ��������������*�� ����������!")
					wait(999)
					sampSendChat("/do ������������� ��������� � ����������.")
					wait(999)
					sampSendChat("/cuff "..player_id)
					create_log("��������: ������ ��������� | �������������: "..player_name)
				end)	
			else
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."����� "..fc.."�� ��������� "..sc.."� ���� ������.", -1)
				sampAddChatMessage("", -1)
			end
		else
			sampAddChatMessage("", -1)
			sampAddChatMessage(helper.script.n.."������ ������ ���!", -1)
			sampAddChatMessage("", -1)
		end
	end
end

function ahk_uncuff(info)
	
	-- create_log("��������: ����� ��������� | �������������: "..player_name)
end

function ahk_escort(info)
--create_log("��������: ������ ����� �� ����� | �������������: "..player_name)
end

function ahk_su(info)
	player_id = string.match(info, "(%d+)")
	if player_id == nil then
		sampAddChatMessage("", -1)
		sampAddChatMessage(helper.script.n.." �����������: "..fc.."/msu [ID ������]", -1)
		sampAddChatMessage("", -1)
	else
		if sampIsPlayerConnected(player_id) then
			player_name = sampGetPlayerNickname(player_id)
			sampAddChatMessage("", -1)
			sampAddChatMessage(helper.script.n.."�� ���������� "..fc..player_name.." ["..player_id.."] "..sc.."� ����������� ������", -1)
			sampAddChatMessage("", -1)
			if developer_mode then
				sampAddChatMessage(helper.script.d.."/su "..player_id, -1)
			end
			lua_thread.create(function()
				sampSendChat("/su "..player_id)
				wait(999)
				sampSendChat("/me ������ ����������� ������� �� �������")
				wait(999)
				sampSendChat("/do ������� � ����.")
				wait(999)
				sampSendChat("/me ������ ������ '����������� ������'")
				wait(999)
				sampSendChat("/do ������ '����������� ������' ������.")
				wait(999)
				sampSendChat("/todo ����� ������� ��������������*������ ������� �� ��������..")
				wait(999)
				sampSendChat("/me ������� �������������� � ����������� ������")
				wait(999)
				sampSendChat("/do ������������� ��������� � ����������� �������.")
				wait(999)
				sampSendChat("/c 60")
				create_log("��������: �������� � ������ | �������������: "..player_name)
			end)	
		else
			sampAddChatMessage("", -1)
			sampAddChatMessage(helper.script.n.."������ ������ ���!", -1)
			sampAddChatMessage("", -1)
		end
	end
end

function ahk_clear(info)
	player_id = string.match(info, "(%d+)")
	if player_id == nil then
		sampAddChatMessage("", -1)
		sampAddChatMessage(helper.script.n.." �����������: "..fc.."/mclear [ID ������]", -1)
		sampAddChatMessage("", -1)
	else
		if sampIsPlayerConnected(player_id) then
			player_name = sampGetPlayerNickname(player_id)
			sampAddChatMessage("", -1)
			sampAddChatMessage(helper.script.n.."�� ����� ������ "..fc..player_name.." ["..player_id.."] "..sc.."� ������������ �������", -1)
			sampAddChatMessage("", -1)
			if developer_mode then
				sampAddChatMessage(helper.script.d.."/clear "..player_id, -1)
			end
			lua_thread.create(function()
				sampSendChat("/me ������ ����������� ������� �� �������")
				wait(999)
				sampSendChat("/do ������� � ����.")
				wait(999)
				sampSendChat("/me ������ ������ '����������� ������'")
				wait(999)
				sampSendChat("/do ������ '����������� ������' ������.")
				wait(999)
				sampSendChat("/me ���� �������� � ���� ������")
				wait(999)
				sampSendChat("/do �������� �������� ��������.")
				wait(999)
				sampSendChat("/me ���� � �������� ������� '����������� ������'")
				wait(999)
				sampSendChat("/do ������������� �� �������� � ����������� �������.")
				wait(999)
				sampSendChat("/clear "..player_id)
				wait(999)
				sampSendChat("/c 60")
				create_log("��������: ����� � ������������ ������� | �������������: "..player_name)
			end)	
		else
			sampAddChatMessage("", -1)
			sampAddChatMessage(helper.script.n.."������ ������ ���!", -1)
			sampAddChatMessage("", -1)
		end
	end
end

function ahk_ejectout(info)
	player_id = string.match(info, "(%d+)")
	if player_id == nil then
		sampAddChatMessage("", -1)
		sampAddChatMessage(helper.script.n.." �����������: "..fc.."/mejectout [ID ������]", -1)
		sampAddChatMessage("", -1)
	else
		if sampIsPlayerConnected(player_id) then
			result, Ped = sampGetCharHandleBySampPlayerId(player_id)
			if result then
				player_name = sampGetPlayerNickname(player_id)
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."�� �������� ������ "..fc..player_name.." ["..player_id.."] "..sc.."�� ������������� ��������", -1)
				sampAddChatMessage("", -1)
				if developer_mode then
					sampAddChatMessage(helper.script.d.."/ejectout "..player_id, -1)
				end
				lua_thread.create(function()
					sampSendChat("/do ����� ������������� �������� �������� ���.")
					wait(999)
					sampSendChat("/me ������ ��������� ���� ������ ����� �� ������� � ������� ��� � ������� �����")
					wait(999)
					sampSendChat("/todo ����� ������� �����*������ �������� ���..")
					wait(999)
					sampSendChat("/do ������� ����� �������.")
					wait(999)
					sampSendChat("/me ������� �������������� �� ������������� ��������")
					wait(999)
					sampSendChat("/ejectout "..player_id)
					wait(999)
					sampSendChat("/do ������������� ����� �����.")
					create_log("��������: �������� �� �/� | �������������: "..player_name)
				end)	
			else
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."����� "..fc.."�� ��������� "..sc.."� ���� ������.", -1)
				sampAddChatMessage("", -1)
			end
		else
			sampAddChatMessage("", -1)
			sampAddChatMessage(helper.script.n.."������ ������ ���!", -1)
			sampAddChatMessage("", -1)
		end
	end
end

function ahk_putpl(info)
	player_id = string.match(info, "(%d+)")
	if player_id == nil then
		sampAddChatMessage("", -1)
		sampAddChatMessage(helper.script.n.." �����������: "..fc.."/mputpl [ID ������]", -1)
		sampAddChatMessage("", -1)
	else
		if sampIsPlayerConnected(player_id) then
			result, Ped = sampGetCharHandleBySampPlayerId(player_id)
			if result then
				player_name = sampGetPlayerNickname(player_id)
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."�� �������� ������ "..fc..player_name.." ["..player_id.."] "..sc.."� ����������� ����������", -1)
				sampAddChatMessage("", -1)
				if developer_mode then
					sampAddChatMessage(helper.script.d.."/putpl "..player_id, -1)
				end
				lua_thread.create(function()
					sampSendChat("/do ����� ������������ ���������� �������.")
					wait(999)
					sampSendChat("/me ������ ����� ����������")
					wait(999)
					sampSendChat("/do ����� �������.")
					wait(999)
					sampSendChat("/todo ���� �������������� � ����������� ����������*��� ������ ��������!")
					wait(999)
					sampSendChat("/do ������������� ��������� � ������.")
					wait(999)
					sampSendChat("/putpl "..player_id)
					create_log("��������: �������� � ����������� ���������� | �������������: "..player_name)
				end)	
			else
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."����� "..fc.."�� ��������� "..sc.."� ���� ������.", -1)
				sampAddChatMessage("", -1)
			end
		else
			sampAddChatMessage("", -1)
			sampAddChatMessage(helper.script.n.."������ ������ ���!", -1)
			sampAddChatMessage("", -1)
		end
	end
end

function ahk_arrest(info)
	player_id = string.match(info, "(%d+)")
	if player_id == nil then
		sampAddChatMessage("", -1)
		sampAddChatMessage(helper.script.n.." �����������: "..fc.."/marrest [ID ������]", -1)
		sampAddChatMessage("", -1)
	else
		if sampIsPlayerConnected(player_id) then
			result, Ped = sampGetCharHandleBySampPlayerId(player_id)
			if result then
				player_name = sampGetPlayerNickname(player_id)
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."�� ���������� ������ "..fc..player_name.." ["..player_id.."]", -1)
				sampAddChatMessage("", -1)
				if developer_mode then
					sampAddChatMessage(helper.script.d.."/arrest "..player_id, -1)
				end
				lua_thread.create(function()
					sampSendChat("/do ����� ������������ ������� �������.")
					wait(999)
					sampSendChat("/me ������ ����� �������")
					wait(999)
					sampSendChat("/do ����� �������.")
					wait(999)
					sampSendChat("/me �������� ���������� � ����������� ���������")
					wait(999)
					sampSendChat("/do �������� ����������.")
					wait(999)
					sampSendChat("/todo ��������� ����������� � ���*�� ���, ��� ��� � �����..")
					wait(999)
					sampSendChat("/arrest "..player_id)
					wait(999)
					sampSendChat("/do ���������� ������� � �������.")
					create_log("��������: �������� � ������� | ����������: "..player_name)
				end)	
			else
				sampAddChatMessage("", -1)
				sampAddChatMessage(helper.script.n.."����� "..fc.."�� ��������� "..sc.."� ���� ������.", -1)
				sampAddChatMessage("", -1)
			end
		else
			sampAddChatMessage("", -1)
			sampAddChatMessage(helper.script.n.."������ ������ ���!", -1)
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
				sampAddChatMessage(helper.script.d.." ��� ������ ���� �������, ������� �� �� �����.")
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
					sampAddChatMessage(helper.script.d.." ����� ��� �� ������ "..fc.."#"..lecture_number)
				end
				choose_lecture(lecture_number, 1)
			elseif lecture_number == 1 then
				if helper.cfg.t_l_1 == true and lecture_type ~= 0 then
					lua_thread.create(function()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." ������ ������ ���� �������, ���������..", -1)
						end
						wait(222)
						choose_lecture(2, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������� �������������� ������ "..fc.."#"..lecture_number, -1)
					end
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("������� �����, �����. ������ ������� ������ �� ���� '�����'.", -1)
						wait(1111)
						sampSendChat("����� ������������ ��� �������� ������ ���������� ����� ������������.", -1)
						wait(1111)
						sampSendChat("��������, ��� ������� � ��������� �� �����, ��� �� � ������� ��� ������.", -1)
						wait(1111)
						sampSendChat("����� � ����� ������������ ��� ����� � ������� ������������.", -1)
						wait(1111)
						sampSendChat("��� ������������ ����� ���������:", -1)
						wait(1111)
						sampSendChat("�������� ������������.", -1)
						wait(1111)
						sampSendChat("������������ ����� ��� ���������� (�������/�������/�������).", -1)
						wait(1111)
						sampSendChat("/n � /rr ��� �� ��������� ������ � �������/������� ����-����.", -1)
						wait(1111)	
						sampSendChat("� ����� ��������� ��������� �� �� ���� � ��������� ������ ���������.", -1)
						wait(1111)
						sampSendChat("������������ ����������� ������� � ��������� ��������� ����� 2-� ���.", -1)
						wait(1111)
						sampSendChat("�� ����� �� ���� ������������� ������� �� ������ �������� ���������.", -1)
						wait(1111)
						sampSendChat("�� ���� ������ ��������. ������� ����?", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ����� ����� [ID 42525]", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ������ ���� �������, ���������..", -1)
						end
						wait(222)
						choose_lecture(3, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������� �������������� ������ "..fc.."#"..lecture_number, -1)
					end		
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("������� �����, �����. ������ ������� ������ �� ���� '����������'.", -1)
						wait(1111)
						sampSendChat("����������� ��������� �������� � ����� ��� ���������� ���� ����� �������.", -1)
						wait(1111)
						sampSendChat("���� �� ��������, �� �� ������� ������ ����� � �������� ���������� ������ � �����.", -1)
						wait(1111)
						sampSendChat("�������� ����� ��� ���������� ��� �� ���������.", -1)
						wait(1111)
						sampSendChat("�� ��� ����� �������� ������������� ��������� ��� �������.", -1)
						wait(1111)
						sampSendChat("�������� � ����� ���������:", -1)
						wait(1111)
						sampSendChat("�������������, ������������ ���������� ������������, ���� � ����.", -1)
						wait(1111)
						sampSendChat("��������� � ������������ ����������.", -1)
						wait(1111)
						sampSendChat("�������� ����� ��� �� 60 ������.", -1)
						wait(1111)
						sampSendChat("����� ���-�� ������� �� ����� ��������� �������� ����������: '��������� ��������?'.", -1)
						wait(1111)
						sampSendChat("� ����� ��� ������� ������ � ������ '������'.", -1)
						wait(1111)
						sampSendChat("�� ����� ������ �������� � ������ �� ������ ��������.", -1)
						wait(1111)
						sampSendChat("����� ��������� ������ ��������� �����.", -1)
						wait(1111)
						sampSendChat("�� ��� �� ������ ������ ��������.", -1)
						wait(1111)
						sampSendChat("�� ���� ������� ������ ������� � �����. ������� ����?", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ����� ����� [ID 42525]", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ������ ���� �������, ���������..", -1)
						end
						wait(222)
						choose_lecture(4, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������� �������������� ������ "..fc.."#"..lecture_number, -1)
					end	
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("������� �����, �����. ������ ����� ������. ����: '����'.", -1)
						wait(1111)
						sampSendChat("���������� ��������� ����� ������: ��� ��������, ��� � ���.", -1)
						wait(1111)
						sampSendChat("��� ������������� �������� ����� '����' � '���'.", -1)
						wait(1111)
						sampSendChat("��� ������������� ���, ��, �� ����� �� ������� � ������� � �����������.", -1)
						wait(1111)
						sampSendChat("��� ������������� ���, ����, ��� ����� �� ��������, ������������ ������.", -1)
						wait(1111)
						sampSendChat("� �������� ������ �� ������ ������������, ����� ��������.", -1)
						wait(1111)
						sampSendChat("����������: � 00:00 �� 6:00.", -1)
						wait(1111)
						sampSendChat("������� � ����� ������ ������� ������ 10 ����� � �������� � ����:", -1)
						wait(1111)
						sampSendChat("1. � ������ ������ ���������� ������ � ��� ������� ����������", -1)
						wait(1111)
						sampSendChat("2. ������ ���������� ������� � ��������� ��� ����������. ��������� ����� ������.", -1)
						wait(1111)
						sampSendChat("3. � ����������, �������� � ���������: ����������, ��.", -1)
						wait(1111)
						sampSendChat("�� ���� ������ ��������. ������� ����?", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ����� ����� [ID 42525]", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ������ ���� �������, ���������..", -1)
						end
						wait(222)
						choose_lecture(5, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������� �������������� ������ "..fc.."#"..lecture_number, -1)
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
							sampAddChatMessage(helper.script.d.." ������ ����� ����� [ID 42525]", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ������ ���� �������, ���������..", -1)
						end
						wait(222)
						choose_lecture(6, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������� �������������� ������ "..fc.."#"..lecture_number, -1)
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
							sampAddChatMessage(helper.script.d.." ������ ����� ����� [ID 42525]", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ������ ���� �������, ���������..", -1)
						end
						wait(222)
						choose_lecture(7, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������� �������������� ������ "..fc.."#"..lecture_number, -1)
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
							sampAddChatMessage(helper.script.d.." ������ ����� ����� [ID 42525]", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ������ ���� �������, ���������..", -1)
						end
						wait(222)
						choose_lecture(8, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������� �������������� ������ "..fc.."#"..lecture_number, -1)
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
							sampAddChatMessage(helper.script.d.." ������ ����� ����� [ID 42525]", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ������ ���� �������, ���������..", -1)
						end
						wait(222)
						choose_lecture(9, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������� �������������� ������ "..fc.."#"..lecture_number, -1)
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
							sampAddChatMessage(helper.script.d.." ������ ����� ����� [ID 42525]", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ������ ���� �������, ���������..", -1)
						end
						wait(222)
						choose_lecture(10, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������� �������������� ������ "..fc.."#"..lecture_number, -1)
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
							sampAddChatMessage(helper.script.d.." ������ ����� ����� [ID 42525]", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ������ ���� �������, ���������..", -1)
						end
						wait(222)
						choose_lecture(1, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������� �������������� ������ "..fc.."#"..lecture_number, -1)
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
							sampAddChatMessage(helper.script.d.." ������ ����� ����� [ID 42525]", -1)
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
		sampAddChatMessage(helper.script.n.."�� ������ ��� ��������� "..fc.."������", -1)
		sampAddChatMessage(helper.script.n.."����������, ��������� � ���������", -1)
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
				sampAddChatMessage(helper.script.d.." ��� ������ ���� �������, ������� �� �� �����.")
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
					sampAddChatMessage(helper.script.d.." ����� ��� �� ������ "..fc.."#"..lecture_number)
				end
				choose_lecture(lecture_number, 1)
			elseif lecture_number == 1 then
				if helper.cfg.t_l_1 == true and lecture_type ~= 0 then
					lua_thread.create(function()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." ������ ������ ���� �������, ���������..", -1)
						end
						wait(222)
						choose_lecture(2, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������� �������������� ������ "..fc.."#"..lecture_number, -1)
					end
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("������� �����, �����. ������ ������� ������ �� ���� '�����'.", -1)
						wait(1111)
						sampSendChat("����� ������������ ��� �������� ������ ���������� ����� ������������.", -1)
						wait(1111)
						sampSendChat("��������, ��� ������� � ��������� �� �����, ��� �� � ������� ��� ������.", -1)
						wait(1111)
						sampSendChat("����� � ����� ������������ ��� ����� � ������� ������������.", -1)
						wait(1111)
						sampSendChat("��� ������������ ����� ���������:", -1)
						wait(1111)
						sampSendChat("�������� ������������.", -1)
						wait(1111)
						sampSendChat("������������ ����� ��� ���������� (�������/�������/�������).", -1)
						wait(1111)
						sampSendChat("/n � /rr ��� �� ��������� ������ � �������/������� ����-����.", -1)
						wait(1111)	
						sampSendChat("� ����� ��������� ��������� �� �� ���� � ��������� ������ ���������.", -1)
						wait(1111)
						sampSendChat("������������ ����������� ������� � ��������� ��������� ����� 2-� ���.", -1)
						wait(1111)
						sampSendChat("�� ����� �� ���� ������������� ������� �� ������ �������� ���������.", -1)
						wait(1111)
						sampSendChat("�� ���� ������ ��������. ������� ����?", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ����� ����� [ID 42525]", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ������ ���� �������, ���������..", -1)
						end
						wait(222)
						choose_lecture(3, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������� �������������� ������ "..fc.."#"..lecture_number, -1)
					end		
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("������� �����, �����. ������ ������� ������ �� ���� '����������'.", -1)
						wait(1111)
						sampSendChat("����������� ��������� �������� � ����� ��� ���������� ���� ����� �������.", -1)
						wait(1111)
						sampSendChat("���� �� ��������, �� �� ������� ������ ����� � �������� ���������� ������ � �����.", -1)
						wait(1111)
						sampSendChat("�������� ����� ��� ���������� ��� �� ���������.", -1)
						wait(1111)
						sampSendChat("�� ��� ����� �������� ������������� ��������� ��� �������.", -1)
						wait(1111)
						sampSendChat("�������� � ����� ���������:", -1)
						wait(1111)
						sampSendChat("�������������, ������������ ���������� ������������, ���� � ����.", -1)
						wait(1111)
						sampSendChat("��������� � ������������ ����������.", -1)
						wait(1111)
						sampSendChat("�������� ����� ��� �� 60 ������.", -1)
						wait(1111)
						sampSendChat("����� ���-�� ������� �� ����� ��������� �������� ����������: '��������� ��������?'.", -1)
						wait(1111)
						sampSendChat("� ����� ��� ������� ������ � ������ '������'.", -1)
						wait(1111)
						sampSendChat("�� ����� ������ �������� � ������ �� ������ ��������.", -1)
						wait(1111)
						sampSendChat("����� ��������� ������ ��������� �����.", -1)
						wait(1111)
						sampSendChat("�� ��� �� ������ ������ ��������.", -1)
						wait(1111)
						sampSendChat("�� ���� ������� ������ ������� � �����. ������� ����?", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ����� ����� [ID 42525]", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ������ ���� �������, ���������..", -1)
						end
						wait(222)
						choose_lecture(4, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������� �������������� ������ "..fc.."#"..lecture_number, -1)
					end	
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("������� �����, �����. ������ ����� ������. ����: '����'.", -1)
						wait(1111)
						sampSendChat("���������� ��������� ����� ������: ��� ��������, ��� � ���.", -1)
						wait(1111)
						sampSendChat("��� ������������� �������� ����� '����' � '���'.", -1)
						wait(1111)
						sampSendChat("��� ������������� ���, ��, �� ����� �� ������� � ������� � �����������.", -1)
						wait(1111)
						sampSendChat("��� ������������� ���, ����, ��� ����� �� ��������, ������������ ������.", -1)
						wait(1111)
						sampSendChat("� �������� ������ �� ������ ������������, ����� ��������.", -1)
						wait(1111)
						sampSendChat("����������: � 00:00 �� 6:00.", -1)
						wait(1111)
						sampSendChat("������� � ����� ������ ������� ������ 10 ����� � �������� � ����:", -1)
						wait(1111)
						sampSendChat("1. � ������ ������ ���������� ������ � ��� ������� ����������", -1)
						wait(1111)
						sampSendChat("2. ������ ���������� ������� � ��������� ��� ����������. ��������� ����� ������.", -1)
						wait(1111)
						sampSendChat("3. � ����������, �������� � ���������: ����������, ��.", -1)
						wait(1111)
						sampSendChat("�� ���� ������ ��������. ������� ����?", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ����� ����� [ID 42525]", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ������ ���� �������, ���������..", -1)
						end
						wait(222)
						choose_lecture(5, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������� �������������� ������ "..fc.."#"..lecture_number, -1)
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
							sampAddChatMessage(helper.script.d.." ������ ����� ����� [ID 42525]", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ������ ���� �������, ���������..", -1)
						end
						wait(222)
						choose_lecture(6, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������� �������������� ������ "..fc.."#"..lecture_number, -1)
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
							sampAddChatMessage(helper.script.d.." ������ ����� ����� [ID 42525]", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ������ ���� �������, ���������..", -1)
						end
						wait(222)
						choose_lecture(7, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������� �������������� ������ "..fc.."#"..lecture_number, -1)
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
							sampAddChatMessage(helper.script.d.." ������ ����� ����� [ID 42525]", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ������ ���� �������, ���������..", -1)
						end
						wait(222)
						choose_lecture(8, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������� �������������� ������ "..fc.."#"..lecture_number, -1)
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
							sampAddChatMessage(helper.script.d.." ������ ����� ����� [ID 42525]", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ������ ���� �������, ���������..", -1)
						end
						wait(222)
						choose_lecture(9, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������� �������������� ������ "..fc.."#"..lecture_number, -1)
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
							sampAddChatMessage(helper.script.d.." ������ ����� ����� [ID 42525]", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ������ ���� �������, ���������..", -1)
						end
						wait(222)
						choose_lecture(10, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������� �������������� ������ "..fc.."#"..lecture_number, -1)
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
							sampAddChatMessage(helper.script.d.." ������ ����� ����� [ID 42525]", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ������ ���� �������, ���������..", -1)
						end
						wait(222)
						choose_lecture(1, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������� �������������� ������ "..fc.."#"..lecture_number, -1)
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
							sampAddChatMessage(helper.script.d.." ������ ����� ����� [ID 42525]", -1)
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
		sampAddChatMessage(helper.script.n.."�� ������ ��� ��������� "..fc.."������", -1)
		sampAddChatMessage(helper.script.n.."����������, ��������� � ���������", -1)
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
				sampAddChatMessage(helper.script.d.." ��� ������ ���� �������, ������� �� �� �����.")
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
					sampAddChatMessage(helper.script.d.." ����� ��� �� ������ "..fc.."#"..lecture_number)
				end
				choose_lecture(lecture_number, 1)
			elseif lecture_number == 1 then
				if helper.cfg.t_l_1 == true and lecture_type ~= 0 then
					lua_thread.create(function()
						if developer_mode then
							sampAddChatMessage(helper.script.d.." ������ ������ ���� �������, ���������..", -1)
						end
						wait(222)
						choose_lecture(2, 1)
					end)
				else
					if developer_mode then
						sampAddChatMessage(helper.script.d.." ������� �������������� ������ "..fc.."#"..lecture_number, -1)
					end
					lua_thread.create(function()
						lecture_start = true
						if developer_mode then
							sampAddChatMessage(helper.script.d.." lecture_start = true", -1)
						end
						sampSendChat("������� �����, �����. ������ ������� ������ �� ���� '�����'.", -1)
						wait(1111)
						sampSendChat("����� ������������ ��� �������� ������ ���������� ����� ������������.", -1)
						wait(1111)
						sampSendChat("��������, ��� ������� � ��������� �� �����, ��� �� � ������� ��� ������.", -1)
						wait(1111)
						sampSendChat("����� � ����� ������������ ��� ����� � ������� ������������.", -1)
						wait(1111)
						sampSendChat("��� ������������ ����� ���������:", -1)
						wait(1111)
						sampSendChat("�������� ������������.", -1)
						wait(1111)
						sampSendChat("������������ ����� ��� ���������� (�������/�������/�������).", -1)
						wait(1111)
						sampSendChat("/n � /rr ��� �� ��������� ������ � �������/������� ����-����.", -1)
						wait(1111)	
						sampSendChat("� ����� ��������� ��������� �� �� ���� � ��������� ������ ���������.", -1)
						wait(1111)
						sampSendChat("������������ ����������� ������� � ��������� ��������� ����� 2-� ���.", -1)
						wait(1111)
						sampSendChat("�� ����� �� ���� ������������� ������� �� ������ �������� ���������.", -1)
						wait(1111)
						sampSendChat("�� ���� ������ ��������. ������� ����?", -1)
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
							sampAddChatMessage(helper.script.d.." ������ ����� ����� [ID 42525]", -1)
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
		sampAddChatMessage(helper.script.n.."�� ������ ��� ��������� "..fc.."������", -1)
		sampAddChatMessage(helper.script.n.."����������, ��������� � ���������", -1)
	end	
end

function func_form()
	sampShowDialog(42518, dn.mform_1, d.mform_1, b.choose, b.close, 2)
	if developer_mode then
		sampAddChatMessage(helper.script.d.." ������ ���������� [ID 42518]", -1)
		sampAddChatMessage(helper.script.d.." INFO: 1) dn.mform_1 2) d.mform_1 3) 2 ", -1)
	end
end

--d_id
-- 4251 - ������ ������ ������
-- 4252 - 42515 - �����
-- 42517 - ����� ������ ������
-- 42518-24 /mform
-- 42525 - ����� �� �����
-- 
--
--
--
--
--
--


function create_log(text)
	myServer = string.match(sampGetCurrentServerName(), "RADMIR RolePlay | ������: (%d+)")
	file = io.open(getGameDirectory().."//moonloader//MVD//mvd_log.txt", "a")
	time_now = os.date("%x %X")
	file:write(time_now.." | ��� ���: "..myNick.." | ���� ������: RANK | ������: "..myServer.." | "..text.."\n") 
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
		sampAddChatMessage(helper.script.d.." �� ������� ������� �������� ������.")
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
