--[[
╔══════════════════════════════════════════════════════════════╗
║          JWTG ULTIMATE HACK TOOL v3.1                       ║
║          Jurassic World The Game - Game Guardian            ║
║          Script by : ZydXie [GG]                            ║
║          Modified : Optimized Memory Regions                ║
║          Game ver  : 1.90.39                                ║
║          Contact   : t.me/zydxie                            ║
╚══════════════════════════════════════════════════════════════╝
--]]
HackingIsTheGame = 1776
-- ============================================================
-- STANDBY FUNCTION
-- ============================================================
function standby()
    gg.processResume()
    gg.setVisible(false)
    while true do
        if gg.isVisible(true) then
            gg.setVisible(false)
            return
        end
        gg.sleep(100)
    end
end

-- ============================================================
-- PERSISTENT DATA
-- ============================================================
local saved = { id_addr = nil, lvl_addr = nil, flags = nil }

-- ============================================================
-- UTILITY
-- ============================================================
function sortByName(t)
    table.sort(t, function(a, b) return a.name:lower() < b.name:lower() end)
end

function getNumber(prompt_text, default_val)
    while true do
        local result = gg.prompt({prompt_text}, {default_val}, {"number"})
        if result == nil then standby() else return result[1] end
    end
end

-- ============================================================
-- OPTIMIZED MEMORY REGIONS FOR JWTG
-- ============================================================
-- An (64) = Anonymous     ← Unity IL2CPP heap, MOST data here
-- Ca (4)  = C++ Alloc     ← Native allocations from libil2cpp
-- Cb (16) = C++ BSS       ← Static vars
-- Cd (8)  = C++ Data      ← Constants / initialized data
-- Total   = 92
local REGION_MASK = 64 + 4 + 16 + 8

function setRegions()
    gg.setRanges(REGION_MASK)
end

-- ============================================================
-- BIG ASCII BANNER
-- ============================================================
function showBanner()
    print("")
    print("╔═══════════════════════════╗")
    print("        JURASSIC WORLD - THE GAME                  ")
    print("        ULTIMATE HACK TOOL v2.3                    ")
    print("╠═══════════════════════════╣")
    print("        Game    : Jurassic World The Game         ")
    print("        Version : 1.90.39                         ")
    print("        Script  : ZydXie [GG]                     ")
    print("        Contact : t.me/zydxie                     ")
    print("╚═══════════════════════════╝")
    print("")
    gg.toast("🔥 JWTG ULTIMATE HACK v2.3 - By ZydXie")
end

-- ============================================================
-- DINOSAUR DATABASE (COMPLETE)
-- ============================================================
local dino_data = {}

-- CARNIVORES
dino_data["CARNIVORES 🍖"] = {
    {name="Acrocanthosaurus", id=-1923421315}, {name="Albertosaurus", id=772223371},
    {name="Allosaurus", id=899619543}, {name="Baryonyx", id=-1990641468},
    {name="Beckle Blondie", id=96331977}, {name="Beckle Brunette", id=-1325467529},
    {name="Beta", id=188668218}, {name="Big Eatie", id=1891732937},
    {name="Blue", id=-1640810987}, {name="Buck", id=1418401004},
    {name="Carnotaurus", id=1101086427}, {name="Ceratosaurus", id=-928015656},
    {name="Charlie", id=-1587119046}, {name="Compso Gen 2", id=280157698},
    {name="Compso JP2", id=1739976340}, {name="Compsognathus", id=2092190703},
    {name="Concavenator", id=320108132}, {name="Cryolophosaurus", id=-900772437},
    {name="Dakotaraptor", id=-231573096}, {name="Deinonychus", id=-1410955683},
    {name="Delta", id=1631523813}, {name="Dilophosaurus", id=428628137},
    {name="Dilophosaurus Gen 2", id=206992864}, {name="Dimetrodon", id=-59391110},
    {name="Doe", id=1881417407}, {name="Dracovenator", id=-516562060},
    {name="Echo", id=1561266457}, {name="Edaphosaurus", id=-1157956613},
    {name="Ghost", id=752040276}, {name="Giganotosaurus", id=1828181319},
    {name="Giganotosaurus Gen 2", id=-213372446}, {name="Gorgosaurus", id=-1112694027},
    {name="Guanlong", id=824631109}, {name="Irritator", id=274868500},
    {name="Irritator Gen 2", id=685802450}, {name="Junior", id=1776749182},
    {name="Leucistic Baryonyx", id=1243809399}, {name="Little Eatie", id=-1112746156},
    {name="Lythronax", id=-550468976}, {name="Majungasaurus", id=-1506057474},
    {name="Major", id=2030971959}, {name="Masiakasaurus", id=1995274011},
    {name="Megalosaurus", id=581241791}, {name="Metriacanthosaurus", id=-1028202083},
    {name="Monolophosaurus", id=-134714335}, {name="One-Armed Baryonyx", id=-352094913},
    {name="One-Eyed Allosaurus", id=-584593692}, {name="Ophiacodon", id=296334992},
    {name="Ostafrikasaurus", id=1215039218}, {name="Oviraptor", id=-1778244387},
    {name="Panthera", id=1594556859}, {name="Proceratosaurus", id=-1560125181},
    {name="Pyroraptor", id=156608990}, {name="Pyroraptor Dominion", id=-1853388446},
    {name="Rajasaurus", id=-1331163703}, {name="Red", id=-1678996102},
    {name="Rexy", id=1019074437}, {name="Rinchenia", id=-49765994},
    {name="Secodontosaurus", id=1829634238}, {name="Sinosauropteryx", id=-271362589},
    {name="Sphenacodon", id=-874670586}, {name="Spinosaurus", id=-1232845953},
    {name="Spinosaurus Gen 2", id=1155941169}, {name="Spinosaurus Rebirth (Spino Gen 3)", id=870413223},
    {name="Suchomimus", id=1393042012}, {name="T-Rex Bull", id=1259125636},
    {name="Tanycolagreus", id=1436272509}, {name="Tarbosaurus", id=-430983708},
    {name="The Big One", id=-568645282}, {name="The Cerato (Cerato Gen 2)", id=-915084322},
    {name="The Spino JP3", id=-858940349}, {name="Tiger", id=-264875118},
    {name="Toro", id=-1053503173}, {name="Troodon", id=1938481426},
    {name="Tyrannosaurus Rex", id=40481232}, {name="Tyrannosaurus Rex Gen 2", id=397647001},
    {name="Tyrannotitan", id=-1285400332}, {name="Utahraptor", id=1566851148},
    {name="Velociraptor", id=-93170300}, {name="Velociraptor Gen 2", id=-1934748652},
    {name="Yutyrannus", id=-348984074},
}
sortByName(dino_data["CARNIVORES 🍖"])

-- HERBIVORES
dino_data["HERBIVORES 🌿"] = {
    {name="Amargasaurus", id=1449929752}, {name="Angel", id=-831693255},
    {name="Ankylosaurus", id=-543227015}, {name="Ankylosaurus Gen 2", id=-565939585},
    {name="Antarctopelta", id=-1930745713}, {name="Apatosaurus", id=1225863842},
    {name="Aquilops", id=1004510449}, {name="Argentinosaurus", id=593764913},
    {name="Australotitan", id=289889214}, {name="Bajadasaurus", id=662471111},
    {name="Bonitasaura", id=828689896}, {name="Borealopelta", id=1709198154},
    {name="Brachiosaurus", id=-1440405685}, {name="Bumpy", id=-1592891285},
    {name="Corythosaurus", id=-1478947770}, {name="Deinocheirus", id=1962465506},
    {name="Diabloceratops", id=1086178365}, {name="Diplodocus", id=367404677},
    {name="Dodo", id=1229598679}, {name="Dracorex", id=-2057755024},
    {name="Dracorex Gen 2", id=1884742183}, {name="Dreadnoughtus", id=-802745447},
    {name="Edmontosaurus", id=-825574828}, {name="Einiosaurus", id=-1180410511},
    {name="Eolambia", id=-1911571793}, {name="Erlikosaurus", id=-1196263296},
    {name="Euplocephalus", id=1884519706}, {name="Fukuisaurus", id=721067753},
    {name="Gallimimus", id=1365354040}, {name="Homalocephale", id=-2046750789},
    {name="Iguanodon", id=22354924}, {name="Kentrosaurus", id=1025144099},
    {name="Koreanosaurus", id=-1035047909}, {name="Nasutoceratops", id=-851099630},
    {name="Nodosaurus", id=1966297937}, {name="Pachycephalosaurus", id=1966720555},
    {name="Pachyrhinosaurus", id=1481742726}, {name="Parasaurolophus", id=2007482531},
    {name="Parasaurolophus Gen 2", id=-1625353072}, {name="Pelecanimimus", id=717706909},
    {name="Pierce", id=571250531}, {name="Rebel", id=981247961},
    {name="Rodrigues Solitaire", id=819309449}, {name="Scelidosaurus", id=-1165376541},
    {name="Scolosaurus", id=378474081}, {name="Segnosaurus", id=1521446454},
    {name="Shunosaurus", id=-65947382}, {name="Sinoceratops", id=167618100},
    {name="Smoothie", id=-1985032250}, {name="Sonorasaurus", id=-785679876},
    {name="Stegosaurus", id=-1779588126}, {name="Stegosaurus Gen 2", id=1737466796},
    {name="Stegourus", id=1191790010}, {name="Struthiomimus", id=178485341},
    {name="Stygimoloch", id=126465803}, {name="Styracosaurus Lux", id=-253858672},
    {name="Supersaurus", id=1212583965}, {name="Therizinosaurus", id=-1743931416},
    {name="Therizinosaurus Gen 2", id=1689534356}, {name="Toujiangosaurus", id=-821387451},
    {name="Triceratops", id=-670191440}, {name="Triceratops Gen 2", id=711962878},
    {name="Tsintaosaurus", id=2055740954}, {name="Unaysaurus", id=1713688563},
    {name="Wuerhosaurus", id=-575092375}, {name="Yuxisaurus", id=-176360013},
    {name="Zalmoxes", id=-715461922},
}
sortByName(dino_data["HERBIVORES 🌿"])

