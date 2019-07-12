param (
	[switch]$cooling,
	[switch]$performance
)

$PATH = [Environment]::GetEnvironmentVariable("PATH")
if (!$PATH.Contains("MSI Afterburner"))
{
	$PATH += "C:\Program Files (x86)\MSI Afterburner;";
	$ENV:PATH = $PATH;
	[Environment]::SetEnvironmentVariable("PATH", $PATH, "USER");
	echo "Added MSI Afterburner to PATH";
}

$coolingCommand = "MSIAfterburner.exe -Profile1";
$performanceCommand = "MSIAfterburner.exe -Profile5";

if ($cooling)
{
	iex $coolingCommand
	echo "GPU cooling profile applied."
}
elseif ($performance)
{
	iex $performanceCommand
	echo "GPU performance profile applied."
}