--[[
╔══════════════════════════════════════════════════════════════╗
║          JWTG ULTIMATE HACK TOOL v3.1                       ║
║          Jurassic World The Game - Game Guardian            ║
║          Script by : ZydXie [GG]                            ║
║          Modified : Optimized Memory Regions                ║
║          Game ver  : 1.90.39                                ║
║          Contact   : t.me/zydxie                            ╚══════════════════════════════════════════════════════════════╝
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
-- RESOURCE REFERENCE DATA (KEPT)
-- ============================================================
local resource_ids = {
    {name="Dinosaur", id=0}, {name="Building", id=1}, {name="Decoration", id=2},
    {name="DNA", id=3}, {name="Food", id=4}, {name="Coin", id=5}, {name="Cash", id=6},
    {name="Loyalty Points", id=7}, {name="Boss DNA", id=8}, {name="Amber", id=9},
    {name="Shards/Fragments", id=10}, {name="Mods", id=11}, {name="S-DNA", id=12},
}

local resource_values = {
    {name="Food / DNA / Cash / Coins / B-DNA / VIP", id=377287197},
    {name="XP", id=-210600260},
    {name="S-DNA", id=2010228124},
}

-- ============================================================
-- LOYALTY REWARD TYPES (FOR REWARD HACK)
-- ============================================================
local loyalty_rewards = {
    {name="🍔 Food", id=0}, {name="🧬 DNA", id=1}, {name="💰 Coins", id=2},
    {name="💵 Cash", id=3}, {name="⭐ Loyalty Points", id=4},
}

-- ============================================================
-- UI HELPERS
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

-- ============================================================
-- REFERENCE MENU (RESOURCES ONLY)
-- ============================================================
function showReferenceMenu()
    local opts = {
        "📦 Trade Port - Resource IDs",
        "🔢 Resource Values",
        "← Back",
    }
    while true do
        local ch = gg.choice(opts, nil, "📋 RESOURCE REFERENCES")
        if ch == nil then standby(); return
        elseif ch == 1 then showReferenceList("Trade Port Resource IDs", resource_ids)
        elseif ch == 2 then showReferenceList("Resource Values", resource_values)
        elseif ch == 3 then return end
    end
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
    setRegions()
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
-- SUBMENU: REWARDS
-- ============================================================
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

-- ============================================================
-- MAIN MENU (CLEANED)
-- ============================================================
function showMainMenu()
    local items = {
        "『1』🎁 Hack Resources via Reward",
        "『2』📋 Resource References",
        "✖️ Exit",
    }
    while true do
        local choice = gg.choice(items, nil, 
        '╔════════ ≪ ° 𝙕𝙮𝙙𝙓𝙞𝙚『𝙂𝙂』° ≫ ════════╗\n\n' ..
        '\t\tGame                  : Jurassic World The Game\n' ..
        '\t\tVersion               : 1.90.39 and above\n' ..
        '\t\tStatus                 : Free Script\n' ..
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
        subMenuRewards()
    elseif menu_choice == 2 then
        showReferenceMenu()
    elseif menu_choice == 3 then
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