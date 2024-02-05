#Hello World
Write-Host 'Hello, World!'
'Hello, World!' | Write-Host

Write-Output 'Hello, World!'
'Hello, World!' | Write-Output

$wh = 'Hello, World!' | Write-Host
$wo = 'Hello, World!' | Write-Output
Get-Variable wh
Get-Variable wo



#Variables
$a = 1337                               
$b = "Swifty"                           
$c = 31337, "Swifty"                    
$d = Get-ChildItem C:\Windows          
New-Variable -Name e -Value 1337 

$number = "1337"   
$number.GetType()

[int]$number = 1337
$number = "One Thousand, Three Hundred and Thirty-Seven"



#Read only Variables
New-Variable -Name myVar -Value 1337 -Option ReadOnly
$myVar

$myVar = 31337

$myvar          
New-Variable -Name myVar -Value 31337 -Option ReadOnly -Force
$myVar

#Constants
New-Variable -Name myConst -Value "This CANNOT be changed" -Option Constant
$myConst

New-Variable -Name myConst -Value "I'm going to change it" -Option Constant -Force



#For
for ($i = 1; $i -le 5; $i++){
    Write-Host $i
}


for ($i = '' ; $i.length -le 20; $i += '='){
    Write-Host $i
}



#For Each
$list = @('a', 'b', 'c', 'd');
foreach($item in $list){
    Write-Host $item
}

$list = @('a', 'b', 'c', 'd');
$list | ForEach-Object { Write-Host $_ }

Get-Help ForEach-Object


#IF/ Else
$value = 5
if ($value -gt 1) {
    Write-Host "value is greater than 1"
}

$value = 5
if ($value -gt 10) {
    Write-Host "value is greater than 10"
}
else {
    Write-Host "value is $value"
}

if ($value -gt 10) {
    Write-Host "value is greater than 10"
}
elseif ($value -lt 10) {
    Write-Host "value is less than 10"
}
else {
    Write-Host "value is 10"
}


#Switch
$month = 7
switch ($month) {
    1 { Write-Host "January" }
    2 { Write-Host "February" }
    3 { Write-Host "March" }
    4 { Write-Host "April" }
    5 { Write-Host "May" }
    6 { Write-Host "June" }
    7 { Write-Host "July" }
    8 { Write-Host "August" }
    9 { Write-Host "September" }
    10 { Write-Host "October" }
    11 { Write-Host "November" }
    12 { Write-Host "December" }
    default { Write-Host "Invalid month" }
}

# Using the -Wildcard parameter
$msg = "Warning, the action failed"
switch -Wildcard ($msg) {
    "Error*" { "Action error" }
    "Warning*" { "Action warning" }
    "Successful*" { "Action succesfull" }
}

## Or use it in the conditions
$msg = "Successful, the action failed"
switch ($msg) {
    { $_ -like "Error*" } { "Action error" }
    { $_ -like "Warning*" } { "Action warning" }
    { $_ -like "Successful*" } { "Action succesfull" }
}


switch ((Get-Date).Day) {
    { $_ -le 10 } { "Day of the month is lower than 10" }
    { $_ -gt 10 -and $_ -le 25 } { "Day of the month is between 10 and 25" }
    { $_ -gt 25 } { "Day of the month is greater than 25" }
}



#Arrays
$values = @("One", "Two", "Three", "Four", "Five")
$values
$values.GetType()

$values = "Six", "Seven", "Eight", "Nine", "10"
$values

[int[]]$values = 6, 7, 8, 9, 10
$values

[array]$values = 11, 12, 13, 14, 15
$values


$values = @("One", "Two", "Three")
$values
# Counting the items in the array using the Count property
Write-Host "Items in array $($values.Count)"
# Add a value to the array using the + operator
$values += "Four"
$values
Write-Host "Items in array $($values.Count)"
# Change a value in the array using the index
$values[0] = "Three"
$values


[array]$values = 1, 2, 3, 4, 5
Write-Host "Item at index 2: $($values[2])"

$nameArray = @("Erik", "Penny", "Randy", "Sandy", "Toby", "Uma", "Vicky", "Will", "Xavier", "Yvette", "Zach")
for ($i = 0; $i -lt $nameArray.Length; $i++) {
    Write-Host $nameArray[$i]
}



#Multidimensional Arrays
$array = @(1, 2, (1, 2, 3), 3, 4, (10, 11, 12), 5)
$array[0]
$array[1]
$array[2]
$array[2][0]
$array[2][1]
$array[5]


$array = New-Object 'object[,]' 5,8
$array[2,5] = 'Hello'
$array[3,7] = 'World!'
$array