-- PTEROSAURS
dino_data["PTEROSAURS 🕊️"] = {
    {name="Aerotitan", id=2010238695}, {name="Alanqa", id=669609303},
    {name="Anurognathus", id=2128082195}, {name="Arambourgiania", id=-574778929},
    {name="Cearadactylus", id=-1478277405}, {name="Coloborhynchus", id=966199354},
    {name="Darwinopterus", id=-99634386}, {name="Dimorphodon", id=991406221},
    {name="Dsungaripterus", id=-987723353}, {name="Eudimorphodon", id=-431140899},
    {name="Geosternbergia", id=-748115216}, {name="Hatzegopteryx", id=-1738689014},
    {name="Monkeydactyl", id=1896456531}, {name="Nyctosaurus", id=-493469469},
    {name="Ornithocheirus", id=708336235}, {name="Preondactylus", id=-1280730068},
    {name="Pteranodon", id=-779586877}, {name="Pteranodon Gen 2", id=-1001234550},
    {name="Pterodaustro", id=446142347}, {name="Pterodactylus", id=-968779196},
    {name="Quetzal Gen 2", id=469338137}, {name="Quetzalcoatlus", id=-1758792470},
    {name="Rhamphorhynchus", id=-2075709758}, {name="Scaphonagtus", id=-1188317494},
    {name="Tapejara", id=-69653029}, {name="Thalassodremius", id=-515569},
    {name="Tropeognathus", id=65958984}, {name="Tupandactylus", id=305981254},
    {name="Tupuxuara", id=-2043290788}, {name="Zhejiangopterus", id=1791880700},
}
sortByName(dino_data["PTEROSAURS 🕊️"])

-- AMPHIBIANS
dino_data["AMPHIBIANS 🐊"] = {
    {name="Acanthostega", id=-1391829152}, {name="Bageherpeton", id=1258282711},
    {name="Deinosuchus", id=1564255850}, {name="Diploceraspis", id=-1166911140},
    {name="Diplocaulus", id=-1122001595}, {name="Diplocaulus Gen 2", id=1333632267},
    {name="Eryops", id=2069924717}, {name="Gerrothorax", id=1298925661},
    {name="Gryposuchus", id=-1574880774}, {name="Ichthyostega", id=-357253751},
    {name="Kaprosuchus", id=1205504321}, {name="Kaprosuchus Gen 2", id=-1352508046},
    {name="Koolasuchus", id=624485828}, {name="Labyrinthhodontia", id=1642788664},
    {name="Limnoscelis", id=407190503}, {name="Mastodonsaurus", id=-1105140581},
    {name="Metoposaurus", id=-267990070}, {name="Metriorhynchus", id=914746593},
    {name="Microposaurus", id=961968637}, {name="Nundasuchus", id=765061825},
    {name="Pederpes Lux", id=-1017631101}, {name="Postosuchus", id=2059535625},
    {name="Prestosuchus", id=-1466238418}, {name="Prionosuchus", id=1712642478},
    {name="Proterogyrinus", id=-1988877534}, {name="Sarcosuchus", id=-2121385870},
    {name="Seymouria", id=1160646243},
}
sortByName(dino_data["AMPHIBIANS 🐊"])

-- SURFACES
dino_data["SURFACES 🌊"] = {
    {name="Barracudasaurus", id=-388063063}, {name="Edestus", id=-119647718},
    {name="Elasmosaurus", id=1121391763}, {name="Hainosaurus", id=467098229},
    {name="Helicoprion", id=1353460577}, {name="Kaiwhekea", id=-30666063},
    {name="Mauisaurus", id=104515922}, {name="Megalodon", id=-1586065800},
    {name="Mosasaurus", id=1992586605}, {name="Mosasaurus Gen 2", id=-1635999394},
    {name="Mosasaurus Rebirth (Gen 3)", id=-377777720}, {name="Onchopristis", id=-277970098},
    {name="Platecarpus", id=-1141247809}, {name="Plesiosaurus", id=-2051495450},
    {name="Plotosaurus", id=1134352729}, {name="Prognathodon", id=738704588},
    {name="Styxosaurus", id=948412072}, {name="Tylosaurus", id=1398946454},
}
sortByName(dino_data["SURFACES 🌊"])

-- REEF
dino_data["REEF 🐚"] = {
    {name="Archelon", id=1134792353}, {name="Dolichorhynchops", id=-186713791},
    {name="Goronyosaurus", id=1686906272}, {name="Hauffiosaurus", id=590865482},
    {name="Henodus", id=594319929}, {name="Kronosaurus", id=540919165},
    {name="Leptocleidus", id=305008788}, {name="Liopleurodon", id=944371444},
    {name="Ophthalmosaurus", id=389296485}, {name="Platypterygius", id=-1560866862},
    {name="Pliosaurus", id=1020658397}, {name="Protostega", id=396189273},
    {name="Psephoderma", id=-409183818}, {name="Rhomaleosaurus", id=-1574275586},
    {name="Temnodontosaurus", id=931389832}, {name="Trinacromerum", id=-100031873},
    {name="Umoonasaurus", id=-680550807},
}
sortByName(dino_data["REEF 🐚"])

-- CAVE
dino_data["CAVE ⛰️"] = {
    {name="Ammonite", id=1753442943}, {name="Baculites", id=-716348083},
    {name="Bananogmius", id=1530026786}, {name="Cameroceras", id=1124512546},
    {name="Dakosaurus", id=1763310270}, {name="Dunkleosteus", id=950565415},
    {name="Geosaurus", id=-2092443334}, {name="Gillicus", id=934303124},
    {name="Hyneria", id=899697514}, {name="Leedsichthys", id=-1789136650},
    {name="Orthacanthus", id=-1502271622}, {name="Plesiosuchus", id=1471491099},
    {name="Rhizodus", id=1062492190}, {name="Suchodus", id=-1765030566},
    {name="Tusoteuthis", id=-1489819329}, {name="Xiphactinus", id=-180341431},
}
sortByName(dino_data["CAVE ⛰️"])

-- SNOW
dino_data["SNOW ❄️"] = {
    {name="Ailurarctos", id=-984562933}, {name="Arctodus", id=1631621154},
    {name="Cervalces", id=689362882}, {name="Deinotherium", id=1903910004},
    {name="Diprotodon", id=-270396296}, {name="Eucladoceros", id=-363122807},
    {name="Marsupial Lion", id=-924081836}, {name="Mastodon", id=-230034235},
    {name="Megaloceros", id=1058151387}, {name="Mylodon", id=-1398033892},
    {name="Panthera Blytheae", id=2043818263}, {name="Sarkastodon", id=966987009},
    {name="Smilodon", id=1107178272}, {name="Synthetoceras", id=1745174245},
    {name="Thylacosmilus", id=-240406446}, {name="Woolly Mammoth (Mamut)", id=-1740156257},
    {name="Woolly Rhinoceros", id=-1294393739},
}
sortByName(dino_data["SNOW ❄️"])

-- SAVANNAH
dino_data["SAVANNAH 🌾"] = {
    {name="Archaeotherium", id=-1788306124}, {name="Brontotherium", id=779908489},
    {name="Elasmotherium", id=-592215760}, {name="Entelodon", id=1350322905},
    {name="Gastornis", id=1909407380}, {name="Indricotherium", id=123636838},
    {name="Kelenken", id=721108216}, {name="Phorusrhacos", id=1751753707},
    {name="Procoptodon", id=-243375428}, {name="Uintatherium", id=1074417044},
    {name="Urtinotherium", id=391343941},
}
sortByName(dino_data["SAVANNAH 🌾"])

-- CAVERN
dino_data["CAVERN 🏔️"] = {
    {name="Amphicyon", id=-332037305}, {name="Andrewsarchus", id=117747839},
    {name="Carbonemys", id=-1137197151}, {name="Doedicurus", id=413525642},
    {name="Eremotherium", id=513419020}, {name="Gigantophis", id=1336203057},
    {name="Glyptodon", id=122252079}, {name="Hyaenodon", id=-2063805018},
    {name="Megatherium", id=-1962550559}, {name="Megistotherium", id=1297895624},
    {name="Meiolania", id=-2133883974}, {name="Panochthus", id=-2004097604},
    {name="Titanoboa", id=-380302569},
}
sortByName(dino_data["CAVERN 🏔️"])

