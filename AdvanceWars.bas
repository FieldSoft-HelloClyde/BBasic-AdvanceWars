
const P_START=0
const P_GAMERUN=1
const P_EXIT=2

Const KEY_UP_c = 38
Const KEY_DOWN_c = 40
Const KEY_LEFT_c = 37
Const KEY_RIGHT_c = 39

'游戏中*/
const O_START=0
const O_RUN=1
const O_OVER=2

const ResMapName=0'地图资源文件名*/
const ResSysName=1'系统资源文件名（全局）*/
const ResAnimName=2'动画库文件名*/
const ResUnSysName=3'非系统资源文件名（局部）*/
const resstring=4

const SPECIALVAL=19890416	'特殊值，为了避免初始化数据*/

const PERSON=0		'人脑*/
const COM=1		'电脑*/

const MOVEMODE=1	'移动模式*/
const CHOOSEMODE=2	'选择模式*/
const ATTMODE=3	'攻击模式*/
const DROPMODE=4	'释放模式*/

const PLAIN=0		'平原*/
const FOREST=1		'树林*/
const TUBE=2		'油管*/
const MOUNTAIN=3		'山*/
const RIVER=4		'河流*/
const ROAD=5		'公路*/
const SHOAL=6		'浅滩*/
const SEA=7		'海*/
const REEF=8		'暗礁*/
const Bridge=9		'桥*/

const HEADQUARTERS=10	'总部*/
const CITY=11	'城市*/
const FACTORY=12	'工厂*/
const AIRPORT=13 	'机场*/
const SHIPYARD=14	'船厂*/

const INFANTRY=15	'步兵*/
const ARTILLERY=16	'管兵*/
const JEEP=17	'吉普*/
const TANK=18	'坦克*/
const BIGTANK=19	'重坦*/
const CANNON=20	'巨炮*/
const REPLENISHMENT=21	'补给*/
const HIGHCANNON=22	'高炮*/
const ROCKET=23	'火箭*/
const AIRKILLER=24	'防空*/
const MISSILE=25	'导弹*/
const BATTLEPLANE=26	'战机*/
const BOMBER=27	'轰炸机*/
const ARMED=28	'武装*/
const CONVEYANCEJ=29	'运输（机）*/
const BATTLESHIP=30	'战舰*/
const CRUISER=31	'巡洋舰*/
const CONVEYANCEC=32	'运输（船）*/
const SUBMARINE=33	'潜艇*/

const TROOPSMAX=50	'军队人数上限*/
const BUILDMAX=100	'建筑数量上限*/

'图片资源号*/
const RESCURSOR=0	'光标*/
const RESMENU=1	'菜单*/
const RESNAME=2	'名称*/
const RESLUMPPIC=3	'地形图片*/
const RESTROOPSPIC=4	'军队图片*/

const SYSMAX=5	'系统资源个数*/
const UNSYSMAX=14	'非系统资源个数*/
const ANIMMAX=4	'动画资源个数*/

const MAPMAX=4	'图层总数*/
const MAXLPWID=50	'地图宽度上限*/
const MAXLPHGT=50	'地图高度上限*/

const MAPBASLUMPWID=16	'基块宽*/
const MAPBASLUMPHGT=16	'基块高*/

const RESMAX=10

const LCD_PIXWID=240	'屏幕实际尺寸(单位：象素)*/
const LCD_PIXHGT=160

const LCD_LPWID=15	'屏幕LP尺寸(单位：块)*/
const LCD_LPHGT=10
'=================================================
dim ENV 	'机型*/
dim GR_DELAY 	'延迟时间（减小绘制地图的时间差）*/
dim CF_DELAY 	'光标闪烁延时*/
dim BG_DELAY 	'背景移动延时*/
dim SYSTIME 	'系统时间*/
dim OPERAT 	'操作*/

dim Leader(2) 

dim LumpTypeIndex(3,96) 		'图层基块类型（由MapLumpID索引，地形是类型，建筑和军队是ID）*/
dim MapLumpID(4,50,50) '地图块ID*/

'struct RESPIXSIZE ResLump(RESMAX) 	'说明图片资源块象素尺寸*/
dim reslump_pixwid(10)
dim reslump_pixhgt(10)
'struct RESLPSIZE Res(RESMAX) 		'说明图片资源LP尺寸*/
dim Res_lpwid(10)
dim Res_lphgt(10)
'struct MAPTYPE Map 			'说明地图属性*/
dim map_lpwid
dim map_lphgt
dim map_x
dim map_y
'struct TROOPSTYPE Troops 		'说明军队属性*/
dim troops_MobileType(19)		'机动类型（轮子、履带等）*/
dim troops_Flexibility(19)		'机动性*/
dim troops_BattleType(19)		'作战类型（车辆、飞机等）*/
dim troops_SLS_Type(19)		'海陆空类型*/
dim troops_Energy(19)			'能量*/
dim troops_HaveWeapon(19)		'有无武器*/
dim troops_WeaponType(19,2)		'武器类型*/
dim troops_Explosive(19)		'弹药量*/
dim troops_AttackScope(19,2)		'攻击范围（以2位数确定攻击范围）*/
dim troops_AttackObject(19,2)	'攻击目标（以最多4位数确定攻击对象的作战类型）*/
dim troops_AttackAdvantage(19,2)	'攻击优势（以最多4位数确定攻击对象的优势） */
dim troops_Conveyance(19)		'运输属性，-1为无运输功能，记录机动属性*/
dim troops_Attack(19,19)		'攻击力（对所有军队）*/
dim troops_Price(19)
'struct TROOPSSTATE Player 		'说明玩家属性*/
dim player_Role(2)			'角色*/
dim player_Money(2)			'金钱*/
dim player_Wrath(2)			'愤怒值（使用技能）*/
dim player_Number(2)			'军队数量*/
dim player_Code(50,50)	'代号*/
dim player_Owner(50,50)	'所属*/
dim player_Type(2,50)		'类型（对应19种基本类型，下标从0到18，可确定该目标的基本属性）*/
dim player_Energy(2,50)	'能量*/
dim player_Life(2,50)		'生命*/
dim player_Explosive(2,50)	'弹药量*/
dim player_X(2,50)		'X坐标*/
dim player_Y(2,50)		'Y坐标*/
dim player_TX(2,50)		'X坐标*/
dim player_TY(2,50)		'Y坐标*/
dim player_Moved(2,50)	'是否移动过*/
dim player_EMS_Code(2,50)	'运输代号*/
'struct LUMPTYPE MapLump(15) 		'说明地形（建筑）属性*/
dim MapLump_Defense(15)'防御*/
dim MapLump_FixType(15)'修理类型*/
dim MapLump_Bar(15,7)'对作战类型的阻碍*/
'struct Point CursorLCD 			'说明光标坐标（相对屏幕）*/
dim CursorLCD_x
dim CursorLCD_y
'struct POint CursorMap 			'说明光标坐标（相对地图）*/
dim CursorMap_x
dim CursorMap_y
'struct REVTYPE REV 			'说明返回坐标属性*/
dim rev_x
dim rev_y
dim rev_w
dim rev_h
'struct OBJTYPE OBJ(6) 			'说明目标属性（记录数据）*/
dim obj_MAPX(6)
dim obj_MAPY(6)
dim obj_LCDX(6)
dim obj_LCDY(6)
dim obj_X(6)
dim obj_Y(6)
dim obj_ID(6)
dim obj_OWNER(6)
dim obj_TYPE(6)
dim obj_CODE(6)
dim obj_BATTLETYPE(6)
dim obj_ATTACKSCOPE(6)
dim obj_FARATTACKER(6)
dim obj_LIFE(6)
dim obj_SLS_TYPE(6)
dim obj_MOBILETYPE(6)
'
dim OBJBOXMARK(6) 			
'struct ASTMP TMP 			'说明临时变量属性*/
dim tmp_VAL
dim tmp_CODE
dim tmp_OWNER
dim tmp_TYPE
dim tmp_ID
dim tmp_X
dim tmp_Y
dim tmp_W
dim tmp_H
dim tmp_offsetX
dim tmp_offsetY
dim tmp_Energy
dim tmp_Explosive
'struct Point CursorSignMap(2) 		'光标位置记录*/
dim CursorSignMap_x(2) 
dim CursorSignMap_y(2)
'struct Point CursorSignLCD(2) 		'光标位置记录*/
dim CursorSignLCD_x(2) 
dim CursorSignLCD_y(2)
'
dim SHOW_CURSOR 	'显示光标*/

dim OBJChoose1, OBJChoose2 		'选定目标时用，通用数据地址*/
dim MoveStep 		'移动标记*/
dim Carry 		'搭载*/
dim CarriedMark 	'被搭载标记*/

dim Controler 		'目前控制者*/
dim ObjTroopsType 	'目标类型（可行域计算）*/

dim Production 		'产值*/
dim Technical 		'技能开关*/
dim Technical_Days(2) 	'技能有效几回合*/


dim STATE 		'状态*/
dim PHASE 		'进程*/


dim Class 		'关卡*/
dim Winer 		'赢家*/

dim order 		'位置以获得控制*/

'struct Point FaceOffset(4) 	'面部偏移*/
dim FaceOffset_x(4) 
dim FaceOffset_y(4)
'
dim GameRound 		'回合记数*/

dim ReDrawMap 		'重绘地图指令*/
dim ReDrawCross 	'重绘可行域指令*/

dim OutGameRun 		'跳出GameRun*/

dim PageStage 		'前台页面*/
dim PageBack 		'后台页面*/
dim PageMap 		'地图页面*/
dim PageTMP 		'临时页面*/

dim ResMap(3) 		'地图资源*/
dim ResSys(5) 	'系统资源*/
dim ResUnSys(14) 	'非系统资源*/
dim ResAnim(4) 	'动画资源*/

dim MenuOffsetX 	'系统菜单X坐标偏移（供多个显示项目使用）*/
dim Key, Key_Box(6) 	'按键设定*/

dim OptionsList(7) 	'选项表*/
dim Options, Options_Num 	'选项变量及个数（通用）*/

dim FileNum 		'地图文件个数*/

'struct Point ATTOBJ(40) '攻击目标坐标*/
dim ATTOBJ_x(40) 
dim ATTOBJ_y(40)
'
dim ATTOBJNUM 		'攻击目标个数*/
dim ATTOBJCODE 		'选中攻击目标*/
dim WeaponUse 		'使用武器攻击*/

'struct Point DROPADDR(4) '释放地址*/
dim DROPADDR_x(4) 
dim DROPADDR_y(4)
'
dim DROPADDRNUM 	'释放地址个数*/
dim DROPADDRCODE 	'选中释放地址*/

dim Build_Number(2,5) 			'玩家建筑数量*/
dim Build_X(2,5,100), Build_Y(2,5,100) '建筑坐标*/
dim Build_Enduring(50,50) 	'建筑耐久度*/

'struct Point REP(4) 	'补给目标坐标*/
dim REP_x(4) 
dim REP_y(4)
'
dim REPNUM 		'补给目标个数*/
dim MoneyFrameX 	'金钱框X坐标*/

'struct Point Add 	'增量*/
dim Add_x
dim Add_y
'
dim PressDelay 		'按键延时*/

dim RESNAMEBOX$(10) 	'资源库文件名*/

dim Path$
dim DataMapName$ 	'地图数据文件名*/
dim MissionSavFile$

Dim FontRes(9)

dim simpic

'========================================================

declare function GetATTWeapon(objATTer,objATTed) 
declare function GetMidnum(num,wc) 
declare function GetnumLen(num) 
declare function ReadData(file$) 
declare function AddBox(bas_val,add_val,limit_left,limit_right,mode) 
declare function InitData() 
declare function GetImpede(X,Y) 
declare sub GameRun() 
declare sub Controller() 
declare sub MapDriver() 
declare sub SetMap(MapCode,ID,X,Y,W,H) 
declare sub InitPic() 
declare sub DrawMap() 
declare sub DrawCross() 
declare sub DrawCursor() 
declare sub ShowPage(Page) 
declare sub OutTextnum(page,x,y,num,mode) 
declare sub ShowIDPic(Page,MapCode,ID,x,y) 
declare sub GetGeography(x,y,mode) 
declare sub SetCross(objbox) 
declare sub PutIn(X,Y) 
declare sub DrawDialog(Page,X,Y,W,H) 
declare sub GameMenu() 
declare function GetKey(ms) 
declare sub InitRound() 
declare sub SeeTroopsMSG(type) 
declare sub SeeMapMSG() 
declare sub GameState() 
declare function GetOBJData(X,Y) 
declare function GetATTOBJ(objbox) 
declare function GetREPOBJ(objbox) 
declare function REPother() 
declare function OBJConsume(objbox,Consume) 
declare sub KillOBJ(owner,code) 
declare function IsCross(X,Y) 
declare sub MoveAToB(objbox,X,Y) 
declare sub ChooseToDo() 
declare function ChooseATT() 
declare function GetATTVal(objATTer,objATTed) 
declare sub Fight(objATTer,objATTed) 
declare function CanATT(objATTer,objATTed) 
declare sub Produce(Producer) 
declare sub AddTroops(ID,X,Y,setmoved) 
declare sub ShowAnimation(Page,ID,X,Y,W,H,PicNum,Delay) 
declare sub ShowLib(Page,Pic,DX,DY,W,H,X,Y) 
declare sub ChooseDrop() 
declare function GetDropAddr() 
declare sub GameStart() 
declare sub PlayRound() 
declare sub GameOver() 
declare function intoGame(gamemode) 
declare sub ComOperate() 
declare sub AdjustWindow(X,Y) 
declare sub THINKTODO(objbox) 
declare function GETBESTOBJ( objbox) 
declare sub GOGOGO( objbox) 
declare function FINDENEMY(objbox) 
declare function CLOSEATTOBJ(objbox,ATTOBJ) 
declare sub GOTOHERE(objbox,X,Y) 

declare function UseTechnical(code) 
declare function GetBacklog(num) 
declare sub GetTrack(X,Y,bas_x,bas_y) 
declare sub GetMoney() 
declare function SetGame() 
declare sub GetFileNum(FilePath$) 
declare function LOF_c(file$) 
declare sub Rectangle_c(Page,x1,y1,x2,y2,style,c)
declare sub main()
declare function getsecond()
declare function getminute()
declare function gethour()
declare function getday()
declare sub showpich(page,pic,dx,dy,w,h,x,y,mode)
declare sub outtextxy(page,x,y,stri$)
Declare Function ShowStr(Page,x,y,Text$)'输出字符,返回字符串所占的字节数
declare sub showpic_h90(page,pic,x0,y0,w,d,x,y,mode)
declare sub screenshot()
declare sub msdelay_c(ms)
declare sub waitkey_c()

main()

sub main()
	dim cnt1,cnt2
	dim time
	dim logo,tmpext$,tmpext2$,videoid,videopage
	dim m_x,m_y
	SetBKMode(TRANSPARENT)
	'FILE *fp
	
	Cnt1 = 0
	while cnt1<4
		resnamebox$(cnt1)=""
		cnt1=cnt1+1
	wend
	DataMapName$=""
	Path$=""
	MissionSavFile$=""
	ENV = GetENV!()
	if env=env_sim then
		path$="高级战争\"
		resnamebox$(resmapname)="高级战争\map.rlb"
		resnamebox$(ressysname)="高级战争\system.rlb"
		resnamebox$(resanimname)="高级战争\animation.rlb"
		resnamebox$(resunsysname)="高级战争\unsystem.rlb"
		resnamebox$(resstring)="高级战争\string.rlb"
		tmpext$="高级战争\logo.rlb"
		tmpext2$="高级战争\video.rlb"
		setlcd(240,320)
		gr_delay=75
		cf_delay=75
		bg_delay=30
	else 
		gr_delay=0
		cf_delay=75
		bg_delay=0
		path$="高级战争\"
		resnamebox$(resmapname)="高级战争\map.lib"
		resnamebox$(ressysname)="高级战争\system.lib"
		resnamebox$(resanimname)="高级战争\animation.lib"
		resnamebox$(resunsysname)="高级战争\unsystem.lib"
		resnamebox$(resstring)="高级战争\string.lib"
		tmpext$="高级战争\logo.lib"
		tmpext2$="高级战争\video.lib"
	end if
	MissionSavFile$=Path$
	MissionSavFile$=MissionSavFile$+"Mission.sav"
	
	videopage=createpage()
	simpic = loadres(resnamebox$(resstring),10)
	logo=loadres(tmpext$,1)
	showlib(videopage,logo,0,0,0,0,0,0)
	showpage(videopage)
	freeres(logo)
	msdelay_c(2000)
	videoid=2
	while videoid<=8
		logo=loadres(tmpext$,videoid)
		showlib(videopage,logo,0,0,0,0,0,0)
		showpage(videopage)
		freeres(logo)
		msdelay_c(70)
		videoid ++
	wend
	
	if initdata()=1 then
		phase=p_start
	else
		phase=p_exit
	end if
	if phase=p_exit then
		print "初始化数据错误！"
		waitkey_c()
		end
	end if
	
	videoid=1
	while videoid <= 280
		logo=loadres(tmpext2$,videoid)
		showlib(videopage,logo,0,0,0,0,0,0)
		showpage(videopage)
		freeres(logo)
		getkey(0)
		if key = key_enter or key = key_escape then
			videoid=281
		end if
		'msdelay_c(40)'70
		videoid ++
	wend
	logo=loadres(tmpext2$,5)
	showlib(videopage,logo,0,0,0,0,0,0)
	showpage(videopage)
	freeres(logo)
	msdelay_c(1000)
	
	time=getsecond()
	cnt1=0
	while cnt1=0
		ShowLib(PageBack,ResUnSys(0), 0, 0, 0, 0, 0, 0)'/*封面*/
		if time> getsecond() then
			time=time-60
		end if
		if getsecond()-time<1 then
			ShowLib(PageBack, ResUnSys(1), 0, 0, 0, 0, 74, 101)
		else if getsecond()-time>1 then
			time=getsecond()
		end if
		ShowPage(PageBack)
		key=inkey()
		if key >= 0 then
			if keypress(key_enter) then
				cnt1=1
			else if keypress(key_escape) then
				phase=p_exit
				cnt1=1
			end if
		else
			m_x = getpenposx(key)
			m_y = getpenposy(key)
			if m_y > 0 and m_y < 65 then
				if m_x > 6 and m_x < 45 then
					screenshot()
				else if m_x > 55 and m_x < 126 then
					cnt1=1
				else if m_x > 140 and m_x < 210 then
					phase=p_exit
					cnt1=1
				end if
			end if
		end if
	wend
	if keypress(key_right_c) then
		open missionsavfile$ for binary as #1
		class=0
		put #1,class
		close #1
	else if keypress(key_left_c) then
		open missionsavfile$ for binary as #1
		get #1,class
		class=class+1
		seek #1,0
		put #1,class
		close #1
	end if
	while phase<>p_exit
		if phase=p_start then
			gamestart()
		else if phase=p_gamerun then
			gamerun()
		end if
	wend
	DeletePage(videopage)
	DeletePage(PageStage)
	DeletePage(PageTMP)
	DeletePage(PageBack)
	DeletePage(PageMap)