#Hash Tables
$employees = @{}
# Adding values using integers
$employees.Add(1, "John")
$employees.Add(2, "Mary")
$employees.Add(3, "Bob")
$employees.Add(4, "Sam")

$address = @{}

# Adding values using strings
$address.Add("John", "123 Main Street")
$address.Add("Mary", "456 North Street")
$address.Add("Bob", "789 West Street")
$address.Add("Sam", "321 South Street")

# Creating the hashtable in one go with values
$zipCodes = @{
    "John" = "12345"
    "Mary" = "54321"
    "Bob" = "98765"
    "Sam" = "32145"
}

$employees[4]
$address["Mary"]
$zipCodes.Sam

$employees.keys | Sort-Object $_ | ForEach-Object {
    Write-Host "Employee ID $($_) : $($employees[$_])"
}

foreach ($key in $address.Keys) {
    Write-Host "$($key) lives at $($address[$key])"
}


$employeeAddress = @{
    Name    = "Mary"
    Address = "456 North Street"
    Zipcode = "54321"
}

$employeeAddress

$employeeAddress = @{
    Name    = "Mary"
    Address = "456 North Street"
    Zipcode = "54321"
}

$employeeAddress.Remove("Zipcode")
$employeeAddress


$addresses = @()

$addresses += [ordered]@{Name = "John"; Address = "123 Main Street" }
$addresses += [ordered]@{Name = "Sam"; Address = "321 South Street" }

$addresses += @{Name = "Mary"; Address = "456 North Street" }
$addresses += @{Name = "Bob"; Address = "789 West Street" }

$addresses


$addresses = @()

$addresses += @{Name = "John"; Address = "123 Main Street" }
$addresses += @{
  Name = "Sam"
  Address = "321 South Street"
}
$addresses += @{Name = "Mary"; Address = "456 North Street" }
$addresses += @{Name = "Bob"; Address = "789 West Street" }

$addresses | Sort-Object -Property @{e = { $_.Name } }




#Functions
function writeHelloWorld() {
    Write-Host "Hello World!"
}
writeHelloWorld




function writeMessage {
    param(
        [string]$Message
    )

    Write-Host "Message: $Message"
}

writeMessage "Hello World!"
writeMessage -message "Who is there?"


function writeMessage {
    param(
        [Parameter(Mandatory = $true, Position = 1, HelpMessage = "The message to write")]
        [string]$Message
    )

    process {
        Write-Host "Message: $message"
    }
}

writeMessage "Hello World!"
writeMessage


function writeMessage {
    [CmdLetBinding()]
    param(
        [Parameter(Mandatory = $true, Position = 1, HelpMessage = "The message to write")]
        [string]$Message
    )

    begin {
        Write-Verbose "Beginning of script"
        if (($null -eq $Message) -or ($Message -eq "")) {
            throw "Message cannot be empty";
        }
    }

    process {
        Write-Host "Message: $message"
    }

    end {
        Write-Host "End of script"
    }
}

writeMessage "Hello World!" -Verbose





#Scopes
$var = "bla"
$var


$global:varOne = "bla"                              # Assign a variable in the global scope

Write-Host "Variable One:" $global:varOne           # Print the variable

# Function to demonstrate local and global scope
function MyFunc() {
    $global:varOne = "bla bla"
    $varTwo = "boo"
    return $varTwo
}

Write-Host "Variable Two:" $varTwo                  # Print the variable

$varTwo = MyFunc                                    # Call the function and change the variable
Write-Host "Variable One:" $varOne                  # Print the variable

Write-Host "Variable Two:" $varTwo 



Remove-Variable -Name var1 -ErrorAction SilentlyContinue

$var1 = "This is a variable"

Write-Host "var1 = '$var1'"

function test1 {
    Write-Host "Inside function, var1 = $var1"
}

test1

# Now let's do it privately
Remove-Variable -Name var1 -ErrorAction SilentlyContinue

$Private:var1 = "This is a variable"

function test2 {
    Write-Host "Inside function with private, var1 = $var1"
}

test2



function myFunc {

    $Script:VarOne = "Script Scoped"
    $Var2 = "Function Scoped"
}

myFunc
Write-Host "Var 1: $VarOne"
Write-Host "Var 2: $Var2"



#Strings
$var = "Hello World!"

"Lorem ipsum dolor sit amet..."
$value1 = "Ut enim ad minim veniam... $var"
$value2 = 'Duis aute irure dolor in... $var'
[string]$value3 = "Excepteur sint occaecat cupidatat non proident..."

$value1, $value2, $value3
write-host $value1, $value2, $value3
write-host $value1 $value2 $value3


#Error Actions
Clear-Host

$items = @()

