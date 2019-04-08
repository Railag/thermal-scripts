param (
	[switch]$status,
	[switch]$enable,
	[switch]$disable,
	[switch]$auto
)

$statusCommand = "nbfc.exe status -a";
$enable3rdFanCommand = "nbfc.exe set 100 -f 2";
$disable3rdFanCommand = "nbfc.exe set 0 -f 2";
$auto3rdFanCommand = "nbfc.exe set auto -f 2";

if ($status)
{
	Invoke-Expression $statusCommand
}
elseif ($enable)
{
	Invoke-Expression $enable3rdFanCommand
}
elseif ($disable)
{
	Invoke-Expression $disable3rdFanCommand
}
elseif ($auto)
{
	Invoke-Expression $auto3rdFanCommand
}