end sub

function GetATTWeapon(objATTer,objATTed)
	dim cnt1
	dim cnt2
	dim sign
	sign=0
	weaponuse=0
	while weaponuse < 2 
		cnt2 = getnumlen(troops_attackobject(obj_type(objatter),weaponuse))
		cnt1 = 1
		while cnt1 <= cnt2
			if getmidnum(troops_attackobject(obj_type(objatter),weaponuse),cnt1) = OBJ_BATTLETYPE(objATTed) then
				if player_explosive(obj_owner(objatter),obj_code(objatter))<>0 then
					GetATTWeapon = weaponuse
					goto endGetATTWeapon
				else
					if sign=0 and weaponuse=1 then
						GetATTWeapon = weaponuse
						goto endGetATTWeapon
					end if
				end if
				sign=1
			end if
			cnt1++
		wend
		weaponuse++
	wend
	GetATTWeapon = -1
	endGetATTWeapon:
end function

function GetMidnum(num,wc)
	dim cnt1
	cnt1=1
	while cnt1<wc
		num=num/10
		cnt1++
	wend
	getmidnum=num mod 10
end function

function GetnumLen(num)
	dim length
	if num=0 then
		length=1
	else
		length=0
		while num>0
			num=num/10
			length++
		wend
	end if
	getnumlen=length
end function

function ReadData(file$)
	'struct POINT Cnt
	dim cnt_x
	dim cnt_y
	'
	dim buidtotal,cnt1
	
	cursorsignmap_x(0)= -1
	cursorsignmap_x(1)= -1
	
	if lof_c(file$)<= 0 then
		readdata=0
		goto end_readdata
	end if
	
	open file$ for binary as #1
	OutTextxy(0, 5, 10, "读取地图...")
	seek #1,64
	get #1,map_lpwid
	get #1,map_lphgt
	
	if map_lpwid<lcd_lpwid or map_lphgt<lcd_lphgt or map_lpwid > maxlpwid or map_lphgt>maxlphgt then
		close #1
		readdata=0
		goto end_readdata
	end if
	player_number(0) = 0
	player_number(1) = 0
	buidtotal = 0
	cnt1=0
	while cnt1<5
		build_number(0,cnt1)=0
		build_number(1,cnt1)=0
		cnt1++
	wend
	
	cnt_y = 0
	while cnt_y < map_lphgt
	
		cnt_x = 0
		while cnt_x < map_lpwid
			get #1,maplumpid(0,cnt_x,cnt_y)
			get #1,maplumpid(1,cnt_x,cnt_y)
			get #1,maplumpid(2,cnt_x,cnt_y)
			
			getgeography(cnt_x,cnt_y,1)
			
			if tmp_code = 1 then
				if tmp_owner <> -1 then
				
					tmp_type -= 10
					build_x(tmp_owner,tmp_type,build_number(tmp_owner,tmp_type))=cnt_x
					build_y(tmp_owner,tmp_type,build_number(tmp_owner,tmp_type))=cnt_y
					build_number(tmp_owner,tmp_type) ++
					buidtotal ++
					if buidtotal > buildmax then
						readdata = 0
						goto end_readdata
					end if
				end if
				
				build_enduring(cnt_x,cnt_y) = 20
				
				if tmp_type = 0 then
					cursorsignmap_x(tmp_owner) = cnt_x
					cursorsignmap_y(tmp_owner) = cnt_y
					
					adjustwindow(cnt_x,cnt_y)
					
					cursorsignlcd_x(tmp_owner) = cnt_x + map_x
					cursorsignlcd_y(tmp_owner) = cnt_y + map_y
				end if
			end if
			
			if maplumpid(2,cnt_x,cnt_y) <> -1 then
				addtroops(lumptypeindex(2,maplumpid(2,cnt_x,cnt_y)),cnt_x,cnt_y,0)
			else
				player_code(cnt_x,cnt_y) = 0
			end if
			
			cnt_x ++
		wend
		cnt_y ++
	wend
	setmap(3,-1,0,0,map_lpwid,map_lphgt)
	close #1
	readdata=1
	end_readdata:
end function

function AddBox(bas_val,add_val,limit_left,limit_right,mode)

	tmp_val=bas_val + add_val
	
	if tmp_val<limit_left then
	
		if mode=1 then
			tmp_val=limit_right
		else
			tmp_val=limit_left
		end if
	else if tmp_val>limit_right then
	
		if mode=1 then
			tmp_val=limit_left
		else
			tmp_val=limit_right
		end if
		
	end if
	
	addbox=tmp_val
end function

function InitData()
	'FILE *fp
	dim tmp$
	dim cnt1
	dim cnt2
	
	font(font_12song)
	
	PageStage = CreatePage()
	PageBack  = CreatePage()
	PageMap   = CreatePage()
	PageTMP   = CreatePage()
	
	'FillPage(PageStage,0,0,320,240,{FFFFFF})
	'FillPage(PageBack,0,0,320,240,{FFFFFF})
	'FillPage(PageMap,0,0,320,240,{FFFFFF})
	'FillPage(PageTMP,0,0,320,240,{FFFFFF})
	
	initpic()
	
	cnt1=0
	while cnt1<3
		resmap(cnt1)=loadres(resnamebox$(resmapname),cnt1+1)
		cnt1++
	wend
	cnt1=0
	while cnt1<sysmax
		ressys(cnt1)=loadres(resnamebox$(ressysname),cnt1+1)
		cnt1++
	wend
	cnt1=0
	while cnt1<unsysmax
		resunsys(cnt1)=loadres(resnamebox$(resunsysname),cnt1+1)
		cnt1++
	wend
	cnt1=0
	while cnt1<animmax
		resanim(cnt1)=loadres(resnamebox$(resanimname),cnt1+1)
		cnt1++
	wend
	cnt1=0
	while cnt1<=8
		fontres(cnt1)=loadres(resnamebox$(resstring),cnt1+1)
		cnt1++
	wend
	
	tmp$=""
	tmp$=path$
	tmp$=tmp$+"advance.dat"
	if lof_c(tmp$)<=0 then
		InitData=0
		goto end_InitData
	end if
	open tmp$ for binary as #1
	
	cnt1=0
	while cnt1<96
		get #1,lumptypeindex(0,cnt1)
		cnt1++
	wend
	
	cnt1=0
	while cnt1<15
		get #1,maplump_defense(cnt1)
		get #1,maplump_fixtype(cnt1)
		cnt2=0
		while cnt2<7
			get #1,maplump_bar(cnt1,cnt2)
			cnt2++
		wend
		cnt1++
	wend
	cnt1=0
	while cnt1 < 19
		get #1,troops_flexibility(cnt1)
		'print troops_flexibility(cnt1)
		get #1,troops_mobiletype(cnt1)
		get #1,troops_battletype(cnt1)
		get #1,troops_sls_type(cnt1)
		get #1,troops_energy(cnt1)
		get #1,troops_haveweapon(cnt1)
		
		cnt2=0
		while cnt2<2
			get #1,Troops_WeaponType(Cnt1,cnt2)
			cnt2++
		wend
		
		get #1,troops_explosive(cnt1)
		
		cnt2=0
		while cnt2<2
			get #1,troops_attackscope(cnt1,cnt2)
			cnt2++
		wend
		
		cnt2=0
		while cnt2<2
			get #1,troops_attackobject(cnt1,cnt2)
			cnt2++
		wend
		
		cnt2=0
		while cnt2<2
			get #1,troops_attackadvantage(cnt1,cnt2)
			cnt2++
		wend
		
		get #1,troops_conveyance(cnt1)
		
		cnt2=0
		while cnt2<19
			get #1,troops_attack(cnt1,cnt2)
			cnt2++
		wend
		
		get #1,troops_price(cnt1)
		
		cnt1++
	wend
	'waitkey_c()
	close #1
	
	cnt1=0
	while cnt1<15
		lumptypeindex(1,cnt1)=cnt1+10
		cnt1++
	wend
	
	cnt1=0
	while cnt1<38
		lumptypeindex(2,cnt1)=cnt1+25
		cnt1++
	wend
	
	reslump_pixwid(0)=16
	reslump_pixhgt(0)=16
	reslump_pixwid(1)=16
	reslump_pixhgt(1)=32
	reslump_pixwid(2)=16
	reslump_pixhgt(2)=16
	
	res_lpwid(0)=12
	res_lphgt(0)=8
	res_lpwid(1)=5
	res_lphgt(1)=3
	res_lpwid(2)=19
	res_lphgt(2)=2
	
	key_box(0)=key_down_c
	key_box(1)=key_up_c
	key_box(2)=key_left_c
	key_box(3)=key_right_c
	key_box(4)=key_enter
	key_box(5)=key_escape
	
	faceoffset_x(0)=110
	faceoffset_x(1)=107
	faceoffset_x(2)=108
	faceoffset_x(3)=114
	
	faceoffset_y(0)=20
	faceoffset_y(1)=62
	faceoffset_y(2)=112
	faceoffset_y(3)=160
	
	InitData=1
	end_InitData:
end function

function getimpede(x,y)

	GetGeography(X, Y, 2)
	
	if tmp_code = 2 and tmp_owner <> controler then
		getimpede=100
	else
		GetGeography(X, Y, 1)
		getimpede = MapLump_Bar(TMP_TYPE,Troops_MobileType(ObjTroopsType))
	end if
end function

sub gamerun()
	
	CursorLCD_X = CursorSignLCD_X(0)
	CursorLCD_Y = CursorSignLCD_Y(0)

	CursorMap_X = CursorSignMap_X(0)
	CursorMap_Y = CursorSignMap_Y(0)

	AdjustWindow(CursorMap_X, CursorMap_Y)

	ReDrawMap = 1
	ReDrawCross = 0
	
	Player_Money(0) = 0
	Player_Money(1) = 0

	SHOW_CURSOR = 0
	STATE = 0
	GameRound = 1
	Controler = 0

	MoneyFrameX = 3

	OPERAT = O_START

	SYSTIME	= getday()*1000000 + gethour()*10000 + getminute()*100 + getsecond()
	OutGameRun = 0
	while OutGameRun = 0
		GameState()
	wend
end sub

sub controller()
	add_x=0
	add_y=0
	
	pressdelay=0
	
	getkey(0)
	
	if key=(key_left_c) then
		add_y = -1
		pressdelay=100
	end if
	if key=(key_right_c) then
		add_y = 1
		pressdelay=100
	end if
	if key=(key_down_c) then
		add_x = -1
		pressdelay=100
	end if
	if key=(key_up_c) then
		add_x = 1
		pressdelay=100
	end if
	if key=(key_enter) then
		msdelay_c(300)
		if state=0 then
			GetGeography(CursorMap_X, CursorMap_Y, 2)
			if tmp_code=2 and tmp_owner=controler and player_moved(controler,player_code(cursormap_x,cursormap_y))=0 then
				objchoose1=GetOBJData(CursorMap_X, CursorMap_Y)
				setcross(objchoose1)
				redrawmap=1
				redrawcross=1
			else if tmp_type>=12 and tmp_type<=14 and tmp_owner=controler then
				produce(tmp_type)
			else
				gamemenu()
			end if
		else if state=movemode then
			if iscross(cursormap_x,cursormap_y) then
				moveatob(OBJChoose1, CursorMap_X, CursorMap_Y)
				OBJChoose2 = GetOBJData(CursorMap_X, CursorMap_Y)
				STATE = CHOOSEMODE
				ReDrawMap = 1
				ReDrawCross = 0
			end if
		end if
	else if key=(key_escape) then
		msdelay_c(300)
		if state=movemode then
			STATE = 0
			Map_X = OBJ_MAPX(OBJChoose1)
			Map_Y = OBJ_MAPY(OBJChoose1)
			CursorLCD_X = OBJ_LCDX(OBJChoose1)
			CursorLCD_Y = OBJ_LCDY(OBJChoose1)
			CursorMap_X = OBJ_X(OBJChoose1)
			CursorMap_Y = OBJ_Y(OBJChoose1)
			OBJBOXMARK(OBJChoose1) = 0
			SetMap(3, -1, REV_X, REV_Y, REV_W, REV_H)
			ReDrawMap = 1
		else
			BitBltPage(PageBack, PageMap)
			GetGeography(CursorMap_X, CursorMap_Y, 2)
			if TMP_CODE = 2 then
				SeeTroopsMSG(-1)
			else
				SeeMapMSG()
			end if
			ShowPage(PageBack)
			while not getkey(0)
			wend
			msdelay_c(300)
		end if
	end if
end sub

sub mapdriver()
	if map_x > lcd_lpwid - map_lpwid and map_x < 0 then
		tmp_x = addbox(cursorlcd_x,add_x,1,lcd_lpwid-2,0)
	else if lcd_lpwid=map_lpwid then
		tmp_x = addbox(cursorlcd_x,add_x,0,lcd_lpwid-1,0)
	else if map_x = 0 then
		tmp_x = addbox(cursorlcd_x,add_x,0,lcd_lpwid-2,0)
	else if map_x = lcd_lpwid - map_lpwid then
		tmp_x = addbox(cursorlcd_x,add_x,1,lcd_lpwid-1,0)
	end if
	if tmp_x<> cursorlcd_x then
		cursorlcd_x = tmp_x
		cursormap_x = cursorlcd_x-map_x
	else if (cursorlcd_x=1 or cursorlcd_x=lcd_lpwid-2)and add_x<>0 then
		map_x -= add_x
		cursormap_x = cursorlcd_x - map_x
		
		redrawmap=1
		pressdelay=gr_delay
	end if
	
	if map_y>lcd_lphgt-map_lphgt and map_y<0 then
		tmp_y=addbox(cursorlcd_y,add_y,2,lcd_lphgt-3,0)
	else if lcd_lphgt=map_lphgt then
		tmp_y=addbox(cursorlcd_y,add_y,0,lcd_lphgt-1,0)
	else if map_y=0 then
		tmp_y=addbox(cursorlcd_y,add_y,0,lcd_lphgt-3,0)
	else if map_y=lcd_lphgt-map_lphgt then
		tmp_y=addbox(cursorlcd_y,add_y,2,lcd_lphgt-1,0)
	end if
	if tmp_y<>cursorlcd_y then
		cursorlcd_y=tmp_y
		cursormap_y=cursorlcd_y - map_y
	else if (cursorlcd_y=2 or cursorlcd_y=lcd_lphgt-3)and add_y<>0 then
		map_y -= add_y
		cursormap_y=cursorlcd_y-map_y
		redrawmap=1
		pressdelay=gr_delay
	end if
	msdelay_c(pressdelay)
end sub

'设置图层图块值

sub setmap(mapcode,id,x,y,w,h)
	TMP_y=0
	while tmp_y < h
	
		tmp_x=0
		while tmp_x < w
			maplumpid(mapcode,tmp_x + x,tmp_y + y) = id
			tmp_x++
		wend
		tmp_y++
	wend
end sub

sub initpic()
	dim cnt1
	cnt1=0
	while cnt1<3 
		resmap(cnt1)=specialval
		cnt1++
	wend
	cnt1=0
	while cnt1<sysmax
		ressys(cnt1)=specialval
		cnt1++
	wend
end sub

