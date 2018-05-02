$TESTS = Get-ChildItem . | Where-Object {$_.Extension -eq ".jmx"}

Remove-Item -Recurse -Force -ErrorAction 0 @('Results')
New-Item -ErrorAction Ignore -ItemType directory -Path @('Results')

foreach ($test in $TESTS)
{
  Write-Host $test
  &jmeter  -n -t $test.jmx -l $test.log -e -o Results\$test
}