-- HYBRIDS
dino_data["HYBRIDS 🧬"] = {
    {name="Alangasaurus", id=-1550549753}, {name="Allonogmius", id=1715886499},
    {name="Andrewtherium", id=1028936594}, {name="Ankylodocus", id=-1412657350},
    {name="Archaeophicyon", id=-2080931006}, {name="Armormata", id=156445524},
    {name="Bagehesaurus", id=1952162803}, {name="Carnoraptor", id=403122970},
    {name="Cerazinosaurus", id=1527506207}, {name="Chromaspinus", id=-1570963456},
    {name="Compsovenator", id=1015311692}, {name="Cryolobourgiania", id=-1582361500},
    {name="Dakoderma", id=1240872332}, {name="Dilophoboa", id=-1269895908},
    {name="Diplotator", id=1973217715}, {name="Draco Lux", id=-1841717071},
    {name="Dracoceratops", id=1748409810}, {name="Dreadactylus", id=-2087041282},
    {name="Dunkleosaurus", id=613996072}, {name="Entelorhacos", id=756797681},
    {name="Erliphosaurus", id=1823466648}, {name="Fukuimimus", id=999978268},
    {name="Geolasmosaurus", id=1046841848}, {name="Giganocephalus", id=-1520394299},
    {name="Gillirhynchops", id=1459515785}, {name="Glythronax", id=-218653987},
    {name="Gorgosuchus", id=1148247156}, {name="Hynecoprion", id=-75947127},
    {name="Iguanosuchus", id=-632627264}, {name="Indominus Rex", id=-147892553},
    {name="Indominus Rex Gen 2", id=194436811}, {name="Indricoceros", id=1734888078},
    {name="Kaprodachtylus", id=-1078620487}, {name="Koolasaurus", id=51859746},
    {name="Labyrinthosaurus", id=-718741931}, {name="Leptostega", id=-798039628},
    {name="Limnorhynchus", id=-782527033}, {name="Liosichtodon", id=1397156379},
    {name="Mammotherium", id=-1051584817}, {name="Megarchelion", id=785006804},
    {name="Megistocurus", id=-1173248534}, {name="Metrialong", id=893259578},
    {name="Metriaphodon", id=1692405504}, {name="Nundagosaurus", id=-704664302},
    {name="Ophthacerapsis", id=-676392169}, {name="Ophiacomimus", id=-56755887},
    {name="Ostaposaurus", id=-175221467}, {name="Pachyceratops", id=121995842},
    {name="Pachygalosaurus", id=2639451}, {name="Parasaura", id=-187694959},
    {name="Pelecanipteryx", id=-60998544}, {name="Priotrodon", id=-1779841202},
    {name="Pteraquetzal", id=-365098277}, {name="Rajastega", id=1097349633},
    {name="Rhinoprotodon", id=-1265948185}, {name="Sah Panthera", id=-1202757183},
    {name="Scorpios Rex", id=-1515170250}, {name="Scorpios Rex Gen 2", id=-708142142},
    {name="Secodontognathus", id=-2017173346}, {name="Segnosuchus", id=-24045446},
    {name="Skoolasaurus", id=1564722760}, {name="Smithetoceras", id=-2078662216},
    {name="Spinoceratops", id=-1409718305}, {name="Spinoraptor", id=-1052162259},
    {name="Stegoceratops", id=461260072}, {name="Suchoripterus", id=1654215819},
    {name="Suprannotitan", id=-1157170275}, {name="Tapejalosaurus", id=1497467848},
    {name="Tropeogopterus", id=213283072}, {name="Tyrannolophosaur", id=1342369609},
    {name="Unayrhynchus", id=370378159}, {name="Xinathodon", id=77664121},
    {name="Yudon", id=-1925448439}, {name="Zalmonodon", id=-1705002253},
}
sortByName(dino_data["HYBRIDS 🧬"])

-- SUPER HYBRIDS
dino_data["SUPER HYBRIDS 🧬💪"] = {
    {name="Dimetrocarnus", id=-1737804847}, {name="Diplosuchus", id=-336036848},
    {name="Gigakylocephalus", id=751034065}, {name="Hydraboa", id=-1054185433},
    {name="Indoraptor", id=883871771}, {name="Indoraptor Gen 2", id=-959655851},
    {name="Megalocevia", id=-214093024}, {name="Monostegotops", id=-1994092941},
    {name="Pelecachtylus", id=-716312085}, {name="Quetzaljara", id=-1408411774},
    {name="Skoonasaurus", id=1869980874}, {name="Spinotasuchus", id=673899032},
    {name="Spinotops", id=250860212}, {name="Tapejalocephalus", id=-1018223924},
}
sortByName(dino_data["SUPER HYBRIDS 🧬💪"])

-- BOSSES
dino_data["BOSSES 😈🔥"] = {
    {name="Akupara 81", id=-735781951}, {name="Alfa 06", id=-137486411},
    {name="Behemot 93", id=-1780705807}, {name="Coloso 04", id=1464691822},
    {name="Distortus Rex", id=-358780502}, {name="Fenix 44", id=949031941},
    {name="Imperatosuchus 53", id=93499547}, {name="Juggernaut 32", id=-998063698},
    {name="Kraken 18", id=-571632332}, {name="Mortem Rex", id=519140120},
    {name="Muerte DoDo", id=-369086997}, {name="Omega 09", id=-1508593356},
    {name="Ouroboros 66", id=-956413745}, {name="Salamander 16", id=-1863210213},
    {name="Valkyrie 77", id=1237788383}, {name="Voragine 08", id=517337621},
    {name="Vulcano 19", id=522063944},
}
sortByName(dino_data["BOSSES 😈🔥"])

-- CATEGORY KEYS
local category_keys = {
    "CARNIVORES 🍖", "HERBIVORES 🌿", "PTEROSAURS 🕊️", "AMPHIBIANS 🐊",
    "SURFACES 🌊", "REEF 🐚", "CAVE ⛰️", "SNOW ❄️", "SAVANNAH 🌾",
    "CAVERN 🏔️", "HYBRIDS 🧬", "SUPER HYBRIDS 🧬💪", "BOSSES 😈🔥",
}

-- ============================================================
-- TRADE TYPE DEFINITIONS
-- ============================================================
local TRADE_TYPE = {
    {name="『1』🦕 Dinosaur", id=0, has_real_id=true},
    {name="『2』🏗️ Building", id=1, has_real_id=true},
    {name="『3』🎨 Decoration", id=2, has_real_id=true},
    {name="『4』🧬 DNA", id=3, has_real_id=false},
    {name="『5』🍔 Food", id=4, has_real_id=false},
    {name="『6』💰 Coin", id=5, has_real_id=false},
    {name="『7』💵 Cash", id=6, has_real_id=false},
    {name="『8』⭐ Loyalty Points", id=7, has_real_id=false},
    {name="『9』👑 Boss DNA", id=8, has_real_id=false},
    {name="『10』🎫 Amber", id=9, has_real_id=false},
    {name="『11』🧩 Fragments/Shards", id=10, has_real_id=true},
    {name="『12』🔧 Mods", id=11, has_real_id=true},
    {name="『13』🧬 S-DNA", id=12, has_real_id=true},
}

-- ============================================================
-- TRADE-SPECIFIC DATABASES
-- ============================================================

-- Buildings
local building_db = {}
building_db["COMMON"] = {
    {name="Acu Security Office", id=-2115132413},
    {name="Amazing Maze", id=-2032241996},
    {name="Badlanda Amphitheater", id=-1483492551},
    {name="Big Bite Burger Restaurant", id=1894282273},
    {name="Cloud Nine Ballon Ride", id=-1894107255},
    {name="Communication Station", id=-534281293},
    {name="Discovery Dig Site", id=1770805621},
    {name="Dizzy Dino Ride", id=77237266},
    {name="Egg Spinner Ride", id=704749173},
    {name="Extinction Roller Coaster", id=-1299151072},
    {name="Flying Ride", id=451987619},
    {name="Heliport", id=826593355},
    {name="Hologram Museum", id=-162004717},
    {name="Horizon Observatory", id=2137758808},
    {name="Ice Cream Stand", id=-1048447638},
    {name="Jungle Bean Coffee Shop", id=1148452710},
    {name="Jurassic Arcade", id=967330073},
    {name="Jurassic Drop Tower", id=1763625346},
    {name="Little Fossil Gift Shop", id=731852446},
    {name="Maintenance Facility", id=-2040279077},
    {name="Navigator Blimp Ride", id=366814250},
    {name="Party Hut", id=-994941130},
    {name="Power Generator", id=-1699182382},
    {name="Pterosauria Cineplex", id=224163545},
    {name="Revolution Ferris Wheel", id=-477328136},
    {name="Sky Point", id=1573211900},
    {name="Solar Tracker", id=-1184513118},
    {name="Speedy Go Kart Circuit", id=1405320306},
    {name="Triple Crown Hotel", id=113373905},
    {name="Wild Waterfalls", id=8991235},
}
sortByName(building_db["COMMON"])