'绘制地图

sub drawmap()
	dim map,life,objmark
	dim x,y
	dim tmp_x,tmp_y
	map=0
	while map<3
		y=0
		while y<lcd_lphgt
			x=0
			while x<lcd_lpwid
				if maplumpid(map,x-map_x,y-map_y)<>-1 then
					tmp_x=x-map_x
					tmp_y=y-map_y
					if map<2 then
						ShowIDPic(PageMap, map, MapLumpID(map,TMP_X,TMP_Y), X * MAPBASLUMPWID, (Y + 1) * MAPBASLUMPHGT - ResLump_PixHgt(map))
					else if map=2 then
						OBJMARK = GetOBJData(TMP_X, TMP_Y)
						ShowIDPic(PageMap, map, MapLumpID(map,TMP_X,TMP_Y) + Player_Moved(OBJ_OWNER(OBJMARK),OBJ_CODE(OBJMARK))* 38, X * MAPBASLUMPWID, (Y + 1) *  MAPBASLUMPHGT - ResLump_PixHgt(map))
						if obj_life(objmark)<96 then
							life=obj_life(objmark)/10
							if obj_life(objmark) mod 10 >5 then
								life++
							end if
							OutTextnum(PageMap, X * 16 + 7, Y * 16 + 8, life, 1)
						end if
						OBJBOXMARK(OBJMARK) = 0
					end if
				end if
				x++
			wend
			y++
		wend
		map++
	wend
end sub

'绘制可行域

sub drawcross()
	dim x,y
	y=0
	while y < LCD_LPHGT
		x=0
		while x < LCD_LPWID
			if MapLumpID(3,x - map_x,y - map_y) <>-1 and MapLumpID(2,x-map_x,y-map_y) = -1 then
				ShowPich(PageMap, ResSys(RESCURSOR), 159, 0, 16, 16, X *  MAPBASLUMPWID, Y * MAPBASLUMPHGT, 1)
			end if
			x++
		wend
		y++
	wend
end sub

sub drawcursor()
	dim objmark
	dim life
	dim directx
	dim cnt1
	if state=attmode then
		tmp_x=61
		tmp_y=305
		tmp_w=30
		tmp_h=29
	else
		tmp_x=27
		tmp_y=1
		tmp_w=26
		tmp_h=25
	end if
	if show_cursor = specialval then
		ShowPich(PageBack, ResSys(RESCURSOR), TMP_X, TMP_Y, TMP_W, TMP_H, CursorLCD_X*MAPBASLUMPWID - 5,  CursorLCD_Y*MAPBASLUMPHGT - 5, 1)
		GetGeography(CursorMap_X, CursorMap_Y, 2)
		if tmp_type>=12 and tmp_type <=14 and tmp_owner=controler then
			tmp_x=111
			tmp_w=16
			tmp_h=16
		else
			tmp_x=79
			tmp_w=13
			tmp_h=13
		end if
		if cursorlcd_x>lcd_lpwid-3 then
			tmp_x+=16
			tmp_offsetx=-11
		else
			tmp_offsetx=13
		end if
		tmp_y=0
		if cursorlcd_y>lcd_lphgt-3 then
			if tmp_x<111 then
				tmp_y=14
			end if
			tmp_offsety=-9
		else
			tmp_offsety=13
		end if
		if state <> attmode then
			ShowPich(PageBack, ResSys(RESCURSOR), TMP_X, TMP_Y, TMP_W, TMP_H,  CursorLCD_X*MAPBASLUMPWID + TMP_offsetX, CursorLCD_Y*MAPBASLUMPHGT + TMP_offsetY, 1)
		end if
	end if
	if cursorlcd_y <6 then
		if cursorlcd_x<7 then
			moneyframex=173
		else if cursorlcd_x >7 then
			moneyframex=3
		end if
	end if
	ShowPich(PageBack, ResSys(RESCURSOR), 123, 305, 64, 27, MoneyFrameX, 3, 1)
	ShowPich(PageBack, ResUnSys(10), FaceOffset_X(Player_Role(Controler)), FaceOffset_Y(Player_Role(Controler)), 37, 12, MoneyFrameX + 2, 15, 1)
	OutTextnum(PageBack, MoneyFrameX + 52, 6, Player_Money(Controler), 1)
	if technical then
		cnt1=0
		while cnt1<player_wrath(controler)/10
			ShowPich(PageBack, ResSys(RESCURSOR), 197, 42, 9, 10, MoneyFrameX + Cnt1 * 7, 27, 1)
			cnt1++
		wend
	end if
	if cursorlcd_x>lcd_lpwid/2 then
		menuoffsetx=10
		tmp_offsetx=4
	else
		menuoffsetx=163
		tmp_offsetx=207
	end if
	GetGeography(CursorMap_X, CursorMap_Y, 1)
	ShowPich(PageBack, ResSys(RESCURSOR), 0, 27, 29, 56, TMP_offsetX, 95, 1)
	ShowIDPic(PageBack, TMP_CODE, MapLumpID(TMP_CODE,CursorMap_X,CursorMap_Y),  TMP_offsetX + 7, 125 - ResLump_PixHgt(TMP_CODE))
	ShowPich(PageBack, ResSys(RESNAME), TMP_TYPE * 32, 0, 32, 16, TMP_offsetX - 1, 98,  1)
	ShowPich(PageBack, ResSys(RESCURSOR), 101, 42, 16, 16, TMP_offsetX, 123, 1)'	/*防御星*/
	OutTextnum(PageBack, TMP_offsetX + 20, 127, MapLump_Defense(TMP_TYPE), 1)'/*防御值*/
	
	if tmp_type >=10 then
		ShowPich(PageBack, ResSys(RESCURSOR), 117, 42, 16, 16, TMP_offsetX, 134, 1)
		OutTextnum(PageBack, TMP_offsetX + 20, 138, Build_Enduring(CursorMap_X,CursorMap_Y), 1)
	end if
	GetGeography(CursorMap_X, CursorMap_Y, 2)
	if tmp_type>=15 then
		if tmp_offsetx=4 then
			tmp_offsetx=34
			directx=66
		else
			tmp_offsetx=177
			directx=145
		end if
		if state=attmode then
			ShowPich(PageBack, ResSys(RESCURSOR), 91, 306, 32, 28, TMP_offsetX - 2, 70,1)
			OBJMARK = GetOBJData(CursorMap_X, CursorMap_y)
			OutTextnum(PageBack, TMP_offsetX + 12, 83, GetATTVal(OBJChoose2, OBJMARK), 1)
			OBJBOXMARK(OBJMARK) = 0
		end if
		ShowPich(PageBack, ResSys(RESCURSOR), 0, 27, 29, 56, TMP_offsetX, 95, 1)';/*半透明背景*/
		ShowIDPic(PageBack, 2, MapLumpID(2,CursorMap_X,CursorMap_Y),  TMP_offsetX + 7, 125 - ResLump_PixHgt(2))
		ShowPich(PageBack, ResSys(RESNAME), TMP_TYPE * 32, 0, 32, 16, TMP_offsetX -  1, 98, 1)';/*名称*/
		ShowPich(PageBack, ResSys(RESCURSOR), 133, 42, 8, 8, TMP_offsetX + 4, 124,  1)';	/*生命星*/
		ShowPich(PageBack, ResSys(RESCURSOR), 141, 42, 8, 8, TMP_offsetX + 4, 132,  1)';	/*能量小*/
		TMP_CODE = Player_Code(CursorMap_X,CursorMap_Y)
		life = Player_Life(TMP_OWNER,TMP_CODE) / 10
		if player_life(tmp_owner,tmp_code) mod 10 >5 then
			life++
		end if
		OutTextnum(PageBack, TMP_offsetX + 20, 125, life, 1)
		OutTextnum(PageBack, TMP_offsetX + 20, 133, Player_Energy(TMP_OWNER,TMP_CODE), 1)
		if player_explosive(tmp_owner,tmp_code) <> -1 then
			ShowPich(PageBack, ResSys(RESCURSOR), 133, 50, 8, 8, TMP_offsetX + 4, 140,  1)';	/*弹药小*/
			OutTextnum(PageBack, TMP_offsetX + 20, 141, Player_Explosive(TMP_OWNER,TMP_CODE), 1)
		end if
		if player_ems_code(tmp_owner,tmp_code)<>-1 then
			ShowPich(PageBack, ResSys(RESCURSOR), 0, 27, 29, 56, DirectX, 95, 1)';/*半透明背景*/
			TMP_CODE = Player_EMS_Code(TMP_OWNER,TMP_CODE)
			ShowIDPic(PageBack, 2, Player_Type(TMP_OWNER,TMP_CODE) + TMP_OWNER*19, DirectX + 9, 112)
		end if
	end if
end sub

sub showpage(page)
	showpic(page,simpic,0,0,240,320,0,0,1)	
	FlipPage(Page)
end sub

sub outtextnum(page,x,y,num,mode)
	dim sign1,sign2
	dim str_c$
	if mode=0 then
		str_c$=str$(num)
		OutTextxy(page,x,y,str_c$)
	else
		if mode=1 then
			tmp_w=8
			tmp_h=8
			tmp_y=58
		else if mode=2 then
			tmp_w=6
			tmp_h=5
			tmp_y=66
		else if mode=3 then
			tmp_w=6
			tmp_h=10
			tmp_y=71
		end if
		sign1=getnumlen(num)
		sign2=0
		while sign2<sign1
			ShowPich(page, ResSys(RESCURSOR), 101 + (num mod 10)*TMP_W, TMP_Y, TMP_W,  TMP_H, x - Sign2*7, y, 1)
			num=num/10
			sign2++
		wend
	end if
end sub

sub ShowIDPic(Page,MapCode,ID,x,y)
	tmp_x= (ID mod Res_LPWid(MapCode)) * ResLump_PixWid(MapCode)
	TMP_Y = ID / Res_LPWid(MapCode) * ResLump_PixHgt(MapCode)
	ShowPich(Page, ResMap(MapCode), TMP_X, TMP_Y, ResLump_PixWid(MapCode), ResLump_PixHgt(MapCode), x, y, 1)
end sub

'获取图块类型
'说明：mode = 1 ， 只取地形， mode = 2，取最上层地图
'检查完毕
sub GetGeography(x,y,mode)
	if maplumpid(2,x,y) <> -1 and mode = 2 then
		tmp_id = lumptypeindex(2,maplumpid(2,x,y))
		tmp_owner = (tmp_id-25)/19
		tmp_type = (tmp_id-25) mod 19 + 15
		tmp_code = 2
	else if maplumpid(1,x,y) <> -1 then
		tmp_id=lumptypeindex(1,maplumpid(1,x,y))
		tmp_owner=(tmp_id-10)/5 - 1
		tmp_type=(tmp_id-10) mod 5 + 10
		tmp_code=1
	else
		tmp_id=lumptypeindex(0,maplumpid(0,x,y))
		tmp_type=lumptypeindex(0,maplumpid(0,x,y))
		tmp_code=0
	end if
end sub

sub SetCross(objbox)
	dim times
	dim cnt1
	dim x,y,bas_x,bas_y
	
	ObjTroopsType = OBJ_TYPE(objbox)
	if player_energy(controler,obj_code(objbox))-troops_flexibility(objtroopstype)>=0 then
		times=troops_flexibility(objtroopstype)
	else
		times=player_energy(controler,obj_code(objbox))
	end if
	bas_x=obj_x(objbox)
	bas_y=obj_y(objbox)
	
	REV_X = BAS_X - TIMES
	REV_Y = BAS_Y - TIMES
	REV_W = TIMES * 2 + 1
	REV_H = REV_W
	
	STATE = MOVEMODE
	
	if rev_x<0 then
		rev_w += rev_x
		rev_x=0
	end if
	
	if rev_y<0 then
		rev_h += rev_y
		rev_y = 0
	end if
	
	if rev_x + rev_w> map_lpWid then
		rev_w = map_lpwid - rev_x
	end if
	
	if rev_y + rev_h > map_lphgt then
		rev_h = map_lphgt - rev_y
	end if
	
	maplumpid(3,bas_x,bas_y) = times
	PutIn(BAS_X, BAS_Y)
	times = GetBacklog(TIMES) * 4
	x = bas_x
	y = bas_y - 1
	cnt1=0
	while cnt1 < times
		PutIn(X, Y)
		GetTrack(&X,&Y,BAS_X, BAS_Y)
		Cnt1++
	wend
end sub

'功能：向坐标四周放置机动值(设置可行域)
'检查完毕
sub PutIn(X,Y)
	dim speed,speeded
	
	if x > -1 and y > -1 and x < Map_LPWid and y < Map_LPHgt then
	
		speed = MapLumpID(3,x,y)
		
		if speed <> -1 then
		
			if y >= 1 and y <= Map_LPHgt and x >= 0 and x <= Map_LPWid - 1 then
				
				speeded = speed - GetImpede(X, Y - 1)
				if speeded > MapLumpID(3,x,y - 1) then
					MapLumpID(3,x,y - 1) = speeded
				end if
			end if
			
			if y >= -1 and y <= Map_LPHgt - 2 and x >= 0 and x <= Map_LPWid - 1 then
				
				speeded = speed - GetImpede(X, Y + 1)
				if speeded > MapLumpID(3,x,y + 1) then
					MapLumpID(3,x,y + 1) = speeded
				end if
			end if
			
			if y >= 0 and y <= Map_LPHgt - 1 and x >= 1 and x <= Map_LPWid then
				
				speeded = speed - GetImpede(X - 1, Y)
				if speeded > MapLumpID(3,x - 1,y) then
					MapLumpID(3,x - 1,y) = speeded
				end if
			end if
			
			if y >= 0 and y <= Map_LPHgt - 1 and x >= -1 and x <= Map_LPWid - 2 then
				
				speeded = speed - GetImpede(X + 1, Y)
				if speeded > MapLumpID(3,x + 1,y) then
					MapLumpID(3,x + 1,y) = speeded
				end if
			end if
			
		end if
	end if
end sub

sub DrawDialog(Page,X,Y,W,H)
	dim wid_box(20),wid_num,wid_cnt
	dim hgt_box(20),hgt_num,hgt_cnt
	dim pic
	dim cnt1,cnt2
	'struct POINT BAS
	dim bas_x
	dim bas_y
	'
	bas_x=0
	bas_y=305
	
	pic=ressys(rescursor)
	w -= 13
	
	wid_num=0
	wid_cnt=0
	while wid_cnt<w
		if w-wid_cnt>48 then
			wid_box(wid_num)=48
		else
			wid_box(wid_num)=w-wid_cnt
		end if
		wid_cnt += wid_box(wid_num)
		Wid_Num++
	wend
	h=h-13
	hgt_num=0
	hgt_cnt=0
	while hgt_cnt<h
		if h-hgt_cnt>16 then
			hgt_box(hgt_num)=16
		else
			hgt_box(hgt_num)=h-hgt_cnt
		end if
		hgt_cnt += hgt_box(hgt_num)
		hgt_num ++
	wend
	ShowPich(Page, Pic, BAS_X, BAS_Y, 6, 5, X, Y, 1)
	cnt1=0
	wid_cnt=0
	while cnt1<wid_num
		ShowPich(Page, Pic, BAS_X + 6, BAS_Y, Wid_Box(Cnt1), 5, X + 6 + Wid_Cnt, Y,  1)
		Wid_Cnt += wid_box(cnt1)
		cnt1++
	wend
	ShowPich(Page, Pic, BAS_X + 54, BAS_Y, 7, 5, X + 6 + Wid_Cnt, Y, 1)
	cnt2=0
	hgt_cnt=0
	while cnt2<hgt_num
		tmp_y = Y + 5 + Hgt_Cnt
		ShowPich(Page, Pic, BAS_X, BAS_Y + 5, 6, Hgt_Box(Cnt2), X, TMP_Y, 1)
		cnt1=0
		wid_cnt=0
		while cnt1<wid_num
			ShowPich(Page, Pic, BAS_X + 6, BAS_Y + 5, Wid_Box(Cnt1), Hgt_Box(Cnt2), X + 6 + Wid_Cnt, TMP_Y, 1)
			Wid_Cnt += wid_box(cnt1)
			cnt1++
		wend
		ShowPich(Page, Pic, BAS_X + 54, BAS_Y + 5, 7, Hgt_Box(Cnt2), X + 6 + Wid_Cnt,  TMP_Y, 1)
		hgt_cnt += hgt_box(cnt2)
		cnt2++
	wend
	TMP_Y = Y + 5 + Hgt_Cnt
	ShowPich(Page, Pic, BAS_X, BAS_Y + 21, 6, 8, X, TMP_Y, 1)
	cnt1=0
	wid_cnt=0
	while cnt1<wid_num
		ShowPich(Page, Pic, BAS_X + 6, BAS_Y + 21, Wid_Box(Cnt1), 8, X + 6 +  Wid_Cnt, TMP_Y, 1)
		wid_cnt += wid_box(cnt1)
		cnt1++
	wend
	ShowPich(Page, Pic, BAS_X + 54, BAS_Y + 21, 7, 8, X + 6 + Wid_Cnt, TMP_Y, 1)
end sub

