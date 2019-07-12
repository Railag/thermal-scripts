param (
	[switch]$cooling,
	[switch]$default,
	[switch]$performance
)

$PATH = [Environment]::GetEnvironmentVariable("PATH")
if (!$PATH.Contains("Extreme Tuning Utility"))
{
	$PATH += "C:\Program Files (x86)\Intel\Intel(R) Extreme Tuning Utility\Client;";
	$ENV:PATH = $PATH;
	[Environment]::SetEnvironmentVariable("PATH", $PATH, "USER");
	echo "Added Intel Extreme Tuning Utility to PATH";
}

$infoCommand = "XtuCLI.exe -i all";
$coolingCommand = "XtuCLI.exe -tune -id 34 -v -150"; # id 34 = Core Voltage Offset, -150 = -150mV
$defaultCommand = "XtuCLI.exe -tune -id 34 -v -0"
$performanceCommand = "XtuCLI.exe -tune -id 34 -v 0"; # TODO test max possible value

if ($cooling)
{
	iex $coolingCommand
	echo "CPU cooling profile applied, set core voltage offset to -150mV."
}
elseif ($default)
{
	iex $defaultCommand
	echo "CPU default profile applied, reset core voltage offset to 0mV."
}
elseif ($performance)
{
	iex $performanceCommand
	echo "CPU performance profile applied, set core voltage offset to 0mV."
}