building_db["VIP"] = {
    {name="Revenue Tower", id=627462233},
    {name="Dino of the Deep Ride", id=1740305612},
    {name="Heat Nightclub", id=-845512984},
    {name="Main Street Bistro", id=-142703287},
    {name="Natural Science Center", id=1979638064},
    {name="Pagoda Garden", id=1425214257},
    {name="Solar Greenhouse", id=-1105918349},
    {name="Supper Club", id=510034534},
    {name="Wildlive Preservation", id=-444290909},
    {name="Wind Turbine", id=-1934950112},
    {name="Zip Line Ride", id=427069590},
}
sortByName(building_db["VIP"])
local building_categories = {"COMMON", "VIP"}

-- Decorations
local deco_db = {}
deco_db["COMMON"] = {
    {name="Amber Pedestial", id=-1760676826},
    {name="Apatosaurus Fossil", id=452427227},
    {name="Apatosaurus Garden Sculpture", id=-380760941},
    {name="Bonfire", id=506389324},
    {name="Carnivorous Plant", id=203282750},
    {name="Cherry Blossom Park", id=75957830},
    {name="Daisy Bed", id=471806689},
    {name="Flowerbed", id=-1659643892},
    {name="Fountain", id=-890115442},
    {name="Gazebo", id=-1840664448},
    {name="Geyser", id=1099996274},
    {name="John Hammond Memorial", id=-252737352},
    {name="Jungle Conservation", id=-50253108},
    {name="Jurassic World Flag", id=-328316449},
    {name="Lava Crater", id=-1742472189},
    {name="Modern Arch", id=2053427703},
    {name="Mosasaurus Sculpture", id=475348004},
    {name="Mystery Cavern", id=-690934920},
    {name="Park Oasis", id=379899900},
    {name="Park of Prehistory", id=205812938},
    {name="Stegosaurus Garden Sculpture", id=900898259},
    {name="Tar Pit", id=-1718690042},
    {name="Triceratops Sculpture", id=-1172162672},
    {name="Tropical Boulevard", id=1067873184},
    {name="Tropical Planter", id=-896388521},
    {name="Tyrannosaurus Topiary", id=1166975718},
    {name="Velociraptor Garden Sculpture", id=-560780693},
    {name="Water Path Garden", id=-1573299598},
    {name="Wooden Bridge", id=1041157981},
}
sortByName(deco_db["COMMON"])

deco_db["VIP"] = {
    {name="Ammonite Oasis", id=504851324},
    {name="Badge Beacon", id=-852413883},
    {name="Brachiosaurus Sculpture", id=-1268232173},
    {name="Clock Tower", id=352124288},
    {name="Earth Park", id=821951616},
    {name="Indoraptor Skylight", id=266163637},
    {name="MR. DNA Statue", id=-1489370798},
    {name="Ocean Fountain", id=-1617945622},
    {name="Paradise Lagoon", id=-1085599335},
    {name="Rainforest Pavilion", id=-218378741},
    {name="Spinosaurus Skeleton", id=1805323180},
    {name="Sundial", id=-806329226},
    {name="Triceratops Exhibit", id=427738399},
}
sortByName(deco_db["VIP"])

deco_db["LIMITED"] = {
    {name="10th Anniversary", id=-258499418},
    {name="30th Anniversary Topiary", id=768852875},
    {name="4th Anniversary", id=-1289510396},
    {name="6th Anniversary", id=-746645681},
    {name="7th Anniversary", id=250203850},
    {name="8th Anniversary", id=697900031},
    {name="9th Anniversary", id=-200293766},
    {name="Amber Motorcycle", id=-1195596305},
    {name="Angel and Rebel", id=658105486},
    {name="Biosyn Fountain", id=218944938},
    {name="Blue Statue", id=-1785241481},
    {name="Blue and Beta", id=-94688805},
    {name="Booster Legacy", id=-1870782173},
    {name="Bumpy's Statue", id=1352911750},
    {name="Charlie Statue", id=-1036375985},
    {name="Commemorative Bell", id=1949226078},
    {name="D Rex Statue", id=1141984432},
    {name="Delta Statue", id=1794234147},
    {name="Dodo Easter Statue", id=-766439695},
    {name="Echo Statue", id=480622185},
    {name="Haast Statue", id=1234806743},
    {name="Incubator Egg Statue", id=-1409675954},
    {name="Jurassic Park Gates", id=-1418590269},
    {name="Jurassic Park T. Rex", id=1559759805},
    {name="Land and Sea Rival Park", id=1000892167},
    {name="Mammoth Diorama", id=100144443},
    {name="Megatherium Diorama", id=1975559997},
    {name="Nodosaurus Fossil", id=-1940619558},
    {name="Rex Rival Park", id=-1629520660},
    {name="Scorpios Rex Statue", id=-308089113},
    {name="Smilodon Diorama", id=-1845385825},
    {name="Snack Statue", id=2041039507},
    {name="Titanoboa Diorama", id=697020531},
}
sortByName(deco_db["LIMITED"])
local deco_categories = {"COMMON", "VIP", "LIMITED"}

-- Boss statues
local boss_statues_data = {
    {name="Akupara 81 (Gold)", id=203199187},
    {name="Akupara 81", id=-735781951},
    {name="Alfa 06 (Gold)", id=1444559527},
    {name="Alfa 06", id=-153991617},
    {name="Behemot 93 (Gold)", id=-1135756980},
    {name="Behemot 93", id=-397666220},
    {name="Coloso 04 (Gold)", id=-1536862410},
    {name="Coloso 04", id=1511097404},
    {name="Dodo de la Muerte (Gold)", id=-2010820612},
    {name="Dodo de la Muerte", id=686633828},
    {name="Fenix 44 (Gold)", id=1897514044},
    {name="Fenix 44", id=-1809034836},
    {name="Imperatosuchus 53 (Gold)", id=1630620922},
    {name="Imperatosuchus 53", id=-2128948937},
    {name="Juggernaut 32 (Gold)", id=-365400059},
    {name="Juggernaut 32", id=169078216},
    {name="Kraken 18 (Gold)", id=-1238538682},
    {name="Kraken 18", id=1213838668},
    {name="Mortem Rex (Gold)", id=-404513622},
    {name="Mortem Rex", id=130548071},
    {name="Omega 09 (Gold)", id=1700107005},
    {name="Omega 09", id=-1479839203},
    {name="Ouroboros 66 (Gold)", id=-480609928},
    {name="Ouroboros 66", id=57795765},
    {name="Salamandra 16 (Gold)", id=948112181},
    {name="Salamandra 16", id=-660039944},
    {name="Valquiria 77 (Gold)", id=-281760963},
    {name="Valquiria 77", id=253703920},
    {name="Vortice 08 (Gold)", id=1230544733},
    {name="Vortice 08", id=-1402139955},
    {name="Vulcano 19 (Gold)", id=-158750391},
    {name="Vulcano 19", id=379729028},
}
sortByName(boss_statues_data)

-- Mods
local mod_db = {
    {name="Adrenaline Rush", id=-2121196462},
    {name="Alpha", id=25394345},
    {name="Armored Hide", id=-1890937760},
    {name="Berserk", id=-387917412},
    {name="Bind", id=1911130150},
    {name="Bleed", id=412634600},
    {name="Charge", id=-883749373},
    {name="Clone", id=-129129226},
    {name="Distraction", id=573614902},
    {name="Endurance", id=-1153828212},
    {name="Inspire", id=1899986661},
    {name="Intimidation", id=-1299204441},
    {name="Invigorate", id=1895634130},
    {name="Killer Instinct", id=-1624170551},
    {name="Mirror", id=1017243203},
    {name="Nullify", id=1988381759},
    {name="Piercing Bite", id=-1735774957},
    {name="Predation", id=-2030249909},
    {name="Protectors", id=530129420},
    {name="Rally", id=1381654457},
    {name="Randomize", id=-399102113},
    {name="Regenerate", id=-1515669511},
    {name="Shuffle", id=-1564118048},
    {name="Siphoning Bite", id=-235149091},
    {name="Spikes", id=1872723326},
    {name="Splinter", id=-760248465},
    {name="Steal", id=1760737639},
    {name="Survival", id=1288377036},
    {name="Terrify", id=104353395},
    {name="Tough Skin", id=133833796},
    {name="Toxin", id=-708689034},
    {name="Vitality", id=626880303},
    {name="Wound", id=-980908495},
    {name="Split Wound", id=1830411669},
}
sortByName(mod_db)

-- S-DNA
local sadn_db = {
    {name="Ankylosaurus", id=-543227015},
    {name="Dimetrodon", id=-59391110},
    {name="Edaphosaurus", id=-1157956613},
    {name="Edestus", id=-119647718},
    {name="Euoplocephalus", id=1884519706},
    {name="Kaprosuchus", id=1205504321},
    {name="Kentrosaurus", id=1025144099},
    {name="Monolophosaurus", id=-134714335},
    {name="Sarcosuchus", id=-2121385870},
    {name="Tapejara", id=-69653029},
    {name="Tupandactylus", id=305981254},
    {name="Velociraptor", id=-93170300},
}
sortByName(sadn_db)