sub gamemenu()
	dim outgamemenu
	dim cnt1
	dim cnt2
	dim door
	dim arrowcnt,arrowdirect
	
	BitBltPage(PageTMP, PageMap)

	Options_Num = 0
	
	OptionsList(0) = 2'
	
	if player_wrath(controler)=60 then
		Options_Num += 2
		'OptionsList(0) = 2
		optionslist(1) = 3
		'options_num += 2
	else if player_wrath(controler)>=30 then
		'OptionsList(0) = 2
		options_num ++
	end if
	
	OptionsList(Options_Num)=6
	Options_Num ++
	OptionsList(Options_Num)=13
	Options_Num ++

	DrawDialog(PageTMP, MenuOffsetX, 10, 61, 13 + Options_Num*16)
	
	cnt1=0
	while cnt1<Options_Num
		ShowPich(PageTMP, ResSys(RESMENU), 0, OptionsList(Cnt1)*16, 54, 16, MenuOffsetX +  5, Cnt1*16 + 15, 1)
		cnt1++
	wend
	
	arrowcnt=0
	arrowdirect=1
	
	outgamemenu=0
	options=0
	while outgamemenu=0
	
		BitBltPage(PageBack, PageTMP)
		
		ShowPich(PageBack, ResSys(RESCURSOR), 143, 0, 16, 16, MenuOffsetX -  10 - ArrowCnt, 16 + Options * 16, 1)
		
		ArrowCnt = AddBox(ArrowCnt, ArrowDirect, 0, 3, 1)
		
		if arrowcnt=0 or arrowcnt=3 then
			arrowdirect = -arrowdirect + 0
		end if
		
		ShowPage(PageBack)
		
		msdelay_c(80)
		
		GetKey(150)
		
		if key=key_left_c then
			options=AddBox(Options, -1, 0, Options_Num - 1, 1)
		else if key=key_right_c then
			options = AddBox(Options, 1, 0, Options_Num - 1, 1)
		else if key=key_enter then
			if optionslist(options)=2 or optionslist(options)=3 then
				UseTechnical(OptionsList(Options) - 1)
				OutGameMenu = 1
			else if OptionsList(Options) = 13 then
				cnt1=0
				while cnt1<50
					BitBltPage(PageBack, PageMap)
					DrawDialog(PageBack, 0, 160 - Cnt1, 240, 50)
					ShowPich(PageBack, ResUnSys(9), 1, 1, 49, 49, 0, 160 - Cnt1, 1)
					ShowPage(PageBack)
					msdelay_c(32)
					cnt1 += 3
				wend
				
				cnt1=1
				while 1
					BitBltPage(PageBack, PageMap)
					DrawDialog(PageBack, 0, 110, 240, 50)
					ShowPich(PageBack, ResUnSys(9), 1, 1, 49, 49, 0, 110, 1)
					OutTextxy(PageBack, 65, 115, "返回主菜单？")
					OutTextxy(PageBack, 75, 131, "是")
					OutTextxy(PageBack, 109, 131, "否")
					ShowPich(PageBack, ResSys(0), 212, 59, 6, 7, 67 + Cnt1 * 32, 136, 1)
					ShowPage(PageBack)
					
					GetKey(300)
					
					if key=key_enter then
						if cnt1=0 then
							OutGameMenu =1
							OutGameRun = 1
							PHASE = P_START
							goto end_gamemenu_while
						else
							cnt1=0
							while cnt1<50 
								BitBltPage(PageBack, PageMap)
								DrawDialog(PageBack, 0, 110 + Cnt1, 240, 50)
								ShowPich(PageBack, ResUnSys(9), 1, 1, 49, 49, 0, 110 + Cnt1, 1)
								ShowPage(PageBack)
								msdelay_c(32)
								cnt1=cnt1+3
							wend
							goto end_gamemenu_while
						end if
					else if key=key_escape then
						cnt1=0
						while cnt1<50
							BitBltPage(PageBack, PageMap)
							DrawDialog(PageBack, 0, 110 + Cnt1, 240, 50)
							ShowPich(PageBack, ResUnSys(9), 1, 1, 49, 49, 0, 110 + Cnt1, 1)
							ShowPage(PageBack)
							msdelay_c(32)
							cnt1 += 3
						wend
						goto end_gamemenu_while
					else if key=key_down_c or key=key_up_c then
						cnt1 = - cnt1 + 1
					end if
				wend
				end_gamemenu_while:
			else if OptionsList(Options) = 6 then
			
				door=0
				while door=0
				
					InitRound()
					
					if Leader(Controler) = COM then
						ComOperate()
						if OPERAT = O_OVER then
							Door = 1
							OutGameMenu = 1
						end if
					else
						Door = 1
						OutGameMenu = 1
					end if
				wend
			else
				OutTextxy(0,10,10,"对不起，该项目未开通!")
				waitkey_c()
			end if
		else if key=key_escape then
			outgamemenu=1
		end if
	wend
	redrawmap=1
end sub

function getkey(ms)
	dim cnt1
	dim touchkey
	dim tkey_x,tkey_y
	dim retimes
	key=0
	cnt1=0
	while cnt1<6
		if keypress(key_box(cnt1)) then
			key=key_box(cnt1)
			cnt1=6
			if ms=-1 then
				waitkey()
			else if ms > 0 then
				msdelay_c(ms)
			end if
			getkey=key
			goto getkey_end
		end if
		cnt1++
	wend
	retimes = 0
	while retimes < 2
		touchkey=inkey()
		if touchkey < 0 then
			retimes = 10
		end if
		retimes ++
	wend
	if touchkey < 0 then
		tkey_x = getpenposx(touchkey)
		tkey_y = getpenposy(touchkey)
		if tkey_y > 0 and tkey_y < 65 then
			if tkey_x > 6 and tkey_x < 45 then
				screenshot()
			else if tkey_x > 55 and tkey_x < 126 then
				key=key_enter
				getkey=key
				goto getkey_end
			else if tkey_x > 140 and tkey_x < 210 then
				key=key_escape
				getkey=key
				goto getkey_end
			end if
		end if
	end if
	getkey=0
	getkey_end:
end function

sub InitRound()
	dim OBJMARK
	dim Consume
	dim troopscode
	dim Cnt1, Cnt2

	if Controler =1 then
		GameRound++
	end if
	troopscode = 0
	while troopscode < Player_Number(Controler)
		Player_Moved(Controler,troopscode) = 0
		troopscode++
	wend
 
	CursorSignMap_X(Controler) = CursorMap_X
	CursorSignMap_Y(Controler) = CursorMap_Y
	CursorSignLCD_X(Controler) = CursorLCD_X
	CursorSignLCD_Y(Controler) = CursorLCD_Y

	Controler = - Controler + 1
	
	troopscode = 0
	while troopscode < Player_Number(Controler)
		TMP_X = *Player_X(Controler,troopscode)
		TMP_Y = *Player_Y(Controler,troopscode)
		OBJMARK = GetOBJData(TMP_X, TMP_Y)
		if OBJ_TYPE(OBJMARK) + 15 = REPLENISHMENT then
			if GetREPOBJ(OBJMARK) then
				REPother()
			end if
		end if
		TMP_TYPE = OBJ_BATTLETYPE(OBJMARK)
		if tmp_type=2 then
			consume=2
		else if tmp_type=3 then
			consume=5
		else if tmp_type=4 then
			consume=1
		else if tmp_type=5 then
			consume=1
		else
			consume=0
		end if
		if tmp_owner=controler and tmp_type>=10 and tmp_type<=14 and obj_sls_type(objmark)=maplump_fixtype(tmp_type) then
			player_life(controler,troopscode)+=5
			player_energy(controler,troopscode)=troops_energy(obj_type(objmark))
			player_explosive(controler,troopscode)=troops_explosive(obj_type(objmark))
		end if
		if player_life(controler,troopscode)>100 then
			player_life(controler,troopscode)=100
		end if
		troopscode += objconsume(objmark,consume)
		GetGeography(TMP_X, TMP_Y, 1)
		OBJBOXMARK(OBJMARK)= 0
	wend
	GetMoney()
	CursorMap_X = CursorSignMap_X(Controler)
	CursorMap_Y = CursorSignMap_Y(Controler)
	CursorLCD_X = CursorSignLCD_X(Controler)
	CursorLCD_Y = CursorSignLCD_Y(Controler)
	Map_X = CursorLCD_X - CursorMap_X
	Map_Y = CursorLCD_Y - CursorMap_Y
	PlayRound()
	STATE = 0
end sub

sub SeeTroopsMSG(type)
	dim cnt1,cnt2,cnt3
	if type=-1 then
		GetGeography(CursorMap_X, CursorMap_Y, 2)
		TMP_CODE = Player_Code(CursorMap_X,CursorMap_Y)
		TMP_Energy = Player_Energy(TMP_OWNER,TMP_CODE)
		TMP_Explosive = Player_Explosive(TMP_OWNER,TMP_CODE)
		if MenuOffsetX = 10 then
			tmp_x=2
		else
			tmp_x=130
		end if
		ShowPich(PageBack, ResSys(RESCURSOR), 61, 305, 30, 29, CursorLCD_X*16 - 6,  CursorLCD_Y*16 - 5, 1)
	else
		TMP_TYPE = type + 15
		TMP_Energy = Troops_Energy(type)
		TMP_Explosive = Troops_Explosive(type)
		TMP_X = 130
	end if
	TMP_offsetX = 0
	TMP_offsetY = 148
	ShowPich(PageBack, ResSys(RESCURSOR), TMP_offsetX, TMP_offsetY, 109, 157, TMP_X, 2,  1)
	ShowPich(PageBack, ResSys(RESNAME), TMP_TYPE * 32, 0, 32, 16, TMP_X + 63, 8, 1)';/*名 称*/
	TMP_TYPE -= 15
	ShowPich(PageBack, ResSys(RESTROOPSPIC), TMP_TYPE * 64, 0, 64, 64, TMP_X - 2, 0, 1)';/*特写照*/
	ShowPich(PageBack, ResSys(RESCURSOR), Troops_MobileType(TMP_TYPE) * 32, 132, 32, 16,  TMP_X + 57, 24, 1)';/*机动类型图标*/
	OutTextnum(PageBack, TMP_X + 93, 28, Troops_Flexibility(TMP_TYPE), 3)
	OutTextnum(PageBack, TMP_X + 87, 42, TMP_Energy, 2)';/*能量*/
	OutTextnum(PageBack, TMP_X + 100, 50, Troops_Energy(TMP_TYPE), 2)
	if troops_explosive(tmp_type)<>-1 then
		ShowPich(PageBack, ResSys(RESCURSOR), 181, 58, 8, 8, TMP_X + 63, 60, 1)
		OutTextnum(PageBack, TMP_X + 59, 58, TMP_Explosive, 2)
		OutTextnum(PageBack, TMP_X + 68, 66, Troops_Explosive(TMP_TYPE), 2)
	end if
	if troops_attackscope(tmp_type,0)>11 then
		ShowPich(PageBack, ResSys(RESCURSOR), 111, 16, 32, 8, TMP_X + 74, 56, 1)';/*攻击范围箭头标志*/
		OutTextnum(PageBack, TMP_X + 79, 66, Troops_AttackScope(TMP_TYPE,0)/10, 2)
		ShowPich(PageBack, ResSys(RESCURSOR), 205, 58, 6, 6, TMP_X + 87, 65, 1)';/*~符号*/
		OutTextnum(PageBack, TMP_X + 95, 66, Troops_AttackScope(TMP_TYPE,0) mod 10, 2)
	end if
	cnt3=0
	while cnt3<2
		TMP_offsetY = Cnt3*48
		if Troops_WeaponType(TMP_TYPE,Cnt3) = -1 then
			TMP_offsetX = 10 
		else
			TMP_offsetX = Troops_WeaponType(TMP_TYPE,Cnt3)
		end if
		ShowPich(PageBack, ResSys(RESNAME), TMP_offsetX*52, 16, 52, 12, TMP_X + 6, 61  + TMP_offsetY, 1)';/*武器名称*/
		if tmp_offsetx<>10 then
			cnt2=GetnumLen(Troops_AttackObject(TMP_TYPE,Cnt3))
			cnt1=0
			while cnt1<cnt2
				TMP_VAL = GetMidnum(Troops_AttackObject(TMP_TYPE,Cnt3),  Cnt1 + 1)
				ShowPich(PageBack, ResSys(RESCURSOR), 29 + TMP_VAL / 2 *  24, 55 - GetMidnum(Troops_AttackAdvantage(TMP_TYPE,Cnt3), Cnt2 - Cnt1)*29, 24, 29, TMP_X + 3 +  Cnt1*26, 73 + TMP_offsetY, 1)';/*优势背景*/
				ShowPich(PageBack, ResSys(RESCURSOR), TMP_VAL * 32, 84,  32, 32, TMP_X + Cnt1*26, 73 + TMP_offsetY, 1)
				cnt1++
			wend
		end if
		cnt3++
	wend
end sub

sub SeeMapMSG()
	dim cnt1,cnt2
	if MenuOffsetX = 10 then
		tmp_x=2
	else
		tmp_x=129
	end if
	GetGeography(CursorMap_X, CursorMap_Y, 1)
	TMP_offsetX = 109
	TMP_offsetY = 148
	ShowPich(PageBack, ResSys(RESCURSOR), TMP_offsetX, TMP_offsetY, 109, 157, TMP_X, 2,  1)
	ShowPich(PageBack, ResSys(RESCURSOR), 61, 305, 30, 29, CursorLCD_X*16 - 6,  CursorLCD_Y*16 - 5, 1)
	ShowPich(PageBack, ResSys(RESNAME), TMP_TYPE * 32, 0, 32, 16, TMP_X + 63, 8, 1)';/*名 称*/
	ShowPich(PageBack, ResSys(RESLUMPPIC), TMP_TYPE * 49, 0, 49, 65, TMP_X + 4,  8, 1)';/*特写照*/
	cnt1=0
	while cnt1<maplump_defense(tmp_type)
		ShowPich(PageBack, ResSys(RESCURSOR), 141, 50, 8, 8, TMP_X + 73 + Cnt1 * 8,  27, 1)';/*防御星*/
		cnt1++
	wend
	if tmp_type>=10 then
		OutTextnum(PageBack, TMP_X + 97, 43, Production, 3)
	end if
	if maplump_fixtype(tmp_type) <> -1 then
		ShowPich(PageBack, ResSys(RESCURSOR), 161 + MapLump_FixType(TMP_TYPE)*21, 66,  21, 15, TMP_X + 84, 57, 1)';/*修理类型*/
	end if
	cnt1=0
	cnt2=0
	while cnt2<7
		TMP_VAL = MapLump_Bar(TMP_TYPE,Cnt2)
		if tmp_val<>100 then
			tmp_offsetx=tmp_x +6 +(cnt1 mod 2)*56
			tmp_offsety=88 +cnt1/2 *16 
			ShowPich(PageBack, ResSys(RESCURSOR), Cnt2*32, 116, 32, 16,  TMP_offsetX, TMP_offsetY, 1)
			OutTextnum(PageBack, TMP_offsetX + 33, TMP_offsetY + 3,  TMP_VAL, 3)
			Cnt1=cnt1+1
		end if
		cnt2++
	wend
end sub

sub gamestate()
	if OPERAT=O_RUN then
		if state=choosemode then
			choosetodo()
		else if state = attmode then
			chooseatt()
		else if state=dropmode then
			choosedrop()
		else
			controller()
			if add_x<>0 or add_y<>0 then
				mapdriver()
			end if
		end if
	else if operat=o_start then
		if getday()*1000000 + gethour()*10000 + getminute()*100 + getsecond() > SYSTIME + 1 then
			GetMoney()
			PlayRound()
			OPERAT = O_RUN
			DrawMap()
		end if
	else if operat=o_over then
		if getday()*1000000 + gethour()*10000 + getminute()*100 + getsecond() > SYSTIME + 1 then
			gameover()
			outgamerun=1
			phase=p_start
		end if
	end if
	if redrawmap then
		drawmap()
		ReDrawMap = 0
		if ReDrawCross then
			drawcross()
		end if
	end if
	bitbltpage(pageback,pagemap)
	drawcursor()
	showpage(pageback)
end sub

'获取目标数据

