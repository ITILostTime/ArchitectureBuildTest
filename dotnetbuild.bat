
set artifactsFolder="./artifacts"

dotnet restore

dotnet pack ./src/ITI.PrimarySchool.WebApp -c Release -o $artifactsFolder --version-suffix="alpha" 

echo "FINISHED BUILDING OF DOTNETCORE"