-- Resource IDs (Trade Port)
local resource_ids = {
    {name="Dinosaur", id=0}, {name="Building", id=1}, {name="Decoration", id=2},
    {name="DNA", id=3}, {name="Food", id=4}, {name="Coin", id=5}, {name="Cash", id=6},
    {name="Loyalty Points", id=7}, {name="Boss DNA", id=8}, {name="Amber", id=9},
    {name="Shards/Fragments", id=10}, {name="Mods", id=11}, {name="S-DNA", id=12},
}

-- Resource values (for search)
local resource_values = {
    {name="Food / DNA / Cash / Coins / B-DNA / VIP", id=377287197},
    {name="XP", id=-210600260},
    {name="S-DNA", id=2010228124},
}

-- Fragment data (Heroic dinos)
local fragment_data = {
    {dino="Triceratops", id=-670191440, mission=5, hj="1769100302;1634887011", jj="1769100302;1634887011"},
    {dino="Postosuchus", id=2059535625, mission=5, hj="1936674830;1970499444", jj="1936674830;1970499444"},
    {dino="Dilophosaurus", id=428628137, mission=5, hj="1818838030;1869115503", jj="1818838030;1869115503"},
    {dino="Pteranodon", id=-779586877, mission=5, hj="1702121486;1869504882", jj="1702121486;1869504882"},
    {dino="Blue", id=-1640810987, mission=5, hj="1970029070;1145324645", jj="1970029070;1145324645"},
    {dino="Rexy", id=1019074437, mission=5, hj="2019906062;1145324665", jj="2019906062;1145324665"},
    {dino="Smoothie", id=-1985032250, mission=5, hj="1869435662;1768453231", jj="1869435662;1768453231"},
}

-- Loyalty reward types
local loyalty_rewards = {
    {name="🍔 Food", id=0}, {name="🧬 DNA", id=1}, {name="💰 Coins", id=2},
    {name="💵 Cash", id=3}, {name="⭐ Loyalty Points", id=4},
}

-- Admin test dinos
local admin_test_dinos = {
    {name="⚠️ Allosaurus 2", id=2092012817},
    {name="⚠️ Ankylosaurus 1", id=-1408633333},
    {name="⚠️ Ankylosaurus 2", id=1314336660},
    {name="⚠️ Ankylosaurus 4", id=-1489728863},
    {name="⚠️ Carno 2", id=-1634015379},
    {name="⚠️ Corythosaurus 1", id=150763225},
    {name="⚠️ HCarno 1", id=-1730238124},
    {name="⚠️ HSpinosaurus 1", id=15221437},
    {name="⚠️ Indominus 2", id=313794202},
    {name="⚠️ Indominus 3", id=1706241548},
    {name="⚠️ Ostafrikasaurus 2", id=210583644},
    {name="⚠️ Spinosaurus 1", id=-555885856},
    {name="⚠️ Stegosaurus 1", id=1851455511},
    {name="⚠️ Stegosaurus 4", id=506465432},
    {name="⚠️ Triceratops 2", id=-769223845},
    {name="⚠️ Triceratops 4", id=994391662},
    {name="⚠️ Tyrannosaurus 1", id=1536634571},
    {name="⚠️ Tyrannosaurus 2", id=-1029800079},
    {name="⚠️ Tyrannosaurus 3", id=-1248243737},
    {name="⚠️ Tyrannosaurus 4", id=738056772},
    {name="⚠️ Velociraptor 1", id=-1128692056},
    {name="⚠️ Velociraptor 2", id=632346386},
    {name="⚠️ Velociraptor 4", id=-858557913},
}
sortByName(admin_test_dinos)

-- ============================================================
-- UI HELPERS
-- ============================================================
function showItemList(title, items, has_back)
    local list = {}
    for i, item in ipairs(items) do
        table.insert(list, i .. ". " .. item.name)
    end
    if has_back then table.insert(list, "← Back") end
    while true do
        local ch = gg.choice(list, nil, title)
        if ch == nil then standby()
        elseif has_back and ch == #list then return nil
        else return items[ch] end
    end
end

-- ============================================================
-- DINO HACK FUNCTIONS
-- ============================================================
function selectCategory()
    local items = {}
    for _, k in ipairs(category_keys) do table.insert(items, k) end
    table.insert(items, "← Back to Main Menu")
    while true do
        local choice = gg.choice(items, nil, "📂 SELECT DINOSAUR CATEGORY")
        if choice == nil then standby()
        elseif items[choice] == "← Back to Main Menu" then return nil
        else return items[choice] end
    end
end

function selectDinosaur(category_name, prompt_title)
    local dino_list = dino_data[category_name]
    if not dino_list then gg.alert("Category not found!"); return nil end
    local names = {}
    for i, d in ipairs(dino_list) do table.insert(names, i .. ". " .. d.name) end
    table.insert(names, "← Back to categories")
    table.insert(names, "🏠 Back to Main Menu")
    while true do
        local choice = gg.choice(names, nil, prompt_title)
        if choice == nil then standby()
        elseif choice == #names then return "EXIT"
        elseif choice == #names - 1 then return nil
        else return dino_list[choice] end
    end
end

function editSavedAddresses(new_id, new_level)
    if saved.id_addr == nil or saved.lvl_addr == nil then
        gg.alert("✖️ No saved addresses.\nRun first-time hack first.")
        return false
    end
    gg.setVisible(false)
    local edits = {
        { address = saved.id_addr, flags = saved.flags, value = new_id },
        { address = saved.lvl_addr, flags = saved.flags, value = new_level }
    }
    gg.setValues(edits)
    gg.setVisible(true)
    print("⚡ INSTANT EDIT: ID → " .. new_id .. ", Level → " .. new_level)
    gg.toast("✔️ INSTANT EDIT! Dino changed!")
    return true
end

function firstTimeHack(dino1, level1, dino2, level2)
    print("")
    print("========================================")
    print("FIRST TIME HACK - Searching pattern...")
    print("Special Offer: " .. dino1.name .. " | Level: " .. level1)
    print("Target:        " .. dino2.name .. " | Level: " .. level2)
    print("========================================")
    gg.setVisible(false)
    local search_pattern = "5;1;" .. dino1.id .. ";" .. level1 .. ":13"
    print("🔍 Searching: " .. search_pattern)
    gg.clearResults()
    setRegions() -- OPTIMIZED: Only scan game-relevant memory
    gg.searchNumber(search_pattern, gg.TYPE_DWORD, false, nil, nil, nil, 0)
    local count = gg.getResultsCount()
    gg.setVisible(true)
    print("📊 Found " .. count .. " result(s)")
    if count > 0 then
        local results = gg.getResults(count)
        local edited_data = {}
        local id_edited = false; local level_edited = false
        for _, v in ipairs(results) do
            if v.value == dino1.id then
                saved.id_addr = v.address; saved.flags = v.flags
                table.insert(edited_data, { address = v.address, flags = v.flags, value = dino2.id })
                id_edited = true
            elseif v.value == level1 then
                saved.lvl_addr = v.address; saved.flags = v.flags
                table.insert(edited_data, { address = v.address, flags = v.flags, value = level2 })
                level_edited = true
            end
        end
        if #edited_data > 0 then
            gg.setVisible(false); gg.setValues(edited_data); gg.clearResults(); gg.setVisible(true)
        end
        if id_edited and level_edited then
            gg.toast("✔️ SUCCESS! " .. dino2.name .. " Lv." .. level2)
            gg.alert("✔️ SUCCESS!\n\n" .. dino2.name .. " Level " .. level2 .. "\nQuick Hack is now [READY].")
            return true
        else
            local msg = "⚠️ Incomplete:\n"
            if not id_edited then msg = msg .. "- ID not found\n" end
            if not level_edited then msg = msg .. "- Level not found\n" end
            msg = msg .. "\nVerify special offer dino is in the shop."
            gg.alert(msg); return false
        end
    else
        gg.alert("✖️ FAILED!\n\nNo search results.\nCheck special offer availability.")
        return false
    end
end

function doFirstTimeHack()
    local cat = selectCategory(); if cat == nil then return end
    local dino1
    while true do
        dino1 = selectDinosaur(cat, "INPUT 1 - Select SPECIAL OFFER Dino")
        if dino1 == nil then cat = selectCategory(); if cat == nil then return end
        elseif dino1 == "EXIT" then return else break end
    end
    local level1 = getNumber("Enter SPECIAL OFFER level:", 10)
    local target_cat = selectCategory(); if target_cat == nil then return end
    local dino2
    while true do
        dino2 = selectDinosaur(target_cat, "INPUT 2 - Select TARGET Dino")
        if dino2 == nil then target_cat = selectCategory(); if target_cat == nil then return end
        elseif dino2 == "EXIT" then return else break end
    end
    local level2 = getNumber("Enter desired level (Max 40):", 40)
    local success = firstTimeHack(dino1, level1, dino2, level2)
    if not success then saved.id_addr = nil; saved.lvl_addr = nil; saved.flags = nil end
end