function getobjdata(x,y)
	dim cnt1
	dim sign1,sign2
	cnt1 = 0
	while 1
		if OBJBOXMARK(Cnt1) <> SPECIALVAL then
			OBJBOXMARK(Cnt1) = SPECIALVAL
			goto end_getobjdata_while
		end if
		cnt1 ++
	wend
	end_getobjdata_while:
	
	OBJ_x(cnt1)=x
	OBJ_y(cnt1)=y
	
	OBJ_mapx(cnt1)=map_x
	OBJ_mapy(cnt1)=map_y
	
	OBJ_lcdx(cnt1)=cursorlcd_x
	OBJ_lcdy(cnt1)=cursorlcd_y
	
	OBJ_ID(Cnt1)=MapLumpID(2,x,y)
	obj_owner(cnt1)=player_owner(x,y)
	obj_code(cnt1)=player_code(x,y)
	obj_type(cnt1)=player_type(obj_owner(cnt1),obj_code(cnt1))
	obj_battletype(cnt1)=troops_battletype(obj_type(cnt1))
	
	OBJ_LIFE(Cnt1) = Player_Life(OBJ_OWNER(Cnt1),OBJ_CODE(Cnt1))
	
	OBJ_ATTACKSCOPE(Cnt1) = Troops_AttackScope(OBJ_TYPE(Cnt1),0)
	
	OBJ_FARATTACKER(Cnt1) = 0
	
	if OBJ_ATTACKSCOPE(Cnt1) <> -1 then
		Sign1 = GetMidnum(Troops_AttackScope(OBJ_TYPE(Cnt1),0), 1)
		Sign2 = GetMidnum(Troops_AttackScope(OBJ_TYPE(Cnt1),0), 2)
		if sign1 <> sign2 then
			OBJ_FARATTACKER(Cnt1) = 1
		end if
	end if
	OBJ_SLS_TYPE(Cnt1) = Troops_SLS_Type(OBJ_TYPE(Cnt1))
	OBJ_MOBILETYPE(Cnt1) = Troops_MobileType(OBJ_TYPE(Cnt1))
	
	getobjdata = cnt1
end function

'获取攻击目标
'检查完毕
function getattobj(objbox)
	dim scope1,scope2
	dim directions
	dim weapon
	dim objmark
	dim cnt1
	dim tmp_x,tmp_y
	
	attobjcode=0
	attobjnum=0
	
	weapon=0
	while weapon<2
		if troops_weapontype(obj_type(objbox),weapon)= -1 then
			goto next_getattobj_while
			'continue
		else if weapon=0 and player_explosive(obj_owner(objbox),obj_code(objbox))=0 then
			goto next_getattobj_while
			'continue
		end if
		Scope1 = GetMidnum(Troops_AttackScope(OBJ_TYPE(objbox),Weapon), 2)
		Scope2 = GetMidnum(Troops_AttackScope(OBJ_TYPE(objbox),Weapon), 1) - Scope1 + 1
		
		TMP_X=obj_x(objbox)
		tmp_y=obj_y(objbox) - scope1
		
		directions=0
		attobjnum=0
		
		cnt1=0
		while 1
			if tmp_x>0 and tmp_x<map_lpwid and tmp_y>=0 and tmp_y <map_lphgt then
				if maplumpid(2,tmp_x,tmp_y)<> -1 then
					objmark = GetOBJData(TMP_X, TMP_Y)
					if obj_owner(objmark) <> obj_owner(objbox) then
						if GetATTWeapon(objbox, OBJMARK) <> -1 then
							ATTOBJ_X(ATTOBJNUM) = TMP_X
							ATTOBJ_Y(ATTOBJNUM) = TMP_Y
							ATTOBJNUM ++
						end if
					end if
					OBJBOXMARK(OBJMARK) = 0
				end if
			end if
			if directions=0 then
				tmp_x--
				tmp_y++
				if tmp_y=obj_y(objbox) then
					directions=1
				end if
			else if directions=1 then
				tmp_x++
				tmp_y++
				if tmp_x=obj_x(objbox) then
					directions=2
				end if
			else if directions=2 then
				tmp_x++
				tmp_y--
				if tmp_y=obj_y(objbox) then
					directions=3
				end if
			else
				tmp_x--
				tmp_y--
				if tmp_x=obj_x(objbox) then
					tmp_y--
					directions=0
					cnt1++
					if cnt1=scope2 then
						getattobj=attobjnum
						goto end_getattobj
					end if
				end if
			end if
		wend
		next_getattobj_while:
		weapon ++
	wend
	getattobj=0
	end_getattobj:
end function

function getrepobj(objbox)
	dim objmark
	'struct POINT Sign
	dim sign_x
	dim sign_y
	'
	dim cnt1
	repnum=0
	cnt1=0
	while cnt1<4
		if cnt1=0 then
			sign_x=obj_x(objbox)
			sign_y=obj_y(objbox)-1
		else if cnt1=1 then
			sign_x=obj_x(objbox)-1
			sign_y=obj_y(objbox)
		else if cnt1=2 then
			sign_x=obj_x(objbox)
			sign_y=obj_y(objbox)+1
		else
			sign_x=obj_x(objbox)+1
			sign_y=obj_y(objbox)
		end if
		if sign_x>=0 and sign_x<map_lpwid and sign_y>=0 and sign_y<map_lphgt then
			if maplumpid(2,sign_x,sign_y)<>-1 then
				objmark=GetOBJData(Sign_X, Sign_Y)
				if obj_owner(objmark)=controler then
					rep_x(repnum)=sign_x
					rep_y(repnum)=sign_y
					repnum++
				end if
				objboxmark(objmark)=0
			end if
		end if
		cnt1++
	wend
	getrepobj=repnum
end function

sub repother()
	dim objmark
	dim cnt1
	cnt1=0
	while cnt1<repnum
		objmark=getobjdata(rep_x(cnt1),rep_y(cnt1))
		player_energy(obj_owner(objmark),obj_code(objmark))=troops_energy(obj_type(objmark))
		player_explosive(obj_owner(objmark),obj_code(objmark))=troops_explosive(obj_type(objmark))
		objboxmark(objmark)=0
		cnt1++
	wend
end sub

'目标消耗

function OBJConsume(objbox,Consume)
	player_energy(obj_owner(objbox),obj_code(objbox)) -= consume
	if player_energy(obj_owner(objbox),obj_code(objbox)) <= 0 and player_moved(obj_owner(objbox),obj_code(objbox))=0 then
		KillOBJ(OBJ_OWNER(objbox), OBJ_CODE(objbox))
		OBJConsume=0
	else
		OBJConsume=1
	end if
end function

sub killobj(owner,code)
	dim code2
	dim cnt1,sign
	dim x,y
	dim next_c
	
	if owner = controler then
		order --
	end if
	
	if technical then
		player_wrath(owner) += troops_price(player_type(owner,code)) / 1000
		player_wrath(owner * -1 + 1) += troops_price(player_type(owner,code)) / 2000
		if player_wrath(owner) > 60 then
			player_wrath(owner) = 60
		end if
		if player_wrath(owner * -1 + 1) > 60 then
			player_wrath(owner * -1 + 1) = 60
		end if
	end if
	
	x = *player_x(owner,code)
	y = *player_y(owner,code)
	
	maplumpid(2,x,y) = -1
	
	next_c=0
	while next_c <> -1
		next_c = -1
		player_number(owner) --
		if player_number(owner) > 0 then
		
			code2 = player_number(owner)
			sign = 0
			
			cnt1 = 0
			while cnt1 < code2
				if cnt1 = code and player_ems_code(owner,cnt1) > -1 then
					next_c=player_ems_code(owner,cnt1)
				end if
				
				if player_ems_code(owner,cnt1) > -1 and player_ems_code(owner,cnt1) = code2 then
					
					player_ems_code(owner,cnt1) = code
					sign = 1
					'goto end_killobj_while
					break
				end if
				cnt1 ++
			wend
			
			if sign then
				player_x(owner,code) = player_x(owner,code2)
				player_y(owner,code) = player_y(owner,code2)
			else
			
				*player_x(owner,code) = *player_x(owner,code2)
				*player_y(owner,code) = *player_y(owner,code2)
				player_code(*player_x(owner,code2),*player_y(owner,code2)) = code
			end if
			player_ems_code(owner,code) = player_ems_code(owner,code2)
			player_type(owner,code) = player_type(owner,code2)
			player_energy(owner,code) = player_energy(owner,code2)
			player_life(owner,code) = player_life(owner,code2)
			player_explosive(owner,code) = player_explosive(owner,code2)
			player_moved(owner,code) = player_moved(owner,code2)
		end if
		code = next_c
	wend
	DrawMap()
	BitBltPage(PageBack, PageMap)
	SHOW_CURSOR = 0
	DrawCursor()
	SHOW_CURSOR = SPECIALVAL
	ShowAnimation(PageBack, 0, (X + Map_X)*16 - 10, (Y + Map_Y)*16 - 23, 35, 42, 6, 100)
	if player_number(owner)=0 then
		operat = o_over
		SYSTIME = getday() * 1000000 + gethour() * 10000 + getminute()*100 + getsecond()
		Winer = owner * -1 + 1 
	end if
end sub

'检查是否为可行域

function iscross(x,y)
	dim objmark
	dim ret
	carry=0
	if obj_x(objchoose1)=x and obj_y(objchoose1)=y then
		movestep=0
	else
		movestep=1
	end if
	if maplumpid(3,x,y) <> -1 then
		if maplumpid(2,x,y) = -1 then
			ret=1
		else
			objmark = getobjdata(x,y)
			if obj_x(objchoose1) = x and obj_y(objchoose1)=y then
				ret=1
			else if obj_owner(objmark)=obj_owner(objchoose1) and troops_conveyance(obj_type(objmark)) <> -1 and player_ems_code(obj_owner(objmark),obj_code(objmark)) = -1 then
				if (obj_type(objchoose1)<=2) or (troops_conveyance(obj_type(objmark))=1 and obj_type(objchoose1)<=10 ) then
					carriedmark = getobjdata(x,y)
					carry=1
					ret=1
				else
					ret=0
				end if
			else
				ret=0
			end if
			objboxmark(objmark)=0
		end if
	else
		ret=0
	end if
	iscross=ret
end function

sub moveatob(objbox,x,y)
	dim id
	maplumpid(2,obj_x(objbox),obj_y(objbox)) = -1
	maplumpid(2,x,y) = obj_id(objbox)
	player_owner(x,y)=obj_owner(objbox)
	player_code(x,y)=obj_code(objbox)
	*player_x(obj_owner(objbox),obj_code(objbox))=x
	*player_y(obj_owner(objbox),obj_code(objbox))=y
end sub

sub choosetodo()
	dim outchoosetodo
	dim end_c
	dim cnt1,cnt2
	dim buildtype,buildowner,buildcode
	dim movelength
	dim objmark
	dim carrycode
	BitBltPage(PageTMP, PageMap)
	
	if menuoffsetx=10 then
		tmp_offsetx=15
	else
		tmp_offsetx=156
	end if
	Options_Num = 0
	if carry then
		optionslist(0)=17
		options_num=1
	else
		carrycode=player_ems_code(obj_owner(objchoose2),obj_code(objchoose2))
		if carrycode>-1 and getdropaddr() then
			optionslist(0)=18
			options_num=1
		end if
		if troops_haveweapon(obj_type(objchoose2)) then
			if (obj_farattacker(objchoose2)=1 and movestep=0) or obj_farattacker(objchoose2)<>1 then
				if getattobj(objchoose2) then
					optionslist(options_num)=14
					options_num++
				end if
			end if
		end if
		if obj_type(objchoose2)+15=replenishment then
			if getrepobj(objchoose2) then
				optionslist(options_num)=15
				options_num++
			end if
		end if
		GetGeography(CursorMap_X, CursorMap_Y, 1)
		if tmp_code=1 and tmp_owner <> controler and obj_mobiletype(objchoose2)<2 then
			optionslist(options_num)=19
			options_num++
			buildtype=tmp_type-10
			buildowner =tmp_owner
		end if
		optionslist(options_num)=16
		options_num++
	end if
	DrawDialog(PageTMP, TMP_offsetX - 4, 10, 61, 13 + Options_Num*16)
	
	cnt1=0
	while cnt1<options_num
		ShowPich(PageTMP, ResSys(RESMENU), 0, OptionsList(Cnt1)*16, 54, 16, TMP_offsetX, Cnt1*16 + 16, 1)
		if OptionsList(Cnt1) = 18 then
			ShowIDPic(PageTMP, 2, Player_Type(OBJ_OWNER(OBJChoose1),CarryCode) + OBJ_OWNER(OBJChoose1)*19, TMP_offsetX + 2, Cnt1*16 + 16)
		end if
		cnt1++
	wend
	
	outchoosetodo=0
	options=0
	end_c=0
	while outchoosetodo=0
		BitBltPage(PageBack, PageTMP)
		ShowPich(PageBack, ResSys(RESCURSOR), 143, 0, 16, 16, TMP_offsetX -  14, 16 + Options * 16, 1)
		ShowPage(PageBack)
		GetKey(300)
		if key=key_left_c then
			options=addbox(options,-1,0,options_num-1,1)
		else if key=key_right_c then
			options=AddBox(Options, 1, 0, Options_Num - 1, 1)
		else if key=key_enter then
			if optionslist(options)=16 then
				end_c=1
			else if optionslist(options)=15 then
				repother()
				end_c=1
			else if optionslist(options)=14 then
				state=attmode
				outchoosetodo=1
				chooseatt()
			else if optionslist(options)=17 then
				Player_EMS_Code(OBJ_OWNER(CarriedMark),OBJ_CODE(CarriedMark)) = OBJ_CODE(OBJChoose2)
					'/*搭载者坐标指针指向宿主*/
				Player_X(OBJ_OWNER(OBJChoose2),OBJ_CODE(OBJChoose2)) = &Player_tX(OBJ_OWNER(CarriedMark),OBJ_CODE(CarriedMark))
				Player_Y(OBJ_OWNER(OBJChoose2),OBJ_CODE(OBJChoose2)) = &Player_TY(OBJ_OWNER(CarriedMark),OBJ_CODE(CarriedMark))
				MoveAToB(CarriedMark, OBJ_X(CarriedMark), OBJ_Y(CarriedMark))
				OBJBOXMARK(CarriedMark) = 0
				end_c=1
			else if optionslist(options)=18 then
				state=dropmode
				outchoosetodo=1
			else if optionslist(options)=19 then
				build_enduring(obj_x(objchoose2),obj_y(objchoose2))=build_enduring(obj_x(objchoose2),obj_y(objchoose2))-obj_life(objchoose2)/10
				if build_enduring(obj_x(objchoose2),obj_y(objchoose2))<=0 then
					if buildowner= - controler +1 then
						buildcode=0
						while not (build_x(buildowner,buildtype,buildcode)=obj_x(objchoose2) and build_y(buildowner,buildtype,buildcode)=obj_y(objchoose2))
							buildcode++
						wend
						build_number(buildowner,buildtype)--
						build_x(buildowner,buildtype,buildcode)=build_x(buildowner,buildtype,build_number(buildowner,buildtype))
						build_y(buildowner,buildtype,buildcode)=build_y(buildowner,buildtype,build_number(buildowner,buildtype))
						if buildtype=0 then
							operat=o_over
							SYSTIME = getday()*1000000 + gethour()*10000 + getminute()*100 + getsecond()
							Winer = Controler
						end if
					end if
					build_x(obj_owner(objchoose2),buildtype,build_number(obj_owner(objchoose2),buildtype))=obj_x(objchoose2)
					build_y(obj_owner(objchoose2),buildtype,build_number(obj_owner(objchoose2),buildtype))=obj_y(objchoose2)
					build_number(obj_owner(objchoose2),buildtype)++
					build_enduring(obj_x(objchoose2),obj_y(objchoose2))=20
					maplumpid(1,obj_x(objchoose2),obj_y(objchoose2))=maplumpid(1,obj_x(objchoose2),obj_y(objchoose2))mod 5 +(controler +1)*5
				end if
				end_c=1
			end if
			if end_c=1 then
				player_moved(controler,obj_code(objchoose2))=1
				movelength=abs(obj_x(objchoose2)-obj_x(objchoose1))+abs(obj_y(objchoose2)-obj_y(objchoose1))
				objconsume(objchoose2,movelength)
				if movelength <> 0 and maplumpid(1,obj_x(objchoose1),obj_y(objchoose1))<> -1 then
					build_enduring(obj_x(objchoose1),obj_y(objchoose1))=20
				end if
				objboxmark(objchoose1)=0
				objboxmark(objchoose2)=0
				SetMap(3, -1, REV_X, REV_Y, REV_W, REV_H)
				OutChooseToDo =1
				ReDrawMap = 1
				STATE = 0
			end if
		else if key=key_escape then
			MoveAToB(OBJChoose2, OBJ_X(OBJChoose1), OBJ_Y(OBJChoose1))
			OBJBOXMARK(OBJChoose2) = 0

			if Carry then
				MoveAToB(CarriedMark, OBJ_X(CarriedMark), OBJ_Y(CarriedMark))
				OBJBOXMARK(CarriedMark) = 0
			end if

			OutChooseToDo =1
			ReDrawMap =1
			ReDrawCross = 1
			STATE = MOVEMODE
		end if
	wend
	end_choosetodo_while1:
end sub

