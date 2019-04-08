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
	iex $statusCommand
}
elseif ($enable)
{
	iex $enable3rdFanCommand
	echo "3rd fan enabled."
}
elseif ($disable)
{
	iex $disable3rdFanCommand
	echo "3rd fan disabled."
}
elseif ($auto)
{
	iex $auto3rdFanCommand
	echo "auto mode enabled for 3rd fan."
}