function doQuickHack()
    if saved.id_addr == nil or saved.lvl_addr == nil then
        gg.alert("✖️ QUICK HACK LOCKED\n\nNo saved addresses.\nRun 'Hack Dinosaur' first time to unlock.")
        return
    end
    local target_cat = selectCategory(); if target_cat == nil then return end
    local dino2
    while true do
        dino2 = selectDinosaur(target_cat, "QUICK - Select TARGET Dino")
        if dino2 == nil then target_cat = selectCategory(); if target_cat == nil then return end
        elseif dino2 == "EXIT" then return else break end
    end
    local level2 = getNumber("Enter desired level (Max 40):", 40)
    if editSavedAddresses(dino2.id, level2) then
        gg.alert("✔️ INSTANT SUCCESS!\n\n" .. dino2.name .. " Level " .. level2)
    end
end

function doResetDino()
    local confirm
    while true do
        confirm = gg.choice({"✔️ Yes, reset saved addresses","✖️ Cancel"}, nil,
            "🔄 RESET DINOSAUR?\n\nNext hack will need Special Offer again.")
        if confirm == nil then standby()
        elseif confirm == 1 then
            saved.id_addr = nil; saved.lvl_addr = nil; saved.flags = nil
            gg.alert("🔄 RESET DONE\n\nQuick Hack is now [LOCKED]."); return
        else return end
    end
end

function showDinoHowToUse()
    gg.alert([[
❔ HACK DINOSAUR - HOW TO USE:

[FIRST TIME - SPECIAL OFFER REQUIRED]
1. Find a special offer dino in the game
2. Note the name & level
3. Select "Hack Dino [first time]"
4. Enter the special offer dino & level
5. Enter the target dino & level you want
6. Script auto searches & replaces
7. Address saved for Quick Hack

[QUICK HACK - AFTER FIRST TIME]
1. Just select the target dino & level
2. Instant edit, no re-search needed!

[RESET DINO]
1. Clear saved addresses
2. Return to first time mode

⚠️ Max normal dino level: 40
    ]])
end

-- ============================================================
-- REWARD HACK FUNCTIONS
-- ============================================================
function doHackRewardByType(reward_index)
    local selected_reward = loyalty_rewards[reward_index]

    gg.alert("📌 INSTRUCTION\n\n1. Open a loyalty pack in the game\n2. Look at the CURRENT amount (e.g. 500)\n3. You'll enter that, plus the DESIRED amount")

    local current_amount = getNumber("Enter CURRENT amount (what's shown):", 500)
    local target_amount = getNumber("Enter DESIRED amount (what you want):", 999999)

    print("")
    print("========================================")
    print("HACKING " .. selected_reward.name .. "...")
    print("Current: " .. current_amount .. " → Target: " .. target_amount)
    print("========================================")

    gg.setVisible(false)
    local search_pattern = "377287197;100;" .. selected_reward.id .. ";" .. current_amount .. ":13"
    print("🔍 Searching: " .. search_pattern)
    gg.clearResults()
    setRegions() -- OPTIMIZED: Only scan game-relevant memory
    gg.searchNumber(search_pattern, gg.TYPE_DWORD, false, nil, nil, nil, 0)
    local count = gg.getResultsCount()
    print("📊 Found " .. count .. " result(s)")

    if count > 0 then
        local results = gg.getResults(count)
        local edited = 0
        for _, v in ipairs(results) do
            if v.value == current_amount then
                gg.setValues({ { address = v.address, flags = v.flags, value = target_amount } })
                edited = edited + 1
            end
        end
        gg.clearResults()
        gg.setVisible(true)
        if edited > 0 then
            print("✔️ Edited " .. edited .. " value(s): " .. current_amount .. " → " .. target_amount)
            gg.toast("✔️ " .. selected_reward.name .. " HACKED!")
            gg.alert("✔️ SUCCESS!\n\n" .. selected_reward.name .. "\n" .. current_amount .. " → " .. target_amount .. "\n\nGo claim the pack in game!")
        else
            gg.setVisible(true)
            gg.alert("⚠️ No matching values to edit.\nMake sure the current amount is correct.")
        end
    else
        gg.setVisible(true)
        gg.alert("✖️ FAILED!\n\nNo search results.\n\nMake sure:\n1. You opened a loyalty pack\n2. The amount matches what's shown")
    end
end

function showRewardHowToUse()
    gg.alert([[
❔ HACK RESOURCES VIA REWARD:

1. Open a loyalty pack in the game
   (Dino Rewards / Any reward pack)
2. Note the CURRENT amount shown
3. Pick the resource you want to hack:
   - Food / DNA / Coins / Cash / LP
4. Enter the current amount
5. Enter the desired amount
6. Auto search + edit!
7. Go back to the game, claim the pack

⚠️ Make sure the pack is still claimable
    ]])
end

-- ============================================================
-- TRADE HARBOR FUNCTIONS
-- ============================================================
function selectTradeType(prompt)
    local names = {}
    for _, t in ipairs(TRADE_TYPE) do table.insert(names, t.name) end
    table.insert(names, "← Back")
    while true do
        local ch = gg.choice(names, nil, prompt)
        if ch == nil then standby()
        elseif ch == #names then return nil
        else return TRADE_TYPE[ch] end
    end
end

function selectRealID(trade_type_id)
    if trade_type_id == 0 then
        local cat_names = {}
        for _, c in ipairs(category_keys) do table.insert(cat_names, c) end
        table.insert(cat_names, "← Back")
        while true do
            local ch = gg.choice(cat_names, nil, "📂 SELECT DINO CATEGORY")
            if ch == nil then standby()
            elseif ch == #cat_names then return nil
            else
                local dino = showItemList(category_keys[ch], dino_data[category_keys[ch]], true)
                if dino then return dino end
            end
        end
    elseif trade_type_id == 1 then
        local cat_names = {}
        for _, c in ipairs(building_categories) do table.insert(cat_names, c) end
        table.insert(cat_names, "← Back")
        while true do
            local ch = gg.choice(cat_names, nil, "📂 SELECT BUILDING CATEGORY")
            if ch == nil then standby()
            elseif ch == #cat_names then return nil
            else
                local item = showItemList(building_categories[ch] .. " BUILDINGS", building_db[building_categories[ch]], true)
                if item then return item end
            end
        end
    elseif trade_type_id == 2 then
        local cat_names = {}
        for _, c in ipairs(deco_categories) do table.insert(cat_names, c) end
        table.insert(cat_names, "BOSS STATUES")
        table.insert(cat_names, "← Back")
        while true do
            local ch = gg.choice(cat_names, nil, "📂 SELECT DECO CATEGORY")
            if ch == nil then standby()
            elseif ch == #cat_names then return nil
            else
                local cat = cat_names[ch]
                if cat == "BOSS STATUES" then
                    local item = showItemList("BOSS STATUES", boss_statues_data, true)
                    if item then return item end
                else
                    local item = showItemList(cat .. " DECORATIONS", deco_db[cat], true)
                    if item then return item end
                end
            end
        end
    elseif trade_type_id == 10 then
        local shard_list = {}
        for _, f in ipairs(fragment_data) do
            table.insert(shard_list, {name="🧩 " .. f.dino .. " (Heroic Fragment)", id=f.id})
        end
        table.insert(shard_list, {name="📂 Other Dino...", id=nil})
        table.insert(shard_list, {name="← Back", id=nil})
        
        while true do
            local names = {}
            for _, s in ipairs(shard_list) do
                if s.id ~= nil then
                    table.insert(names, s.name)
                else
                    table.insert(names, s.name)
                end
            end
            local ch = gg.choice(names, nil, "🧩 SELECT SHARDS/FRAGMENTS")
            if ch == nil then standby()
            elseif ch == #shard_list then return nil
            elseif ch == #shard_list - 1 then
                local cat_names = {}
                for _, c in ipairs(category_keys) do table.insert(cat_names, c) end
                table.insert(cat_names, "← Back")
                while true do
                    local cch = gg.choice(cat_names, nil, "📂 SELECT DINO CATEGORY FOR SHARDS")
                    if cch == nil then standby()
                    elseif cch == #cat_names then break
                    else
                        local item = showItemList(category_keys[cch], dino_data[category_keys[cch]], true)
                        if item then return item end
                    end
                end
            else
                return shard_list[ch]
            end
        end
    elseif trade_type_id == 11 then
        return showItemList("SELECT MOD", mod_db, true)
    elseif trade_type_id == 12 then
        return showItemList("SELECT S-DNA", sadn_db, true)
    end
    return nil
end

function getCurrentSide(prompt_prefix, side_label)
    local ttype = selectTradeType(prompt_prefix .. " - CURRENT " .. side_label)
    if ttype == nil then return nil end
    local value = getNumber("Enter CURRENT " .. side_label .. " VALUE:", 100)
    local real_id = 0
    if ttype.has_real_id then
        local real_item = selectRealID(ttype.id)
        if real_item == nil then return nil end
        real_id = real_item.id
    end
    return { type = ttype.id, value = value, real_id = real_id, type_name = ttype.name }
end

function getTargetGive(current)
    local target_value = getNumber("TARGET VALUE for " .. current.type_name .. " (current: " .. current.value .. "):", 1)
    return { type = current.type, value = target_value, real_id = current.real_id, type_name = current.type_name }
end

