param($installPath, $toolsPath, $package, $project)


if ($project.CodeModel.Language -eq "{B5E9BD34-6D3E-4B5D-925E-8A43B79820B4}") 
{
	$item = $project.ProjectItems | where-object {$_.Name -eq "ApplicationEvents.vb"}
	$item.Delete()
}
if ($project.CodeModel.Language -eq "{B5E9BD33-6D3E-4B5D-925E-8A43B79820B4}") 
{
	$item = $project.ProjectItems | where-object {$_.Name -eq "Program.cs.txt"}
	$item.Delete()
}

Add-Type -AssemblyName 'Microsoft.Build, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a'
$msbuild = [Microsoft.Build.Evaluation.ProjectCollection]::GlobalProjectCollection.GetLoadedProjects($project.FullName) | Select-Object -First 1

$project.Save()
