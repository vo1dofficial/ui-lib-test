--[[

.----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.     .----------------.  .----------------. 
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |   | .--------------. || .--------------. |
| |  ____  ____  | || |  _________   | || |  ____  ____  | || |     ____     | || |  _______     | || |      __      | |   | | _____  _____ | || |     _____    | |
| | |_   ||   _| | || | |_   ___  |  | || | |_  _||_  _| | || |   .'    `.   | || | |_   __ \    | || |     /  \     | |   | ||_   _||_   _|| || |    |_   _|   | |
| |   | |__| |   | || |   | |_  \_|  | || |   \ \  / /   | || |  /  .--.  \  | || |   | |__) |   | || |    / /\ \    | |   | |  | |    | |  | || |      | |     | |
| |   |  __  |   | || |   |  _|  _   | || |    > `' <    | || |  | |    | |  | || |   |  __ /    | || |   / ____ \   | |   | |  | '    ' |  | || |      | |     | |
| |  _| |  | |_  | || |  _| |___/ |  | || |  _/ /'`\ \_  | || |  \  `--'  /  | || |  _| |  \ \_  | || | _/ /    \ \_ | |   | |   \ `--' /   | || |     _| |_    | |
| | |____||____| | || | |_________|  | || | |____||____| | || |   `.____.'   | || | |____| |___| | || ||____|  |____|| |   | |    `.__.'    | || |    |_____|   | |
| |              | || |              | || |              | || |              | || |              | || |              | |   | |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |   | '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'     '----------------'  '----------------' 
    __             __  __                              _____       ______                      __       
   / /_  __  __   / / / /__  _  ______  _________ _   / ___/____  / __/ /__      ______  _____/ /_______
  / __ \/ / / /  / /_/ / _ \| |/_/ __ \/ ___/ __ `/   \__ \/ __ \/ /_/ __/ | /| / / __ \/ ___/ //_/ ___/
 / /_/ / /_/ /  / __  /  __/>  </ /_/ / /  / /_/ /   ___/ / /_/ / __/ /_ | |/ |/ / /_/ / /  / ,< (__  ) 
/_.___/\__, /  /_/ /_/\___/_/|_|\____/_/   \__,_/   /____/\____/_/  \__/ |__/|__/\____/_/  /_/|_/____/  
      /____/   

-- ]]

local HexoraUI = {}
HexoraUI.__index = HexoraUI
HexoraUI.IconProviders = {}
HexoraUI.IconSets = {
    material = {},
    lucide = {},
}

local BuiltinLucideIcons = {
	["a-arrow-down"] = 85758889687786,
	["a-arrow-up"] = 102165397775777,
	["a-large-small"] = 120435565718499,
	accessibility = 134709504811618,
	activity = 116785635688905,
	["air-vent"] = 128830959442416,
	airplay = 120532433393858,
	["alarm-clock"] = 135676792539632,
	["alarm-clock-check"] = 127147726542044,
	["alarm-clock-minus"] = 95643155997004,
	["alarm-clock-off"] = 137565311508297,
	["alarm-clock-plus"] = 120411905187238,
	["alarm-smoke"] = 132790621765466,
	album = 127392884430355,
	["align-center"] = 96679836838314,
	["align-center-horizontal"] = 81234251374424,
	["align-center-vertical"] = 123778475388904,
	["align-end-horizontal"] = 81993664554439,
	["align-end-vertical"] = 99312370694107,
	["align-horizontal-distribute-center"] = 118173212655147,
	["align-horizontal-distribute-end"] = 119611041085513,
	["align-horizontal-distribute-start"] = 121542670969125,
	["align-horizontal-justify-center"] = 129528110611234,
	["align-horizontal-justify-end"] = 84954252650701,
	["align-horizontal-justify-start"] = 94264399395941,
	["align-horizontal-space-around"] = 103744081790884,
	["align-horizontal-space-between"] = 101251856513947,
	["align-justify"] = 132508901949872,
	["align-left"] = 73665096529381,
	["align-right"] = 119992416120405,
	["align-start-horizontal"] = 92574847248087,
	["align-start-vertical"] = 96167730292932,
	["align-vertical-distribute-center"] = 100557171686579,
	["align-vertical-distribute-end"] = 140244274635306,
	["align-vertical-distribute-start"] = 104366918572697,
	["align-vertical-justify-center"] = 125823633272170,
	["align-vertical-justify-end"] = 101012057660025,
	["align-vertical-justify-start"] = 127756811142477,
	["align-vertical-space-around"] = 80630398253986,
	["align-vertical-space-between"] = 99587234432478,
	ambulance = 87996833293600,
	ampersand = 76003774257181,
	ampersands = 122865331745636,
	amphora = 85710574172044,
	anchor = 117368273793473,
	angry = 131535996678230,
	annoyed = 89651894120317,
	antenna = 105556767656262,
	anvil = 100535116378267,
	aperture = 88920539534875,
	["app-window"] = 128524598896661,
	["app-window-mac"] = 84920671926321,
	apple = 82452145861900,
	archive = 96979844504359,
	["archive-restore"] = 130207139403143,
	["archive-x"] = 125724859663305,
	armchair = 92951944347771,
	["arrow-big-down"] = 87872502681784,
	["arrow-big-down-dash"] = 80956925610434,
	["arrow-big-left"] = 76008736050357,
	["arrow-big-left-dash"] = 80166004308034,
	["arrow-big-right"] = 81390374011332,
	["arrow-big-right-dash"] = 125910019327152,
	["arrow-big-up"] = 118315457005585,
	["arrow-big-up-dash"] = 139174253931992,
	["arrow-down"] = 111101849488750,
	["arrow-down-0-1"] = 134662804888116,
	["arrow-down-1-0"] = 90807982982621,
	["arrow-down-a-z"] = 74563886614714,
	["arrow-down-from-line"] = 123039586915624,
	["arrow-down-left"] = 105470816142918,
	["arrow-down-narrow-wide"] = 104635517851768,
	["arrow-down-right"] = 104630792951402,
	["arrow-down-to-dot"] = 95176928712454,
	["arrow-down-to-line"] = 109729358294452,
	["arrow-down-up"] = 139238003599315,
	["arrow-down-wide-narrow"] = 88577562336410,
	["arrow-down-z-a"] = 90653871517145,
	["arrow-left"] = 86088091986547,
	["arrow-left-from-line"] = 88700685151310,
	["arrow-left-right"] = 94596049358882,
	["arrow-left-to-line"] = 116829154369215,
	["arrow-right"] = 81302631706885,
	["arrow-right-from-line"] = 132141803726901,
	["arrow-right-left"] = 108283385684703,
	["arrow-right-to-line"] = 114892398312410,
	["arrow-up"] = 79062740627249,
	["arrow-up-0-1"] = 114095112758791,
	["arrow-up-1-0"] = 115833544112532,
	["arrow-up-a-z"] = 130831349804002,
	["arrow-up-down"] = 102155677695268,
	["arrow-up-from-dot"] = 134959689985016,
	["arrow-up-from-line"] = 134860743051776,
	["arrow-up-left"] = 107477197303574,
	["arrow-up-narrow-wide"] = 101421168592063,
	["arrow-up-right"] = 103889806698388,
	["arrow-up-to-line"] = 131974361540264,
	["arrow-up-wide-narrow"] = 106886180124309,
	["arrow-up-z-a"] = 76578983028237,
	["arrows-up-from-line"] = 105423404426073,
	asterisk = 123815391218414,
	["at-sign"] = 104314582758551,
	atom = 120167347744561,
	["audio-lines"] = 138755914830486,
	["audio-waveform"] = 119789394178873,
	award = 89623672395278,
	axe = 95479937653376,
	["axis-3d"] = 92397422208087,
	baby = 134780923890658,
	backpack = 78993249203823,
	badge = 93861197775357,
	["badge-alert"] = 73521163893374,
	["badge-cent"] = 122278154144822,
	["badge-check"] = 102864233048311,
	["badge-dollar-sign"] = 99073011426006,
	["badge-euro"] = 129639299324055,
	["badge-indian-rupee"] = 87973104646655,
	["badge-info"] = 98821060789724,
	["badge-japanese-yen"] = 134928701899269,
	["badge-minus"] = 129618320064265,
	["badge-percent"] = 105307797413967,
	["badge-plus"] = 120096069624662,
	["badge-pound-sterling"] = 98623823861803,
	["badge-question-mark"] = 114663892643950,
	["badge-russian-ruble"] = 99522239121803,
	["badge-swiss-franc"] = 115747080056818,
	["badge-turkish-lira"] = 137289094254207,
	["badge-x"] = 127345048117218,
	["baggage-claim"] = 108988660196157,
	ban = 131594718784390,
	banana = 126474514866989,
	bandage = 102355944011166,
	banknote = 83624352345036,
	["banknote-arrow-down"] = 128101736029907,
	["banknote-arrow-up"] = 103476760707791,
	["banknote-x"] = 110844057471453,
	barcode = 129209916672607,
	barrel = 127931314050877,
	baseline = 137447148848893,
	bath = 111108655648642,
	battery = 81540661066811,
	["battery-charging"] = 126836500232390,
	["battery-full"] = 127212547690381,
	["battery-low"] = 87721404307217,
	["battery-medium"] = 114615415737248,
	["battery-plus"] = 76354196605526,
	["battery-warning"] = 136795384828263,
	beaker = 140429312347329,
	bean = 140548534094518,
	["bean-off"] = 87490357773352,
	bed = 103703460158347,
	["bed-double"] = 118545136165123,
	["bed-single"] = 117894740011786,
	beef = 95141393904694,
	bell = 111725241873349,
	["bell-dot"] = 102000063515653,
	["bell-electric"] = 130154093563594,
	["bell-minus"] = 134871560843826,
	["bell-off"] = 109403921599739,
	["bell-plus"] = 87193682465452,
	["bell-ring"] = 81911080119140,
	["between-horizontal-end"] = 105855324839543,
	["between-horizontal-start"] = 116266907424675,
	["between-vertical-end"] = 109243784030881,
	["between-vertical-start"] = 112708575033628,
	["biceps-flexed"] = 113573819070463,
	bike = 120355969619987,
	binary = 82905169249889,
	binoculars = 114841582615801,
	biohazard = 90593430701402,
	bird = 127082032570770,
	bitcoin = 120165823908407,
	blend = 106898143444225,
	blinds = 131748682748698,
	blocks = 99930206828481,
	bluetooth = 87938138872705,
	["bluetooth-connected"] = 93809243280097,
	["bluetooth-off"] = 92065127311527,
	["bluetooth-searching"] = 138407763527325,
	bold = 71230510917945,
	bolt = 72499878743015,
	bomb = 119539352578001,
	bone = 93032826374472,
	book = 136417435522797,
	["book-a"] = 138905558517206,
	["book-alert"] = 83126881397457,
	["book-audio"] = 130817325428812,
	["book-check"] = 101435243286406,
	["book-copy"] = 92171152631020,
	["book-dashed"] = 81283267299629,
	["book-down"] = 133514420249956,
	["book-headphones"] = 139523016403916,
	["book-heart"] = 122531870789237,
	["book-image"] = 137276864404721,
	["book-key"] = 139461027818572,
	["book-lock"] = 98420126712941,
	["book-marked"] = 108700129544150,
	["book-minus"] = 134429286820139,
	["book-open"] = 73094472868219,
	["book-open-check"] = 139564107496900,
	["book-open-text"] = 112163368354922,
	["book-plus"] = 86198588567912,
	["book-text"] = 92477178021408,
	["book-type"] = 140569336920621,
	["book-up"] = 129825144914500,
	["book-up-2"] = 138870529166566,
	["book-user"] = 78445558294223,
	["book-x"] = 117684589004730,
	bookmark = 96422374119496,
	["bookmark-check"] = 140385274312943,
	["bookmark-minus"] = 90761509653848,
	["bookmark-plus"] = 102716399992603,
	["bookmark-x"] = 83946741234593,
	["boom-box"] = 117773767367782,
	bot = 112973706230253,
	["bot-message-square"] = 127454915177046,
	["bot-off"] = 123215836836938,
	["bow-arrow"] = 82126194792160,
	box = 101391159909398,
	boxes = 129614835711516,
	braces = 74399703620454,
	brackets = 126480941270849,
	brain = 80449922621372,
	["brain-circuit"] = 122829293465734,
	["brain-cog"] = 133841445789468,
	["brick-wall"] = 88059137745523,
	["brick-wall-fire"] = 101508535298010,
	["brick-wall-shield"] = 122970924994177,
	briefcase = 79573382931819,
	["briefcase-business"] = 89024144265875,
	["briefcase-conveyor-belt"] = 80699894594034,
	["briefcase-medical"] = 88977669291957,
	["bring-to-front"] = 121372673068497,
	brush = 140399962450518,
	["brush-cleaning"] = 77081887717462,
	bubbles = 100951413779327,
	bug = 108064626456459,
	["bug-off"] = 115130754051050,
	["bug-play"] = 93005823489214,
	building = 115759871615135,
	["building-2"] = 113633264034729,
	bus = 70492885634507,
	["bus-front"] = 101442123728652,
	cable = 73929033306217,
	["cable-car"] = 103343370160284,
	cake = 94945328569141,
	["cake-slice"] = 134869363778873,
	calculator = 126294519603935,
	calendar = 95545489603627,
	["calendar-1"] = 111669544177893,
	["calendar-arrow-down"] = 98826297336095,
	["calendar-arrow-up"] = 101259481484784,
	["calendar-check"] = 128735293881337,
	["calendar-check-2"] = 134741295436727,
	["calendar-clock"] = 137989998809749,
	["calendar-cog"] = 81132100829120,
	["calendar-days"] = 74473866264642,
	["calendar-fold"] = 72800363993863,
	["calendar-heart"] = 140469143489469,
	["calendar-minus"] = 126947076491962,
	["calendar-minus-2"] = 114758284207771,
	["calendar-off"] = 83172321745470,
	["calendar-plus"] = 95864120179039,
	["calendar-plus-2"] = 110548362075353,
	["calendar-range"] = 137666557292561,
	["calendar-search"] = 77709463965815,
	["calendar-sync"] = 97624728588729,
	["calendar-x"] = 138974312970463,
	["calendar-x-2"] = 107515535887947,
	camera = 102911860111235,
	["camera-off"] = 99242316763000,
	candy = 121602796953412,
	["candy-cane"] = 112464754953529,
	["candy-off"] = 98908167238404,
	captions = 92247523675264,
	["captions-off"] = 117421756298550,
	car = 104209031513829,
	["car-front"] = 108397050137008,
	["car-taxi-front"] = 73584751879123,
	caravan = 127063101240586,
	["card-sim"] = 87568181073492,
	carrot = 121695263564136,
	["case-lower"] = 104147111219050,
	["case-sensitive"] = 80443686256687,
	["case-upper"] = 106568493343250,
	["cassette-tape"] = 85528666149718,
	cast = 106045389407030,
	castle = 137349466287423,
	cat = 132587012252853,
	cctv = 96089950910363,
	["chart-area"] = 83865456239149,
	["chart-bar"] = 78022204342641,
	["chart-bar-big"] = 77915167652266,
	["chart-bar-decreasing"] = 128999724972766,
	["chart-bar-increasing"] = 94790043521729,
	["chart-bar-stacked"] = 118586341637168,
	["chart-candlestick"] = 97939388409760,
	["chart-column"] = 90604892299985,
	["chart-column-big"] = 117124840997620,
	["chart-column-decreasing"] = 128154461153272,
	["chart-column-increasing"] = 110238053193715,
	["chart-column-stacked"] = 138210545678793,
	["chart-gantt"] = 105284278917364,
	["chart-line"] = 132073950959918,
	["chart-no-axes-column"] = 134593063392849,
	["chart-no-axes-column-decreasing"] = 117582413267339,
	["chart-no-axes-column-increasing"] = 107383929417521,
	["chart-no-axes-combined"] = 125766210212199,
	["chart-no-axes-gantt"] = 136683497999733,
	["chart-pie"] = 129237625973646,
	["chart-scatter"] = 109368208547302,
	["chart-spline"] = 128939166873577,
	check = 83827110621355,
	["check-check"] = 85764415779159,
	["check-line"] = 85776673122871,
	["chef-hat"] = 104351698660651,
	cherry = 130832753420629,
	["chevron-down"] = 95086910949405,
	["chevron-first"] = 130485497879762,
	["chevron-last"] = 127072220474704,
	["chevron-left"] = 83856486110301,
	["chevron-right"] = 126507964682213,
	["chevron-up"] = 124630674114245,
	["chevrons-down"] = 118746624854239,
	["chevrons-down-up"] = 122938925052724,
	["chevrons-left"] = 72622305378588,
	["chevrons-left-right"] = 100027150072609,
	["chevrons-left-right-ellipsis"] = 70758373090992,
	["chevrons-right"] = 115563110262022,
	["chevrons-right-left"] = 79674513843833,
	["chevrons-up"] = 115981451099607,
	["chevrons-up-down"] = 113432796824448,
	chrome = 73342145832786,
	church = 136057686683219,
	circle = 97474013459876,
	["circle-alert"] = 86075768491850,
	["circle-arrow-down"] = 98516510858394,
	["circle-arrow-left"] = 139149045348698,
	["circle-arrow-out-down-left"] = 140114130402613,
	["circle-arrow-out-down-right"] = 97306619688140,
	["circle-arrow-out-up-left"] = 133904465013804,
	["circle-arrow-out-up-right"] = 133791579853102,
	["circle-arrow-right"] = 132106229530514,
	["circle-arrow-up"] = 125630987618979,
	["circle-check"] = 122835208471730,
	["circle-check-big"] = 101462339244321,
	["circle-chevron-down"] = 125398962450772,
	["circle-chevron-left"] = 133979492199232,
	["circle-chevron-right"] = 130029053510525,
	["circle-chevron-up"] = 137057131849576,
	["circle-dashed"] = 97773019242734,
	["circle-divide"] = 75278590313141,
	["circle-dollar-sign"] = 103021845191343,
	["circle-dot"] = 73332621255981,
	["circle-dot-dashed"] = 121201310391755,
	["circle-ellipsis"] = 128894546879090,
	["circle-equal"] = 91854769894722,
	["circle-fading-arrow-up"] = 121178878326961,
	["circle-fading-plus"] = 95512963110153,
	["circle-gauge"] = 84688454826847,
	["circle-minus"] = 74458161947564,
	["circle-off"] = 80618483788295,
	["circle-parking"] = 121342131175144,
	["circle-parking-off"] = 115951067573453,
	["circle-pause"] = 75601858754638,
	["circle-percent"] = 89021739919224,
	["circle-play"] = 119442756895009,
	["circle-plus"] = 132023187288319,
	["circle-pound-sterling"] = 121749745341582,
	["circle-power"] = 131944289575262,
	["circle-question-mark"] = 98575632186975,
	["circle-slash"] = 86554477881978,
	["circle-slash-2"] = 93846864384983,
	["circle-small"] = 106775888594817,
	["circle-star"] = 108994144808450,
	["circle-stop"] = 122478988921288,
	["circle-user"] = 73363870264217,
	["circle-user-round"] = 103422319407938,
	["circle-x"] = 136096054247483,
	["circuit-board"] = 102649990533936,
	citrus = 104012894480157,
	clapperboard = 117040519290119,
	clipboard = 91839478896367,
	["clipboard-check"] = 119930716282333,
	["clipboard-clock"] = 81178312131599,
	["clipboard-copy"] = 116099874965891,
	["clipboard-list"] = 110095483413821,
	["clipboard-minus"] = 107683237596936,
	["clipboard-paste"] = 137750657442733,
	["clipboard-pen"] = 112275963070957,
	["clipboard-pen-line"] = 111346066067551,
	["clipboard-plus"] = 132362866476079,
	["clipboard-type"] = 106736512129205,
	["clipboard-x"] = 128986978015444,
	clock = 96835529467684,
	["clock-1"] = 98563563321460,
	["clock-10"] = 80443443598462,
	["clock-11"] = 82371834247998,
	["clock-12"] = 133877976025070,
	["clock-2"] = 72258367874092,
	["clock-3"] = 86319537133958,
	["clock-4"] = 111040057497751,
	["clock-5"] = 82455058311564,
	["clock-6"] = 110541146574832,
	["clock-7"] = 138423994726927,
	["clock-8"] = 98901513399369,
	["clock-9"] = 140464097226658,
	["clock-alert"] = 115862173875314,
	["clock-arrow-down"] = 95351498388159,
	["clock-arrow-up"] = 131512554213603,
	["clock-fading"] = 138812484601909,
	["clock-plus"] = 108994381956359,
	["closed-caption"] = 109168929168877,
	cloud = 76797375125469,
	["cloud-alert"] = 106567345820073,
	["cloud-check"] = 83689617445982,
	["cloud-cog"] = 99037393440946,
	["cloud-download"] = 134259137069761,
	["cloud-drizzle"] = 108966030756512,
	["cloud-fog"] = 116434374562091,
	["cloud-hail"] = 93896344446382,
	["cloud-lightning"] = 88393801019014,
	["cloud-moon"] = 92598532990542,
	["cloud-moon-rain"] = 102795706163713,
	["cloud-off"] = 132746052928464,
	["cloud-rain"] = 126682720368880,
	["cloud-rain-wind"] = 138531953575675,
	["cloud-snow"] = 83889452050491,
	["cloud-sun"] = 99857531021323,
	["cloud-sun-rain"] = 102969016910466,
	["cloud-upload"] = 85588611412306,
	cloudy = 72892691173430,
	clover = 73146836842348,
	club = 119692145642080,
	code = 102858857098762,
	["code-xml"] = 130876992978049,
	codepen = 121196034119960,
	codesandbox = 81104810964988,
	coffee = 75171771078867,
	cog = 134998527925514,
	coins = 128784569032326,
	["columns-2"] = 89175983308456,
	["columns-3"] = 109318054321048,
	["columns-3-cog"] = 138473447831624,
	["columns-4"] = 92778631374832,
	combine = 98228911815481,
	command = 129307680894782,
	compass = 117355392623233,
	component = 81317444646043,
	computer = 129323176739507,
	["concierge-bell"] = 126886445681359,
	cone = 74845976589938,
	construction = 115083821531795,
	contact = 83336471862351,
	["contact-round"] = 92207205844906,
	container = 116643588421234,
	contrast = 76959893700184,
	cookie = 139241068220893,
	["cooking-pot"] = 73135275032763,
	copy = 87942399647942,
	["copy-check"] = 99030373914807,
	["copy-minus"] = 73147465136627,
	["copy-plus"] = 124547842490145,
	["copy-slash"] = 73629354412770,
	["copy-x"] = 76935228109965,
	copyleft = 117008643514602,
	copyright = 116764791222062,
	["corner-down-left"] = 121810619354729,
	["corner-down-right"] = 94219370057308,
	["corner-left-down"] = 88518708580891,
	["corner-left-up"] = 80457911677892,
	["corner-right-down"] = 71667850048566,
	["corner-right-up"] = 116802297506682,
	["corner-up-left"] = 77719684055742,
	["corner-up-right"] = 101875782041114,
	cpu = 115781787166822,
	["creative-commons"] = 106945564709172,
	["credit-card"] = 135019527878105,
	croissant = 124064182582120,
	crop = 137832753521417,
	cross = 106039923010417,
	crosshair = 114929017287945,
	crown = 90472614287057,
	cuboid = 85125857520529,
	["cup-soda"] = 116064630908908,
	currency = 98741673384975,
	cylinder = 106008846957333,
	dam = 123638563636102,
	database = 122884003685338,
	["database-backup"] = 134263890065988,
	["database-zap"] = 94292145388316,
	["decimals-arrow-left"] = 83364854887027,
	["decimals-arrow-right"] = 89255202941321,
	delete = 120475342373468,
	dessert = 79122775950408,
	diameter = 103202047751161,
	diamond = 116224572544413,
	["diamond-minus"] = 98219591040851,
	["diamond-percent"] = 90953177250482,
	["diamond-plus"] = 81855866369969,
	["dice-1"] = 129785132691343,
	["dice-2"] = 101184428062194,
	["dice-3"] = 126124539917527,
	["dice-4"] = 136593201423203,
	["dice-5"] = 72548398039172,
	["dice-6"] = 107423423270100,
	dices = 117821030233748,
	diff = 89271474511472,
	disc = 139513828111819,
	["disc-2"] = 77624862049574,
	["disc-3"] = 101670496442540,
	["disc-album"] = 119925914044267,
	divide = 122092927804054,
	dna = 89745363802733,
	["dna-off"] = 138639847028076,
	dock = 132625251672190,
	dog = 111571812945872,
	["dollar-sign"] = 118972397587528,
	donut = 80434741396669,
	["door-closed"] = 89760328598955,
	["door-closed-locked"] = 72612456720492,
	["door-open"] = 133814065231262,
	dot = 97016002851923,
	download = 93868047445509,
	["drafting-compass"] = 132019045125555,
	drama = 140495061255070,
	dribbble = 85814569433570,
	drill = 102448607336819,
	drone = 87852662372231,
	droplet = 117947500824611,
	["droplet-off"] = 89562126293632,
	droplets = 91168064495352,
	drum = 85667754872431,
	drumstick = 75387497663037,
	dumbbell = 135834722331614,
	ear = 125040388889621,
	["ear-off"] = 77431400735000,
	earth = 80407859572555,
	["earth-lock"] = 82771383007037,
	eclipse = 124423514511474,
	egg = 73908680452587,
	["egg-fried"] = 88691210642745,
	["egg-off"] = 75945935080886,
	ellipsis = 95956203670622,
	["ellipsis-vertical"] = 93274856771582,
	equal = 81138954359025,
	["equal-approximately"] = 126766764416385,
	["equal-not"] = 110767672641130,
	eraser = 101514212866613,
	["ethernet-port"] = 107171703835846,
	euro = 105515269837621,
	expand = 135216706603096,
	["external-link"] = 88749979118129,
	eye = 139722329189430,
	["eye-closed"] = 85964738779718,
	["eye-off"] = 112375739491233,
	facebook = 126875779412726,
	factory = 124610887424481,
	fan = 99112617546784,
	["fast-forward"] = 86261062156594,
	feather = 72722125673150,
	fence = 136027177552403,
	["ferris-wheel"] = 94212033084546,
	figma = 78102137532795,
	file = 105710786731627,
	["file-archive"] = 121027564735426,
	["file-audio"] = 109136641816876,
	["file-audio-2"] = 71519060566551,
	["file-axis-3d"] = 120595284164307,
	["file-badge"] = 130908597463749,
	["file-badge-2"] = 117822997727543,
	["file-box"] = 78582029223846,
	["file-chart-column"] = 79314568863524,
	["file-chart-column-increasing"] = 113934830439854,
	["file-chart-line"] = 127333232922341,
	["file-chart-pie"] = 87366366651618,
	["file-check"] = 82422075525002,
	["file-check-2"] = 87216739205557,
	["file-clock"] = 73969155690610,
	["file-code"] = 92873308907212,
	["file-code-2"] = 115805780254840,
	["file-cog"] = 89816062085634,
	["file-diff"] = 123117415259557,
	["file-digit"] = 104037036187285,
	["file-down"] = 70441423818099,
	["file-heart"] = 90332007470916,
	["file-image"] = 80147266004613,
	["file-input"] = 126683034896557,
	["file-json"] = 76272094739618,
	["file-json-2"] = 117283373455325,
	["file-key"] = 85781683326011,
	["file-key-2"] = 104279126245073,
	["file-lock"] = 74414492225090,
	["file-lock-2"] = 129467818396353,
	["file-minus"] = 100049317730317,
	["file-minus-2"] = 99533501912168,
	["file-music"] = 87486385971490,
	["file-output"] = 117761656606452,
	["file-pen"] = 120012000577923,
	["file-pen-line"] = 77107867479655,
	["file-play"] = 122519637890628,
	["file-plus"] = 134349751246644,
	["file-plus-2"] = 98358464374463,
	["file-question-mark"] = 107111567783242,
	["file-scan"] = 116607859572941,
	["file-search"] = 87648314058326,
	["file-search-2"] = 97504576826222,
	["file-sliders"] = 87362735438576,
	["file-spreadsheet"] = 108378493201587,
	["file-stack"] = 119139237519469,
	["file-symlink"] = 125888988169632,
	["file-terminal"] = 114817439039127,
	["file-text"] = 77346633411296,
	["file-type"] = 91319647276184,
	["file-type-2"] = 102862931204754,
	["file-up"] = 77215633607245,
	["file-user"] = 125031706574705,
	["file-video-camera"] = 98825192269661,
	["file-volume"] = 84825655898765,
	["file-volume-2"] = 132074661677474,
	["file-warning"] = 131113901247439,
	["file-x"] = 134673190690961,
	["file-x-2"] = 75426786305569,
	files = 119868587246453,
	film = 115982940808785,
	fingerprint = 135337299493865,
	["fire-extinguisher"] = 106667025708329,
	fish = 107002260548857,
	["fish-off"] = 83515767284587,
	["fish-symbol"] = 112313456680575,
	flag = 80165228709790,
	["flag-off"] = 131374214560413,
	["flag-triangle-left"] = 100274047554673,
	["flag-triangle-right"] = 95559011206904,
	flame = 78769660969441,
	["flame-kindling"] = 125287652452426,
	flashlight = 114148297083785,
	["flashlight-off"] = 78806207489112,
	["flask-conical"] = 77588155748536,
	["flask-conical-off"] = 140153784540477,
	["flask-round"] = 125921380095942,
	["flip-horizontal"] = 104841355411279,
	["flip-horizontal-2"] = 75840761823703,
	["flip-vertical"] = 88010991372085,
	["flip-vertical-2"] = 115335841457244,
	flower = 125602823130456,
	["flower-2"] = 93937864318346,
	focus = 74209922635562,
	["fold-horizontal"] = 119215308506101,
	["fold-vertical"] = 89627287319601,
	folder = 94236858672537,
	["folder-archive"] = 85978040479686,
	["folder-check"] = 89058605827073,
	["folder-clock"] = 132379000568110,
	["folder-closed"] = 78087942744334,
	["folder-code"] = 79208102753918,
	["folder-cog"] = 125325854177187,
	["folder-dot"] = 135307937184362,
	["folder-down"] = 133724276147220,
	["folder-git"] = 129905012475725,
	["folder-git-2"] = 132556334850282,
	["folder-heart"] = 74682854132263,
	["folder-input"] = 89543549078565,
	["folder-kanban"] = 115692234423291,
	["folder-key"] = 134841972348783,
	["folder-lock"] = 129345483035475,
	["folder-minus"] = 96592440405999,
	["folder-open"] = 100030967746766,
	["folder-open-dot"] = 93584740507880,
	["folder-output"] = 79131635705997,
	["folder-pen"] = 95853187570930,
	["folder-plus"] = 133649526561782,
	["folder-root"] = 85546937479322,
	["folder-search"] = 85575256433549,
	["folder-search-2"] = 132801780326542,
	["folder-symlink"] = 82192734774481,
	["folder-sync"] = 80229070969489,
	["folder-tree"] = 137484935980485,
	["folder-up"] = 135876471645692,
	["folder-x"] = 98414588777713,
	folders = 129365910191151,
	footprints = 128293375583452,
	forklift = 121191524995774,
	forward = 85252404877367,
	frame = 91667256603587,
	framer = 105756021674631,
	frown = 136210266332024,
	fuel = 124477459297771,
	fullscreen = 75191423285573,
	funnel = 139525415522108,
	["funnel-plus"] = 85388798952525,
	["funnel-x"] = 118617352389010,
	["gallery-horizontal"] = 119833288662729,
	["gallery-horizontal-end"] = 110525792845537,
	["gallery-thumbnails"] = 104642411702006,
	["gallery-vertical"] = 73022710081053,
	["gallery-vertical-end"] = 81965622854313,
	gamepad = 98531369429309,
	["gamepad-2"] = 123513783706820,
	gauge = 112385371277348,
	gavel = 135735395765414,
	gem = 111750318675671,
	["georgian-lari"] = 83044477439865,
	ghost = 121912141443713,
	gift = 104098622197576,
	["git-branch"] = 137795533783771,
	["git-branch-plus"] = 140661560177072,
	["git-commit-horizontal"] = 70945132741002,
	["git-commit-vertical"] = 91329034046756,
	["git-compare"] = 115173556067875,
	["git-compare-arrows"] = 88221652268203,
	["git-fork"] = 99605451182076,
	["git-graph"] = 112496986736544,
	["git-merge"] = 136694613142223,
	["git-pull-request"] = 103161641898441,
	["git-pull-request-arrow"] = 135103379062990,
	["git-pull-request-closed"] = 132153092177959,
	["git-pull-request-create"] = 72404602418293,
	["git-pull-request-create-arrow"] = 78997835114389,
	["git-pull-request-draft"] = 109941927307148,
	github = 99911323926868,
	gitlab = 84697247849648,
	["glass-water"] = 88501428715818,
	glasses = 71294658108313,
	globe = 111578783307093,
	["globe-lock"] = 90505069766503,
	goal = 113884228231281,
	gpu = 94475400466478,
	["graduation-cap"] = 137048485405567,
	grape = 81297793587857,
	["grid-2x2"] = 74713443066181,
	["grid-2x2-check"] = 138646582122430,
	["grid-2x2-plus"] = 73772834594194,
	["grid-2x2-x"] = 70574771191740,
	["grid-3x2"] = 98309561243489,
	["grid-3x3"] = 71217273531422,
	grip = 85101746401400,
	["grip-horizontal"] = 87629819003793,
	["grip-vertical"] = 137774674680603,
	group = 137317722960946,
	guitar = 73621537334007,
	ham = 88694785814390,
	hamburger = 94625438561758,
	hammer = 118024154647073,
	hand = 135226632951455,
	["hand-coins"] = 83908670424159,
	["hand-fist"] = 107874697791879,
	["hand-grab"] = 123243858007453,
	["hand-heart"] = 112348965568014,
	["hand-helping"] = 125055501525649,
	["hand-metal"] = 79886749805841,
	["hand-platter"] = 107005076555892,
	handbag = 91595142847556,
	handshake = 119934900822508,
	["hard-drive"] = 78399523068992,
	["hard-drive-download"] = 126141378180246,
	["hard-drive-upload"] = 83678732882261,
	["hard-hat"] = 108269886668169,
	hash = 79281219073716,
	["hat-glasses"] = 88187986739237,
	haze = 71695050029489,
	["hdmi-port"] = 81667603031684,
	heading = 78795987652364,
	["heading-1"] = 139010744018776,
	["heading-2"] = 124511186941584,
	["heading-3"] = 93398585070111,
	["heading-4"] = 129752194457637,
	["heading-5"] = 91071250337131,
	["heading-6"] = 120942934503080,
	["headphone-off"] = 129718080175290,
	headphones = 77933962515384,
	headset = 78282688338634,
	heart = 111284155515598,
	["heart-crack"] = 127768416202523,
	["heart-handshake"] = 116921190920035,
	["heart-minus"] = 73753737435862,
	["heart-off"] = 77001527259120,
	["heart-plus"] = 136895624976238,
	["heart-pulse"] = 77506710442387,
	heater = 92597012287078,
	hexagon = 107545705237342,
	highlighter = 76647612275284,
	history = 87356875172942,
	hop = 107327941544346,
	["hop-off"] = 82070652552741,
	hospital = 136121422327167,
	hotel = 116521770015178,
	hourglass = 97354459771104,
	house = 127889862453151,
	["house-plug"] = 78286530988441,
	["house-plus"] = 86361930968044,
	["house-wifi"] = 81833657881659,
	["ice-cream-bowl"] = 132923169807183,
	["ice-cream-cone"] = 113398279002531,
	["id-card"] = 132284632593096,
	["id-card-lanyard"] = 109892675249866,
	image = 97933683823480,
	["image-down"] = 128149725849146,
	["image-minus"] = 133568289476916,
	["image-off"] = 99722939227313,
	["image-play"] = 73625941877084,
	["image-plus"] = 110592938693426,
	["image-up"] = 132790868440788,
	["image-upscale"] = 93091453446368,
	images = 100017582062659,
	import = 139415113590086,
	inbox = 117961494051741,
	["indent-decrease"] = 90925139615278,
	["indent-increase"] = 110694604864721,
	infinity = 71094877806551,
	info = 117194610053749,
	["inspection-panel"] = 140555328817154,
	instagram = 137841936676016,
	italic = 138130625449010,
	["iteration-ccw"] = 106807980654516,
	["iteration-cw"] = 117352992192290,
	["japanese-yen"] = 135085526808806,
	joystick = 126601646824958,
	kanban = 94237167428633,
	kayak = 114220085067472,
	key = 128426502701541,
	["key-round"] = 80439075172197,
	["key-square"] = 108847209577743,
	keyboard = 78021479821645,
	["keyboard-music"] = 96603074688320,
	["keyboard-off"] = 74463086557782,
	lamp = 106149598999550,
	["lamp-ceiling"] = 107373474068506,
	["lamp-desk"] = 119091300882668,
	["lamp-floor"] = 118721404002286,
	["lamp-wall-down"] = 131117332018010,
	["lamp-wall-up"] = 111944147622055,
	["land-plot"] = 117262165674351,
	landmark = 79297358121552,
	languages = 99917326264912,
	laptop = 88630921256285,
	["laptop-minimal"] = 91902636411470,
	["laptop-minimal-check"] = 98083699649871,
	lasso = 136407965747211,
	["lasso-select"] = 140206314736013,
	laugh = 88041268215527,
	layers = 92401939426051,
	["layers-2"] = 71032875043708,
	["layout-dashboard"] = 109242208940047,
	["layout-grid"] = 80776002921415,
	["layout-list"] = 114901096944423,
	["layout-panel-left"] = 114060619125104,
	["layout-panel-top"] = 140600115620376,
	["layout-template"] = 129513311046670,
	leaf = 114141473154636,
	["leafy-green"] = 75869853521394,
	lectern = 132546168528484,
	["letter-text"] = 127411184020577,
	library = 83641291044674,
	["library-big"] = 70943181021648,
	["life-buoy"] = 88251596523708,
	ligature = 108611580430117,
	lightbulb = 84480692719292,
	["lightbulb-off"] = 107872451939373,
	["line-squiggle"] = 109026309416970,
	link = 73034596791310,
	["link-2"] = 133396582932673,
	["link-2-off"] = 121617377271978,
	linkedin = 140464241694936,
	list = 114094290740453,
	["list-check"] = 127870753168379,
	["list-checks"] = 86457557777962,
	["list-collapse"] = 82013284474006,
	["list-end"] = 137196003577993,
	["list-filter"] = 93463268962238,
	["list-filter-plus"] = 82054172755080,
	["list-minus"] = 109578084629712,
	["list-music"] = 129462394886041,
	["list-ordered"] = 90091028350622,
	["list-plus"] = 132897130887667,
	["list-restart"] = 131578648989528,
	["list-start"] = 139157484305448,
	["list-todo"] = 80421543478674,
	["list-tree"] = 117981368838761,
	["list-video"] = 109079200359344,
	["list-x"] = 79967305528275,
	loader = 93092440305180,
	["loader-circle"] = 83085220798016,
	["loader-pinwheel"] = 80619164634690,
	locate = 76100135911825,
	["locate-fixed"] = 90537535083303,
	["locate-off"] = 130114126626523,
	lock = 71897067930472,
	["lock-keyhole"] = 82932539629673,
	["lock-keyhole-open"] = 126670774179963,
	["lock-open"] = 87192818819520,
	["log-in"] = 104921246880407,
	["log-out"] = 121452889215065,
	logs = 116413304493431,
	lollipop = 92370242563303,
	luggage = 109817666982832,
	magnet = 106378767543648,
	mail = 107247149114562,
	["mail-check"] = 102299214572170,
	["mail-minus"] = 137507529682313,
	["mail-open"] = 79957216174404,
	["mail-plus"] = 97392054041921,
	["mail-question-mark"] = 132294296415348,
	["mail-search"] = 132121654925757,
	["mail-warning"] = 85952461449135,
	["mail-x"] = 132599640757010,
	mailbox = 121433709442295,
	mails = 109802610456892,
	map = 108279805507438,
	["map-minus"] = 133117854348106,
	["map-pin"] = 125589857044225,
	["map-pin-check"] = 73433657551837,
	["map-pin-check-inside"] = 102543459974284,
	["map-pin-house"] = 128212288031307,
	["map-pin-minus"] = 120843698769560,
	["map-pin-minus-inside"] = 118797191517231,
	["map-pin-off"] = 83652562771070,
	["map-pin-pen"] = 102101538402375,
	["map-pin-plus"] = 90799053974278,
	["map-pin-plus-inside"] = 131853510003248,
	["map-pin-x"] = 129671310772849,
	["map-pin-x-inside"] = 90842207454692,
	["map-pinned"] = 113144984652101,
	["map-plus"] = 115814246160273,
	mars = 120237837691441,
	["mars-stroke"] = 78837613304628,
	martini = 131037926665327,
	maximize = 98630565368634,
	["maximize-2"] = 108777312690515,
	medal = 112779948066117,
	megaphone = 104747300280187,
	["megaphone-off"] = 77333538129191,
	meh = 95295284819943,
	["memory-stick"] = 136984029152121,
	menu = 88105946054940,
	merge = 101733452883797,
	["message-circle"] = 103253555420242,
	["message-circle-code"] = 96382573068905,
	["message-circle-dashed"] = 88932788490732,
	["message-circle-heart"] = 126027602940494,
	["message-circle-more"] = 101045229209246,
	["message-circle-off"] = 98784452586047,
	["message-circle-plus"] = 88173371208090,
	["message-circle-question-mark"] = 72740176528871,
	["message-circle-reply"] = 85158719896232,
	["message-circle-warning"] = 92512156177738,
	["message-circle-x"] = 138168651420422,
	["message-square"] = 101115671378532,
	["message-square-code"] = 87110566156463,
	["message-square-dashed"] = 114772668488726,
	["message-square-diff"] = 132647384859535,
	["message-square-dot"] = 95702767009418,
	["message-square-heart"] = 71034790619774,
	["message-square-lock"] = 138911497616369,
	["message-square-more"] = 76114133337761,
	["message-square-off"] = 72445971887595,
	["message-square-plus"] = 84876490293543,
	["message-square-quote"] = 101124360921783,
	["message-square-reply"] = 99682905593886,
	["message-square-share"] = 111163696139836,
	["message-square-text"] = 91402725252953,
	["message-square-warning"] = 133546627536577,
	["message-square-x"] = 91869532020383,
	["messages-square"] = 109110355978624,
	mic = 103948785438713,
	["mic-off"] = 79381540622986,
	["mic-vocal"] = 92319189653574,
	microchip = 114426363692876,
	microscope = 103981634776023,
	microwave = 75423014603555,
	milestone = 84696060292016,
	milk = 107378004547607,
	["milk-off"] = 81017198212200,
	minimize = 132292418800172,
	["minimize-2"] = 115725194133672,
	minus = 120931250449806,
	monitor = 73331152826648,
	["monitor-check"] = 108437497698621,
	["monitor-cog"] = 125290620584522,
	["monitor-dot"] = 86826823806038,
	["monitor-down"] = 80104156010991,
	["monitor-off"] = 107107538808355,
	["monitor-pause"] = 115791072190872,
	["monitor-play"] = 128624177550179,
	["monitor-smartphone"] = 124682793139873,
	["monitor-speaker"] = 105110083118826,
	["monitor-stop"] = 101211853475552,
	["monitor-up"] = 116088712099154,
	["monitor-x"] = 133534745521587,
	moon = 77588825794567,
	["moon-star"] = 98988085004726,
	mountain = 80263482644790,
	["mountain-snow"] = 104191181305826,
	mouse = 107043064551659,
	["mouse-off"] = 116655697625016,
	["mouse-pointer"] = 115752319794521,
	["mouse-pointer-2"] = 109904293129960,
	["mouse-pointer-ban"] = 137539892774993,
	["mouse-pointer-click"] = 107709798577185,
	move = 133600479817246,
	["move-3d"] = 81125830831808,
	["move-diagonal"] = 125202386581344,
	["move-diagonal-2"] = 81239271655220,
	["move-down"] = 125006021670342,
	["move-down-left"] = 76073036666591,
	["move-down-right"] = 129792477029045,
	["move-horizontal"] = 93208311061400,
	["move-left"] = 112800860992157,
	["move-right"] = 82428819089555,
	["move-up"] = 71652407503735,
	["move-up-left"] = 119494062849748,
	["move-up-right"] = 90419076834904,
	["move-vertical"] = 70761579193717,
	music = 93139938100228,
	["music-2"] = 113187037257153,
	["music-3"] = 81349478842651,
	["music-4"] = 96972456280656,
	navigation = 90646250576973,
	["navigation-2"] = 134503816311328,
	["navigation-2-off"] = 131174321328073,
	["navigation-off"] = 108454330041507,
	network = 126418990233987,
	newspaper = 135902869972441,
	nfc = 131962316674237,
	["non-binary"] = 105709493665133,
	notebook = 129243301519710,
	["notebook-pen"] = 91292009218546,
	["notebook-tabs"] = 123657464898215,
	["notebook-text"] = 133642544036180,
	["notepad-text"] = 92434105164050,
	["notepad-text-dashed"] = 136002331761132,
	nut = 81712991871726,
	["nut-off"] = 96078624970734,
	octagon = 134475998551461,
	["octagon-alert"] = 95722117767051,
	["octagon-minus"] = 115829204734243,
	["octagon-pause"] = 91912739903056,
	["octagon-x"] = 117018306251145,
	omega = 91642142247281,
	option = 109155681659629,
	orbit = 74587349912272,
	origami = 77425924575822,
	package = 132935702099654,
	["package-2"] = 91942377485714,
	["package-check"] = 101219557585600,
	["package-minus"] = 100080161784047,
	["package-open"] = 86330655620431,
	["package-plus"] = 83558395457935,
	["package-search"] = 94733344459732,
	["package-x"] = 131230547740708,
	["paint-bucket"] = 136313372531199,
	["paint-roller"] = 134288427758523,
	paintbrush = 131259265232881,
	["paintbrush-vertical"] = 102069363134766,
	palette = 72590019059979,
	panda = 94307958462865,
	["panel-bottom"] = 137958171526644,
	["panel-bottom-close"] = 129839176758045,
	["panel-bottom-dashed"] = 70933718377231,
	["panel-bottom-open"] = 121992330356041,
	["panel-left"] = 113565000264024,
	["panel-left-close"] = 74390600046658,
	["panel-left-dashed"] = 72672900085409,
	["panel-left-open"] = 83412022647633,
	["panel-right"] = 84244938232059,
	["panel-right-close"] = 110482031701194,
	["panel-right-dashed"] = 90286202042323,
	["panel-right-open"] = 97178553892975,
	["panel-top"] = 73398031615308,
	["panel-top-close"] = 96198752262708,
	["panel-top-dashed"] = 110503999562022,
	["panel-top-open"] = 97204124781562,
	["panels-left-bottom"] = 103748432439667,
	["panels-right-bottom"] = 126632243488487,
	["panels-top-left"] = 110293983641300,
	paperclip = 85348713089672,
	parentheses = 132664978899134,
	["parking-meter"] = 137810887120829,
	["party-popper"] = 109041559217985,
	pause = 103515787468348,
	["paw-print"] = 92297066485556,
	["pc-case"] = 128937361383812,
	pen = 116061195824555,
	["pen-line"] = 74845359608302,
	["pen-off"] = 87844360625113,
	["pen-tool"] = 133366920150012,
	pencil = 138696307419367,
	["pencil-line"] = 110410329363278,
	["pencil-off"] = 137726198263006,
	["pencil-ruler"] = 84544564987704,
	pentagon = 83842838413405,
	percent = 122952027760305,
	["person-standing"] = 88108597062307,
	["philippine-peso"] = 137021984302903,
	phone = 98258227445115,
	["phone-call"] = 110549742231723,
	["phone-forwarded"] = 101851668578549,
	["phone-incoming"] = 110075904144850,
	["phone-missed"] = 76822282444954,
	["phone-off"] = 96027672862323,
	["phone-outgoing"] = 136094637639849,
	pi = 76240757098861,
	piano = 99707908396210,
	pickaxe = 75482513098960,
	["picture-in-picture"] = 89952035422534,
	["picture-in-picture-2"] = 111681849788255,
	["piggy-bank"] = 90884658423229,
	pilcrow = 70649688801421,
	["pilcrow-left"] = 78150190347601,
	["pilcrow-right"] = 77497763828757,
	pill = 116144362117466,
	["pill-bottle"] = 135805261557990,
	pin = 91435057862637,
	["pin-off"] = 86227962812956,
	pipette = 71094894064846,
	pizza = 95650659741106,
	plane = 137398243053043,
	["plane-landing"] = 104010936460941,
	["plane-takeoff"] = 95605407118637,
	play = 80104466227462,
	plug = 127012265988191,
	["plug-2"] = 75875872308134,
	["plug-zap"] = 101683967511440,
	plus = 118563428285930,
	pocket = 113239264323778,
	["pocket-knife"] = 103757792000836,
	podcast = 96567592813667,
	pointer = 103954952458474,
	["pointer-off"] = 77566412863428,
	popcorn = 124139605746210,
	popsicle = 102234286085590,
	["pound-sterling"] = 126999093165604,
	power = 139821907770093,
	["power-off"] = 91025506233520,
	presentation = 126156401836303,
	printer = 138626675452013,
	["printer-check"] = 75685462628514,
	projector = 82137422954163,
	proportions = 95735787905869,
	puzzle = 94036333231756,
	pyramid = 134832369326112,
	["qr-code"] = 115947204757344,
	quote = 102055887623346,
	rabbit = 131189288131840,
	radar = 77840020129555,
	radiation = 100120053411692,
	radical = 83794585544135,
	radio = 96448232078753,
	["radio-receiver"] = 115849531523249,
	["radio-tower"] = 123806688762520,
	radius = 121971099119676,
	["rail-symbol"] = 114970540339018,
	rainbow = 93078612490453,
	rat = 79141000137786,
	ratio = 74750864366592,
	receipt = 76330670769012,
	["receipt-cent"] = 131615440184048,
	["receipt-euro"] = 70850947232799,
	["receipt-indian-rupee"] = 84786980270142,
	["receipt-japanese-yen"] = 82207509366200,
	["receipt-pound-sterling"] = 71719348386314,
	["receipt-russian-ruble"] = 81492439455331,
	["receipt-swiss-franc"] = 79810601551246,
	["receipt-text"] = 88438942017408,
	["receipt-turkish-lira"] = 86570860820726,
	["rectangle-circle"] = 85507321361461,
	["rectangle-ellipsis"] = 127439030387481,
	["rectangle-goggles"] = 118679920384510,
	["rectangle-horizontal"] = 71430723037696,
	["rectangle-vertical"] = 72311863384941,
	recycle = 113191864541329,
	redo = 121875341327093,
	["redo-2"] = 138576248818175,
	["redo-dot"] = 117514482954867,
	["refresh-ccw"] = 86267075959666,
	["refresh-ccw-dot"] = 119023527726959,
	["refresh-cw"] = 76845925482586,
	["refresh-cw-off"] = 129981583943775,
	refrigerator = 86690334895832,
	regex = 79467153526782,
	["remove-formatting"] = 100639728039833,
	["repeat"] = 140407645345286,
	["repeat-1"] = 138579844223208,
	["repeat-2"] = 81045504832502,
	replace = 90341483418707,
	["replace-all"] = 76323102138169,
	reply = 138678897436694,
	["reply-all"] = 118380589053924,
	rewind = 124642191767611,
	ribbon = 79206292377631,
	rocket = 79846157539863,
	["rocking-chair"] = 135381220274271,
	["roller-coaster"] = 135317411701728,
	["rotate-3d"] = 136846515530149,
	["rotate-ccw"] = 103593823592882,
	["rotate-ccw-key"] = 72108307437441,
	["rotate-ccw-square"] = 102805428127392,
	["rotate-cw"] = 92926614772014,
	["rotate-cw-square"] = 94393061569190,
	route = 90844221445155,
	["route-off"] = 85315637775689,
	router = 130572058656931,
	["rows-2"] = 140376315766404,
	["rows-3"] = 70922215029935,
	["rows-4"] = 82310713996487,
	rss = 74657652878902,
	ruler = 81932543667472,
	["ruler-dimension-line"] = 116926583536145,
	["russian-ruble"] = 108882947390227,
	sailboat = 138278085859398,
	salad = 97083943538056,
	sandwich = 84512118570250,
	satellite = 90379425147438,
	["satellite-dish"] = 139162594956306,
	["saudi-riyal"] = 111230712493826,
	save = 126786081818943,
	["save-all"] = 132114356737462,
	["save-off"] = 103052152978546,
	scale = 119160471592362,
	["scale-3d"] = 93309101177595,
	scaling = 72422884764012,
	scan = 85082632913446,
	["scan-barcode"] = 71220109533744,
	["scan-eye"] = 97734789454128,
	["scan-face"] = 112627054869699,
	["scan-heart"] = 126892182652292,
	["scan-line"] = 125356770699594,
	["scan-qr-code"] = 129609805395670,
	["scan-search"] = 123647342231468,
	["scan-text"] = 82686374141174,
	school = 82511976287252,
	scissors = 73848300538397,
	["scissors-line-dashed"] = 102508082248814,
	["screen-share"] = 106412780353220,
	["screen-share-off"] = 101801998485496,
	scroll = 125776467998184,
	["scroll-text"] = 86918746287564,
	search = 125618569555993,
	["search-check"] = 102448639481709,
	["search-code"] = 107490113587580,
	["search-slash"] = 140195845290995,
	["search-x"] = 76625315572908,
	section = 132412965594548,
	send = 120131238507529,
	["send-horizontal"] = 127567207232610,
	["send-to-back"] = 105100147812939,
	["separator-horizontal"] = 136326354982755,
	["separator-vertical"] = 81032704114272,
	server = 72203285684743,
	["server-cog"] = 80743099902491,
	["server-crash"] = 104218894040999,
	["server-off"] = 95557390125060,
	settings = 101463883805422,
	["settings-2"] = 75339943202126,
	shapes = 94522066975471,
	share = 117401968838172,
	["share-2"] = 128552309636290,
	sheet = 124970301577850,
	shell = 126582315829979,
	shield = 84528813312016,
	["shield-alert"] = 92505396627173,
	["shield-ban"] = 102215491431686,
	["shield-check"] = 83449656859552,
	["shield-ellipsis"] = 93186850567552,
	["shield-half"] = 127055700945681,
	["shield-minus"] = 130374791120900,
	["shield-off"] = 132566117165802,
	["shield-plus"] = 83455402777739,
	["shield-question-mark"] = 128418825650056,
	["shield-user"] = 99618574383264,
	["shield-x"] = 89958978888777,
	ship = 119708468740563,
	["ship-wheel"] = 100264434901423,
	shirt = 100263550622526,
	["shopping-bag"] = 128835919419658,
	["shopping-basket"] = 139164114183615,
	["shopping-cart"] = 74658309187754,
	shovel = 93002580942748,
	["shower-head"] = 73619400343212,
	shredder = 138895317439043,
	shrimp = 116646646308539,
	shrink = 88836419137438,
	shrub = 76988369043032,
	shuffle = 119271040819486,
	sigma = 95577381168467,
	signal = 86317434523846,
	["signal-high"] = 71259263664875,
	["signal-low"] = 131288244120038,
	["signal-medium"] = 100328562267364,
	["signal-zero"] = 129038651813632,
	signature = 109457267964186,
	signpost = 72013144690387,
	["signpost-big"] = 101768854635202,
	siren = 135315463281920,
	["skip-back"] = 100366953633482,
	["skip-forward"] = 96350165788710,
	skull = 89401908547230,
	slack = 103734185902703,
	slash = 80289381134111,
	slice = 110909868827850,
	["sliders-horizontal"] = 104021219611587,
	["sliders-vertical"] = 105544572196049,
	smartphone = 109476896891915,
	["smartphone-charging"] = 94398441643045,
	["smartphone-nfc"] = 108057157032168,
	smile = 72681486741811,
	["smile-plus"] = 74596726382029,
	snail = 112699295253268,
	snowflake = 82505048791925,
	["soap-dispenser-droplet"] = 117335418112713,
	sofa = 80126963498533,
	soup = 104459318914683,
	space = 124217116768896,
	spade = 76967916150583,
	sparkle = 126477294768200,
	sparkles = 130602425201313,
	speaker = 138304808385322,
	speech = 137983960166079,
	["spell-check"] = 78243940332032,
	["spell-check-2"] = 95385653254823,
	spline = 128106773633629,
	["spline-pointer"] = 123280676328314,
	split = 112314002585584,
	spool = 109278157412120,
	spotlight = 87670272614404,
	["spray-can"] = 121630219787799,
	sprout = 116761478445060,
	square = 96489726265199,
	["square-activity"] = 140333051781567,
	["square-arrow-down"] = 107014673922005,
	["square-arrow-down-left"] = 124277460165719,
	["square-arrow-down-right"] = 73561771563744,
	["square-arrow-left"] = 140645828577303,
	["square-arrow-out-down-left"] = 89110471358870,
	["square-arrow-out-down-right"] = 79224964686159,
	["square-arrow-out-up-left"] = 139915836525364,
	["square-arrow-out-up-right"] = 75394510228384,
	["square-arrow-right"] = 137883327825941,
	["square-arrow-up"] = 86704051916529,
	["square-arrow-up-left"] = 72035481166850,
	["square-arrow-up-right"] = 103199082180609,
	["square-asterisk"] = 91331591548413,
	["square-bottom-dashed-scissors"] = 72833822818441,
	["square-chart-gantt"] = 118014434980199,
	["square-check"] = 131281718379727,
	["square-check-big"] = 93336092924352,
	["square-chevron-down"] = 131902770547285,
	["square-chevron-left"] = 127087352857648,
	["square-chevron-right"] = 83652669185775,
	["square-chevron-up"] = 72583133755831,
	["square-code"] = 124986136764997,
	["square-dashed"] = 79183888005672,
	["square-dashed-bottom"] = 89157701577789,
	["square-dashed-bottom-code"] = 116292194698799,
	["square-dashed-kanban"] = 121007350604616,
	["square-dashed-mouse-pointer"] = 130924289391684,
	["square-dashed-top-solid"] = 124416825207572,
	["square-divide"] = 137218625315282,
	["square-dot"] = 117976103587060,
	["square-equal"] = 121507447179718,
	["square-function"] = 86203774968018,
	["square-kanban"] = 93286950307565,
	["square-library"] = 117062543132766,
	["square-m"] = 115722178058159,
	["square-menu"] = 81614384000771,
	["square-minus"] = 71839009603427,
	["square-mouse-pointer"] = 93614884809738,
	["square-parking"] = 129799277887252,
	["square-parking-off"] = 73561529934834,
	["square-pause"] = 126984552711307,
	["square-pen"] = 94523918453624,
	["square-percent"] = 127625721826020,
	["square-pi"] = 110661345713027,
	["square-pilcrow"] = 79387020279550,
	["square-play"] = 109792454183012,
	["square-plus"] = 73228825720276,
	["square-power"] = 110236577492349,
	["square-radical"] = 138382976817926,
	["square-round-corner"] = 117707560364355,
	["square-scissors"] = 75179246281400,
	["square-sigma"] = 131506090287142,
	["square-slash"] = 112196704068674,
	["square-split-horizontal"] = 97627785389902,
	["square-split-vertical"] = 106959144758418,
	["square-square"] = 80835095859324,
	["square-stack"] = 124304690179249,
	["square-star"] = 115056433115255,
	["square-stop"] = 111768891575856,
	["square-terminal"] = 93337999108432,
	["square-user"] = 72248743154708,
	["square-user-round"] = 135580858593151,
	["square-x"] = 107073482662073,
	["squares-exclude"] = 73691835285197,
	["squares-intersect"] = 96924928301087,
	["squares-subtract"] = 87554296790348,
	["squares-unite"] = 122198623051662,
	squircle = 82987060321691,
	["squircle-dashed"] = 118443285499033,
	squirrel = 73560557505029,
	stamp = 121319474186232,
	star = 127746172798481,
	["star-half"] = 131968454447228,
	["star-off"] = 72177495447859,
	["step-back"] = 85492554496339,
	["step-forward"] = 113928948415823,
	stethoscope = 105982582717298,
	sticker = 127276314334483,
	["sticky-note"] = 112097020099499,
	store = 133824185120097,
	["stretch-horizontal"] = 132144609663362,
	["stretch-vertical"] = 75386274307446,
	strikethrough = 83947301832572,
	subscript = 113391516050262,
	sun = 79901529465096,
	["sun-dim"] = 104619182730276,
	["sun-medium"] = 91618371923097,
	["sun-moon"] = 79929011380037,
	["sun-snow"] = 137414435824708,
	sunrise = 135585238325032,
	sunset = 73712698016360,
	superscript = 72669097231454,
	["swatch-book"] = 128454451162104,
	["swiss-franc"] = 136694453759982,
	["switch-camera"] = 140606464585502,
	sword = 75020726675544,
	swords = 89815227241465,
	syringe = 78733573607159,
	table = 86743029152675,
	["table-2"] = 124462232337013,
	["table-cells-merge"] = 103787916007071,
	["table-cells-split"] = 137584996978518,
	["table-columns-split"] = 112532547114237,
	["table-of-contents"] = 123289010637455,
	["table-properties"] = 106533508299112,
	["table-rows-split"] = 80913015124376,
	tablet = 98236546892857,
	["tablet-smartphone"] = 82512006965851,
	tablets = 118977326005264,
	tag = 103234399652910,
	tags = 102666304482309,
	["tally-1"] = 110936672654832,
	["tally-2"] = 94187147342756,
	["tally-3"] = 124913781937253,
	["tally-4"] = 92590022818947,
	["tally-5"] = 138114201809681,
	tangent = 115243287449073,
	target = 81035867308138,
	telescope = 111810481539512,
	tent = 135834669198083,
	["tent-tree"] = 78356729712249,
	terminal = 73413798937791,
	["test-tube"] = 108565640789121,
	["test-tube-diagonal"] = 111814426284329,
	["test-tubes"] = 84207634752507,
	text = 92542971051973,
	["text-cursor"] = 71303185547080,
	["text-cursor-input"] = 81578218115202,
	["text-quote"] = 103419429142075,
	["text-search"] = 119231709110976,
	["text-select"] = 107531686199786,
	theater = 83268813741529,
	thermometer = 105535887519165,
	["thermometer-snowflake"] = 129660993200918,
	["thermometer-sun"] = 72570194548829,
	["thumbs-down"] = 105602592815443,
	["thumbs-up"] = 72411375022432,
	ticket = 104336783939037,
	["ticket-check"] = 125662376066034,
	["ticket-minus"] = 125106761208017,
	["ticket-percent"] = 73387393631130,
	["ticket-plus"] = 91987299109025,
	["ticket-slash"] = 88947231854573,
	["ticket-x"] = 120285559163949,
	tickets = 128293616470608,
	["tickets-plane"] = 110636990485048,
	timer = 96119720980390,
	["timer-off"] = 73592886882763,
	["timer-reset"] = 115263131999748,
	["toggle-left"] = 126278872210073,
	["toggle-right"] = 135316241551499,
	toilet = 82858381666593,
	["tool-case"] = 133216548079593,
	tornado = 119132390241284,
	torus = 135140424211153,
	touchpad = 111708702894486,
	["touchpad-off"] = 111996914034893,
	["tower-control"] = 132285132951711,
	["toy-brick"] = 91649902772315,
	tractor = 97620732372191,
	["traffic-cone"] = 139621281679882,
	["train-front"] = 98677382842804,
	["train-front-tunnel"] = 114866528676443,
	["train-track"] = 120194201330757,
	["tram-front"] = 91307750164226,
	transgender = 111481765827654,
	trash = 116863849368916,
	["trash-2"] = 79564839810840,
	["tree-deciduous"] = 131205325166458,
	["tree-palm"] = 128164120447244,
	["tree-pine"] = 90774792597002,
	trees = 98571299046731,
	trello = 107898356259657,
	["trending-down"] = 117917602459815,
	["trending-up"] = 116886197130999,
	["trending-up-down"] = 103717610858616,
	triangle = 107100599170044,
	["triangle-alert"] = 76712741040235,
	["triangle-dashed"] = 84136951328014,
	["triangle-right"] = 97661263578338,
	trophy = 99468111768746,
	truck = 102380610139245,
	["truck-electric"] = 107501288276081,
	["turkish-lira"] = 98366519784263,
	turntable = 129425246442560,
	turtle = 124788802294981,
	tv = 91976706623107,
	["tv-minimal"] = 102675516773869,
	["tv-minimal-play"] = 133814752541561,
	twitch = 78418686039425,
	type = 123010942632689,
	["type-outline"] = 75596975306451,
	umbrella = 130176200284323,
	["umbrella-off"] = 123696654720209,
	underline = 86005310176484,
	undo = 98677000788509,
	["undo-2"] = 123288184651876,
	["undo-dot"] = 97048183118444,
	["unfold-horizontal"] = 102321820508665,
	["unfold-vertical"] = 110395906345252,
	ungroup = 116761886838866,
	university = 105398737245802,
	unlink = 114774779025598,
	["unlink-2"] = 84980216310960,
	unplug = 71213047838603,
	upload = 84448595764921,
	usb = 122244624865802,
	user = 81899856845503,
	["user-check"] = 124183127537182,
	["user-cog"] = 132530394308182,
	["user-lock"] = 102304427888373,
	["user-minus"] = 139212780407738,
	["user-pen"] = 109063575712204,
	["user-plus"] = 73169931625061,
	["user-round"] = 122472562648438,
	["user-round-check"] = 116820685971606,
	["user-round-cog"] = 81932262543896,
	["user-round-minus"] = 131104410574220,
	["user-round-pen"] = 88582957358214,
	["user-round-plus"] = 72756692986447,
	["user-round-search"] = 121920726195803,
	["user-round-x"] = 133496165281802,
	["user-search"] = 91526614931270,
	["user-star"] = 104674549336879,
	["user-x"] = 83017534068566,
	users = 109023655602096,
	["users-round"] = 73720692207232,
	utensils = 92328553872866,
	["utensils-crossed"] = 115379488607669,
	["utility-pole"] = 78544397723455,
	variable = 108495567404232,
	vault = 125730392773824,
	["vector-square"] = 120085753224630,
	vegan = 133693714976186,
	["venetian-mask"] = 73997918289433,
	venus = 77091339518872,
	["venus-and-mars"] = 85333806376716,
	vibrate = 94421703759873,
	["vibrate-off"] = 104055297186916,
	video = 120899025417114,
	["video-off"] = 98571437579498,
	videotape = 110595652490996,
	view = 96170375252355,
	voicemail = 129863571214632,
	volleyball = 79983513397509,
	volume = 136944486138432,
	["volume-1"] = 76450166585050,
	["volume-2"] = 127590428470553,
	["volume-off"] = 76437794585400,
	["volume-x"] = 102557100794756,
	vote = 111127508049086,
	wallet = 82693664006746,
	["wallet-cards"] = 131093307699863,
	["wallet-minimal"] = 104760648200766,
	wallpaper = 127531571966115,
	wand = 100247093544676,
	["wand-sparkles"] = 109636225248973,
	warehouse = 117043792208242,
	["washing-machine"] = 124299191442908,
	watch = 96632122742030,
	waves = 132537108109414,
	["waves-ladder"] = 130770635115623,
	waypoints = 89579429286632,
	webcam = 99543028331067,
	webhook = 127494549649286,
	["webhook-off"] = 94143246779298,
	weight = 70452176653194,
	wheat = 72827060603331,
	["wheat-off"] = 133950070398243,
	["whole-word"] = 83053413552620,
	wifi = 101360393607039,
	["wifi-cog"] = 86268760919032,
	["wifi-high"] = 139565602232260,
	["wifi-low"] = 129432377919005,
	["wifi-off"] = 128431848377922,
	["wifi-pen"] = 109435800293522,
	["wifi-sync"] = 134593311559828,
	["wifi-zero"] = 132143289837251,
	wind = 73952787381292,
	["wind-arrow-down"] = 107113727390188,
	workflow = 125401528378697,
	worm = 110566866003503,
	["wrap-text"] = 118921109568806,
	wrench = 108764185264619,
	x = 73070135088117,
	youtube = 100529433894693,
	zap = 99546940565021,
	["zap-off"] = 112636243101847,
	["zoom-in"] = 132256802524814,
	["zoom-out"] = 109610457179810,
	["beer-off"] = 138037951949066,
	["beer"] = 120586510698080,
	["bottle-wine"] = 93707442058849,
	["cannabis"] = 130136923421319,
	["chart-network"] = 116749958806877,
	["cigarrete-off"] = 85361164732665,
	["cigarette"] = 78543658965377,
	["indian-rupee"] = 139912038918762,
	["twitter"] = 83698772731875,
	["wine-off"] = 128440413658301,
	["wine"] = 73532622126175,
}
HexoraUI.IconSets.lucide = BuiltinLucideIcons


local BuiltinMaterialIcons = {
	["perm_media"] = 6031215982;
	["sticky_note_2"] = 6031265972;
	["gavel"] = 6023565902;
	["table_view"] = 6031233835;
	["home"] = 6026568195;
	["list"] = 6026568229;
	["alarm_add"] = 6023426898;
	["speaker_notes"] = 6031266001;
	["check_circle_outline"] = 6023426909;
	["extension"] = 6023565892;
	["pending"] = 6031084745;
	["pageview"] = 6031216007;
	["group_work"] = 6023565910;
	["zoom_in"] = 6031075573;
	["aspect_ratio"] = 6022668895;
	["code"] = 6022668955;
	["3d_rotation"] = 6022668893;
	["translate"] = 6031225812;
	["star_rate"] = 6031265978;
	["system_update_alt"] = 6031251515;
	["open_with"] = 6026568265;
	["build_circle"] = 6023426952;
	["toc"] = 6031229341;
	["settings_phone"] = 6031289445;
	["open_in_full"] = 6026568245;
	["history"] = 6026568197;
	["accessibility_new"] = 6022668945;
	["hourglass_disabled"] = 6026568193;
	["line_style"] = 6026568276;
	["account_circle"] = 6022668898;
	["settings_cell"] = 6031280890;
	["search_off"] = 6031260783;
	["shop"] = 6031265983;
	["anchor"] = 6023426906;
	["language"] = 6026568213;
	["settings_brightness"] = 6031280902;
	["restore_page"] = 6031154877;
	["chrome_reader_mode"] = 6023426912;
	["sync_alt"] = 6031233840;
	["book"] = 6022860343;
	["smart_button"] = 6031265962;
	["request_page"] = 6031154873;
	["lock_clock"] = 6026568260;
	["android"] = 6022668966;
	["outgoing_mail"] = 6026568242;
	["dynamic_form"] = 6023426970;
	["track_changes"] = 6031225814;
	["source"] = 6031289451;
	["thumb_down"] = 6031229336;
	["integration_instructions"] = 6026568214;
	["opacity"] = 6026568295;
	["perm_identity"] = 6031215978;
	["view_module"] = 6031079152;
	["perm_data_setting"] = 6031215991;
	["assignment_turned_in"] = 6023426904;
	["change_history"] = 6023426914;
	["thumb_down_off_alt"] = 6031229354;
	["text_rotation_angledown"] = 6031251513;
	["bookmark"] = 6022852108;
	["view_stream"] = 6031079164;
	["remove_done"] = 6031086169;
	["markunread_mailbox"] = 6031082531;
	["store"] = 6031265968;
	["text_rotation_angleup"] = 6031229337;
	["eco"] = 6023426988;
	["find_in_page"] = 6023426986;
	["api"] = 6022668911;
	["launch"] = 6026568211;
	["text_rotation_down"] = 6031229334;
	["flip_to_back"] = 6023565896;
	["contact_page"] = 6022668881;
	["preview"] = 6031260793;
	["restore"] = 6031260800;
	["favorite_border"] = 6023565882;
	["assignment_late"] = 6022668880;
	["youtube_searched_for"] = 6031075934;
	["hourglass_full"] = 6026568190;
	["timeline"] = 6031229350;
	["turned_in"] = 6031225808;
	["info"] = 6026568227;
	["restore_from_trash"] = 6031154869;
	["arrow_circle_down"] = 6022668877;
	["flaky"] = 6031082523;
	["alarm_on"] = 6023426920;
	["swap_vertical_circle"] = 6031233839;
	["open_in_new"] = 6026568256;
	["watch_later"] = 6031075924;
	["alarm_off"] = 6023426901;
	["maximize"] = 6026568267;
	["lock_outline"] = 6031082533;
	["outbond"] = 6026568244;
	["view_carousel"] = 6031251507;
	["published_with_changes"] = 6031243328;
	["verified_user"] = 6031225819;
	["drag_indicator"] = 6023426962;
	["lightbulb_outline"] = 6026568254;
	["segment"] = 6031260773;
	["assignment"] = 6022668882;
	["work_outline"] = 6031075930;
	["line_weight"] = 6026568226;
	["dangerous"] = 6022668916;
	["assessment"] = 6022668897;
	["view_day"] = 6031079153;
	["help_center"] = 6026568192;
	["logout"] = 6031082522;
	["event"] = 6023426959;
	["get_app"] = 6023565889;
	["tab"] = 6031233851;
	["label"] = 6031082525;
	["g_translate"] = 6031082526;
	["view_week"] = 6031079154;
	["view_in_ar"] = 6031079158;
	["card_travel"] = 6023426925;
	["lock_open"] = 6026568220;
	["voice_over_off"] = 6031075927;
	["app_blocking"] = 6022668952;
	["settings_ethernet"] = 6031280883;
	["supervised_user_circle"] = 6031289449;
	["done_all"] = 6023426929;
	["lightbulb"] = 6026568247;
	["find_replace"] = 6023426979;
	["bookmarks"] = 6023426924;
	["today"] = 6031229352;
	["class"] = 6022668949;
	["supervisor_account"] = 6031251516;
	["support"] = 6031251532;
	["done_outline"] = 6023426936;
	["reorder"] = 6031154868;
	["fact_check"] = 6023426951;
	["thumb_up"] = 6031229347;
	["assignment_returned"] = 6023426899;
	["card_giftcard"] = 6023426978;
	["trending_down"] = 6031225811;
	["settings_backup_restore"] = 6031280886;
	["settings_voice"] = 6031265966;
	["dns"] = 6023426958;
	["perm_scan_wifi"] = 6031215985;
	["plagiarism"] = 6031243320;
	["commute"] = 6022668901;
	["gif"] = 6031082540;
	["work"] = 6031075939;
	["picture_in_picture_alt"] = 6031215979;
	["query_builder"] = 6031086183;
	["label_off"] = 6026568209;
	["all_out"] = 6022668876;
	["article"] = 6022668907;
	["shopping_basket"] = 6031265997;
	["mark_as_unread"] = 6026568223;
	["work_off"] = 6031075937;
	["delete_outline"] = 6022668962;
	["account_box"] = 6023426915;
	["home_filled"] = 9080449299;
	["lock"] = 6026568224;
	["perm_device_information"] = 6031215996;
	["add_task"] = 6022668912;
	["text_rotate_up"] = 6031251526;
	["swipe"] = 6031233863;
	["eject"] = 6023426930;
	["mediation"] = 6026568249;
	["label_important_outline"] = 6026568199;
	["settings_remote"] = 6031289442;
	["history_toggle_off"] = 6026568196;
	["invert_colors"] = 6026568253;
	["visibility_off"] = 6031075929;
	["addchart"] = 6023426905;
	["cancel_schedule_send"] = 6022668963;
	["loyalty"] = 6026568237;
	["speaker_notes_off"] = 6031265965;
	["online_prediction"] = 6026568239;
	["remove_shopping_cart"] = 6031260778;
	["text_rotate_vertical"] = 6031251518;
	["visibility"] = 6031075931;
	["add_to_drive"] = 6022860335;
	["accessible"] = 6022668902;
	["bookmark_border"] = 6022860339;
	["tour"] = 6031229362;
	["compare_arrows"] = 6022668951;
	["view_sidebar"] = 6031079160;
	["face"] = 6023426944;
	["wysiwyg"] = 6031075938;
	["camera_enhance"] = 6023426935;
	["perm_camera_mic"] = 6031215983;
	["model_training"] = 6026568222;
	["arrow_circle_up"] = 6022668934;
	["euro_symbol"] = 6023426954;
	["pending_actions"] = 6031260777;
	["not_accessible"] = 6026568269;
	["explore_off"] = 6023426953;
	["build"] = 6023426938;
	["backup"] = 6023426911;
	["settings_input_antenna"] = 6031280891;
	["disabled_by_default"] = 6023426939;
	["upgrade"] = 6031225815;
	["contactless"] = 6022668886;
	["trending_flat"] = 6031225818;
	["schedule"] = 6031260808;
	["offline_pin"] = 6031084770;
	["date_range"] = 6022668894;
	["flight_land"] = 6023565897;
	["view_headline"] = 6031079151;
	["cached"] = 6023426921;
	["unpublished"] = 6031225817;
	["outlet"] = 6031084748;
	["favorite"] = 6023426974;
	["vertical_split"] = 6031225820;
	["report_problem"] = 6031086176;
	["fingerprint"] = 6023565895;
	["important_devices"] = 6026568202;
	["outbox"] = 6026568263;
	["all_inbox"] = 6022668909;
	["label_important"] = 6026568215;
	["print"] = 6031243324;
	["settings_bluetooth"] = 6031280905;
	["power_settings_new"] = 6031260781;
	["zoom_out"] = 6031075577;
	["stars"] = 6031265971;
	["offline_bolt"] = 6031084742;
	["feedback"] = 6023426957;
	["accessibility"] = 6022668887;
	["announcement"] = 6022668946;
	["settings_input_hdmi"] = 6031280970;
	["leaderboard"] = 6026568216;
	["view_quilt"] = 6031079155;
	["note_add"] = 6031084749;
	["theaters"] = 6031229335;
	["alarm"] = 6023426910;
	["settings_input_composite"] = 6031280896;
	["grade"] = 6026568189;
	["tab_unselected"] = 6031251505;
	["swap_vert"] = 6031233847;
	["assignment_return"] = 6023426931;
	["highlight_alt"] = 6023565913;
	["shopping_bag"] = 6031265970;
	["contact_support"] = 6022668879;
	["flip_to_front"] = 6023565894;
	["touch_app"] = 6031229361;
	["room"] = 6031154875;
	["send_and_archive"] = 6031280889;
	["view_array"] = 6031225842;
	["settings_power"] = 6031289446;
	["admin_panel_settings"] = 6022668961;
	["open_in_browser"] = 6026568266;
	["card_membership"] = 6023426942;
	["rule"] = 6031154859;
	["schedule_send"] = 6031154866;
	["calendar_today"] = 6022668917;
	["info_outline"] = 6026568210;
	["description"] = 6022668888;
	["dashboard_customize"] = 6022668899;
	["rowing"] = 6031154857;
	["swap_horizontal_circle"] = 6031233833;
	["account_balance_wallet"] = 6022668892;
	["view_agenda"] = 6031225831;
	["shop_two"] = 6031289461;
	["done"] = 6023426926;
	["circle_notifications"] = 6023426923;
	["compress"] = 6022668878;
	["calendar_view_day"] = 6023426946;
	["thumbs_up_down"] = 6031229373;
	["account_balance"] = 6022668900;
	["play_for_work"] = 6031260776;
	["pets"] = 6031260782;
	["view_column"] = 6031079172;
	["search"] = 6031154871;
	["autorenew"] = 6023565901;
	["copyright"] = 6023565898;
	["privacy_tip"] = 6031260784;
	["arrow_right_alt"] = 6022668890;
	["delete"] = 6022668885;
	["nightlight_round"] = 6031084743;
	["batch_prediction"] = 6022860334;
	["shopping_cart"] = 6031265976;
	["login"] = 6031082527;
	["settings_input_svideo"] = 6031289444;
	["payment"] = 6031084751;
	["update"] = 6031225810;
	["text_rotation_none"] = 6031229344;
	["perm_contact_calendar"] = 6031215990;
	["explore"] = 6023426941;
	["delete_forever"] = 6022668939;
	["rounded_corner"] = 6031154861;
	["book_online"] = 6022860332;
	["quickreply"] = 6031243319;
	["bug_report"] = 6022852107;
	["subtitles_off"] = 6031289466;
	["close_fullscreen"] = 6023426928;
	["horizontal_split"] = 6026568194;
	["minimize"] = 6026568240;
	["filter_list_alt"] = 6023426955;
	["add_shopping_cart"] = 6022668875;
	["next_plan"] = 6026568231;
	["view_list"] = 6031079156;
	["receipt"] = 6031086173;
	["polymer"] = 6031260785;
	["spellcheck"] = 6031289450;
	["wifi_protected_setup"] = 6031075926;
	["label_outline"] = 6026568207;
	["highlight_off"] = 6023565916;
	["turned_in_not"] = 6031225806;
	["edit_off"] = 6023426983;
	["question_answer"] = 6031086172;
	["settings_overscan"] = 6031289459;
	["trending_up"] = 6031225816;
	["verified"] = 6031225809;
	["flight_takeoff"] = 6023565891;
	["grading"] = 6026568191;
	["dashboard"] = 6022668883;
	["expand"] = 6022668891;
	["backup_table"] = 6022860338;
	["analytics"] = 6022668884;
	["picture_in_picture"] = 6031215994;
	["settings"] = 6031280882;
	["accessible_forward"] = 6022668906;
	["pan_tool"] = 6031084771;
	["https"] = 6026568200;
	["filter_alt"] = 6023426984;
	["thumb_up_off_alt"] = 6031229342;
	["record_voice_over"] = 6031243318;
	["help_outline"] = 6026568201;
	["check_circle"] = 6023426945;
	["comment_bank"] = 6023426937;
	["perm_phone_msg"] = 6031215986;
	["settings_applications"] = 6031280894;
	["exit_to_app"] = 6023426922;
	["saved_search"] = 6031154867;
	["toll"] = 6031229343;
	["not_started"] = 6026568232;
	["subject"] = 6031289452;
	["redeem"] = 6031086170;
	["input"] = 6026568225;
	["settings_input_component"] = 6031280884;
	["assignment_ind"] = 6022668935;
	["swap_horiz"] = 6031233841;
	["fullscreen"] = 6031094681;
	["cancel"] = 6031094677;
	["subdirectory_arrow_left"] = 6031104654;
	["close"] = 6031094678;
	["arrow_back_ios"] = 6031091003;
	["east"] = 6031094675;
	["unfold_more"] = 6031104644;
	["south"] = 6031104646;
	["arrow_drop_up"] = 6031090990;
	["arrow_back"] = 6031091000;
	["arrow_downward"] = 6031090991;
	["west"] = 6031104677;
	["legend_toggle"] = 6031097233;
	["fullscreen_exit"] = 6031094691;
	["last_page"] = 6031094686;
	["switch_right"] = 6031104649;
	["check"] = 6031094667;
	["home_work"] = 6031094683;
	["north_east"] = 6031097228;
	["double_arrow"] = 6031094674;
	["more_vert"] = 6031104648;
	["chevron_left"] = 6031094670;
	["more_horiz"] = 6031104650;
	["unfold_less"] = 6031104681;
	["first_page"] = 6031094682;
	["payments"] = 6031097227;
	["arrow_right"] = 6031090994;
	["offline_share"] = 6031097267;
	["south_west"] = 6031104652;
	["expand_less"] = 6031094679;
	["south_east"] = 6031104642;
	["assistant_navigation"] = 6031091006;
	["apps"] = 6031090999;
	["arrow_upward"] = 6031090997;
	["app_settings_alt"] = 6031090998;
	["subdirectory_arrow_right"] = 6031104647;
	["north_west"] = 6031104630;
	["switch_left"] = 6031104651;
	["chevron_right"] = 6031094680;
	["arrow_forward"] = 6031090995;
	["arrow_forward_ios"] = 6031091008;
	["arrow_drop_down"] = 6031091004;
	["refresh"] = 6031097226;
	["pivot_table_chart"] = 6031097234;
	["expand_more"] = 6031094687;
	["campaign"] = 6031094666;
	["arrow_left"] = 6031091002;
	["arrow_drop_down_circle"] = 6031091001;
	["menu_open"] = 6031097229;
	["waterfall_chart"] = 6031104632;
	["assistant_direction"] = 6031091005;
	["menu"] = 6031097225;
	["personal_video"] = 6034457070;
	["power_off"] = 6034457087;
	["wifi_off"] = 6034461625;
	["adb"] = 6034418515;
	["airline_seat_recline_normal"] = 6034418512;
	["sync_problem"] = 6034452653;
	["network_check"] = 6034461631;
	["event_busy"] = 6034439634;
	["airline_seat_flat"] = 6034418511;
	["disc_full"] = 6034418518;
	["sd_card"] = 6034457089;
	["time_to_leave"] = 6034452660;
	["phone_bluetooth_speaker"] = 6034457057;
	["phone_paused"] = 6034457066;
	["phone_locked"] = 6034457058;
	["more"] = 6034461627;
	["add_call"] = 6034418524;
	["account_tree"] = 6034418507;
	["do_not_disturb_on"] = 6034439649;
	["event_note"] = 6034439637;
	["sync_disabled"] = 6034452649;
	["mms"] = 6034461621;
	["airline_seat_flat_angled"] = 6034418513;
	["bluetooth_audio"] = 6034418522;
	["vibration"] = 6034452651;
	["system_update"] = 6034452663;
	["enhanced_encryption"] = 6034439652;
	["wc"] = 6034452643;
	["live_tv"] = 6034439648;
	["folder_special"] = 6034439639;
	["phone_missed"] = 6034457056;
	["airline_seat_recline_extra"] = 6034418528;
	["sms"] = 6034452645;
	["tap_and_play"] = 6034452650;
	["confirmation_number"] = 6034418519;
	["event_available"] = 6034439643;
	["sms_failed"] = 6034452676;
	["do_not_disturb_alt"] = 6034461619;
	["do_not_disturb"] = 6034439645;
	["ondemand_video"] = 6034457065;
	["no_encryption"] = 6034457059;
	["airline_seat_legroom_extra"] = 6034418508;
	["tv_off"] = 6034452646;
	["sim_card_alert"] = 6034452641;
	["airline_seat_legroom_normal"] = 6034418532;
	["wifi"] = 6034461626;
	["do_not_disturb_off"] = 6034439642;
	["imagesearch_roller"] = 6034439635;
	["power"] = 6034457105;
	["airline_seat_legroom_reduced"] = 6034418520;
	["phone_in_talk"] = 6034457067;
	["airline_seat_individual_suite"] = 6034418514;
	["priority_high"] = 6034457092;
	["phone_callback"] = 6034457104;
	["phone_forwarded"] = 6034457106;
	["sync"] = 6034452662;
	["vpn_lock"] = 6034452648;
	["support_agent"] = 6034452656;
	["network_locked"] = 6034457064;
	["directions_off"] = 6034418517;
	["drive_eta"] = 6034464371;
	["sensor_window"] = 6031067242;
	["sensor_door"] = 6031067241;
	["keyboard_return"] = 6034818370;
	["monitor"] = 6034837803;
	["device_hub"] = 6034789877;
	["keyboard"] = 6034818398;
	["keyboard_voice"] = 6034818360;
	["cast"] = 6034789876;
	["developer_board"] = 6034789883;
	["tablet"] = 6034848733;
	["keyboard_hide"] = 6034818386;
	["dock"] = 6034789888;
	["phonelink"] = 6034837801;
	["device_unknown"] = 6034789884;
	["speaker_group"] = 6034848732;
	["desktop_mac"] = 6034789898;
	["point_of_sale"] = 6034837798;
	["memory"] = 6034837807;
	["keyboard_tab"] = 6034818363;
	["router"] = 6034837806;
	["sim_card"] = 6034837800;
	["headset"] = 6034789880;
	["gamepad"] = 6034789879;
	["speaker"] = 6034848746;
	["devices_other"] = 6034789873;
	["laptop"] = 6034818367;
	["scanner"] = 6034837799;
	["tv"] = 6034848740;
	["headset_mic"] = 6034818383;
	["browser_not_supported"] = 6034789875;
	["computer"] = 6034789874;
	["connected_tv"] = 6034789870;
	["phonelink_off"] = 6034837804;
	["headset_off"] = 6034818402;
	["cast_connected"] = 6034789895;
	["watch"] = 6034848747;
	["keyboard_arrow_up"] = 6034818379;
	["keyboard_backspace"] = 6034818381;
	["laptop_chromebook"] = 6034818364;
	["phone_iphone"] = 6034837811;
	["smartphone"] = 6034848731;
	["power_input"] = 6034837794;
	["videogame_asset"] = 6034848748;
	["desktop_windows"] = 6034789893;
	["keyboard_arrow_down"] = 6034818372;
	["laptop_mac"] = 6034837808;
	["laptop_windows"] = 6034837796;
	["keyboard_arrow_right"] = 6034818365;
	["cast_for_education"] = 6034789872;
	["keyboard_capslock"] = 6034818403;
	["toys"] = 6034848752;
	["tablet_android"] = 6034848734;
	["mouse"] = 6034837797;
	["phone_android"] = 6034837793;
	["keyboard_arrow_left"] = 6034818375;
	["security"] = 6034837802;
	["dry_cleaning"] = 6034754456;
	["bakery_dining"] = 6034767610;
	["place"] = 6034503372;
	["run_circle"] = 6034503367;
	["local_post_office"] = 6034513883;
	["takeout_dining"] = 6034467808;
	["nightlife"] = 6034510003;
	["design_services"] = 6034754453;
	["celebration"] = 6034767613;
	["near_me_disabled"] = 6034509988;
	["add_location_alt"] = 6034483678;
	["directions_run"] = 6034754445;
	["local_fire_department"] = 6034684949;
	["add_road"] = 6034483677;
	["my_location"] = 6034509987;
	["dinner_dining"] = 6034754457;
	["local_airport"] = 6034687951;
	["zoom_out_map"] = 6035229856;
	["pin_drop"] = 6034470807;
	["subway"] = 6034467790;
	["electric_moped"] = 6034744027;
	["restaurant_menu"] = 6034503378;
	["local_gas_station"] = 6034684935;
	["local_cafe"] = 6034687954;
	["theater_comedy"] = 6034467796;
	["directions_bus"] = 6034754434;
	["hail"] = 6034744033;
	["satellite"] = 6034503370;
	["local_phone"] = 6034513884;
	["electric_bike"] = 6034744032;
	["local_see"] = 6034513887;
	["transit_enterexit"] = 6034467805;
	["local_convenience_store"] = 6034687956;
	["local_offer"] = 6034513891;
	["electric_car"] = 6034744029;
	["beenhere"] = 6034483675;
	["miscellaneous_services"] = 6034509993;
	["maps_ugc"] = 6034509992;
	["moped"] = 6034509999;
	["medical_services"] = 6034510001;
	["money"] = 6034509997;
	["transfer_within_a_station"] = 6034467809;
	["electrical_services"] = 6034744038;
	["museum"] = 6034510005;
	["add_location"] = 6034483672;
	["layers"] = 6034687957;
	["handyman"] = 6034744057;
	["local_pharmacy"] = 6034513903;
	["electric_rickshaw"] = 6034744043;
	["alt_route"] = 6034483670;
	["no_transfer"] = 6034503363;
	["pedal_bike"] = 6034503374;
	["directions_transit"] = 6034754436;
	["railway_alert"] = 6034470823;
	["local_police"] = 6034513895;
	["directions_car"] = 6034754441;
	["category"] = 6034767621;
	["attractions"] = 6034767620;
	["person_pin_circle"] = 6034503375;
	["cleaning_services"] = 6034767619;
	["terrain"] = 6034467794;
	["no_meals"] = 6034510024;
	["train"] = 6034467803;
	["delivery_dining"] = 6034767644;
	["pest_control"] = 6034470809;
	["directions"] = 6034754449;
	["atm"] = 6034767614;
	["rate_review"] = 6034503385;
	["local_bar"] = 6034687950;
	["local_drink"] = 6034687965;
	["directions_railway"] = 6034754433;
	["person_pin"] = 6034503364;
	["ev_station"] = 6034744037;
	["home_repair_service"] = 6034744064;
	["bus_alert"] = 6034767618;
	["agriculture"] = 6034483674;
	["volunteer_activism"] = 6034467799;
	["breakfast_dining"] = 6034483671;
	["layers_clear"] = 6034687975;
	["plumbing"] = 6034470800;
	["taxi_alert"] = 6034467792;
	["add_business"] = 6034483666;
	["badge"] = 6034767607;
	["edit_attributes"] = 6034754443;
	["directions_walk"] = 6034754448;
	["local_play"] = 6034513889;
	["bike_scooter"] = 6034483669;
	["two_wheeler"] = 6034467795;
	["local_florist"] = 6034684940;
	["local_hotel"] = 6034684939;
	["no_meals_ouline"] = 6034510025;
	["festival"] = 6034744031;
	["local_shipping"] = 6034684926;
	["directions_boat"] = 6034754442;
	["wrong_location"] = 6034467801;
	["restaurant"] = 6034503366;
	["directions_subway"] = 6034754440;
	["not_listed_location"] = 6034503380;
	["electric_scooter"] = 6034744041;
	["ramen_dining"] = 6034503377;
	["edit_road"] = 6034744035;
	["local_printshop"] = 6034513897;
	["map"] = 6034684930;
	["car_rental"] = 6034767641;
	["multiple_stop"] = 6034510026;
	["brunch_dining"] = 6034767611;
	["local_laundry_service"] = 6034684943;
	["set_meal"] = 6034503368;
	["local_car_wash"] = 6034687976;
	["pest_control_rodent"] = 6034470803;
	["local_pizza"] = 6034513885;
	["local_grocery_store"] = 6034684933;
	["traffic"] = 6034467797;
	["departure_board"] = 6034767615;
	["icecream"] = 6034687967;
	["navigation"] = 6034509984;
	["near_me"] = 6034509996;
	["fastfood"] = 6034744034;
	["local_library"] = 6034684931;
	["local_activity"] = 6034687955;
	["local_hospital"] = 6034684956;
	["menu_book"] = 6034509994;
	["directions_bike"] = 6034754459;
	["store_mall_directory"] = 6034470811;
	["trip_origin"] = 6034467804;
	["tram"] = 6034467806;
	["edit_location"] = 6034754439;
	["streetview"] = 6034470805;
	["hvac"] = 6034687960;
	["lunch_dining"] = 6034684928;
	["car_repair"] = 6034767617;
	["compass_calibration"] = 6034767623;
	["360"] = 6034767608;
	["flight"] = 6034744030;
	["local_mall"] = 6034684934;
	["hotel"] = 6034687977;
	["local_parking"] = 6034513893;
	["hardware"] = 6034744036;
	["local_dining"] = 6034687963;
	["park"] = 6034503369;
	["location_pin"] = 6034684937;
	["local_movies"] = 6034684936;
	["local_atm"] = 6034687953;
	["local_taxi"] = 6034684927;
	["brightness_low"] = 6034989542;
	["screen_lock_landscape"] = 6034996700;
	["graphic_eq"] = 6034989551;
	["screen_lock_rotation"] = 6034996710;
	["signal_cellular_4_bar"] = 6035030076;
	["airplanemode_inactive"] = 6034983848;
	["signal_wifi_0_bar"] = 6035030067;
	["battery_full"] = 6034983854;
	["gps_fixed"] = 6034989550;
	["brightness_high"] = 6034989541;
	["ad_units"] = 6034983845;
	["signal_cellular_alt"] = 6035030079;
	["bluetooth_connected"] = 6034983855;
	["wifi_tethering"] = 6035039430;
	["dvr"] = 6034989561;
	["screen_search_desktop"] = 6034996711;
	["network_wifi"] = 6034996712;
	["access_alarms"] = 6034983853;
	["nfc"] = 6034996698;
	["location_disabled"] = 6034996694;
	["signal_wifi_4_bar"] = 6035030077;
	["access_time"] = 6034983856;
	["mobile_off"] = 6034996702;
	["battery_unknown"] = 6034983842;
	["signal_cellular_null"] = 6035030075;
	["bluetooth_disabled"] = 6034989562;
	["developer_mode"] = 6034989549;
	["network_cell"] = 6034996709;
	["sd_storage"] = 6034996719;
	["signal_cellular_no_sim"] = 6035030078;
	["devices"] = 6034989540;
	["screen_rotation"] = 6034996701;
	["device_thermostat"] = 6034989544;
	["signal_wifi_off"] = 6035030074;
	["widgets"] = 6035039429;
	["bluetooth"] = 6034983880;
	["battery_charging_full"] = 6034983849;
	["mobile_friendly"] = 6034996699;
	["signal_cellular_0_bar"] = 6035030072;
	["storage"] = 6035030083;
	["send_to_mobile"] = 6034996697;
	["location_searching"] = 6034996695;
	["brightness_auto"] = 6034989545;
	["wifi_lock"] = 6035039428;
	["gps_not_fixed"] = 6034989547;
	["access_alarm"] = 6034983844;
	["battery_alert"] = 6034983843;
	["signal_cellular_off"] = 6035030084;
	["signal_cellular_connected_no_internet_4"] = 6035229858;
	["gps_off"] = 6034989548;
	["add_alarm"] = 6034983850;
	["brightness_medium"] = 6034989543;
	["usb"] = 6035030080;
	["airplanemode_active"] = 6034983864;
	["reset_tv"] = 6034996696;
	["wallpaper"] = 6035030102;
	["settings_system_daydream"] = 6035030081;
	["bluetooth_searching"] = 6034989553;
	["add_to_home_screen"] = 6034983858;
	["screen_lock_portrait"] = 6034996706;
	["data_usage"] = 6034989568;
	["_auto_delete"] = 6031071068;
	["_error"] = 6031071057;
	["_notification_important"] = 6031071056;
	["_add_alert"] = 6031071067;
	["_warning"] = 6031071053;
	["_error_outline"] = 6031071050;
	["check_box_outline_blank"] = 6031068420;
	["toggle_off"] = 6031068429;
	["indeterminate_check_box"] = 6031068445;
	["radio_button_checked"] = 6031068426;
	["toggle_on"] = 6031068430;
	["check_box"] = 6031068421;
	["radio_button_unchecked"] = 6031068433;
	["star"] = 6031068423;
	["star_border"] = 6031068425;
	["star_half"] = 6031068427;
	["star_outline"] = 6031068428;
	["multiline_chart"] = 6034941721;
	["pie_chart"] = 6034973076;
	["format_line_spacing"] = 6034910905;
	["format_align_left"] = 6034900727;
	["linear_scale"] = 6034941707;
	["insert_photo"] = 6034941703;
	["scatter_plot"] = 6034973094;
	["post_add"] = 6034973083;
	["format_textdirection_r_to_l"] = 6034925623;
	["format_size"] = 6034910908;
	["format_color_fill"] = 6034910903;
	["format_paint"] = 6034925618;
	["format_underlined"] = 6034925627;
	["format_shapes"] = 6034910909;
	["title"] = 6034934042;
	["highlight"] = 6034925617;
	["bar_chart"] = 6034898096;
	["format_indent_increase"] = 6034900724;
	["merge_type"] = 6034941705;
	["bubble_chart"] = 6034925612;
	["publish"] = 6034973085;
	["format_indent_decrease"] = 6034900733;
	["margin"] = 6034941701;
	["table_rows"] = 6034934025;
	["stacked_line_chart"] = 6034934039;
	["border_clear"] = 6034898135;
	["border_color"] = 6034898100;
	["border_inner"] = 6034898131;
	["insert_chart"] = 6034925628;
	["border_top"] = 6034900726;
	["padding"] = 6034973078;
	["border_vertical"] = 6034900725;
	["score"] = 6034934041;
	["border_right"] = 6034898120;
	["add_chart"] = 6034898093;
	["space_bar"] = 6034934037;
	["border_outer"] = 6034898104;
	["mode_comment"] = 6034941700;
	["attach_money"] = 6034898098;
	["drag_handle"] = 6034910907;
	["format_align_right"] = 6034900723;
	["pie_chart_outlined"] = 6034973077;
	["horizontal_rule"] = 6034925610;
	["border_all"] = 6034898101;
	["border_style"] = 6034898097;
	["insert_comment"] = 6034925609;
	["vertical_align_top"] = 6034973080;
	["vertical_align_center"] = 6034934051;
	["format_color_text"] = 6034910910;
	["format_quote"] = 6034925629;
	["height"] = 6034925613;
	["add_comment"] = 6034898128;
	["format_strikethrough"] = 6034910904;
	["strikethrough_s"] = 6034934030;
	["border_left"] = 6034898099;
	["format_list_bulleted"] = 6034925620;
	["format_italic"] = 6034910912;
	["format_list_numbered"] = 6034925622;
	["attach_file"] = 6034898102;
	["wrap_text"] = 6034973118;
	["insert_invitation"] = 6034973091;
	["format_list_numbered_rtl"] = 6034910906;
	["border_horizontal"] = 6034898105;
	["format_align_center"] = 6034900718;
	["format_textdirection_l_to_r"] = 6034925619;
	["show_chart"] = 6034934032;
	["insert_chart_outlined"] = 6034925606;
	["vertical_align_bottom"] = 6034934023;
	["subscript"] = 6034934059;
	["format_align_justify"] = 6034900721;
	["format_clear"] = 6034910902;
	["notes"] = 6034973084;
	["insert_drive_file"] = 6034941697;
	["functions"] = 6034925614;
	["insert_emoticon"] = 6034973079;
	["insert_link"] = 6034973074;
	["format_color_reset"] = 6034900743;
	["monetization_on"] = 6034973115;
	["short_text"] = 6034934035;
	["mode_edit"] = 6034941708;
	["superscript"] = 6034934034;
	["table_chart"] = 6034973081;
	["format_bold"] = 6034900732;
	["money_off"] = 6034973088;
	["border_bottom"] = 6034898094;
	["text_fields"] = 6034934040;
	["note"] = 6026663734;
	["shuffle"] = 6026667003;
	["library_books"] = 6026660085;
	["library_music"] = 6026660075;
	["surround_sound"] = 6026671209;
	["forward_30"] = 6026660088;
	["music_video"] = 6026663704;
	["videocam_off"] = 6026671212;
	["control_camera"] = 6026647916;
	["explicit"] = 6026647913;
	["3k_plus"] = 6026681598;
	["fiber_pin"] = 6026660064;
	["skip_previous"] = 6026667011;
	["pause_circle_filled"] = 6026663718;
	["video_settings"] = 6026671211;
	["movie"] = 6026660081;
	["add_to_queue"] = 6026647903;
	["6k"] = 6026681579;
	["web_asset"] = 6026671239;
	["play_circle_outline"] = 6026663726;
	["volume_off"] = 6026671224;
	["mic_off"] = 6026660076;
	["featured_play_list"] = 6026647932;
	["pause_circle_outline"] = 6026663701;
	["slow_motion_video"] = 6026681583;
	["7k"] = 6026681584;
	["playlist_add"] = 6026663728;
	["fiber_smart_record"] = 6026660080;
	["8k"] = 6026643014;
	["hd"] = 6026660065;
	["repeat_one_on"] = 6026666992;
	["recent_actors"] = 6026663773;
	["fiber_new"] = 6026647930;
	["fiber_dvr"] = 6026647912;
	["hearing_disabled"] = 6026660068;
	["forward_10"] = 6026660062;
	["4k_plus"] = 6026643005;
	["repeat_one"] = 6026681590;
	["equalizer"] = 6026647906;
	["stop"] = 6026681576;
	["2k"] = 6026643032;
	["playlist_add_check"] = 6026663727;
	["not_interested"] = 6026663743;
	["videocam"] = 6026671213;
	["sort_by_alpha"] = 6026667009;
	["library_add"] = 6026660063;
	["stop_circle"] = 6026681577;
	["pause"] = 6026663719;
	["new_releases"] = 6026663730;
	["album"] = 6026647905;
	["sd"] = 6026681582;
	["volume_up"] = 6026671215;
	["replay_5"] = 6026666993;
	["high_quality"] = 6026660059;
	["shuffle_on"] = 6026666996;
	["play_arrow"] = 6026663699;
	["snooze"] = 6026667006;
	["closed_caption_disabled"] = 6026647900;
	["subscriptions"] = 6026671207;
	["skip_next"] = 6026667005;
	["branding_watermark"] = 6026647911;
	["speed"] = 6026681578;
	["art_track"] = 6026647908;
	["3k"] = 6026681574;
	["4k"] = 6026643017;
	["volume_mute"] = 6026671214;
	["playlist_play"] = 6026663723;
	["remove_from_queue"] = 6026663771;
	["fast_forward"] = 6026647902;
	["play_disabled"] = 6026663702;
	["fast_rewind"] = 6026647942;
	["5k"] = 6026681575;
	["replay_10"] = 6026667007;
	["video_library"] = 6026671208;
	["loop"] = 6026660087;
	["replay_circle_filled"] = 6026667002;
	["5g"] = 6026643007;
	["library_add_check"] = 6026660083;
	["repeat"] = 6026666998;
	["queue_play_next"] = 6026663700;
	["forward_5"] = 6026660067;
	["web"] = 6026671234;
	["mic_none"] = 6026660066;
	["queue"] = 6026663724;
	["closed_caption_off"] = 6026647943;
	["hearing"] = 6026660060;
	["queue_music"] = 6026663725;
	["airplay"] = 6026647929;
	["9k"] = 6026643013;
	["video_label"] = 6026671204;
	["8k_plus"] = 6026643003;
	["play_circle_filled"] = 6026663705;
	["1k"] = 6026643002;
	["fiber_manual_record"] = 6026647909;
	["closed_caption"] = 6026647896;
	["subtitles"] = 6026671203;
	["featured_video"] = 6026647910;
	["replay_30"] = 6026667010;
	["10k"] = 6026643035;
	["5k_plus"] = 6026643028;
	["6k_plus"] = 6026643019;
	["replay"] = 6026666999;
	["repeat_on"] = 6026666994;
	["1k_plus"] = 6026681580;
	["2k_plus"] = 6026681588;
	["games"] = 6026660074;
	["volume_down"] = 6026671206;
	["mic"] = 6026660078;
	["call_to_action"] = 6026647898;
	["7k_plus"] = 6026643012;
	["av_timer"] = 6026647934;
	["9k_plus"] = 6026681585;
	["radio"] = 6026663698;
	["10mp"] = 6031328149;
	["20mp"] = 6031488940;
	["wb_twighlight"] = 6034412760;
	["movie_creation"] = 6034323681;
	["crop_portrait"] = 6031630198;
	["filter_5"] = 6031597518;
	["broken_image"] = 6031471480;
	["flip_camera_android"] = 6034333280;
	["flip_camera_ios"] = 6034333267;
	["circle"] = 6031625146;
	["photo_camera_front"] = 6031771000;
	["assistant"] = 6031360356;
	["face_retouching_natural"] = 6034333274;
	["palette"] = 6034316009;
	["nature_people"] = 6034323711;
	["14mp"] = 6031328161;
	["gradient"] = 6034333261;
	["filter_4"] = 6031597512;
	["panorama_wide_angle_select"] = 6031770990;
	["photo"] = 6031770993;
	["grid_off"] = 6034333286;
	["leak_add"] = 6034407074;
	["landscape"] = 6034407069;
	["exposure_plus_1"] = 6034328970;
	["slideshow"] = 6031754546;
	["camera_alt"] = 6031572307;
	["audiotrack"] = 6031471489;
	["filter_none"] = 6031600815;
	["blur_off"] = 6031371055;
	["crop_16_9"] = 6031630205;
	["blur_on"] = 6031371068;
	["brightness_4"] = 6031471483;
	["details"] = 6034328968;
	["panorama_horizontal"] = 6034315966;
	["camera_rear"] = 6031572316;
	["hdr_weak"] = 6034407083;
	["collections"] = 6031625145;
	["hdr_enhanced_select"] = 6034333281;
	["adjust"] = 6031339048;
	["burst_mode"] = 6031572306;
	["nature"] = 6034323695;
	["brightness_6"] = 6031572309;
	["19mp"] = 6031339054;
	["grain"] = 6034333288;
	["receipt_long"] = 6031763428;
	["photo_filter"] = 6031770992;
	["edit"] = 6034328955;
	["healing"] = 6034407071;
	["exposure_neg_1"] = 6034328957;
	["exposure"] = 6034328962;
	["wb_shade"] = 6034315974;
	["compare"] = 6031625151;
	["cases"] = 6031572324;
	["timer_3"] = 6031754540;
	["exposure_plus_2"] = 6034328961;
	["12mp"] = 6031328140;
	["22mp"] = 6031360353;
	["timer_off"] = 6031734881;
	["auto_stories"] = 6031360360;
	["rotate_left"] = 6031763427;
	["wb_iridescent"] = 6034315972;
	["shutter_speed"] = 6031763443;
	["switch_video"] = 6031754536;
	["23mp"] = 6031339045;
	["euro"] = 6034328963;
	["15mp"] = 6031328158;
	["filter_center_focus"] = 6031600817;
	["photo_library"] = 6031770998;
	["mp"] = 6034323674;
	["looks_4"] = 6034407089;
	["filter_2"] = 6031597521;
	["crop_3_2"] = 6034328956;
	["auto_fix_normal"] = 6031371074;
	["auto_fix_off"] = 6031360381;
	["wb_auto"] = 6031734875;
	["switch_camera"] = 6031754550;
	["filter_vintage"] = 6031600811;
	["photo_size_select_small"] = 6031763457;
	["blur_linear"] = 6031488930;
	["hdr_on"] = 6034333279;
	["tag_faces"] = 6031754560;
	["21mp"] = 6031339065;
	["camera"] = 6031572312;
	["image_aspect_ratio"] = 6034407073;
	["filter_b_and_w"] = 6031600824;
	["crop_landscape"] = 6031630202;
	["13mp"] = 6031328137;
	["grid_on"] = 6034333276;
	["motion_photos_pause"] = 6034323668;
	["filter_6"] = 6031597524;
	["linked_camera"] = 6034407082;
	["panorama_fish_eye"] = 6034315969;
	["panorama"] = 6034315955;
	["color_lens"] = 6031625148;
	["lens"] = 6034407081;
	["crop_din"] = 6031630208;
	["exposure_neg_2"] = 6034328973;
	["mic_external_off"] = 6034323672;
	["crop_free"] = 6031630212;
	["crop_original"] = 6031630204;
	["panorama_photosphere_select"] = 6034315975;
	["photo_size_select_actual"] = 6031771012;
	["leak_remove"] = 6034407080;
	["collections_bookmark"] = 6034328965;
	["straighten"] = 6031754545;
	["timelapse"] = 6031754541;
	["picture_as_pdf"] = 6031763425;
	["crop_rotate"] = 6031630203;
	["control_point_duplicate"] = 6034328959;
	["photo_camera_back"] = 6031771007;
	["looks_3"] = 6034407088;
	["motion_photos_off"] = 6034323670;
	["rotate_right"] = 6031763429;
	["view_compact"] = 6031734878;
	["crop_7_5"] = 6031630197;
	["style"] = 6031754538;
	["exposure_zero"] = 6034329000;
	["camera_front"] = 6031572318;
	["hdr_strong"] = 6034333272;
	["view_comfy"] = 6031734876;
	["panorama_vertical"] = 6034315963;
	["panorama_vertical_select"] = 6034315961;
	["looks_two"] = 6034412757;
	["filter_drama"] = 6031600813;
	["center_focus_strong"] = 6031625147;
	["18mp"] = 6031339064;
	["7mp"] = 6031328139;
	["wb_sunny"] = 6034412758;
	["filter_9_plus"] = 6031600812;
	["crop"] = 6034328964;
	["vignette"] = 6031734905;
	["brightness_2"] = 6031488938;
	["crop_square"] = 6031630222;
	["looks_5"] = 6034412764;
	["flip"] = 6034333275;
	["looks_one"] = 6034412761;
	["flash_off"] = 6034333270;
	["hdr_off"] = 6034333266;
	["photo_album"] = 6031770989;
	["motion_photos_paused"] = 6034323675;
	["photo_camera"] = 6031770997;
	["2mp"] = 6031328138;
	["3mp"] = 6031328136;
	["24mp"] = 6031360352;
	["filter_9"] = 6031597534;
	["6mp"] = 6031328131;
	["remove_red_eye"] = 6031763426;
	["4mp"] = 6031328152;
	["add_a_photo"] = 6031339049;
	["filter_3"] = 6031597513;
	["crop_5_4"] = 6034328960;
	["8mp"] = 6031328133;
	["camera_roll"] = 6031572314;
	["panorama_wide_angle"] = 6031770995;
	["transform"] = 6031734873;
	["flare"] = 6031600816;
	["image_search"] = 6034407084;
	["auto_awesome"] = 6031360365;
	["motion_photos_on"] = 6034323669;
	["rotate_90_degrees_ccw"] = 6031763456;
	["filter_1"] = 6031597511;
	["filter_tilt_shift"] = 6031600814;
	["image"] = 6034407078;
	["center_focus_weak"] = 6031625144;
	["blur_circular"] = 6031488945;
	["bedtime"] = 6031371054;
	["auto_fix_high"] = 6031360355;
	["monochrome_photos"] = 6034323678;
	["flash_auto"] = 6034333287;
	["5mp"] = 6031328144;
	["photo_size_select_large"] = 6031763423;
	["assistant_photo"] = 6031339052;
	["animation"] = 6031625150;
	["looks"] = 6034407096;
	["17mp"] = 6031339055;
	["panorama_horizontal_select"] = 6034315965;
	["flash_on"] = 6034333271;
	["iso"] = 6034407106;
	["music_note"] = 6034323673;
	["music_off"] = 6034323679;
	["navigate_next"] = 6034315956;
	["timer"] = 6031754564;
	["loupe"] = 6034412770;
	["navigate_before"] = 6034323696;
	["brightness_1"] = 6031471488;
	["brightness_7"] = 6031471491;
	["tonality"] = 6031734891;
	["brush"] = 6031572320;
	["colorize"] = 6031625161;
	["filter_7"] = 6031597515;
	["16mp"] = 6031328168;
	["timer_10"] = 6031734880;
	["portrait"] = 6031763434;
	["tune"] = 6031734877;
	["image_not_supported"] = 6034407076;
	["wb_cloudy"] = 6031734907;
	["auto_awesome_motion"] = 6031360370;
	["filter_8"] = 6031597532;
	["brightness_5"] = 6031471479;
	["movie_filter"] = 6034323687;
	["add_photo_alternate"] = 6031471484;
	["add_to_photos"] = 6031371075;
	["texture"] = 6031754553;
	["11mp"] = 6031328141;
	["mic_external_on"] = 6034323671;
	["looks_6"] = 6034412759;
	["dehaze"] = 6031630200;
	["control_point"] = 6031625131;
	["panorama_photosphere"] = 6034412763;
	["filter_frames"] = 6031600833;
	["auto_awesome_mosaic"] = 6031371053;
	["9mp"] = 6031328146;
	["filter"] = 6031597514;
	["brightness_3"] = 6031572317;
	["dirty_lens"] = 6034328967;
	["wb_incandescent"] = 6034316010;
	["filter_hdr"] = 6031600819;
	["textsms"] = 6035202006;
	["comment"] = 6035181871;
	["call_end"] = 6035173845;
	["qr_code_scanner"] = 6035202022;
	["phonelink_setup"] = 6035202025;
	["call_merge"] = 6035173843;
	["phonelink_erase"] = 6035202085;
	["contact_mail"] = 6035181868;
	["contact_phone"] = 6035181861;
	["screen_share"] = 6035202008;
	["present_to_all"] = 6035202020;
	["stay_primary_portrait"] = 6035202009;
	["message"] = 6035202033;
	["sentiment_satisfied_alt"] = 6035202069;
	["stay_current_portrait"] = 6035202004;
	["voicemail"] = 6035202019;
	["business"] = 6035173853;
	["mail_outline"] = 6035190844;
	["vpn_key"] = 6035202034;
	["forward_to_inbox"] = 6035190840;
	["contacts"] = 6035181864;
	["phonelink_ring"] = 6035202066;
	["domain_disabled"] = 6035181862;
	["person_add_disabled"] = 6035202007;
	["stay_primary_landscape"] = 6035202026;
	["alternate_email"] = 6035173865;
	["phone_disabled"] = 6035202028;
	["email"] = 6035181866;
	["mobile_screen_share"] = 6035202021;
	["live_help"] = 6035190836;
	["chat_bubble"] = 6035181858;
	["stop_screen_share"] = 6035202042;
	["location_on"] = 6035190846;
	["chat_bubble_outline"] = 6035181869;
	["dialer_sip"] = 6035181865;
	["no_sim"] = 6035202030;
	["list_alt"] = 6035190838;
	["call"] = 6035173859;
	["pause_presentation"] = 6035202015;
	["invert_colors_off"] = 6035190842;
	["call_missed_outgoing"] = 6035173847;
	["stay_current_landscape"] = 6035202011;
	["import_export"] = 6035202040;
	["add_ic_call"] = 6035173839;
	["dialpad"] = 6035181892;
	["nat"] = 6035202082;
	["unsubscribe"] = 6035202044;
	["mark_chat_unread"] = 6035190841;
	["portable_wifi_off"] = 6035202091;
	["location_off"] = 6035202049;
	["person_search"] = 6035202013;
	["phonelink_lock"] = 6035202064;
	["desktop_access_disabled"] = 6035181863;
	["import_contacts"] = 6035190854;
	["rss_feed"] = 6035202016;
	["chat"] = 6035173838;
	["print_disabled"] = 6035202041;
	["mark_email_read"] = 6035202038;
	["hourglass_top"] = 6035190886;
	["clear_all"] = 6035181870;
	["forum"] = 6035202002;
	["qr_code"] = 6035202012;
	["speaker_phone"] = 6035202018;
	["rtt"] = 6035202010;
	["domain_verification"] = 6035181867;
	["app_registration"] = 6035173870;
	["call_split"] = 6035173861;
	["cell_wifi"] = 6035173852;
	["phone_enabled"] = 6035202089;
	["call_made"] = 6035173858;
	["call_received"] = 6035173844;
	["phone"] = 6035202017;
	["ring_volume"] = 6035202032;
	["mark_email_unread"] = 6035202027;
	["hourglass_bottom"] = 6035202043;
	["read_more"] = 6035202014;
	["duo"] = 6035181860;
	["more_time"] = 6035202036;
	["wifi_calling"] = 6035202065;
	["swap_calls"] = 6035202037;
	["cancel_presentation"] = 6035173837;
	["call_missed"] = 6035173850;
	["mark_chat_read"] = 6035202031;
	["text_snippet"] = 6031302995;
	["snippet_folder"] = 6031302947;
	["workspaces_outline"] = 6031302952;
	["file_download"] = 6031302931;
	["request_quote"] = 6031302941;
	["approval"] = 6031302928;
	["drive_folder_upload"] = 6031302929;
	["rule_folder"] = 6031302940;
	["attach_email"] = 6031302935;
	["topic"] = 6031302976;
	["upload_file"] = 6031302959;
	["attachment"] = 6031302921;
	["file_download_done"] = 6031302926;
	["drive_file_move_outline"] = 6031302924;
	["cloud_upload"] = 6031302992;
	["cloud_circle"] = 6031302919;
	["folder_shared"] = 6031302945;
	["cloud_download"] = 6031302917;
	["file_upload"] = 6031302996;
	["workspaces_filled"] = 6031302961;
	["cloud_queue"] = 6031302916;
	["cloud"] = 6031302918;
	["folder_open"] = 6031302934;
	["grid_view"] = 6031302950;
	["cloud_off"] = 6031302993;
	["create_new_folder"] = 6031302933;
	["cloud_done"] = 6031302927;
	["folder"] = 6031302932;
	["drive_file_move"] = 6031302922;
	["drive_file_rename_outline"] = 6031302994;
	["notifications_active"] = 6034304908;
	["sentiment_neutral"] = 6034230636;
	["sick"] = 6034230642;
	["poll"] = 6034267991;
	["emoji_events"] = 6034275726;
	["groups"] = 6034281935;
	["sports_soccer"] = 6034227075;
	["person_add"] = 6034287514;
	["mood_bad"] = 6034295706;
	["person_remove_alt_1"] = 6034287515;
	["king_bed"] = 6034281948;
	["architecture"] = 6034275730;
	["deck"] = 6034295703;
	["group_add"] = 6034281909;
	["sports_basketball"] = 6034230649;
	["emoji_symbols"] = 6034281899;
	["switch_account"] = 6034227138;
	["remove_moderator"] = 6034267998;
	["coronavirus"] = 6034275724;
	["people"] = 6034287513;
	["person"] = 6034287594;
	["elderly"] = 6034295698;
	["clean_hands"] = 6034275729;
	["emoji_flags"] = 6034304898;
	["psychology"] = 6034287516;
	["person_add_alt"] = 6034267994;
	["sports_volleyball"] = 6034227139;
	["domain"] = 6034275722;
	["emoji_objects"] = 6034281900;
	["ios_share"] = 6034281941;
	["history_edu"] = 6034281934;
	["share"] = 6034230648;
	["military_tech"] = 6034295711;
	["sports_kabaddi"] = 6034227141;
	["cake"] = 6034295702;
	["engineering"] = 6034281908;
	["emoji_food_beverage"] = 6034304883;
	["notifications_none"] = 6034308947;
	["emoji_people"] = 6034281904;
	["thumb_down_alt"] = 6034227069;
	["sentiment_very_satisfied"] = 6034230650;
	["nights_stay"] = 6034304881;
	["reduce_capacity"] = 6034268013;
	["add_moderator"] = 6034295699;
	["science"] = 6034230640;
	["pages"] = 6034304892;
	["sentiment_satisfied"] = 6034230668;
	["plus_one"] = 6034268012;
	["party_mode"] = 6034287521;
	["person_remove"] = 6034267996;
	["single_bed"] = 6034230651;
	["mood"] = 6034295704;
	["public"] = 6034287522;
	["sports_rugby"] = 6034227073;
	["sports_handball"] = 6034227074;
	["person_add_alt_1"] = 6034287519;
	["people_alt"] = 6034287518;
	["notifications_off"] = 6034304894;
	["whatshot"] = 6034287525;
	["emoji_transportation"] = 6034281894;
	["outdoor_grill"] = 6034304900;
	["sentiment_very_dissatisfied"] = 6034230659;
	["masks"] = 6034295710;
	["luggage"] = 6034295708;
	["sports_motorsports"] = 6034227071;
	["sports_esports"] = 6034227061;
	["location_city"] = 6034304889;
	["sports_golf"] = 6034227060;
	["sentiment_dissatisfied"] = 6034230637;
	["no_luggage"] = 6034304891;
	["fireplace"] = 6034281910;
	["emoji_nature"] = 6034281896;
	["group"] = 6034281901;
	["thumb_up_alt"] = 6034227076;
	["sports_tennis"] = 6034227068;
	["facebook"] = 6034281898;
	["sports_mma"] = 6034227072;
	["person_outline"] = 6034268008;
	["sports_baseball"] = 6034230652;
	["sports_cricket"] = 6034230660;
	["people_outline"] = 6034287528;
	["notifications_paused"] = 6034304896;
	["emoji_emotions"] = 6034275731;
	["follow_the_signs"] = 6034281911;
	["sanitizer"] = 6034287586;
	["self_improvement"] = 6034230634;
	["notifications"] = 6034308946;
	["public_off"] = 6034287538;
	["recommend"] = 6034287524;
	["sports_football"] = 6034227067;
	["sports_hockey"] = 6034227064;
	["school"] = 6034230641;
	["connect_without_contact"] = 6034275800;
	["sports"] = 6034230647;
	["construction"] = 6034275725;
	["inventory"] = 6035056487;
	["add_box"] = 6035047375;
	["how_to_reg"] = 6035053288;
	["unarchive"] = 6035078921;
	["block_flipped"] = 6035047378;
	["file_copy"] = 6035053293;
	["bolt"] = 6035047381;
	["remove_circle_outline"] = 6035067843;
	["move_to_inbox"] = 6035067838;
	["save_alt"] = 6035067842;
	["weekend"] = 6035078894;
	["where_to_vote"] = 6035078913;
	["biotech"] = 6035047385;
	["report_off"] = 6035067830;
	["clear"] = 6035047409;
	["redo"] = 6035056483;
	["link"] = 6035056475;
	["drafts"] = 6035053297;
	["push_pin"] = 6035056481;
	["reply"] = 6035067844;
	["undo"] = 6035078896;
	["archive"] = 6035047379;
	["add"] = 6035047377;
	["insights"] = 6035067839;
	["flag"] = 6035053279;
	["save"] = 6035067857;
	["text_format"] = 6035078890;
	["content_cut"] = 6035053280;
	["ballot"] = 6035047386;
	["remove"] = 6035067836;
	["calculate"] = 6035047384;
	["report"] = 6035067826;
	["markunread"] = 6035056476;
	["delete_sweep"] = 6035053301;
	["gesture"] = 6035053287;
	["link_off"] = 6035056484;
	["forward"] = 6035053298;
	["reply_all"] = 6035067824;
	["how_to_vote"] = 6035053295;
	["square_foot"] = 6035078918;
	["outlined_flag"] = 6035056486;
	["add_circle"] = 6035047380;
	["stacked_bar_chart"] = 6035078892;
	["policy"] = 6035056512;
	["backspace"] = 6035047397;
	["sort"] = 6035078888;
	["content_paste"] = 6035053285;
	["low_priority"] = 6035056491;
	["font_download"] = 6035053275;
	["shield"] = 6035078889;
	["waves"] = 6035078898;
	["select_all"] = 6035067834;
	["dynamic_feed"] = 6035053289;
	["mail"] = 6035056477;
	["amp_stories"] = 6035047382;
	["filter_list"] = 6035053294;
	["send"] = 6035067832;
	["create"] = 6035053304;
	["stream"] = 6035078897;
	["next_week"] = 6035067835;
	["inbox"] = 6035067831;
	["add_link"] = 6035047374;
	["content_copy"] = 6035053278;
	["remove_circle"] = 6035067837;
	["add_circle_outline"] = 6035047391;
	["block"] = 6035047387;
	["tag"] = 6035078895;
	["beach_access"] = 6035107923;
	["stroller"] = 6035161535;
	["family_restroom"] = 6035121916;
	["corporate_fare"] = 6035121908;
	["no_meeting_room"] = 6035153649;
	["do_not_touch"] = 6035121915;
	["ac_unit"] = 6035107929;
	["business_center"] = 6035107933;
	["spa"] = 6035153639;
	["no_flash"] = 6035145424;
	["no_cell"] = 6035145376;
	["room_service"] = 6035153648;
	["tapas"] = 6035161533;
	["microwave"] = 6035145367;
	["meeting_room"] = 6035145361;
	["wash"] = 6035161540;
	["escalator"] = 6035121939;
	["house_siding"] = 6035145393;
	["food_bank"] = 6035121921;
	["foundation"] = 6035121918;
	["elevator"] = 6035121912;
	["room_preferences"] = 6035153642;
	["do_not_step"] = 6035121910;
	["free_breakfast"] = 6035145363;
	["house"] = 6035145364;
	["child_care"] = 6035107927;
	["night_shelter"] = 6035145378;
	["child_friendly"] = 6035121942;
	["checkroom"] = 6035107931;
	["hot_tub"] = 6035145382;
	["dry"] = 6035121909;
	["charging_station"] = 6035107925;
	["all_inclusive"] = 6035107920;
	["bento"] = 6035107924;
	["no_backpack"] = 6035145368;
	["storefront"] = 6035161534;
	["no_food"] = 6035145372;
	["backpack"] = 6035107928;
	["stairs"] = 6035153637;
	["carpenter"] = 6035107955;
	["no_stroller"] = 6035153661;
	["roofing"] = 6035153656;
	["umbrella"] = 6035161550;
	["sports_bar"] = 6035153638;
	["apartment"] = 6035107922;
	["smoke_free"] = 6035153647;
	["pool"] = 6035153655;
	["bathtub"] = 6035107939;
	["no_drinks"] = 6035145390;
	["escalator_warning"] = 6035121930;
	["wheelchair_pickup"] = 6035161536;
	["smoking_rooms"] = 6035153636;
	["rice_bowl"] = 6035153662;
	["tty"] = 6035161541;
	["no_photography"] = 6035153664;
	["casino"] = 6035107936;
	["fence"] = 6035121923;
	["grass"] = 6035145359;
	["countertops"] = 6035121914;
	["kitchen"] = 6035145362;
	["golf_course"] = 6035145423;
	["soap"] = 6035153645;
	["water_damage"] = 6035161563;
	["airport_shuttle"] = 6035107921;
	["fitness_center"] = 6035121907;
	["baby_changing_station"] = 6035107930;
	["fire_extinguisher"] = 6035121913;
	["sparkle"] = 4483362748
}
HexoraUI.IconSets.material = BuiltinMaterialIcons
\r\n

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Helpers
local function create(className, props, children)
    local inst = Instance.new(className)
    if props then
        for k, v in pairs(props) do
            inst[k] = v
        end
    end
    if children then
        for _, child in ipairs(children) do
            child.Parent = inst
        end
    end
    return inst
end

local function tween(inst, info, goal)
    local t = TweenService:Create(inst, info, goal)
    t:Play()
    return t
end

local function clamp(n, min, max)
    if n < min then return min end
    if n > max then return max end
    return n
end

local function listToText(list)
    if type(list) ~= "table" then
        return tostring(list or "")
    end
    if #list == 0 then
        return "None specified"
    end
    local parts = {}
    for _, v in ipairs(list) do
        parts[#parts + 1] = "- " .. tostring(v)
    end
    return table.concat(parts, "\n")
end

local function isImageRef(val)
    if type(val) ~= "string" then
        return false
    end
    if val:match("^rbxassetid://") or val:match("^https?://") then
        return true
    end
    if val:match("^%d+$") then
        return true
    end
    return false
end

local function toImageRef(val)
    if type(val) ~= "string" then
        return val
    end
    if val:match("^%d+$") then
        return "rbxassetid://" .. val
    end
    return val
end

function HexoraUI:RegisterIconProvider(name, resolver)
    if type(name) ~= "string" or type(resolver) ~= "function" then
        return
    end
    self.IconProviders[string.lower(name)] = resolver
end

function HexoraUI:RegisterMaterialIcons(map)
    if type(map) ~= "table" then
        return
    end
    self.IconSets.material = map
end

function HexoraUI:RegisterLucideIcons(map)
    if type(map) ~= "table" then
        return
    end
    self.IconSets.lucide = map
end

local function normalizeIconSpec(icon, theme)
    if not icon then
        return nil
    end

    if type(icon) == "string" then
        return {
            kind = "text",
            text = icon,
            color = theme.Accent,
            size = 14,
            font = Enum.Font.GothamBold,
        }
    end

    if type(icon) ~= "table" then
        return nil
    end

    local providerName = icon.Provider or icon.Type
    if providerName then
        local key = tostring(providerName):lower()
        local provider = HexoraUI.IconProviders[key]
        if provider then
            local resolved = provider(icon)
            if type(resolved) == "string" then
                if isImageRef(resolved) then
                    return {
                        kind = "image",
                        image = toImageRef(resolved),
                        color = icon.Color or icon.ImageColor3 or theme.Accent,
                        size = icon.Size,
                    }
                end
                return {
                    kind = "text",
                    text = resolved,
                    color = icon.Color or icon.TextColor3 or theme.Accent,
                    size = icon.Size,
                    font = icon.Font,
                    fontFace = icon.FontFace,
                }
            elseif type(resolved) == "number" then
                return {
                    kind = "image",
                    image = toImageRef(tostring(resolved)),
                    color = icon.Color or icon.ImageColor3 or theme.Accent,
                    size = icon.Size,
                }
            elseif type(resolved) == "table" then
                if resolved.Image or resolved.ImageId or resolved.AssetId then
                    local img = resolved.Image or resolved.ImageId or resolved.AssetId
                    if type(img) == "number" then
                        img = tostring(img)
                    end
                    return {
                        kind = "image",
                        image = toImageRef(img),
                        color = resolved.Color or icon.Color or resolved.ImageColor3 or icon.ImageColor3 or theme.Accent,
                        size = resolved.Size or icon.Size,
                    }
                end
                if resolved.Text then
                    return {
                        kind = "text",
                        text = resolved.Text,
                        color = resolved.Color or icon.Color or resolved.TextColor3 or icon.TextColor3 or theme.Accent,
                        size = resolved.Size or icon.Size,
                        font = resolved.Font or icon.Font,
                        fontFace = resolved.FontFace or icon.FontFace,
                    }
                end
            end
        end

        local set = HexoraUI.IconSets[key]
        if type(set) == "table" then
            local name = icon.Name or icon.Icon or icon.Key
            local entry = name and set[name]
            if type(entry) == "string" then
                if isImageRef(entry) then
                    return {
                        kind = "image",
                        image = toImageRef(entry),
                        color = icon.Color or icon.ImageColor3 or theme.Accent,
                        size = icon.Size,
                    }
                end
                return {
                    kind = "text",
                    text = entry,
                    color = icon.Color or icon.TextColor3 or theme.Accent,
                    size = icon.Size,
                    font = icon.Font,
                    fontFace = icon.FontFace,
                }
            elseif type(entry) == "number" then
                return {
                    kind = "image",
                    image = toImageRef(tostring(entry)),
                    color = icon.Color or icon.ImageColor3 or theme.Accent,
                    size = icon.Size,
                }
            elseif type(entry) == "table" then
                if entry.Image or entry.ImageId or entry.AssetId then
                    local img = entry.Image or entry.ImageId or entry.AssetId
                    if type(img) == "number" then
                        img = tostring(img)
                    end
                    return {
                        kind = "image",
                        image = toImageRef(img),
                        color = entry.Color or icon.Color or entry.ImageColor3 or icon.ImageColor3 or theme.Accent,
                        size = entry.Size or icon.Size,
                    }
                end
                if entry.Text then
                    return {
                        kind = "text",
                        text = entry.Text,
                        color = entry.Color or icon.Color or entry.TextColor3 or icon.TextColor3 or theme.Accent,
                        size = entry.Size or icon.Size,
                        font = entry.Font or icon.Font,
                        fontFace = entry.FontFace or icon.FontFace,
                    }
                end
            end
        end
    end

    if icon.Image or icon.ImageId or icon.AssetId then
        local img = icon.Image or icon.ImageId or icon.AssetId
        if type(img) == "number" then
            img = tostring(img)
        end
        return {
            kind = "image",
            image = toImageRef(img),
            color = icon.Color or icon.ImageColor3 or theme.Accent,
            size = icon.Size,
        }
    end

    if icon.Text then
        return {
            kind = "text",
            text = icon.Text,
            color = icon.Color or icon.TextColor3 or theme.Accent,
            size = icon.Size,
            font = icon.Font,
            fontFace = icon.FontFace,
        }
    end

    return nil
end

local function addGradient(inst, colorSeq, transparencySeq, rotation)
    local g = Instance.new("UIGradient")
    g.Color = colorSeq
    if transparencySeq then
        g.Transparency = transparencySeq
    end
    g.Rotation = rotation or 90
    g.Parent = inst
    return g
end

local function addScale(inst, defaultScale)
    local s = Instance.new("UIScale")
    s.Scale = defaultScale or 1
    s.Parent = inst
    return s
end

local function pressable(inst, downScale)
    local s = addScale(inst, 1)
    local target = downScale or 0.98
    inst.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            tween(s, TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = target })
        end
    end)
    inst.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            tween(s, TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 1 })
        end
    end)
end

local function hoverScale(inst, overScale)
    local s = inst:FindFirstChildOfClass("UIScale") or addScale(inst, 1)
    local target = overScale or 1.01
    inst.MouseEnter:Connect(function()
        tween(s, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = target })
    end)
    inst.MouseLeave:Connect(function()
        tween(s, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 1 })
    end)
end

-- Theme
local DefaultTheme = {
    Background = Color3.fromRGB(16, 18, 22),
    Panel = Color3.fromRGB(22, 25, 32),
    PanelAlt = Color3.fromRGB(28, 32, 40),
    Sidebar = Color3.fromRGB(18, 20, 26),
    Accent = Color3.fromRGB(0, 190, 255),
    Accent2 = Color3.fromRGB(120, 120, 255),
    AccentSoft = Color3.fromRGB(0, 120, 160),
    Text = Color3.fromRGB(230, 234, 240),
    Muted = Color3.fromRGB(140, 150, 165),
    Stroke = Color3.fromRGB(40, 45, 56),
}

-- Window object
local Window = {}
Window.__index = Window

-- Tab object
local Tab = {}
Tab.__index = Tab

-- Section object
local Section = {}
Section.__index = Section

-- Create library
function HexoraUI:CreateWindow(opts)
    opts = opts or {}
    local Title = opts.Title or "HexoraUI"
    local Subtitle = opts.Subtitle or ""
    local Keybind = opts.Keybind or Enum.KeyCode.RightShift
    local Parent = opts.Parent or PlayerGui
    local Theme = opts.Theme or DefaultTheme
    local ProfileEnabled = opts.ProfileEnabled ~= false
    local ProfileSize = opts.ProfileSize or 56
    local ProfileCorner = opts.ProfileCorner or 12
    local LoadingEnabled = opts.LoadingEnabled ~= false
    local LoadingTitle = opts.LoadingTitle or Title
    local LoadingSubtitle = opts.LoadingSubtitle or "Loading..."
    local LoadingDuration = opts.LoadingDuration or 1.6
    local KeySystem = opts.KeySystem or false
    local KeyTitle = opts.KeyTitle or "Key System"
    local KeySubtitle = opts.KeySubtitle or "Enter access key"
    local KeyNote = opts.KeyNote or "Join our Discord for the key"
    local KeyList = opts.Key or {}

    local self = setmetatable({}, Window)
    self.Theme = Theme
    self.Tabs = {}
    self.ActiveTab = nil
    self.Minimized = false

    -- Root
    local ScreenGui = create("ScreenGui", {
        Name = "HexoraUI",
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent = Parent,
    })

    local Root = create("Frame", {
        Name = "Root",
        Size = UDim2.new(0, 760, 0, 460),
        Position = UDim2.new(0.5, -380, 0.5, -230),
        BackgroundColor3 = Theme.Background,
        BorderSizePixel = 0,
        Parent = ScreenGui,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 14) }),
        create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
    })

    local Topbar = create("Frame", {
        Name = "Topbar",
        Size = UDim2.new(1, 0, 0, 48),
        BackgroundColor3 = Theme.Panel,
        BorderSizePixel = 0,
        Parent = Root,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 14) }),
    })

    local TopbarMask = create("Frame", {
        Name = "TopbarMask",
        Size = UDim2.new(1, 0, 0, 14),
        Position = UDim2.new(0, 0, 0, 34),
        BackgroundColor3 = Theme.Panel,
        BorderSizePixel = 0,
        Parent = Topbar,
    })

    local TitleLabel = create("TextLabel", {
        Name = "Title",
        Text = Title,
        Font = Enum.Font.GothamSemibold,
        TextSize = 16,
        TextColor3 = Theme.Text,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -24, 0, 20),
        Position = UDim2.new(0, 12, 0, 7),
        Parent = Topbar,
    })

    local SubtitleLabel = create("TextLabel", {
        Name = "Subtitle",
        Text = Subtitle,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextColor3 = Theme.Muted,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -24, 0, 16),
        Position = UDim2.new(0, 12, 0, 26),
        Parent = Topbar,
    })

    -- Window controls
    local Controls = create("Frame", {
        Name = "Controls",
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 64, 0, 24),
        Position = UDim2.new(1, -72, 0, 12),
        Parent = Topbar,
    })

    local MinBtn = create("TextButton", {
        Name = "Minimize",
        Text = "-",
        Font = Enum.Font.GothamBold,
        TextSize = 18,
        TextColor3 = Theme.Muted,
        BackgroundColor3 = Theme.PanelAlt,
        BorderSizePixel = 0,
        Size = UDim2.new(0, 28, 0, 24),
        Position = UDim2.new(0, 0, 0, 0),
        AutoButtonColor = false,
        Parent = Controls,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 8) }),
        create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
    })

    local CloseBtn = create("TextButton", {
        Name = "Close",
        Text = "x",
        Font = Enum.Font.GothamBold,
        TextSize = 18,
        TextColor3 = Theme.Muted,
        BackgroundColor3 = Theme.PanelAlt,
        BorderSizePixel = 0,
        Size = UDim2.new(0, 28, 0, 24),
        Position = UDim2.new(0, 34, 0, 0),
        AutoButtonColor = false,
        Parent = Controls,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 8) }),
        create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
    })

    local Sidebar = create("Frame", {
        Name = "Sidebar",
        Size = UDim2.new(0, 180, 1, -48),
        Position = UDim2.new(0, 0, 0, 48),
        BackgroundColor3 = Theme.Sidebar,
        BorderSizePixel = 0,
        Parent = Root,
    })

    local ProfileCard
    local ProfileName
    local ProfileDisplay
    if ProfileEnabled then
        ProfileCard = create("Frame", {
            Name = "Profile",
            BackgroundColor3 = Theme.Panel,
            BorderSizePixel = 0,
            Size = UDim2.new(1, -20, 0, 68),
            Parent = Sidebar,
        }, {
            create("UICorner", { CornerRadius = UDim.new(0, 10) }),
            create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
        })

        local Avatar = create("ImageLabel", {
            Name = "Avatar",
            BackgroundColor3 = Theme.PanelAlt,
            BorderSizePixel = 0,
            Size = UDim2.new(0, ProfileSize, 0, ProfileSize),
            Position = UDim2.new(0, 8, 0.5, -(ProfileSize / 2)),
            Image = "",
            Parent = ProfileCard,
        }, {
            create("UICorner", { CornerRadius = UDim.new(0, ProfileCorner) }),
            create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
        })

        ProfileName = create("TextLabel", {
            Name = "Username",
            Text = LocalPlayer.Name,
            Font = Enum.Font.GothamSemibold,
            TextSize = 12,
            TextColor3 = Theme.Text,
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            Size = UDim2.new(1, -(ProfileSize + 24), 0, 16),
            Position = UDim2.new(0, ProfileSize + 16, 0.5, -14),
            Parent = ProfileCard,
        })

        ProfileDisplay = create("TextLabel", {
            Name = "DisplayName",
            Text = LocalPlayer.DisplayName,
            Font = Enum.Font.Gotham,
            TextSize = 11,
            TextColor3 = Theme.Muted,
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            Size = UDim2.new(1, -(ProfileSize + 24), 0, 14),
            Position = UDim2.new(0, ProfileSize + 16, 0.5, 2),
            Parent = ProfileCard,
        })

        task.spawn(function()
            local ok, content = pcall(function()
                return Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size180x180)
            end)
            if ok and content then
                Avatar.Image = content
            end
        end)
    end

    local SidebarList = create("UIListLayout", {
        Padding = UDim.new(0, 6),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = Sidebar,
    })

    local SidebarPadding = create("UIPadding", {
        PaddingTop = UDim.new(0, 10),
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
        Parent = Sidebar,
    })

    local Content = create("Frame", {
        Name = "Content",
        Size = UDim2.new(1, -180, 1, -48),
        Position = UDim2.new(0, 180, 0, 48),
        BackgroundTransparency = 1,
        Parent = Root,
    })

    -- Drag
    local dragging = false
    local dragStart, startPos
    Topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Root.Position
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            Root.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    -- Minimize
    UserInputService.InputBegan:Connect(function(input, gpe)
        if gpe then return end
        if input.KeyCode == Keybind then
            self.Minimized = not self.Minimized
            if self.Minimized then
                tween(Root, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(0, 760, 0, 48) })
                Content.Visible = false
                Sidebar.Visible = false
            else
                Content.Visible = true
                Sidebar.Visible = true
                tween(Root, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(0, 760, 0, 460) })
            end
        end
    end)

    local function setMinimize(state)
        self.Minimized = state
        if self.Minimized then
            tween(Root, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(0, 760, 0, 48) })
            Content.Visible = false
            Sidebar.Visible = false
        else
            Content.Visible = true
            Sidebar.Visible = true
            tween(Root, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(0, 760, 0, 460) })
        end
    end

    MinBtn.MouseButton1Click:Connect(function()
        setMinimize(not self.Minimized)
    end)
    CloseBtn.MouseButton1Click:Connect(function()
        self:Destroy()
    end)

    pressable(MinBtn, 0.95)
    pressable(CloseBtn, 0.95)

    self._gui = ScreenGui
    self._root = Root
    self._content = Content
    self._sidebar = Sidebar
    self._sidebarList = SidebarList

    function self:SetTheme(newTheme)
        self.Theme = newTheme or Theme
        Root.BackgroundColor3 = self.Theme.Background
        Topbar.BackgroundColor3 = self.Theme.Panel
        TopbarMask.BackgroundColor3 = self.Theme.Panel
        Sidebar.BackgroundColor3 = self.Theme.Sidebar
        TitleLabel.TextColor3 = self.Theme.Text
        SubtitleLabel.TextColor3 = self.Theme.Muted
        MinBtn.BackgroundColor3 = self.Theme.PanelAlt
        CloseBtn.BackgroundColor3 = self.Theme.PanelAlt
        MinBtn.TextColor3 = self.Theme.Muted
        CloseBtn.TextColor3 = self.Theme.Muted
        if ProfileCard then
            ProfileCard.BackgroundColor3 = self.Theme.Panel
        end
        if ProfileName then
            ProfileName.TextColor3 = self.Theme.Text
        end
        if ProfileDisplay then
            ProfileDisplay.TextColor3 = self.Theme.Muted
        end
    end

    function self:Destroy()
        if self._gui then
            self._gui:Destroy()
        end
    end

    -- Loading overlay
    if LoadingEnabled then
        local Overlay = create("Frame", {
            Name = "LoadingOverlay",
            BackgroundColor3 = Theme.Background,
            BackgroundTransparency = 0,
            Size = UDim2.new(1, 0, 1, 0),
            Parent = Root,
        }, {
            create("UICorner", { CornerRadius = UDim.new(0, 14) }),
        })

        local LTitle = create("TextLabel", {
            Text = LoadingTitle,
            Font = Enum.Font.GothamSemibold,
            TextSize = 16,
            TextColor3 = Theme.Text,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 22),
            Position = UDim2.new(0, 0, 0.5, -32),
            Parent = Overlay,
        })

        local LSub = create("TextLabel", {
            Text = LoadingSubtitle,
            Font = Enum.Font.Gotham,
            TextSize = 12,
            TextColor3 = Theme.Muted,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 18),
            Position = UDim2.new(0, 0, 0.5, -10),
            Parent = Overlay,
        })

        local Bar = create("Frame", {
            BackgroundColor3 = Theme.Panel,
            BorderSizePixel = 0,
            Size = UDim2.new(0, 220, 0, 6),
            Position = UDim2.new(0.5, -110, 0.5, 18),
            Parent = Overlay,
        }, {
            create("UICorner", { CornerRadius = UDim.new(0, 4) }),
        })

        local BarFill = create("Frame", {
            BackgroundColor3 = Theme.Accent,
            BorderSizePixel = 0,
            Size = UDim2.new(0, 0, 1, 0),
            Parent = Bar,
        }, {
            create("UICorner", { CornerRadius = UDim.new(0, 4) }),
        })

        local Dots = create("TextLabel", {
            Text = "•",
            Font = Enum.Font.GothamSemibold,
            TextSize = 16,
            TextColor3 = Theme.Accent,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 18),
            Position = UDim2.new(0, 0, 0.5, 30),
            Parent = Overlay,
        })

        task.spawn(function()
            local run = true
            task.delay(LoadingDuration, function() run = false end)
            while run do
                tween(BarFill, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { Size = UDim2.new(1, 0, 1, 0) })
                tween(BarFill, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.In), { Size = UDim2.new(0.15, 0, 1, 0) })
                Dots.Text = "•"
                task.wait(0.12)
                Dots.Text = "••"
                task.wait(0.12)
                Dots.Text = "•••"
                task.wait(0.12)
            end
            tween(Overlay, TweenInfo.new(0.2), { BackgroundTransparency = 1 })
            tween(LTitle, TweenInfo.new(0.2), { TextTransparency = 1 })
            tween(LSub, TweenInfo.new(0.2), { TextTransparency = 1 })
            tween(Bar, TweenInfo.new(0.2), { BackgroundTransparency = 1 })
            tween(BarFill, TweenInfo.new(0.2), { BackgroundTransparency = 1 })
            tween(Dots, TweenInfo.new(0.2), { TextTransparency = 1 })
            task.wait(0.22)
            Overlay:Destroy()
        end)
    end

    -- Key system overlay
    local function normalizeKeys(list)
        if type(list) == "string" then
            return { list }
        end
        if type(list) ~= "table" then
            return {}
        end
        return list
    end
    KeyList = normalizeKeys(KeyList)

    if KeySystem then
        local KeyOverlay = create("Frame", {
            Name = "KeyOverlay",
            BackgroundColor3 = Theme.Background,
            BackgroundTransparency = 0.05,
            Size = UDim2.new(1, 0, 1, 0),
            Parent = Root,
        }, {
            create("UICorner", { CornerRadius = UDim.new(0, 14) }),
        })

        local Card = create("Frame", {
            BackgroundColor3 = Theme.Panel,
            BorderSizePixel = 0,
            Size = UDim2.new(0, 360, 0, 200),
            Position = UDim2.new(0.5, -180, 0.5, -100),
            Parent = KeyOverlay,
        }, {
            create("UICorner", { CornerRadius = UDim.new(0, 12) }),
            create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
        })

        create("TextLabel", {
            Text = KeyTitle,
            Font = Enum.Font.GothamSemibold,
            TextSize = 16,
            TextColor3 = Theme.Text,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, -20, 0, 20),
            Position = UDim2.new(0, 10, 0, 12),
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = Card,
        })

        create("TextLabel", {
            Text = KeySubtitle,
            Font = Enum.Font.Gotham,
            TextSize = 12,
            TextColor3 = Theme.Muted,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, -20, 0, 18),
            Position = UDim2.new(0, 10, 0, 34),
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = Card,
        })

        local Input = create("TextBox", {
            Text = "",
            PlaceholderText = "Enter key...",
            Font = Enum.Font.Gotham,
            TextSize = 12,
            TextColor3 = Theme.Text,
            PlaceholderColor3 = Theme.Muted,
            BackgroundColor3 = Theme.PanelAlt,
            BorderSizePixel = 0,
            Size = UDim2.new(1, -20, 0, 28),
            Position = UDim2.new(0, 10, 0, 70),
            ClearTextOnFocus = false,
            Parent = Card,
        }, {
            create("UICorner", { CornerRadius = UDim.new(0, 8) }),
            create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
        })

        local Status = create("TextLabel", {
            Text = "",
            Font = Enum.Font.Gotham,
            TextSize = 12,
            TextColor3 = Theme.Muted,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, -20, 0, 18),
            Position = UDim2.new(0, 10, 0, 104),
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = Card,
        })

        local Submit = create("TextButton", {
            Text = "Submit",
            Font = Enum.Font.GothamSemibold,
            TextSize = 13,
            TextColor3 = Theme.Text,
            BackgroundColor3 = Theme.Accent,
            BorderSizePixel = 0,
            Size = UDim2.new(1, -20, 0, 30),
            Position = UDim2.new(0, 10, 0, 130),
            AutoButtonColor = false,
            Parent = Card,
        }, {
            create("UICorner", { CornerRadius = UDim.new(0, 8) }),
        })

        create("TextLabel", {
            Text = KeyNote,
            Font = Enum.Font.Gotham,
            TextSize = 11,
            TextColor3 = Theme.Muted,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, -20, 0, 18),
            Position = UDim2.new(0, 10, 1, -22),
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = Card,
        })

        local function isValid(key)
            for _, k in ipairs(KeyList) do
                if tostring(k) == tostring(key) then
                    return true
                end
            end
            return false
        end

        local function unlock()
            tween(KeyOverlay, TweenInfo.new(0.2), { BackgroundTransparency = 1 })
            for _, child in ipairs(Card:GetDescendants()) do
                if child:IsA("TextLabel") then
                    tween(child, TweenInfo.new(0.2), { TextTransparency = 1 })
                elseif child:IsA("TextBox") then
                    tween(child, TweenInfo.new(0.2), { BackgroundTransparency = 1, TextTransparency = 1 })
                elseif child:IsA("TextButton") then
                    tween(child, TweenInfo.new(0.2), { BackgroundTransparency = 1, TextTransparency = 1 })
                end
            end
            task.wait(0.22)
            KeyOverlay:Destroy()
        end

        local function submitKey()
            local key = Input.Text
            if isValid(key) then
                Status.Text = "Access granted"
                Status.TextColor3 = Theme.Accent
                unlock()
            else
                Status.Text = "Invalid key"
                Status.TextColor3 = Color3.fromRGB(255, 90, 90)
            end
        end

        Submit.MouseButton1Click:Connect(submitKey)
        Input.FocusLost:Connect(function(enter)
            if enter then submitKey() end
        end)
    end

    return self
end

function Window:CreateTab(opts)
    opts = opts or {}
    local Name = opts.Name or "Tab"
    local Icon = opts.Icon
    local Theme = self.Theme

    local TabButton = create("TextButton", {
        Name = Name .. "Button",
        Size = UDim2.new(1, 0, 0, 36),
        BackgroundColor3 = Theme.PanelAlt,
        Text = "",
        AutoButtonColor = false,
        Parent = self._sidebar,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 10) }),
        create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
    })

    local Indicator = create("Frame", {
        Name = "Indicator",
        BackgroundColor3 = Theme.Accent,
        BorderSizePixel = 0,
        Size = UDim2.new(0, 3, 1, -10),
        Position = UDim2.new(0, 6, 0, 5),
        BackgroundTransparency = 1,
        Parent = TabButton,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 3) }),
    })

    local TabLabel = create("TextLabel", {
        Name = "Label",
        Text = Name,
        Font = Enum.Font.GothamMedium,
        TextSize = 13,
        TextColor3 = Theme.Text,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -16, 1, 0),
        Position = UDim2.new(0, 12, 0, 0),
        Parent = TabButton,
    })

    local iconSpec = normalizeIconSpec(Icon, Theme)
    if iconSpec then
        TabLabel.Position = UDim2.new(0, 36, 0, 0)
        if iconSpec.kind == "image" then
            local size = iconSpec.size or 18
            create("ImageLabel", {
                Name = "Icon",
                Image = iconSpec.image or "",
                ImageColor3 = iconSpec.color or Theme.Accent,
                BackgroundTransparency = 1,
                Size = UDim2.new(0, size, 0, size),
                Position = UDim2.new(0, 12, 0.5, -(size / 2)),
                Parent = TabButton,
            })
        else
            local IconLabel = create("TextLabel", {
                Name = "Icon",
                Text = iconSpec.text or "",
                Font = iconSpec.font or Enum.Font.GothamBold,
                TextSize = iconSpec.size or 14,
                TextColor3 = iconSpec.color or Theme.Accent,
                BackgroundTransparency = 1,
                Size = UDim2.new(0, 24, 1, 0),
                Position = UDim2.new(0, 10, 0, 0),
                Parent = TabButton,
            })
            if iconSpec.fontFace then
                IconLabel.FontFace = iconSpec.fontFace
            end
        end
    end

    local Page = create("ScrollingFrame", {
        Name = Name .. "Page",
        Size = UDim2.new(1, 0, 1, 0),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollBarThickness = 4,
        ScrollBarImageColor3 = Theme.AccentSoft,
        BackgroundTransparency = 1,
        Visible = false,
        Parent = self._content,
    }, {
        create("UIListLayout", {
            Padding = UDim.new(0, 10),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        create("UIPadding", {
            PaddingTop = UDim.new(0, 12),
            PaddingLeft = UDim.new(0, 12),
            PaddingRight = UDim.new(0, 12),
            PaddingBottom = UDim.new(0, 12),
        }),
    })

    local tab = setmetatable({
        Name = Name,
        Button = TabButton,
        Page = Page,
        Theme = Theme,
        _window = self,
    }, Tab)

    TabButton.MouseEnter:Connect(function()
        tween(TabButton, TweenInfo.new(0.12), { BackgroundColor3 = Theme.Panel })
    end)
    TabButton.MouseLeave:Connect(function()
        if self.ActiveTab ~= tab then
            tween(TabButton, TweenInfo.new(0.12), { BackgroundColor3 = Theme.PanelAlt })
        end
    end)

    pressable(TabButton, 0.985)

    TabButton.MouseButton1Click:Connect(function()
        if self.ActiveTab then
            self.ActiveTab.Page.Visible = false
            self.ActiveTab.Button.BackgroundColor3 = Theme.PanelAlt
            local oldIndicator = self.ActiveTab.Button:FindFirstChild("Indicator")
            if oldIndicator then
                tween(oldIndicator, TweenInfo.new(0.12), { BackgroundTransparency = 1 })
            end
        end
        self.ActiveTab = tab
        tab.Page.Position = UDim2.new(0, 8, 0, 0)
        tab.Page.Visible = true
        tab.Button.BackgroundColor3 = Theme.Panel
        tween(Indicator, TweenInfo.new(0.12), { BackgroundTransparency = 0 })
        tween(tab.Page, TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(0, 0, 0, 0) })
    end)

    if not self.ActiveTab then
        self.ActiveTab = tab
        tab.Page.Position = UDim2.new(0, 0, 0, 0)
        tab.Page.Visible = true
        tab.Button.BackgroundColor3 = Theme.Panel
        Indicator.BackgroundTransparency = 0
    end

    table.insert(self.Tabs, tab)
    return tab
end

function Window:CreateHomeTab(opts)
    opts = opts or {}
    local Name = opts.Name or "Home"
    local Icon = opts.Icon or "home"
    local Description = opts.Description or "Welcome."
    local SupportedExecutors = opts.SupportedExecutors or {}
    local DiscordInvite = opts.DiscordInvite
    local ExtraInfo = opts.ExtraInfo

    local tab = self:CreateTab({
        Name = Name,
        Icon = Icon,
    })

    local info = tab:CreateSection({ Title = "Welcome" })
    info:CreateParagraph({
        Title = Name,
        Text = Description,
    })

    local exec = tab:CreateSection({ Title = "Supported Executors" })
    exec:CreateParagraph({
        Title = "Executors",
        Text = listToText(SupportedExecutors),
    })

    if DiscordInvite then
        local community = tab:CreateSection({ Title = "Community" })
        community:CreateParagraph({
            Title = "Discord",
            Text = "Invite: " .. tostring(DiscordInvite),
        })
    end

    if ExtraInfo then
        local extra = tab:CreateSection({ Title = "Info" })
        extra:CreateParagraph({
            Title = "Details",
            Text = tostring(ExtraInfo),
        })
    end

    return tab
end

function Tab:CreateSection(opts)
    opts = opts or {}
    local Title = opts.Title or "Section"
    local Theme = self.Theme

    local SectionFrame = create("Frame", {
        Name = Title .. "Section",
        BackgroundColor3 = Theme.Panel,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 40),
        AutomaticSize = Enum.AutomaticSize.Y,
        Parent = self.Page,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 12) }),
        create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
        create("UIPadding", {
            PaddingTop = UDim.new(0, 12),
            PaddingBottom = UDim.new(0, 12),
            PaddingLeft = UDim.new(0, 12),
            PaddingRight = UDim.new(0, 12),
        }),
        create("UIListLayout", {
            Padding = UDim.new(0, 8),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
    })

    addGradient(SectionFrame, ColorSequence.new({
        ColorSequenceKeypoint.new(0, Theme.Panel),
        ColorSequenceKeypoint.new(1, Theme.PanelAlt),
    }), nil, 90)

    hoverScale(SectionFrame, 1.008)

    local Header = create("TextLabel", {
        Name = "Header",
        Text = Title,
        Font = Enum.Font.GothamSemibold,
        TextSize = 14,
        TextColor3 = Theme.Text,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, 0, 0, 20),
        Parent = SectionFrame,
    })

    local section = setmetatable({
        Frame = SectionFrame,
        Theme = Theme,
    }, Section)

    return section
end

function Section:CreateLabel(opts)
    opts = opts or {}
    local Text = opts.Text or "Label"
    local Theme = self.Theme

    local Label = create("TextLabel", {
        Text = Text,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextColor3 = Theme.Muted,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, 0, 0, 18),
        Parent = self.Frame,
    })
    return Label
end

function Section:CreateParagraph(opts)
    opts = opts or {}
    local Title = opts.Title or "Title"
    local Text = opts.Text or ""
    local Theme = self.Theme

    local Wrap = create("Frame", {
        BackgroundColor3 = Theme.PanelAlt,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 40),
        AutomaticSize = Enum.AutomaticSize.Y,
        Parent = self.Frame,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 10) }),
        create("UIPadding", {
            PaddingTop = UDim.new(0, 10),
            PaddingBottom = UDim.new(0, 10),
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 10),
        }),
    })

    local TitleLabel = create("TextLabel", {
        Text = Title,
        Font = Enum.Font.GothamSemibold,
        TextSize = 13,
        TextColor3 = Theme.Text,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, 0, 0, 18),
        Parent = Wrap,
    })

    local Body = create("TextLabel", {
        Text = Text,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextColor3 = Theme.Muted,
        BackgroundTransparency = 1,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, 0, 0, 18),
        AutomaticSize = Enum.AutomaticSize.Y,
        Position = UDim2.new(0, 0, 0, 20),
        Parent = Wrap,
    })
    hoverScale(Wrap, 1.006)
    return Wrap
end

function Section:CreateButton(opts)
    opts = opts or {}
    local Name = opts.Name or "Button"
    local Callback = opts.Callback or function() end
    local Theme = self.Theme

    local Btn = create("TextButton", {
        Text = Name,
        Font = Enum.Font.GothamMedium,
        TextSize = 13,
        TextColor3 = Theme.Text,
        BackgroundColor3 = Theme.PanelAlt,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 34),
        AutoButtonColor = false,
        Parent = self.Frame,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 10) }),
        create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
    })

    Btn.MouseEnter:Connect(function()
        tween(Btn, TweenInfo.new(0.12), { BackgroundColor3 = Theme.Panel })
    end)
    Btn.MouseLeave:Connect(function()
        tween(Btn, TweenInfo.new(0.12), { BackgroundColor3 = Theme.PanelAlt })
    end)
    Btn.MouseButton1Click:Connect(function()
        task.spawn(Callback)
    end)

    pressable(Btn, 0.975)
    hoverScale(Btn, 1.01)
    return Btn
end

function Section:CreateToggle(opts)
    opts = opts or {}
    local Name = opts.Name or "Toggle"
    local Default = opts.Default or false
    local Callback = opts.Callback or function(_) end
    local Description = opts.Description
    local Theme = self.Theme

    local Wrap = create("Frame", {
        BackgroundColor3 = Theme.PanelAlt,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, Description and 48 or 34),
        Parent = self.Frame,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 10) }),
        create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
    })

    local Label = create("TextLabel", {
        Text = Name,
        Font = Enum.Font.GothamMedium,
        TextSize = 13,
        TextColor3 = Theme.Text,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -54, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        Parent = Wrap,
    })

    if Description then
        Label.Size = UDim2.new(1, -54, 0, 18)
        local Desc = create("TextLabel", {
            Text = Description,
            Font = Enum.Font.Gotham,
            TextSize = 11,
            TextColor3 = Theme.Muted,
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            Size = UDim2.new(1, -54, 0, 16),
            Position = UDim2.new(0, 10, 0, 20),
            Parent = Wrap,
        })
    end

    local Toggle = create("Frame", {
        Size = UDim2.new(0, 36, 0, 18),
        Position = UDim2.new(1, -46, 0.5, -9),
        BackgroundColor3 = Theme.Panel,
        BorderSizePixel = 0,
        Parent = Wrap,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 9) }),
    })

    local Knob = create("Frame", {
        Size = UDim2.new(0, 14, 0, 14),
        Position = UDim2.new(0, 2, 0.5, -7),
        BackgroundColor3 = Theme.Muted,
        BorderSizePixel = 0,
        Parent = Toggle,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 7) }),
    })

    local StateLabel = create("TextLabel", {
        Text = Default and "ON" or "OFF",
        Font = Enum.Font.GothamSemibold,
        TextSize = 10,
        TextColor3 = Theme.Muted,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Right,
        Size = UDim2.new(0, 36, 0, 16),
        Position = UDim2.new(1, -88, 0.5, -8),
        Parent = Wrap,
    })

    local state = Default
    local function setState(v)
        state = v
        if state then
            tween(Toggle, TweenInfo.new(0.12), { BackgroundColor3 = Theme.AccentSoft })
            tween(Knob, TweenInfo.new(0.12), { Position = UDim2.new(1, -16, 0.5, -7), BackgroundColor3 = Theme.Accent })
            StateLabel.Text = "ON"
            StateLabel.TextColor3 = Theme.Accent
        else
            tween(Toggle, TweenInfo.new(0.12), { BackgroundColor3 = Theme.Panel })
            tween(Knob, TweenInfo.new(0.12), { Position = UDim2.new(0, 2, 0.5, -7), BackgroundColor3 = Theme.Muted })
            StateLabel.Text = "OFF"
            StateLabel.TextColor3 = Theme.Muted
        end
        task.spawn(Callback, state)
    end

    Wrap.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            setState(not state)
        end
    end)

    hoverScale(Wrap, 1.01)
    setState(Default)
    return { Set = setState }
end

function Section:CreateInput(opts)
    opts = opts or {}
    local Name = opts.Name or "Input"
    local Placeholder = opts.Placeholder or ""
    local Callback = opts.Callback or function(_) end
    local Description = opts.Description
    local Theme = self.Theme

    local Wrap = create("Frame", {
        BackgroundColor3 = Theme.PanelAlt,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, Description and 60 or 40),
        Parent = self.Frame,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 10) }),
        create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
    })

    local Label = create("TextLabel", {
        Text = Name,
        Font = Enum.Font.GothamMedium,
        TextSize = 12,
        TextColor3 = Theme.Text,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -12, 0, 16),
        Position = UDim2.new(0, 10, 0, 6),
        Parent = Wrap,
    })

    if Description then
        local Desc = create("TextLabel", {
            Text = Description,
            Font = Enum.Font.Gotham,
            TextSize = 11,
            TextColor3 = Theme.Muted,
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            Size = UDim2.new(1, -12, 0, 14),
            Position = UDim2.new(0, 10, 0, 22),
            Parent = Wrap,
        })
    end

    local BoxY = Description and 36 or 20
    local Box = create("TextBox", {
        Text = "",
        PlaceholderText = Placeholder,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextColor3 = Theme.Text,
        PlaceholderColor3 = Theme.Muted,
        BackgroundColor3 = Theme.Panel,
        BorderSizePixel = 0,
        Size = UDim2.new(1, -20, 0, 18),
        Position = UDim2.new(0, 10, 0, BoxY),
        ClearTextOnFocus = false,
        Parent = Wrap,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 6) }),
    })

    Box.FocusLost:Connect(function(enter)
        task.spawn(Callback, Box.Text, enter)
    end)

    hoverScale(Wrap, 1.01)
    return Box
end

function Section:CreateSlider(opts)
    opts = opts or {}
    local Name = opts.Name or "Slider"
    local Min = opts.Min or 0
    local Max = opts.Max or 100
    local Default = opts.Default or Min
    local Callback = opts.Callback or function(_) end
    local Description = opts.Description
    local Theme = self.Theme

    local Wrap = create("Frame", {
        BackgroundColor3 = Theme.PanelAlt,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, Description and 66 or 44),
        Parent = self.Frame,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 10) }),
        create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
    })

    local Label = create("TextLabel", {
        Text = Name,
        Font = Enum.Font.GothamMedium,
        TextSize = 12,
        TextColor3 = Theme.Text,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -12, 0, 16),
        Position = UDim2.new(0, 10, 0, 6),
        Parent = Wrap,
    })

    if Description then
        local Desc = create("TextLabel", {
            Text = Description,
            Font = Enum.Font.Gotham,
            TextSize = 11,
            TextColor3 = Theme.Muted,
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            Size = UDim2.new(1, -12, 0, 14),
            Position = UDim2.new(0, 10, 0, 22),
            Parent = Wrap,
        })
    end

    local ValueLabel = create("TextLabel", {
        Text = tostring(Default),
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextColor3 = Theme.Muted,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Right,
        Size = UDim2.new(1, -12, 0, 16),
        Position = UDim2.new(0, 0, 0, 6),
        Parent = Wrap,
    })

    local TrackY = Description and 42 or 26
    local Track = create("Frame", {
        BackgroundColor3 = Theme.Panel,
        BorderSizePixel = 0,
        Size = UDim2.new(1, -20, 0, 8),
        Position = UDim2.new(0, 10, 0, TrackY),
        Parent = Wrap,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 4) }),
    })

    local Fill = create("Frame", {
        BackgroundColor3 = Theme.Accent,
        BorderSizePixel = 0,
        Size = UDim2.new(0, 0, 1, 0),
        Parent = Track,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 4) }),
    })

    local dragging = false
    local function setValue(v)
        v = clamp(v, Min, Max)
        local alpha = (v - Min) / (Max - Min)
        tween(Fill, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(alpha, 0, 1, 0) })
        ValueLabel.Text = tostring(math.floor(v))
        task.spawn(Callback, v)
    end

    Track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            local x = (input.Position.X - Track.AbsolutePosition.X) / Track.AbsoluteSize.X
            setValue(Min + (Max - Min) * x)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local x = (input.Position.X - Track.AbsolutePosition.X) / Track.AbsoluteSize.X
            setValue(Min + (Max - Min) * x)
        end
    end)

    hoverScale(Wrap, 1.01)
    setValue(Default)
    return { Set = setValue }
end

function Section:CreateDropdown(opts)
    opts = opts or {}
    local Name = opts.Name or "Dropdown"
    local Items = opts.Items or {}
    local Callback = opts.Callback or function(_) end
    local Description = opts.Description
    local Theme = self.Theme

    local baseHeight = Description and 60 or 40
    local Wrap = create("Frame", {
        BackgroundColor3 = Theme.PanelAlt,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, baseHeight),
        Parent = self.Frame,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 10) }),
        create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
    })

    local Label = create("TextLabel", {
        Text = Name,
        Font = Enum.Font.GothamMedium,
        TextSize = 12,
        TextColor3 = Theme.Text,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -12, 0, 16),
        Position = UDim2.new(0, 10, 0, 6),
        Parent = Wrap,
    })

    if Description then
        local Desc = create("TextLabel", {
            Text = Description,
            Font = Enum.Font.Gotham,
            TextSize = 11,
            TextColor3 = Theme.Muted,
            BackgroundTransparency = 1,
            TextXAlignment = Enum.TextXAlignment.Left,
            Size = UDim2.new(1, -12, 0, 14),
            Position = UDim2.new(0, 10, 0, 22),
            Parent = Wrap,
        })
    end

    local ButtonY = Description and 36 or 20
    local selected = nil
    local Button = create("TextButton", {
        Text = "Select (" .. tostring(#Items) .. ")",
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextColor3 = Theme.Muted,
        BackgroundColor3 = Theme.Panel,
        BorderSizePixel = 0,
        Size = UDim2.new(1, -20, 0, 18),
        Position = UDim2.new(0, 10, 0, ButtonY),
        TextXAlignment = Enum.TextXAlignment.Left,
        AutoButtonColor = false,
        Parent = Wrap,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 6) }),
        create("UIPadding", {
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
        }),
    })

    local Open = false
    local ListY = Description and 60 or 40
    local List = create("Frame", {
        BackgroundColor3 = Theme.Panel,
        BorderSizePixel = 0,
        Size = UDim2.new(1, -20, 0, 0),
        Position = UDim2.new(0, 10, 0, ListY),
        ClipsDescendants = true,
        ZIndex = 3,
        Parent = Wrap,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 8) }),
        create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
    })

    local ListLayout = create("UIListLayout", {
        Padding = UDim.new(0, 4),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = List,
    })

    local function rebuild()
        for _, child in ipairs(List:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end
        for _, item in ipairs(Items) do
            local Option = create("TextButton", {
                Text = tostring(item),
                Font = Enum.Font.Gotham,
                TextSize = 12,
                TextColor3 = Theme.Text,
                BackgroundColor3 = Theme.PanelAlt,
                BorderSizePixel = 0,
                Size = UDim2.new(1, -10, 0, 20),
                TextXAlignment = Enum.TextXAlignment.Left,
                AutoButtonColor = false,
                Parent = List,
            }, {
                create("UICorner", { CornerRadius = UDim.new(0, 6) }),
                create("UIPadding", {
                    PaddingLeft = UDim.new(0, 8),
                    PaddingRight = UDim.new(0, 8),
                }),
            })
            Option.MouseButton1Click:Connect(function()
                selected = item
                Button.Text = tostring(item)
                task.spawn(Callback, item)
                Open = false
                tween(List, TweenInfo.new(0.16), { Size = UDim2.new(1, -20, 0, 0) })
                tween(Wrap, TweenInfo.new(0.16), { Size = UDim2.new(1, 0, 0, baseHeight) })
            end)
        end
    end

    rebuild()

    Button.MouseButton1Click:Connect(function()
        Open = not Open
        local height = Open and (#Items * 24 + 8) or 0
        tween(List, TweenInfo.new(0.16), { Size = UDim2.new(1, -20, 0, height) })
        tween(Wrap, TweenInfo.new(0.16), { Size = UDim2.new(1, 0, 0, baseHeight + height) })
    end)

    hoverScale(Wrap, 1.01)
    return {
        SetItems = function(newItems)
            Items = newItems or {}
            rebuild()
            if not selected then
                Button.Text = "Select (" .. tostring(#Items) .. ")"
            end
        end
    }
end

function Window:Notify(opts)
    opts = opts or {}
    local Title = opts.Title or "Notification"
    local Text = opts.Text or ""
    local Duration = opts.Duration or 3
    local Theme = self.Theme

    if not self._notifyRoot then
        local Holder = create("Frame", {
            Name = "Notify",
            BackgroundTransparency = 1,
            Size = UDim2.new(0, 280, 1, -20),
            Position = UDim2.new(1, -300, 0, 10),
            Parent = self._gui,
        }, {
            create("UIListLayout", {
                Padding = UDim.new(0, 8),
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Top,
            }),
        })
        self._notifyRoot = Holder
    end

    local Card = create("Frame", {
        BackgroundColor3 = Theme.Panel,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, 60),
        Parent = self._notifyRoot,
    }, {
        create("UICorner", { CornerRadius = UDim.new(0, 10) }),
        create("UIStroke", { Color = Theme.Stroke, Thickness = 1 }),
    })

    local TitleLabel = create("TextLabel", {
        Text = Title,
        Font = Enum.Font.GothamSemibold,
        TextSize = 13,
        TextColor3 = Theme.Text,
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -26, 0, 18),
        Position = UDim2.new(0, 18, 0, 6),
        Parent = Card,
    })

    local Body = create("TextLabel", {
        Text = Text,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        TextColor3 = Theme.Muted,
        BackgroundTransparency = 1,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        Size = UDim2.new(1, -26, 0, 32),
        Position = UDim2.new(0, 18, 0, 22),
        Parent = Card,
    })

    -- Notification animations
    Card.Position = UDim2.new(1, 20, 0, 0)
    Card.BackgroundTransparency = 1
    for _, child in ipairs(Card:GetChildren()) do
        if child:IsA("TextLabel") then
            child.TextTransparency = 1
        end
    end

    tween(Card, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 0 })
    for _, child in ipairs(Card:GetChildren()) do
        if child:IsA("TextLabel") then
            tween(child, TweenInfo.new(0.2), { TextTransparency = 0 })
        end
    end

    task.delay(Duration, function()
        if Card and Card.Parent then
            tween(Card, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Position = UDim2.new(1, 20, 0, 0), BackgroundTransparency = 1 })
            for _, child in ipairs(Card:GetChildren()) do
                if child:IsA("TextLabel") then
                    tween(child, TweenInfo.new(0.12), { TextTransparency = 1 })
                end
            end
            task.wait(0.18)
            Card:Destroy()
        end
    end)
end

return setmetatable(HexoraUI, HexoraUI)