function getTargetReceive(current)
    gg.alert("📌 TARGET RECEIVE\n\nNow pick a NEW TYPE for RECEIVE.\nCan be different from current!\n\nExample:\nCurrent: LP\nTarget: Dino\n\nOr keep LP but increase the value.")
    local ttype = selectTradeType("🎯 TARGET RECEIVE - SELECT TYPE")
    if ttype == nil then return nil end
    local target_value = getNumber("TARGET VALUE for " .. ttype.name .. ":", current.value)
    local real_id = 0
    if ttype.has_real_id then
        local real_item = selectRealID(ttype.id)
        if real_item == nil then gg.alert("⚠️ Must select a specific item for " .. ttype.name); return nil end
        real_id = real_item.id
    end
    return { type = ttype.id, value = target_value, real_id = real_id, type_name = ttype.name }
end

function executeTradeHack(curr_give, curr_recv, tgt_give, tgt_recv)
    local search_pattern = curr_give.type .. ";" .. curr_give.value .. ";" .. curr_give.real_id .. ";" ..
                           curr_recv.type .. ";" .. curr_recv.value .. ";" .. curr_recv.real_id .. ";5:25"
    local target_pattern = tgt_give.type .. ";" .. tgt_give.value .. ";" .. tgt_give.real_id .. ";" ..
                           tgt_recv.type .. ";" .. tgt_recv.value .. ";" .. tgt_recv.real_id .. ";5:25"
    print("")
    print("========================================")
    print("🔍 SEARCH PATTERN (CURRENT):")
    print("   " .. search_pattern)
    print("🎯 TARGET PATTERN:")
    print("   " .. target_pattern)
    print("========================================")
    local confirm = gg.choice({"✔️ Execute!","✖️ Cancel"}, nil,
        "CONFIRM TRADE HACK\n\n🔍 SEARCH: " .. search_pattern .. "\n🎯 TARGET: " .. target_pattern)
    if confirm ~= 1 then return false end
    gg.setVisible(false); gg.clearResults()
    setRegions() -- OPTIMIZED: Only scan game-relevant memory
    gg.searchNumber(search_pattern, gg.TYPE_DWORD, false, nil, nil, nil, 0)
    local count = gg.getResultsCount()
    gg.setVisible(true)
    print("📊 Found " .. count .. " result(s)")
    if count == 0 then
        gg.alert("✖️ FAILED!\n\nNo results found.\n\nCheck:\n1. Trade Harbor open with Custom Trade\n2. Values match game\n3. Pattern: " .. search_pattern)
        return false
    end
    local results = gg.getResults(count)
    local edited_give = 0; local edited_recv = 0
    gg.setVisible(false)
    for _, v in ipairs(results) do
        if v.value == curr_give.value then
            gg.setValues({ { address = v.address, flags = v.flags, value = tgt_give.value } })
            edited_give = edited_give + 1
        end
        if v.value == curr_recv.value then
            gg.setValues({ { address = v.address, flags = v.flags, value = tgt_recv.value } })
            edited_recv = edited_recv + 1
        end
    end
    for _, v in ipairs(results) do
        if v.value == curr_recv.type then
            gg.setValues({ { address = v.address, flags = v.flags, value = tgt_recv.type } })
        end
        if v.value == curr_recv.real_id then
            gg.setValues({ { address = v.address, flags = v.flags, value = tgt_recv.real_id } })
        end
    end
    gg.clearResults(); gg.setVisible(true)
    if edited_give > 0 or edited_recv > 0 then
        gg.toast("✔️ TRADE HACKED!")
        gg.alert("✔️ TRADE HACK SUCCESS!\n\n" ..
            "📤 GIVE: " .. curr_give.type_name .. " " .. curr_give.value .. " → " .. tgt_give.value .. "\n" ..
            "📥 RECEIVE: " .. curr_recv.type_name .. " " .. curr_recv.value .. " → " .. tgt_recv.type_name .. " " .. tgt_recv.value .. "\n\n" ..
            "Go back to game → CONFIRM trade!")
        return true
    else
        gg.alert("⚠️ No values edited.\nPattern might need adjustment.")
        return false
    end
end

function doGuidedTrade()
    gg.alert("📌 NOTE\n\nMake sure Trade Harbor → Custom Trade is open.\nNote the values shown in the game.\n\nPress OK to continue.")
    local curr_give = getCurrentSide("📤 STEP 1", "GIVE")
    if curr_give == nil then return end
    local curr_recv = getCurrentSide("📥 STEP 2", "RECEIVE")
    if curr_recv == nil then return end
    local c = gg.choice({"✔️ Continue to TARGET","✖️ Cancel"}, nil,
        "📊 CURRENT TRADE:\n\n📤 GIVE: " .. curr_give.type_name .. " x" .. curr_give.value ..
        "\n📥 RECEIVE: " .. curr_recv.type_name .. " x" .. curr_recv.value)
    if c == 1 then
        local tgt_give = getTargetGive(curr_give)
        local tgt_recv = getTargetReceive(curr_recv)
        if tgt_recv == nil then return end
        executeTradeHack(curr_give, curr_recv, tgt_give, tgt_recv)
    end
end

function doManualSearch()
    gg.alert("🔧 MANUAL SEARCH MODE\n\nEnter CURRENT pattern to search,\nthen enter TARGET pattern to edit.\n\nFormat:\ntype1;val1;rid1;type2;val2;rid2;5:25\n\nExample search:\n3;959;0;7;296;0;5:25\n\nExample target:\n3;1;0;0;1;123456;5:25")
    local result = gg.prompt({"Enter SEARCH pattern:","Enter TARGET pattern:"}, {"",""}, {"text","text"})
    if result == nil then return end
    local search_pat = result[1]; local target_pat = result[2]
    if search_pat == "" or target_pat == "" then gg.alert("Both patterns required!"); return end
    print("")
    print("========================================")
    print("🔍 SEARCH: " .. search_pat)
    print("🎯 TARGET: " .. target_pat)
    print("========================================")
    local parts = {}; for p in string.gmatch(search_pat, "([^;]+)") do table.insert(parts, p) end
    local tparts = {}; for p in string.gmatch(target_pat, "([^;]+)") do table.insert(tparts, p) end
    if #parts < 6 or #tparts < 6 then gg.alert("⚠️ Invalid pattern format!"); return end
    gg.setVisible(false); gg.clearResults()
    setRegions() -- OPTIMIZED: Only scan game-relevant memory
    gg.searchNumber(search_pat, gg.TYPE_DWORD, false, nil, nil, nil, 0)
    local count = gg.getResultsCount()
    gg.setVisible(true)
    print("📊 Found " .. count .. " results")
    if count == 0 then gg.alert("✖️ No results found!"); return end
    local curr_give_val = tonumber(parts[2]); local curr_recv_val = tonumber(parts[5])
    local tgt_give_val = tonumber(tparts[2]); local tgt_recv_val = tonumber(tparts[5])
    local tgt_recv_type = tonumber(tparts[4]); local tgt_recv_rid = tonumber(tparts[6])
    local results = gg.getResults(count); local edited = 0
    gg.setVisible(false)
    for _, v in ipairs(results) do
        if v.value == curr_give_val then gg.setValues({ { address = v.address, flags = v.flags, value = tgt_give_val } }); edited = edited + 1 end
        if v.value == curr_recv_val then gg.setValues({ { address = v.address, flags = v.flags, value = tgt_recv_val } }); edited = edited + 1 end
        if v.value == tonumber(parts[4]) then gg.setValues({ { address = v.address, flags = v.flags, value = tgt_recv_type } }) end
        if v.value == tonumber(parts[6]) then gg.setValues({ { address = v.address, flags = v.flags, value = tgt_recv_rid } }) end
    end
    gg.clearResults(); gg.setVisible(true)
    gg.toast("✔️ Manual hack done! Edited " .. edited .. " values")
    gg.alert("✔️ MANUAL HACK DONE!\n\nEdited " .. edited .. " values.\n\nConfirm trade in game.")
end

function showTradeHowToUse()
    gg.alert([[
❔ HACK VIA TRADE HARBOR:

1. Open game → Trade Harbor → Custom Trade
2. Pick a trade & NOTE both values

[GUIDED TRADE]
3. Enter CURRENT GIVE (type & value)
4. Enter CURRENT RECEIVE (type & value)
5. Enter TARGET GIVE (new value)
6. Enter TARGET RECEIVE (new TYPE + value)
7. Auto search & edit
8. Back to game → CONFIRM trade

Example:
  Current: DNA;959 → LP;296
  Target:  DNA;1   → Dino;1;Blue

[MANUAL SEARCH]
  Enter manual pattern format:
  type;value;real_id;type;value;real_id;5:25

Contact: t.me/zydxie
    ]])
end

-- ============================================================
-- REFERENCE DATA FUNCTIONS
-- ============================================================
function showReferenceList(title, data)
    if not data or #data == 0 then gg.alert("No data in this category."); return end
    local items = {}
    for i, item in ipairs(data) do
        table.insert(items, i .. ". " .. item.name)
    end
    table.insert(items, "← Back")
    while true do
        local ch = gg.choice(items, nil, "📚 " .. title)
        if ch == nil then standby()
        elseif ch == #items then return
        else
            local d = data[ch]
            local actions = {
                "📋 Copy ID: " .. d.id,
                "← Back"
            }
            local sel = gg.choice(actions, nil, "📌 " .. d.name)
            if sel == nil then standby()
            elseif sel == 1 then
                gg.copyText(tostring(d.id))
                gg.toast("✔️ Copied: " .. d.name .. " (ID: " .. d.id .. ")")
                print("📋 Copied to clipboard: " .. d.id)
            end
        end
    end
