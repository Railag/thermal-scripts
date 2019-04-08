echo "Starting thermal optimizations.";
PowerShell -NoProfile -ExecutionPolicy Bypass -Command ".\3rdfan.ps1 -auto"
PowerShell -NoProfile -ExecutionPolicy Bypass -Command ".\intelExtremeTuningCpuVoltageOffset.ps1 -cooling"
PowerShell -NoProfile -ExecutionPolicy Bypass -Command ".\msiAfterburnerGpuCustomCoreClockCurve.ps1 -cooling"
echo "Finished thermal optimizations.";