# Generate more items
$items += for ($i = 0; $i -le 3; $i++) {
    "$($env:TEMP)\$(Get-Process -Id $pid)-$($i).txt"
}

# Let's generate some errors
$items | ForEach-Object {
    Get-Item -Path $_ -ErrorAction Inquire
}


#Error Handling

try {
    # This will generate an error
    1/0
    Write-Host "This is executed after the error"
} catch [System.DivideByZeroException] {
    # Catch all errors
    Write-Host "Divide by zero error occurred.`n$_"
} catch {
    # Catch all errors
    Write-Host "Oh oh! Another error occurred.`n$_"
} finally {
    Write-Host "Finally!"
}



#Reading Files
$url = "https://gist.githubusercontent.com/sanderstad/7b9593f7f30abb9f17f9026c74ed9c68/raw/d4406c4cbbc427e15fc9d6d92f8bcf3c72a1e70a/samplefile1.txt"
$filePath = Join-Path -Path $env:temp -ChildPath "samplefile1.txt"

Invoke-WebRequest -Uri $url -OutFile $filePath

$url = "https://gist.githubusercontent.com/sanderstad/f59996889fc3ec794d325ad2162648f8/raw/5353480009bd714f9764a093b52f0fabff1078fd/samplefile2.csv"
$filePath = Join-Path -Path $env:temp -ChildPath "samplefile2.txt"

Invoke-WebRequest -Uri $url -OutFile $filePath

Get-Content -Path (Join-Path -Path $env:temp -ChildPath "samplefile1.txt")


#Writing Files
Add-Content -Path (Join-Path -Path $env:TEMP -ChildPath "test1.txt") -Value "This is just a test"
Add-Content -Path (Join-Path -Path $env:TEMP -ChildPath "test1.txt") -Value "This is just another test"
Get-Content (Join-Path -Path $env:TEMP -ChildPath "test1.txt")


#Time and Date

Get-Date

#Sorting 

$names = @("Muffin","Romeo","Noodle","Zoe","Jack","Luna","Gracie","mittens","Phoebe","Peanut","Harley","Jake")

$names | Sort-Object -Descending

#Custom Objects

# Old style of creating an object
$object1 = New-Object PSObject

Add-Member -InputObject $object1 -MemberType NoteProperty -Name prop1 -Value "value1"
Add-Member -InputObject $object1 -MemberType NoteProperty -Name prop2 -Value "value2"

$object1
$object1.GetType()

#New way
$object2 = [PSCustomObject]@{
    prop1 = "value1"
    prop2 = "value2"
}

$object2

#Splatting

Get-ChildItem -Path $env:TEMP -Include "*.txt" -Depth 2 -Recurse
$params = @{
    Path = $env:TEMP
    Include = "*.txt"
    Depth = 2
    Recurse = $true
}
Get-ChildItem @params


#Classes

class Tree {
    [int]$Height
    [int]$Age
    [string]$Color

    # Initialize the tree by setting default values
    Tree() {
        $this.Height = 1
        $this.Age = 0
        $this.Color = "Green"
    }

    # Create a constructor with parameters a.k.a. constructor overloading
    Tree([int]$Height, [int]$Age, [string]$Color) {
        $this.Height = $Height
        $this.Age = $Age
        $this.Color = $Color
    }

    [void]Grow() {
        # Get a random height because plants and trees don't grow the same each year
        $heightIncrease = Get-Random -Min 1 -Max 5;
        $this.Height += $heightIncrease;
        $this.Age += 1
    }
}

$tree = [Tree]::New()

# Let the tree grow for 10 years
for ($i = 0; $i -lt 10; $i++) {
    $tree.Grow()
    $tree
}


#JSON

$url = "https://gist.githubusercontent.com/sanderstad/1c47c1add7476945857bff4d8dc2be59/raw/d12f30e4aaf9d2ee18e4539b394a12e63dea0c9c/SampleJSON1.json"
$json = (New-Object System.Net.WebClient).DownloadString($url)

$data = $json | ConvertFrom-Json

$data.colors

#XML

# Creating a simple XML document
$xmlDocument = New-Object System.Xml.XmlDocument

# Adding a root element
$rootElement = $xmlDocument.CreateElement("Root")
$xmlDocument.AppendChild($rootElement)

# Adding child elements
$childElement1 = $xmlDocument.CreateElement("Child1")
$childElement1.InnerText = "Value1"
$rootElement.AppendChild($childElement1)

$childElement2 = $xmlDocument.CreateElement("Child2")
$childElement2.InnerText = "Value2"
$rootElement.AppendChild($childElement2)

# Save the XML to a file
$xmlDocument.Save("C:\Path\To\Your\File.xml")