# TODO add other windows-related optimizations
param (
    [switch]$cooling,
    [switch]$default,
    [switch]$performance
)

$changePowerModeCommand = "powercfg.exe /setactive"

$economyMode = " a1841308-3541-4fab-bc81-f71556f20b4a"
$balancedMode = " 381b4222-f694-41f0-9685-ff5bb260df2e"
$performanceMode = " 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"

if ($cooling)
{
    $changePowerModeCommand += $balancedMode
    echo "Windows cooling balanced profile applied."
}
elseif ($performance)
{
    $changePowerModeCommand += $performanceMode
    echo "Windows performance profile applied."
}
else
{
    $changePowerModeCommand += $balancedMode
    echo "Windows balanced profile applied."
}

iex $changePowerModeCommand

#-----------------------------------
# GUID: 381b4222-f694-41f0-9685-ff5bb260df2e  (Balanced)
# GUID: 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c  (High-Performance)
# GUID: a1841308-3541-4fab-bc81-f71556f20b4a  (Economy)