function chooseatt()

	dim objmark
	
	getkey(200)
	
	if key = key_down_c then
		attobjcode --
	else if key = key_up_c then
		attobjcode ++
	else if key = key_left_c then
		attobjcode --
	else if key = key_right_c then
		attobjcode ++
	end if
	
	if attobjcode = -1 then
	
		attobjcode = attobjnum - 1
		
	else if attobjcode = attobjnum then
	
		attobjcode=0
		
	end if
	
	cursormap_x=attobj_x(attobjcode)
	cursormap_y=attobj_y(attobjcode)
	cursorlcd_x=cursormap_x+map_x
	cursorlcd_y=cursormap_y+map_y
	
	if cursormap_x + map_x<0 then
		map_x = cursormap_x * -1 + 0
		cursorlcd_x = 0
	else if cursormap_x + map_x > 14 then
		map_x = cursormap_x * -1 + 14
		cursorlcd_x = 4
	end if
	
	if cursormap_y + map_y < 0 then
		map_y = cursormap_y * -1 + 0
		cursorlcd_y = 0
	else if cursormap_y + map_y > 9 then
		map_y = cursormap_y * -1 + 9
		cursorlcd_y = 9
	end if
	
	if key = key_enter then
		Player_Moved(Controler,OBJ_CODE(OBJChoose2)) = 1
		OBJConsume(OBJChoose2, abs(OBJ_X(OBJChoose2) - OBJ_X(OBJChoose1)) + abs(OBJ_y(OBJChoose2) - OBJ_Y(OBJChoose1)))
		SetMap(3, -1, REV_X, REV_Y, REV_W, REV_H)
		STATE = 0
		ReDrawMap = 1
		OBJMARK = GetOBJData(CursorMap_X, CursorMap_Y)
		'/*战斗*/
		Fight(OBJChoose2, OBJMARK)
		OBJBOXMARK(OBJMARK) = 0
		OBJBOXMARK(OBJChoose1) =0
		OBJBOXMARK(OBJChoose2) = 0
	else if key=key_escape then
		state=choosemode
		cursormap_x=obj_x(objchoose2)
		cursormap_y=obj_y(objchoose2)
		cursorlcd_x=cursormap_x + map_x
		cursorlcd_y=cursormap_y + map_y
	end if
	
end function

function getattval(objatter,objatted)
	GetGeography(OBJ_X(objATTed), OBJ_Y(objATTed), 1)
	getattval=(- MapLump_Defense(TMP_TYPE) + 10) * Troops_Attack(OBJ_TYPE(objATTer),OBJ_TYPE(objATTed)) * Player_Life(OBJ_OWNER(objATTer),OBJ_CODE(objATTer)) / 1000
end function

'战斗（外接GetATTOBJ函数提供的WeaponUse）

sub fight(objatter,objatted)
	dim hurt
	
	if weaponuse=0 then
		player_explosive(obj_owner(objatter),obj_code(objatter)) --
	end if
	
	hurt = GetATTVal(objATTer, objATTed)
	
	player_life(obj_owner(objatted),obj_code(objatted)) -= hurt
	
	if player_life(obj_owner(objatted),obj_code(objatted)) < 6 then
	
		killobj(obj_owner(objatted),obj_code(objatted))
		
	else if canatt(objatted,objatter) then
	
		if weaponuse=0 then
			player_explosive(obj_owner(objatted),obj_code(objatted)) --
		end if
		
		hurt = GetATTVal(objATTed, objATTer)
		
		player_life(obj_owner(objatter),obj_code(objatter)) -= hurt
		
		if player_life(obj_owner(objatter),obj_code(objatter))<6 then
			killobj(obj_owner(objatter),obj_code(objatter))
		end if
	end if
end sub

function canatt(objatter,objatted)
	dim cnt1
	if troops_haveweapon(obj_type(objatter)) then
		GetATTOBJ(objATTer)
		cnt1=0
		while cnt1<attobjnum
			if attobj_x(cnt1)=obj_x(objatted) and attobj_y(cnt1)=obj_y(objatted) then
				canatt=1
				goto end_canatt
			end if
			cnt1++
		wend
	end if
	canatt=0
	end_canatt:
end function

sub Produce(Producer)
	dim outproduce,troopsoffset
	dim cnt1,listaddr
	dim type
	
	BitBltPage(PageTMP, PageMap)

	DrawDialog(PageTMP, 11, 34, 117, 125)

	ShowPich(PageTMP, ResSys(RESCURSOR), 123, 305, 64, 27, 3, 3, 1)
	OutTextnum(PageTMP, 55, 6, Player_Money(Controler), 1)
	if (Producer = FACTORY) then
		troopsoffset = 0
		Options_Num = 11
	else if (Producer = AIRPORT) then
		troopsoffset = 11
		Options_Num = 4
	else
		troopsoffset = 15
		Options_Num = 4
	end if
	OutProduce = 0
	ListAddr = 0
	Options = 0
	while OutProduce = 0
		BitBltPage(PageBack, PageTMP)
		SeeTroopsMSG(Options + ListAddr + troopsoffset)
		Cnt1 = 0
		while Cnt1 + ListAddr < Options_Num and Cnt1 < 7
			type = Cnt1 + ListAddr + troopsoffset
			ShowIDPic(PageBack, 2, type, 17, Cnt1*16 + 39)
			ShowPich(PageBack, ResSys(RESNAME), (type + 15) * 32, 0, 32, 16, 35, Cnt1*16 + 41, 1)';/*名称*/
			OutTextnum(PageBack, 114, Cnt1*16 + 43, Troops_Price(type), 3)
			Cnt1 = Cnt1 +1
		wend
		if (ListAddr > 0) then
			ShowPich(PageBack, ResSys(RESCURSOR), 149, 42, 16, 8, 64, 34, 1)
		end if
		if (ListAddr + 7 < Options_Num) then
			ShowPich(PageBack, ResSys(RESCURSOR), 149, 50, 16, 8, 64, 150, 1)
		end if
		ShowPich(PageBack, ResSys(RESCURSOR), 143, 0, 16, 16, 1, 40 + Options * 16, 1)
		ShowPage(PageBack)
		GetKey(100)
		if (Key = key_left_c) then
			Options --
		else if (Key = key_right_c and Options < Options_Num - 1) then
			Options ++
		end if
		if (Options = -1) then
			Options = 0
			if (ListAddr > 0) then
				ListAddr --
			end if
		else if (Options = 7) then
			Options = 6
			if (ListAddr < Options_Num - 7) then
				ListAddr ++
			end if
		end if
		if (Key = KEY_ENTER) then
			if (Player_Money(Controler) >= Troops_Price(Options + ListAddr + troopsoffset)) then
				if (Player_Number(Controler) = 50) then
					OutTextxy(0,5,5,"军队已达上限！")
					waitkey_c()
				else
					AddTroops(Options + ListAddr + troopsoffset + Controler*19 + 25, CursorMap_X, CursorMap_Y, 1)
					Player_Money(Controler) -= Troops_Price(Options + ListAddr + troopsoffset)
					OutProduce = 1
					ReDrawMap = 1
				end if
			end if
		else if (Key = KEY_ESCAPE) then
			OutProduce = 1
		end if
	wend
end sub

sub addtroops(id,x,y,setmoved)
	dim owner,type,code
	id -= 25
	owner=id /19
	type=id mod 19
	code=player_number(owner)
	
	player_owner(x,y)=owner
	player_code(x,y)=code
	player_type(owner,code)=type
	player_energy(owner,code)=troops_energy(type)
	player_life(owner,code)=100
	player_explosive(owner,code)=troops_explosive(type)
	player_tx(owner,code)=x
	player_ty(owner,code)=y
	player_x(owner,code)=&player_tx(owner,code)
	player_y(owner,code)=&player_ty(owner,code)
	player_moved(owner,code)=setmoved
	player_ems_code(owner,code) = -1
	player_number(owner)++
	maplumpid(2,x,y)=id
end sub

sub showanimation(page,id,x,y,w,h,picnum,delay)
	dim cnt1
	cnt1=0
	while cnt1<picnum
		BitBltPage(PageTMP, Page)
		ShowPich(PageTMP, ResAnim(ID), Cnt1 * W, 0, W, H, X, Y, 1)
		ShowPage(PageTMP)
		msdelay_c(Delay)
		cnt1++
	wend
end sub

sub showlib(page,pic,dx,dy,w,h,x,y)
	if w=0 then w=getpichgt(pic)
	if h=0 then h=getpicwid(pic)
	showpich(page,pic,dx,dy,w,h,x,y,1)
end sub

sub choosedrop()

	GetKey(200)
	
	if Key=key_down_c then
		DROPADDRCODE--
	else if Key=key_up_c then
		DROPADDRCODE++
	else if Key=key_left_c then
		DROPADDRCODE--
	else if Key=key_right_c then
		DROPADDRCODE++
	end if
	
	if (DROPADDRCODE < 0) then
		DROPADDRCODE = DROPADDRNUM - 1
	else if (DROPADDRCODE = DROPADDRNUM) then
		DROPADDRCODE = 0
	end if
	
	CursorMap_X = DROPADDR_X(DROPADDRCODE)
	CursorMap_Y = DROPADDR_Y(DROPADDRCODE)
	CursorLCD_X = CursorMap_X + Map_X
	CursorLCD_Y = CursorMap_Y + Map_Y
	
	if (Key = KEY_ESCAPE) then
		STATE = CHOOSEMODE
		CursorMap_X = OBJ_X(OBJChoose2)
		CursorMap_Y = OBJ_Y(OBJChoose2)
		CursorLCD_X = CursorMap_X + Map_X
		CursorLCD_Y = CursorMap_Y + Map_Y
	else if (Key = KEY_ENTER) then
		TMP_CODE = Player_EMS_Code(Controler,OBJ_CODE(OBJChoose2))
		MapLumpID(2,CursorMap_X,CursorMap_Y) = Player_Type(Controler,TMP_CODE) + Controler*19
		Player_TX(Controler,TMP_CODE) = CursorMap_X
		Player_TY(Controler,TMP_CODE) = CursorMap_Y
		Player_X(Controler,TMP_CODE) = &Player_TX(Controler,TMP_CODE)
		Player_Y(Controler,TMP_CODE) = &Player_TY(Controler,TMP_CODE)
		Player_Code(CursorMap_X,CursorMap_Y) = TMP_CODE
		Player_Owner(CursorMap_X,CursorMap_Y) = Controler
		Player_Moved(Controler,OBJ_CODE(OBJChoose2)) =1
		ReDrawMap = 1
		Player_EMS_Code(Controler,OBJ_CODE(OBJChoose2)) = -1
		SetMap(3, -1, REV_X, REV_Y, REV_W, REV_H)
		STATE = OBJBOXMARK(OBJChoose1) =0
		OBJBOXMARK(OBJChoose2) = 0
	end if
end sub

function getdropaddr()
	dim Cnt1
	dim ID
	dim X, Y

	DROPADDRNUM =0
	DROPADDRCODE = 0
	
	Cnt1 = 0
	while Cnt1 < 4
		DROPADDR_X(DROPADDRNUM) = OBJ_X(OBJChoose2)
		DROPADDR_Y(DROPADDRNUM) = OBJ_Y(OBJChoose2)

		if Cnt1= 0 then
			DROPADDR_Y(DROPADDRNUM)--
		else if Cnt1= 1 then
			DROPADDR_X(DROPADDRNUM)--
		else if Cnt1= 2 then
			DROPADDR_Y(DROPADDRNUM)++
		else
			DROPADDR_X(DROPADDRNUM)++
		end if

		X = DROPADDR_X(DROPADDRNUM)
		Y = DROPADDR_Y(DROPADDRNUM)

		if (X >= 0 and X < Map_LPWid and Y >= 0 and Y < Map_LPHgt and MapLumpID(2,X,Y) = -1) then
			GetGeography(X, Y, 1)
			if (TMP_TYPE <> 2 and TMP_TYPE <> 7 and TMP_TYPE <> 8 and TMP_TYPE <> 2 and TMP_TYPE <> 7 and TMP_TYPE <> 8) then
				DROPADDRNUM++
			end if
		end if
	    Cnt1++
	wend
	GetDropAddr=DROPADDRNUM
end function

sub gamestart()
	dim outgamestart
	dim time
	dim optionsdetailed
	dim basid
	'struct POINT Background[4]
	dim background_x(4)
	dim background_y(4)
	'
	dim cnt1
	dim t_str_x,t_str$(2)
	dim arrowcnt,arrowdirect
	
	t_str$(0)="完成一个又一个的任务，与电脑一决雌雄。"
	t_str$(1)="与朋友在高级战争的世界中对决。"
	options=0
	optionsdetailed=0
	
	background_x(0)=0
	background_y(0)=-96
	background_x(1)=0
	background_y(1)=-352
	background_x(2)=256
	background_y(2)=-352
	background_x(3)=256
	background_y(3)=-96
	
	arrowdirect=1
	
	outgamestart=0
	arrowcnt=0
	t_str_x = 0
	while outgamestart=0
		'fillpage(pagetmp,0,0,320,240,{ffffff})
		cnt1=0
		while cnt1<4
			showpich(pagetmp,resunsys(8),0,0,256,256,background_x(cnt1),background_y(cnt1),1)
			background_x(cnt1)--
			background_y(cnt1)++
			if background_x(cnt1) = -256 and background_y(cnt1)=160 then
				background_x(cnt1) = 256
				background_y(cnt1) = -352
			else if background_x(cnt1) = -256 and background_y(cnt1)=-96 then
				background_x(cnt1)=0
				background_y(cnt1) = -352
			else if background_x(cnt1)=0 and background_y(cnt1)=160 then
				background_x(cnt1) = 256
				background_y(cnt1) = -96
			end if
			cnt1++
		wend
		showlib(pagetmp,resunsys(7),0,0,0,0,5,5)
		showpich(pagetmp,resunsys(0),0,160,240,2,0,145,0)
		cnt1=0
		while cnt1<2
			if options=cnt1 then
				showlib(pagetmp,resunsys(5),0,options * 32,0,32,16,72)
			else
				ShowLib(PageTMP, ResUnSys(6), 0, Cnt1 * 12, 0, 12, 0, 114)
			end if
			cnt1++
		wend
		ShowPich(PageTMP, ResSys(RESCURSOR), 176, 0, 16, 16, 10 - ArrowCnt, 96 + ArrowCnt/2, 1)
		ShowPich(PageTMP, ResSys(RESCURSOR), 192, 0, 16, 16, 133 + ArrowCnt, 65 - ArrowCnt/2, 1)
		ArrowCnt = AddBox(ArrowCnt,ArrowDirect,0,8,1)
		if arrowcnt=0 or arrowcnt=8 then
			arrowdirect = - arrowdirect + 0
		end if
		outtextxy(pagetmp,t_str_x,148,t_str$(options))
		't_str_x = AddBox(t_str_x,1,-len(t_str$(options))*12,240,1)
		t_str_x++
		if t_str_x > 240 then
			t_str_x = -len(t_str$(options))*6
		end if
		showpage(pagetmp)
		msdelay_c(bg_delay)
		getkey(300)
		if key=key_left_c or key=key_right_c then
			options= -options+1
			t_str_x = 0
		else if key=key_enter then
			outgamestart=intogame(options)
		else if key=key_escape then
			outgamestart=1
			phase=p_exit
		end if
	wend
end sub

sub playround()
	dim sign1,numlenth,cnt1,cnt2
	drawmap()
	bitbltpage(pageback,pagemap)
	show_cursor=0
	DrawCursor()
	SHOW_CURSOR = SPECIALVAL
	BitBltPage(PageMap, PageBack)
	ShowAnimation(PageBack, 1, 48, 48, 96, 64, 5, 100)
	BitBltPage(PageBack, PageTMP)
	TMP_VAL = GameRound
	NumLenth = GetnumLen(TMP_VAL)
	
	sign1=0
	while sign1<numlenth
		ShowLib(PageBack, ResAnim(2), (TMP_VAL mod 10)*64, 0, 64,  64, 139 + (NumLenth - Sign1 - 1)*22, 48)
		TMP_VAL = TMP_VAL / 10
		sign1++
	wend
	
	ShowPage(PageBack)

	msdelay_c(300)

	BitBltPage(PageBack, PageMap)
	
	cnt1=0
	while cnt1<4
		cnt2=cnt1*30
		ShowLib(PageMap, ResAnim(1), 384 + Cnt2, 0, 96 - Cnt2, 64, 48 + Cnt2, 48)
		TMP_VAL = GameRound
		sign1=0
		while sign1<numlenth
			ShowLib(PageMap, ResAnim(2), (TMP_VAL mod 10)*64, 0, 64,  64, 139 + (NumLenth - Sign1 - 1)*22, 48)
			TMP_VAL = TMP_VAL / 10
			sign1++
		wend
		ShowPage(PageMap)
		BitBltPage(PageMap, PageBack)
		msdelay_c(100)
		cnt1++
	wend
end sub