end

function showFragmentMenu()
    local frags = {}
    for i, f in ipairs(fragment_data) do
        table.insert(frags, i .. ". " .. f.dino)
    end
    table.insert(frags, "← Back")
    while true do
        local ch = gg.choice(frags, nil, "🧩 FRAGMENTS - Heroic Dinos")
        if ch == nil then standby()
        elseif ch == #frags then return
        else
            local f = fragment_data[ch]
            local actions = {
                "📋 Copy Dino ID: " .. f.id,
                "📋 Copy H.J Search: " .. f.hj,
                "📋 Copy J.J Search: " .. f.jj,
                "← Back"
            }
            local sel = gg.choice(actions, nil, "🧩 " .. f.dino)
            if sel == nil then standby()
            elseif sel == 1 then
                gg.copyText(tostring(f.id))
                gg.toast("✔️ Dino ID copied!")
            elseif sel == 2 then
                gg.copyText(f.hj)
                gg.toast("✔️ H.J Search copied!")
            elseif sel == 3 then
                gg.copyText(f.jj)
                gg.toast("✔️ J.J Search copied!")
            end
        end
    end
end

function showReferenceMenu()
    local opts = {
        "🎨 Decorations - Common","💎 Decorations - VIP","🎉 Decorations - Limited",
        "🏗️ Buildings - Common","🏛️ Buildings - VIP","🗡️ Mods - Offense","🛡️ Mods - Defense",
        "🔮 Mods - Support","💚 Mods - Heal","👑 Boss Statues","📦 Trade Port - Resource IDs",
        "🔢 Resource Values","🧬 S-ADN Dinos","🧩 Fragment IDs",
        "⚠️ Admin Test Dinos","← Back",
    }
    local mod_data = {
        ["OFFENSE 🗡️"] = {
            {name="Alpha", id=25394345},{name="Berserk", id=-387917412},{name="Bleed", id=412634600},
            {name="Charge", id=-883749373},{name="Distraction", id=573614902},{name="Intimidation", id=-1299204441},
            {name="Piercing Bite", id=-1735774957},{name="Rally", id=1381654457},{name="Spikes", id=1872723326},
            {name="Splinter", id=-760248465},{name="Terrify", id=104353395},{name="Toxin", id=-708689034},
        },
        ["DEFENSE 🛡️"] = {
            {name="Armored Hide", id=-1890937760},{name="Inspire", id=1899986661},{name="Protectors", id=530129420},
            {name="Survival", id=1288377036},{name="Tough Skin", id=133833796},
        },
        ["SUPPORT 🔮"] = {
            {name="Adrenaline Rush", id=-2121196462},{name="Bind", id=1911130150},{name="Clone", id=-129129226},
            {name="Killer Instinct", id=-1624170551},{name="Mirror", id=1017243203},{name="Nullify", id=1988381759},
            {name="Predation", id=-2030249909},{name="Randomize", id=-399102113},{name="Shuffle", id=-1564118048},
            {name="Steal", id=1760737639},
        },
        ["HEAL 💚"] = {
            {name="Endurance", id=-1153828212},{name="Invigorate", id=1895634130},{name="Regenerate", id=-1515669511},
            {name="Siphoning Bite", id=-235149091},{name="Split Wound", id=1830411669},{name="Vitality", id=626880303},
            {name="Wound", id=-980908495},
        },
    }
    while true do
        local ch = gg.choice(opts, nil, "📋 REFERENCE DATA")
        if ch == nil then standby(); return
        elseif ch == 1 then showReferenceList("Decorations - Common", deco_db["COMMON"])
        elseif ch == 2 then showReferenceList("Decorations - VIP", deco_db["VIP"])
        elseif ch == 3 then showReferenceList("Decorations - Limited", deco_db["LIMITED"])
        elseif ch == 4 then showReferenceList("Buildings - Common", building_db["COMMON"])
        elseif ch == 5 then showReferenceList("Buildings - VIP", building_db["VIP"])
        elseif ch == 6 then showReferenceList("Mods - Offense", mod_data["OFFENSE 🗡️"])
        elseif ch == 7 then showReferenceList("Mods - Defense", mod_data["DEFENSE 🛡️"])
        elseif ch == 8 then showReferenceList("Mods - Support", mod_data["SUPPORT 🔮"])
        elseif ch == 9 then showReferenceList("Mods - Heal", mod_data["HEAL 💚"])
        elseif ch == 10 then showReferenceList("Boss Statues", boss_statues_data)
        elseif ch == 11 then showReferenceList("Trade Port Resource IDs", resource_ids)
        elseif ch == 12 then showReferenceList("Resource Values", resource_values)
        elseif ch == 13 then showReferenceList("S-ADN Dinos", sadn_db)
        elseif ch == 14 then showFragmentMenu()
        elseif ch == 15 then showReferenceList("Admin Test Dinos ⚠️", admin_test_dinos)
        elseif ch == 16 then return end
    end
end

-- ============================================================
-- SUBMENUS
-- ============================================================
function subMenuDinosaur()
    while true do
        local opts = {
            "『1』🦕 Hack Dino [first time]",
            "『2』⚡ Quick Dino Hack" .. ((saved.id_addr ~= nil) and " [READY]" or " [LOCKED]"),
            "『3』🔄 Reset Saved Dino",
            "❔ How To Use",
            "← Back to Main Menu",
        }
        local ch = gg.choice(opts, nil, "🦕 HACK DINOSAUR")
        if ch == nil then standby()
        elseif ch == 1 then doFirstTimeHack()
        elseif ch == 2 then doQuickHack()
        elseif ch == 3 then doResetDino()
        elseif ch == 4 then showDinoHowToUse()
        elseif ch == 5 then return end
    end
end

function subMenuRewards()
    local opts = {
        "『1』🍔 Hack Food",
        "『2』🧬 Hack DNA",
        "『3』💰 Hack Coins",
        "『4』💵 Hack Cash",
        "『5』⭐ Hack Loyalty Points",
        "❔ How To Use",
        "← Back to Main Menu",
    }
    while true do
        local ch = gg.choice(opts, nil, "🎁 HACK RESOURCES VIA REWARD")
        if ch == nil then standby()
        elseif ch >= 1 and ch <= 5 then doHackRewardByType(ch)
        elseif ch == 6 then showRewardHowToUse()
        elseif ch == 7 then return end
    end
end

function subMenuTrade()
    local opts = {
        "『1』🏪 Hack Trade [Guided]",
        "『2』🔧 Manual Search",
        "❔ How To Use",
        "← Back to Main Menu",
    }
    while true do
        local ch = gg.choice(opts, nil, "🏪 HACK VIA TRADE HARBOR")
        if ch == nil then standby()
        elseif ch == 1 then doGuidedTrade()
        elseif ch == 2 then doManualSearch()
        elseif ch == 3 then showTradeHowToUse()
        elseif ch == 4 then return end
    end
end

-- ============================================================
-- MAIN MENU
-- ============================================================
function showMainMenu()
    local items = {
        "『1』🦕 Hack Dinosaur",
        "『2』🎁 Hack Resources via Reward",
        "『3』🏪 Hack Anything via Trade Harbor",
        "『4』📋 ID References",
        "✖️ Exit",
    }
    while true do
        local choice = gg.choice(items, nil, 
        '╔════════ ≪ ° 𝙕𝙮𝙙𝙓𝙞𝙚『𝙂𝙂』° ≫ ════════╗\n\n' ..
        '\t\tGame                  : Jurassic World The Game\n' ..
        '\t\tVersion               : 1.90.39 and above\n' ..
        '\t\tStatus                 : Ultimate Script\n' ..
        '\t\tDate Expired      : 03 August 2026\n' ..
        '\t\tLink Telegram   : t.me/@zydxie\n\n' ..
        '╚════════════  ≪ °❈° ≫  ════════════╝')
        if choice == nil then standby() else return choice end
    end
end

-- ============================================================
-- MAIN LOOP
-- ============================================================
gg.setVisible(true)
showBanner()

while true do
    local menu_choice = showMainMenu()

    if menu_choice == 1 then
        subMenuDinosaur()
    elseif menu_choice == 2 then
        subMenuRewards()
    elseif menu_choice == 3 then
        subMenuTrade()
    elseif menu_choice == 4 then
        showReferenceMenu()
    elseif menu_choice == 5 then
        local confirm
        while true do
            confirm = gg.choice({"✖️ Back to main menu","✔️ Yes, exit script"}, nil, "Confirm Exit")
            if confirm == nil then standby()
            elseif confirm == 2 then
                print("")
                print("╔═══════════════════════════╗")
                print("        Thank you for using JWTG Hack!   ")
                print("        Script by ZydXie [GG]            ")
                print("        t.me/zydxie                      ")
                print("╚═══════════════════════════╝")
                gg.toast("Thanks! - ZydXie [GG]")
                break
            else break end
        end
        if confirm == 2 then break end
    end
end

gg.setVisible(false)
