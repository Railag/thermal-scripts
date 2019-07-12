param (
	[switch]$status,
	[switch]$enable,
	[switch]$disable,
	[switch]$auto
)

$fanCommand = "nbfc.exe set"

$fanEnableCommand = "nbfc.exe start -e"
$fanDisableCommand = "nfbc.exe stop"

$1stFanCommand = $fanCommand + " -f 0"
$2ndFanCommand = $fanCommand + " -f 1"
$3rdFanCommand = $fanCommand + " -f 2"

$statusCommand = "nbfc.exe status -a";
$enable3rdFanCommand = "nbfc.exe set -s 100 -f 2";
$disable3rdFanCommand = "nbfc.exe set -s 0 -f 2";
$auto3rdFanCommand = "nbfc.exe set -a -f 2";

if ($status)
{
	iex $statusCommand
}
elseif ($enable)
{
	iex $fanEnableCommand
	$1stFanCommand += " -s 100"
	$2ndFanCommand += " -s 100"
	$3rdFanCommand += " -s 100"
	iex $1stFanCommand
	iex $2ndFanCommand
	iex $3rdFanCommand
	echo "Fans performance mode enabled."
}
elseif ($disable)
{
	iex $fanDisableCommand
	$1stFanCommand += " -s 0"
	$2ndFanCommand += " -s 0"
	$3rdFanCommand += " -s 0"
	iex $1stFanCommand
	iex $2ndFanCommand
	iex $3rdFanCommand
	echo "No fans mode disabled."
}
elseif ($auto)
{
	iex $fanEnableCommand
	$1stFanCommand += " -a"
	$2ndFanCommand += " -a"
	$3rdFanCommand += " -a"
	iex $1stFanCommand
	iex $2ndFanCommand
	iex $3rdFanCommand
	echo "Fans auto mode enabled."
}