sub gameover()
	dim cnt1
	'struct POINT Background[4];
	dim background_x(4)
	dim background_y(4)
	
	if (Leader(1) = COM and Winer = 1) then
		Cnt1 = 0
		while  Cnt1 < 64
			BitBltPage(PageTMP, PageBack)
			ShowLib(PageTMP, ResUnSys(4), 0, 0, 0, 0, 57, Cnt1)
			ShowPage(PageTMP)
			Cnt1++
		wend
		waitkey_c()
	else
		'FillPage(0, 0, 0, 240, 160, 0)
		msdelay_c(300)
		'Cls
		'msdelay_c(100)
		ShowLib(PageBack, ResUnSys(2), 0, 0, 0, 0, 0, 0)
		ShowPage(PageBack)
		ShowLib(-1, ResUnSys(3), 0, 0, 0, 0, 36, 56)
		waitkey_c()
		Cnt1 = 56
		while Cnt1 > -39
			BitBltPage(PageTMP, PageBack)
			ShowLib(PageTMP, ResUnSys(3), 0, 0, 0, 0, 36, Cnt1)
			ShowPage(PageTMP)
			msdelay_c(50)
			Cnt1 -= 9
		wend
		Cnt1 = 0
		while  Cnt1 < 50
			BitBltPage(PageTMP, PageBack)
			DrawDialog(PageTMP, 0, - Cnt1 +160 , 240, 47)
			ShowPich(PageTMP, ResUnSys(11), 1, 1 + Player_Role(Winer) * 159, 129, 159, Cnt1 * 2 - 100, 1, 1)
			ShowPage(PageTMP)
			msdelay_c(32)
			Cnt1 += 3
		wend
		'Color(0, {ffffff}, 0)
		if (Player_Role(Winer) = 0) then
			OutTextxy(0, 120, 120, "太棒了！下次")
			OutTextxy(0, 120, 136, "我还会赢的！")
		else if (Player_Role(Winer) = 1) then
			OutTextxy(0, 120, 120, "果然！和我")
			OutTextxy(0, 120, 136, "预料的一样简单！")
		else if (Player_Role(Winer) = 2) then
			OutTextxy(0, 130, 120, "也许，我")
			OutTextxy(0, 130, 136, "应该下手轻点！")
		else
			OutTextxy(0, 130, 120, "哼！简直是")
			OutTextxy(0, 130, 136, "浪费我的时间！")
		end if
		waitkey_c()
		msdelay_c(1000)
		Background_X(0) = 0
		Background_Y(0) = -96
		Background_X(1) = 0
		Background_Y(1) = -352
		Background_X(2) = 256
		Background_Y(2) = -352
		Background_X(3) = 256
		Background_Y(3) = -96

		while (not GetKey(300))
			Cnt1 = 0
			while Cnt1 < 4
				ShowPich(PageTMP, ResUnSys(8), 256, 0, 256, 256, Background_X(Cnt1), Background_Y(Cnt1), 1)
				Background_X(Cnt1)--
				Background_Y(Cnt1)++
				if (Background_X(Cnt1) = -256 and Background_Y(Cnt1) = 160) then
					Background_X(Cnt1) = 256
					Background_Y(Cnt1) = -352
				else if (Background_X(Cnt1) = -256 and Background_Y(Cnt1) = -96) then
					Background_X(Cnt1) = 0
					Background_Y(Cnt1) = -352
				else if (Background_X(Cnt1) = 0 and Background_Y(Cnt1) = 160) then
					Background_X(Cnt1)= 256
					Background_Y(Cnt1) = -96
				end if
				Cnt1++
			wend

			ShowPich(PageTMP, ResUnSys(12), 1, 1, 240, 96, 0, 0, 1)
			ShowPich(PageTMP, ResUnSys(12), 1, 97, 240, 24, 0, 136, 1)

			ShowPich(PageTMP, ResUnSys(10), 96, Player_Role(Winer) * 48, 48, 48, 0, 0, 1)
			ShowPich(PageTMP, ResUnSys(10), 48, Player_Role(- Winer +1) * 48, 48, 48, 192, 112, 1)

			DrawDialog(PageTMP, 2, 74, 133, 29)

			OutTextxy(PageTMP, 8, 80, "历时")
			OutTextxy(PageTMP, 113, 80, "天")

			OutTextnum(PageTMP, 105, 83, GameRound, 3)

			ShowPage(PageTMP)

			msdelay_c(BG_DELAY)
		wend
		if (Winer = 0 and Leader(1) = COM) then
			open MissionSavFile$ for binary as #1 
			'fp = fopen(MissionSavFile, "rb+")
			Class++
			'fwrite(&Class, 4, 1, fp);
			put #1,class
			close #1
			'fclose(fp);
		end if
	end if
end sub

function intogame(gamemode)
	dim tmpfile$
	dim name$
	dim tmpch$
	dim choose
	dim cnt1
	dim listaddr
	'color(0,{ffffff},0)
	production=1000
	technical=1
	player_wrath(0)=0
	player_wrath(1)=0
	technical_days(0)=0
	technical_days(1)=0
	tmpfile$=path$
	if gamemode=0 then
		leader(0)=person
		leader(1)=com
		player_role(0)=0
		player_role(1)=3
		tmpfile$ = "" + tmpfile$ + "Mission\"
		datamapname$ = tmpfile$
		open missionsavfile$ for binary as #1
		get #1,class
		close #1
		if class = 99 then
			getfilenum(tmpfile$)
			if filenum>0 then
				choose=0
				listaddr=0
				while 1
					bitbltpage(pageback,pagetmp)
					drawdialog(pageback,70,40,100,110)
					cnt1=0
					while cnt1 < filenum and cnt1 < 6
						name$="map"+str$(cnt1+listaddr+1)
						outtextxy(pageback,96,45 + cnt1 * 16,name$)
						cnt1++
					wend
					showpich(pageback,ressys(rescursor),143,0,16,16,76,45 + choose*16,1)
					if listaddr>0 then
						showpich(PageBack, ResSys(RESCURSOR), 149, 42, 16, 8, 112, 32, 1)
					end if
					if listaddr+6 <filenum then
						ShowPich(PageBack, ResSys(RESCURSOR), 149, 50, 16, 8, 112, 149, 1)
					end if
					showpage(pageback)
					getkey(150)
					if key=key_escape then
						intogame=0
						goto end_intogame
					else if key=key_enter then
						datamapname$=tmpfile$
						name$="map"+str$(choose+listaddr+1)+".dat"
						datamapname$=""+datamapname$+name$
						if readdata(datamapname$)=1 then
							outtextxy(0,5,30,"载入地图成功！")
							phase=p_gamerun
							intogame=1
							goto end_intogame
						else
							OutTextxy(0, 5, 30, "载入地图错误！")
							waitkey_c()
						end if
					else if key=key_left_c then
						choose--
					else if key=key_right_c and choose <filenum-1 then
						choose++
					end if
					if choose=-1 then
						choose=0
						if listaddr>0 then
							listaddr--
						end if
					else if choose=6 then
						choose=5
						if listaddr<filenum-6 then
							listaddr++
						end if
					end if
				wend
			else
				showpich(-1,resunsys(0),0,160,240,15,0,145,0)
				outtextxy(0,5,148,"没有找到地图文件!")
				waitkey_c()
				intogame=0
				goto end_intogame
			end if
		else
			name$ = "map" +str$(class+1) + ".dat"
			datamapname$=datamapname$+name$
			if readdata(datamapname$)=1 then
				outtextxy(0,5,30,"载入地图成功！")
				phase=p_gamerun
				intogame=1
				goto end_intogame
			else
				'showpich(-1,resunsys(0),0,160,240,15,0,145,0)
				'outtextxy(0,5,148,"已通关，请等待新的关卡或清档重玩。")
				ShowLib(-1,ResUnSys(13), 0, 0, 0, 0, 0, 0)
				waitkey_c()
				class = 99
				open missionsavfile$ for binary as #1
				put #1,class
				close #1
				intogame=0
				goto end_intogame
			end if
		end if
	else
		leader(0)=person
		leader(1)=person
		player_role(0)=0
		player_role(1)=1
		tmpfile$ = "" + tmpfile$ + "war\"
		getfilenum(tmpfile$)
		if filenum>0 then
			choose=0
			listaddr=0
			while 1
				bitbltpage(pageback,pagetmp)
				drawdialog(pageback,70,40,100,110)
				cnt1=0
				while cnt1 < filenum and cnt1 < 6
					name$="map"+str$(cnt1+listaddr+1)
					outtextxy(pageback,96,45 + cnt1 * 16,name$)
					cnt1++
				wend
				showpich(pageback,ressys(rescursor),143,0,16,16,76,45 + choose*16,1)
				if listaddr>0 then
					showpich(PageBack, ResSys(RESCURSOR), 149, 42, 16, 8, 112, 32, 1)
				end if
				if listaddr+6 <filenum then
					ShowPich(PageBack, ResSys(RESCURSOR), 149, 50, 16, 8, 112, 149, 1)
				end if
				showpage(pageback)
				getkey(150)
				if key=key_escape then
					intogame=0
					goto end_intogame
				else if key=key_enter then
					if setgame() then
						datamapname$=tmpfile$
						name$="map"+str$(choose+listaddr+1)+".dat"
						datamapname$=""+datamapname$+name$
						if readdata(datamapname$)=1 then
							outtextxy(0,5,30,"载入地图成功！")
							phase=p_gamerun
							intogame=1
							goto end_intogame
						else
							OutTextxy(0, 5, 30, "载入地图错误！")
							waitkey_c()
						end if
					else
						intogame=0
						goto end_intogame
					end if
				else if key=key_left_c then
					choose--
				else if key=key_right_c and choose <filenum-1 then
					choose++
				end if
				if choose=-1 then
					choose=0
					if listaddr>0 then
						listaddr--
					end if
				else if choose=6 then
					choose=5
					if listaddr<filenum-6 then
						listaddr++
					end if
				end if
			wend
		else
			OutTextxy(0, 5, 146, "没有找到地图文件!")
			waitkey_c()
			intogame=0
			goto end_intogame
		end if
	end if
	end_intogame:
end function

sub comoperate()
	dim OBJMARK
	dim Cnt1
	dim times

	if (ENV = ENV_SIM) then

		times = 6
	
	else
		
		times = 4
	
	end if
	order = 0
	while  order < Player_Number(Controler) and OPERAT <> O_OVER
		'/*先选择好目标*/
		OBJMARK = GetOBJData(Player_TX(Controler,order), Player_TY(Controler,order))';/*1*/

		SetCross(OBJMARK)

		'/*移动窗口，对准目标*/
		AdjustWindow(OBJ_X(OBJMARK), OBJ_Y(OBJMARK))
		CursorMap_X = OBJ_X(OBJMARK)
		CursorMap_Y = OBJ_Y(OBJMARK)
		CursorLCD_X = Map_X + CursorMap_X
		CursorLCD_Y = Map_Y + CursorMap_Y

		'/*闪烁光标*/
		Cnt1 = 0
		while Cnt1 < times
			DrawMap()
			BitBltPage(PageBack, PageMap)

			if (Cnt1 mod 2 = 0) then

				SHOW_CURSOR = 1

			else

				SHOW_CURSOR = SPECIALVAL
				
			end if

			DrawCursor()

			ShowPage(PageBack)
			msdelay_c(CF_DELAY)
			
			Cnt1++
		wend

		'/*思考*/
		THINKTODO(OBJMARK)

		OBJBOXMARK(OBJMARK) = 0';/*1*/
		
		order ++
	wend 
end sub

sub adjustwindow(x,y)
	map_x= -x + 7
	map_y= -y + 4
	if map_x< - map_lpwid + 15 then
		map_x= - map_lpwid + 15
	end if
	if map_x>0 then
		map_x=0
	end if
	if map_y< - map_lphgt + 10 then
		map_y= -map_lphgt +10
	end if
	if map_y>0 then
		map_y=0
	end if
end sub

'选择动作进行执行

sub thinktodo(objbox)
	dim BESTOBJ
	dim TODO
	dim Cnt1
	dim OBJMARK_BEST
	dim again
	dim X, Y, MoveLength

	'/*判断动作*/
	X = OBJ_X(objbox)
	Y = OBJ_Y(objbox)

		'/*有无武器*/
		if (Troops_HaveWeapon(OBJ_TYPE(objbox))) then
			'/*远程攻击*/
			if (OBJ_FARATTACKER(objbox)) then
				if (GetATTOBJ(objbox)) then
					OBJMARK_BEST = GETBESTOBJ(objbox)
					
					TODO = 1
				else
					TODO = 2'/*移动*/
				end if
			else'/*近身攻击*/
				OBJMARK_BEST = FINDENEMY(objbox)
				'print objmark_best
				'waitkey_c()
				if (OBJMARK_BEST <> -1) then
					'/*接近目标，打它*/
					if CLOSEATTOBJ( &objbox, OBJMARK_BEST) then

						GOTOHERE( &objbox, TMP_X, TMP_Y)
						
						TODO = 1
					else 
					
						TODO = 2
						
					end if
				else
					TODO = 2
				end if
			end if
		end if
		'print todo
		'waitkey_c()

		if (TODO = 1) then'/*攻击OBJMARK_BEST*/
			CursorMap_X = OBJ_X(OBJMARK_BEST)
			CursorMap_Y = OBJ_Y(OBJMARK_BEST)
			CursorLCD_X = Map_X + CursorMap_X
			CursorLCD_Y = Map_Y + CursorMap_Y

			OBJChoose2 = objbox

			DrawMap()
			BitBltPage(PageBack, PageMap)
			STATE = ATTMODE
			DrawCursor()
			STATE = 0
			ShowPage(PageBack)

			msdelay_c(1000)

			Fight(objbox, OBJMARK_BEST)
			OBJBOXMARK(OBJMARK_BEST) = 0'/*2*/
		else if (TODO = 2) then'/*前进（敢死队的说）*/

			GOGOGO(&objbox)
		end if

	Player_Moved(OBJ_OWNER(objbox),OBJ_CODE(objbox)) = 1
	MoveLength = abs(OBJ_X(objbox) - X) + abs(OBJ_Y(objbox) - Y)

	OBJConsume(objbox, MoveLength)

	if (MoveLength <> 0 and MapLumpID(1,X,Y) <> -1) then
		Build_Enduring(X,Y) = 20
	end if
	SetMap(3, -1, REV_X, REV_Y, REV_W, REV_H) 
	
end sub

'获取最优攻击目标（返回攻击代号）
'检查完毕
function getbestobj(objbox)
	dim cnt1
	dim objmark1,objmark2
	
	objmark1 = GetOBJData(ATTOBJ_X(0), ATTOBJ_Y(0))         ';/*2*/
	
	cnt1 = 1
	while cnt1 < ATTOBJNUM
		objmark2 = GetOBJData(ATTOBJ_X(Cnt1), ATTOBJ_Y(Cnt1))          ';/*3*/
		
		if GetATTVal(objbox, OBJMARK2) > GetATTVal(objbox, OBJMARK1) then
			OBJBOXMARK(OBJMARK1) = 0
			OBJMARK1 = OBJMARK2
		else
			objboxmark(objmark2) = 0
		end if
		cnt1 ++
	wend
	getbestobj=objmark1
end function

'前进

sub gogogo(objbox)
	dim owner
	dim Cnt1
	dim Direct_X, Direct_Y
	dim X, Y, BAS_X, BAS_Y
	dim OK_X1, OK_Y1
	dim limit
	'struct POINT OK
	dim ok_x
	dim ok_y
	'

	'/*根据敌方所有军队的方位，计算出移动向量，再进行移动*/
	owner = Controler * -1 + 1
	Direct_X = 0
	Direct_Y = 0
	Cnt1 = 0
	while  Cnt1 < Player_Number(owner)
		Direct_X += *Player_X(owner,Cnt1)
		Direct_Y += *Player_Y(owner,Cnt1)
		Cnt1++
	wend 

	Direct_X /= Cnt1
	Direct_Y /= Cnt1

	OK_X1 =	OBJ_X(*objbox)
	BAS_X = OBJ_X(*objbox)
	OK_Y1 = OBJ_Y(*objbox)
	BAS_Y = OBJ_Y(*objbox)

	X = BAS_X
	Y = BAS_Y - 1

	limit = GetBacklog(Troops_Flexibility(OBJ_TYPE(*objbox))) * 4
	Cnt1 = 0
	while  Cnt1 < limit
		if (abs(X - Direct_X) + abs(Y - Direct_Y) < abs(OK_X1 - Direct_X) + abs(OK_Y1 - Direct_Y) and MapLumpID(3,X,Y) <> -1 and MapLumpID(2,X,Y) = -1) then
			OK_X1 = X
			OK_Y1 = Y
		end if
		GetTrack(&X, &Y, BAS_X, BAS_Y)
		Cnt1 ++
	wend
	GOTOHERE(objbox, OK_X1, OK_Y1)
end sub

'寻找攻击目标

function findenemy(objbox)
	dim limit
	dim Cnt1
	dim OBJMARK, BESTOBJMARK
	dim X, Y, BAS_X, BAS_Y

	BAS_X = OBJ_X(objbox)
	BAS_Y = OBJ_Y(objbox)

	X = BAS_X
	Y = BAS_Y - 1

	limit = GetBacklog(Troops_Flexibility(OBJ_TYPE(objbox)) + 1) * 4

	BESTOBJMARK = -1
	
	Cnt1 = 0
	while Cnt1 < limit
	
			'/*有军队，查看*/
			if (MapLumpID(2,X,Y) <> -1 and X >= 0 and X < Map_LPWid and Y >= 0 and Y < Map_LPHgt) then
				
				GetGeography(X, Y, 2)
				
				if (TMP_OWNER <> Controler) then
				
					if (BESTOBJMARK = -1) then
					
						BESTOBJMARK = GetOBJData(X, Y)
						
						if CLOSEATTOBJ(&objbox, BESTOBJMARK) <> 1 or GetATTWeapon(objbox, BESTOBJMARK) = -1 then
								'print CLOSEATTOBJ(&objbox, BESTOBJMARK)
								'print GetATTWeapon(objbox, BESTOBJMARK)
								'waitkey_c()
							OBJBOXMARK(BESTOBJMARK) = 0
							BESTOBJMARK = -1
						end if
					else
						OBJMARK = GetOBJData(X, Y)
						if (GetATTVal(objbox, OBJMARK) > GetATTVal(objbox, BESTOBJMARK) and CLOSEATTOBJ(&objbox, OBJMARK)) then
							OBJBOXMARK(BESTOBJMARK) = 0
							BESTOBJMARK = OBJMARK
						else
							OBJBOXMARK(OBJMARK) = 0
						end if
					end if
				end if
			end if
		GetTrack(&X, &Y, BAS_X, BAS_Y)
		Cnt1 ++
	wend

	FINDENEMY= BESTOBJMARK
end function

'判断能否接近目标
'检验完毕
function closeattobj(objbox,attobj)
	dim  Cnt1
	Cnt1 = 0
	while Cnt1 < 4
		if Cnt1 = 0 then
			TMP_X = OBJ_X(ATTOBJ)
			TMP_Y = OBJ_Y(ATTOBJ) - 1
		else if Cnt1 = 1 then
			TMP_X = OBJ_X(ATTOBJ) - 1
			TMP_Y = OBJ_Y(ATTOBJ)
		else if Cnt1 = 2 then
			TMP_X = OBJ_X(ATTOBJ)
			TMP_Y = OBJ_Y(ATTOBJ) + 1
		else
			TMP_X = OBJ_X(ATTOBJ) + 1
			TMP_Y = OBJ_Y(ATTOBJ)
		end if

		if TMP_X >= 0 and TMP_X < Map_LPWid and TMP_Y >= 0 and TMP_Y < Map_LPHgt then
			if MapLumpID(3,TMP_X,TMP_Y) <> -1 and MapLumpID(2,TMP_X,TMP_Y) = -1 then
				closeattobj = 1
				goto end_closeattobj
			else
				if TMP_X = OBJ_X(*objbox) and TMP_Y = OBJ_Y(*objbox) then
					closeattobj = 1
					goto end_closeattobj
				end if
			end if
		end if
		Cnt1 ++
	wend
	closeattobj= 0
	end_closeattobj:
end function

sub gotohere(objbox,x,y)
	AdjustWindow(X, Y)
	CursorMap_X = X
	CursorMap_Y = Y
	CursorLCD_X = Map_X + CursorMap_X
	CursorLCD_Y = Map_Y + CursorMap_Y

	DrawMap()
	DrawCross()
	BitBltPage(PageBack, PageMap)
	DrawCursor()
	ShowPage(PageBack)

	msdelay_c(200)

	BitBltPage(PageBack, PageMap)
	SHOW_CURSOR = SPECIALVAL
	DrawCursor()
	ShowPage(PageBack)

	msdelay_c(200)

	MoveAToB(*objbox, X, Y)

	DrawMap()
	DrawCross()
	BitBltPage(PageBack, PageMap)
	DrawCursor()
	ShowPage(PageBack)

	msdelay_c(200)

	OBJBOXMARK(*objbox) = 0
	*objbox = GetOBJData(X, Y) 
end sub

function usetechnical(code)
	dim Cnt1, Cnt2
	dim X, Y

	SHOW_CURSOR = 0
		Cnt1 = 0
		while Cnt1 < Player_Number(Controler)
		
			X = Player_TX(Controler,Cnt1)
			Y = Player_TY(Controler,Cnt1)

			if (X + Map_X < 2 or X + Map_X > 13 or Y + Map_Y < 2 or Y + Map_Y > 8) then
				AdjustWindow(X, Y)
			end if

			CursorMap_X = X
			CursorMap_Y = Y
			CursorLCD_X = X + Map_X
			CursorLCD_Y = Y + Map_Y

			DrawMap()
			BitBltPage(PageBack, PageMap)
			DrawCursor()

			X += Map_X
			Y += Map_Y
			
			Cnt2 = 0
			while  Cnt2 < 10
				if (Player_Life(Controler,Cnt1) > 100) then
					Player_Life(Controler,Cnt1) = 100
				end if

				BitBltPage(PageTMP, PageBack)
				ShowPich(PageTMP, ResAnim(3), Cnt2 * 80, 0, 80, 80, (X - 2) * 16, (Y - 2) * 16, 1)
				ShowPage(PageTMP)
				msdelay_c(30)

				if (Cnt2 = 5) then
					msdelay_c(30)
				end if
				Cnt2 ++
			wend
			Player_Life(Controler,Cnt1) += code * 20
			Cnt1++
		wend

	SHOW_CURSOR = SPECIALVAL
	Player_Wrath(Controler) -= code * 30
end function

'获取累加数

function getbacklog(num)
	dim cnt1
	cnt1 = num-1
	while cnt1 > 0
		num += cnt1
		cnt1--
	wend
	getbacklog=num
end function

'获取轨迹坐标
'检验完毕
sub gettrack( x , y , bas_x , bas_y)
	if (*X <= bas_x and *Y < bas_y) then
		*X = *X - 1
		*Y = *Y + 1
	else if (*X < bas_x and *Y >= bas_y) then
		*X =*x+1
		*Y =*y+1
	else if (*X >= bas_x and *Y > bas_y) then
		*X =*x+1
		*Y =*y-1
	else if (*X > bas_x and *Y <= bas_y) then
		*X =*x-1
		*Y =*y-1
		if (*X = bas_x) then
			*Y=*y -1
		end if
	end if
end sub

sub getmoney()
	dim cnt1,cnt2
	cnt1=0
	while cnt1<5
		cnt2=0
		while cnt2<build_number(controler,cnt1)
			player_money(controler) += production
			cnt2++
		wend
		cnt1++
	wend
	if player_money(controler)>999999 then
		player_money(controler)=999999
	end if
end sub

function setgame()
	'struct POINT Background[4], DBArrow;
	dim background_x(4)
	dim background_y(4)
	dim dbarrow_x
	dim dbarrow_y
	'
	dim DBArrowPartition
	dim outsetgame
	dim cnt1
	dim setphase
	dim substitute(2,2),add(2,2),limit_left(2,2),limit_right(2,2)
	dim addval
	
	background_x(0)=0
	background_y(0)=-96
	background_x(1)=0
	background_y(1)=-352
	background_x(2)=256
	background_y(2)=-352
	background_x(3)=256
	background_y(3)=-96
	
	limit_left(0,0)=0
	limit_left(0,1)=0
	
	limit_left(1,0)=1000
	limit_left(1,1)=0
	
	limit_right(0,0)=3
	limit_right(0,1)=3
	
	limit_right(1,0)=9500
	limit_right(1,1)=1
	
	Substitute(0,0) = &Player_Role(0)
	Substitute(0,1) = &Player_Role(1)
	Substitute(1,0) = &Production
	Substitute(1,1) = &technical
	
	add(0,0)=1
	add(0,1)=1
	add(1,1)=1
	add(1,0)=500
	
	Color(0, {ffffff}, 0)
	
	OutSetGame = 0
	SetPhase = 0
	Options = 0
	while outsetgame=0
		cnt1=0
		while cnt1<4
			ShowPich(PageTMP, ResUnSys(8), 256, 0, 256, 256, Background_X(Cnt1), Background_Y(Cnt1), 1)
			Background_X(Cnt1)=Background_X(Cnt1)-1
			Background_y(Cnt1)=Background_y(Cnt1)+1
			if Background_X(Cnt1)=-256 and Background_y(Cnt1)=160 then
				Background_X(Cnt1)=256
				Background_y(Cnt1)=-352
			else if Background_X(Cnt1)=-256 and Background_y(Cnt1)=-96 then
				Background_X(Cnt1)=0
				Background_y(Cnt1)=-352
			else if Background_X(Cnt1)=0 and Background_y(Cnt1)=160 then
				Background_X(Cnt1)=256
				Background_y(Cnt1)=-96
			end if
			cnt1=cnt1+1
		wend
		DrawDialog(PageTMP, 2, 130, 237, 29)
		if setphase=0 then
			DBArrowPartition = 56
			DBArrow_X = 62 + Options * 96
			DBArrow_Y = 45
			ShowPich(PageTMP, ResSys(0), 64, 334, 68, 24, 4, 4, 1)
			cnt1=0
			while cnt1<2
				Rectangle_c(PageTMP, 46 + Cnt1 * 96, 53, 94 + Cnt1 * 96, 100, 0, 0)
				Rectangle_c(PageTMP, 47 + Cnt1 * 96, 54, 93 + Cnt1 * 96, 99, 0, {ffffff})
				ShowPich(PageTMP, ResUnSys(10), 98, 2 + Player_Role(Cnt1) * 48, 44, 44, 49 + Cnt1 * 96, 55, 1)
				ShowPich(PageTMP, ResSys(0), 181 + Cnt1 * 14, 28, 14, 14, 48 + Cnt1 * 96, 85, 1)
				ShowPich(PageTMP, ResSys(0), 165 + Cnt1 * 14, 42, 16, 16, 87 + Cnt1 * 96, 53, 1)
				cnt1=cnt1+1
			wend
			OutTextxy(PageTMP, 27, 136, "请选择指挥官")
		else
			DBArrowPartition = 46
			DBArrow_X = 69 + Options * 88
			DBArrow_Y = 52
			ShowPich(PageTMP, ResSys(0), 132, 334, 61, 24, 4, 4, 1)
			ShowPich(PageTMP, ResSys(0), 0, 334, 32, 40, 60, 60, 1)
			ShowPich(PageTMP, ResSys(0), 32, 334, 32, 40, 148, 60, 1)
			OutTextnum(PageTMP, 83, 79, Production, 1)
			ShowPich(PageTMP, ResSys(0), 140 + Technical * 9, 16, 9, 8, 160, 80, 1)
			OutTextxy(PageTMP, 27, 136, "请设置参数")
		end if
		ShowPich(PageTMP, ResSys(0), 149, 42, 16, 8, DBArrow_X, DBArrow_Y, 1)
		ShowPich(PageTMP, ResSys(0), 149, 50, 16, 8, DBArrow_X, DBArrow_Y + DBArrowPartition, 1)
		ShowPage(PageTMP)
		msdelay_c(BG_DELAY)
		GetKey(150)
		addval = 0
		if key=key_down_c or key=key_up_c then
			options=1-options
		else if key=key_left_c then
			addval=-1
		else if key=key_right_c then
			addval=1
		end if
		*Substitute(SetPhase,Options) = AddBox(*Substitute(SetPhase,Options), addval * ADD(SetPhase,Options), limit_left(SetPhase,Options), limit_right(SetPhase,Options), 1)

		if key=key_enter then
			if setphase=0 then
				setphase=1
			else
				setgame=1
				outsetgame=1
			end if
		else if key=key_escape then
			if setphase=1 then
				setphase=0
			else
				setgame=0
				outsetgame=1
			end if
		end if
	wend
end function

sub getfilenum(filepath$)
	dim file$
	dim rei
	rei=1
	filenum=1
	while rei
		file$=filepath$+"map"+str$(filenum)+".dat"
		if lof_c(file$)<=0 then
			rei=0
		end if
		filenum++
	wend
	filenum--
end sub

function lof_c(file$)
	dim tmp_lof
	open file$ for binary as #3
	tmp_lof=lof(3)
	close #3
	lof_c=tmp_lof
end function

function getsecond()
	getsecond=(gettick()/1000)mod 60
end function

function getminute()
	getminute=((gettick()/1000)/60)mod 60
end function

function gethour()
	gethour=(((gettick()/1000)/60)/60)mod 24
end function

function getday()
	getday=(((gettick()/1000)/60)/60)/24
end function

sub showpich(page,pic,dx,dy,w,h,x,y,mode)
	showpic_h90(page,pic,x,y,w,h,dx,dy,mode)
end sub

sub outtextxy(page,x,y,stri$)
	if page=0 then page = -1
	ShowStr(Page,x,y,stri$)
end sub

Function ShowStr(BgPage,x,y,Text$)
	dim Str_n,Str_len,Str_byte,Str_byte2,p1,p2,temlen,x0,y0
	dim tmpstr$
	temlen = 0
	Str_n = 1
	Str_len = len(Text$)
	While Str_n <= Str_len
		tmpstr$=mid$(Text$, Str_n-1, 1)
		Str_byte = asc(tmpstr$)
		Str_n ++
		if Str_byte < 128 and Str_byte > 30 then
			showpic_h90(BgPage,FontRes(0),x,y,6,12,(str_byte Mod 32) * 6,(str_byte / 32 - 1) * 12 ,1)
			x += 6
			temlen++
		else
			tmpstr$=mid$(Text$, Str_n-1, 1)
			Str_byte2 = asc(tmpstr$)
			str_byte += 256
			str_byte2 += 256
			str_n ++
			p1 = str_byte -160
			p2 = str_byte2 - 161
			if p1 >12 then
				p2= 96 * ((p1-1) mod 12) + p2
				p1=(p1 - 1 )/12 + 1
			else
				p2 = 96 * p1 - (96 - p2 )
				p1 = 1
			end if
			if p1 <= 8 and p1>=1 then
				x0=( p2 mod 32 ) * 12
				y0=(p2 / 32 ) * 12
				showpic_h90(BgPage,FontRes(p1),x,y,12,12,x0,y0,1)
			end if
			x += 12
			temlen += 2
		end if
	Wend
	showstr=temlen
End Function

sub Rectangle_c(Page,x1,y1,x2,y2,style,c)
	Fillpage(page,y1+55,320-x1-(x2-x1+1)-7,y2-y1+1,x2-x1+1,c)
end sub

sub showpic_h90(page,pic,x0,y0,w,d,x,y,mode)
	showpic(page,pic,y0+55,320-x0-w-7,d,w,y,getpichgt(pic)-x-w,mode)
end function

sub screenshot()
	dim ssid
	dim ssname$
	dim pos
	dim ss_x,ss_y
	dim pc1
	dim c_r1,c_b1,c_g1
	dim sspicdata$
	dim ss_bar
	fillpage(-1,227,110,13,162,{3c3c3c})
	ssid=1
	while 1
		ssname$="高级战争\screenshot\screenshot" + str$(ssid) + ".bmp"
		if lof_c(ssname$) = 0 then
			goto end_ss_while
		end if
		ssid ++
	wend
	end_ss_while:
	
	open ssname$ for binary as #1
	pos = 0
	seek #1,pos
	pos += 2
	put #1,19778
	seek #1,pos
	pos += 2
	put #1,49718
	seek #1,pos
	pos += 2
	put #1,1
	seek #1,pos
	pos += 2
	put #1,0
	seek #1,pos
	pos += 2
	put #1,0
	seek #1,pos
	pos += 2
	put #1,54
	seek #1,pos
	pos += 2
	put #1,0
	seek #1,pos
	pos += 2
	put #1,40
	seek #1,pos
	pos += 2
	put #1,0
	seek #1,pos
	pos += 2
	put #1,240
	seek #1,pos
	pos += 2
	put #1,0
	seek #1,pos
	pos += 2
	put #1,160
	seek #1,pos
	pos += 2
	put #1,0
	seek #1,pos
	pos += 2
	put #1,1
	seek #1,pos
	pos += 2
	put #1,24
	seek #1,pos
	pos += 2
	put #1,0
	seek #1,pos
	pos += 2
	put #1,0
	seek #1,pos
	pos += 2
	put #1,49664
	seek #1,pos
	pos += 2
	put #1,1
	seek #1,pos
	pos += 2
	put #1,0
	seek #1,pos
	pos += 2
	put #1,0
	seek #1,pos
	pos += 2
	put #1,0
	seek #1,pos
	pos += 2
	put #1,0
	seek #1,pos
	pos += 2
	put #1,0
	seek #1,pos
	pos += 2
	put #1,0
	seek #1,pos
	pos += 2
	put #1,0
	seek #1,pos
	pos += 2
	put #1,0
	
	pos = 54
	
	ss_bar = 270
	
	ss_X = 214
	while ss_x >= 55
		ss_y = 312
		sspicdata$ = ""
		while ss_y >= 73
			pc1=READPIXEL(-1,ss_X,ss_Y)
			c_r1=EAND(pc1,255)
			if c_r1 = 0 then c_r1 = 1
			pc1=ESHR(pc1, 8)
			c_g1=EAND(pc1,255)
			if c_g1 = 0 then c_g1 = 1
			pc1=ESHR(pc1, 8)
			c_b1=pc1
			if c_b1 = 0 then c_b1 = 1
			sspicdata$ = "" + sspicdata$ + chr$(c_b1) + chr$(c_g1) + chr$(c_r1)
			ss_y --
		wend
		seek #1,pos
		put #1,sspicdata$
		pos += 720
		fillpage(-1,228,ss_bar,11,1,{2AAF68})
		ss_bar --
		ss_x --
	wend
	'put #1,sspicdata$
	'waitkey_c()
	showpage(-1)
	close #1
end sub

sub msdelay_c(ms)
	dim t
	t=gettick()
	while gettick() < t + ms
	wend
end sub

sub waitkey_c()
	while getkey(0) = 0
	wend
end sub









