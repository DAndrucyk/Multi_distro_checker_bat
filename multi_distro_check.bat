@echo off

setlocal enabledelayedexpansion

cls

:start

rem Creating the start of the user array. UsrSI is starting at slot 1 (skipping 0 so it lines up with how people normally count)

set "UsrSI=1"

rem Creating the end of the user array. UsrEI is the end of the user array and is determined by what the user puts in

set /P UsrEI="How many users do you want to check? "

Rem To populate the UsrArray

for /L %%i in (%UsrSI%,1,%UsrEI%) do (

                rem adds entry to user array

                set /p UsrArray[%%i]="Enter user ID: "

)

rem Creating the start of the distribution list array. DLSI is starting at slot 1 (skipping 0 so it lines up with how people normally count)

set "DLSI=1"

rem Creating the end of the distribution list array. DLEI is the end of the distribution list array and is determined by what the user puts in

set /P DLEI="How many distribution lists/security groups do you want to check? "

Rem To populate the DLArray

for /L %%i in (%DLSI%,1,%DLEI%) do (

                rem adds entry to distribution list array

                set /p DLArray[%%i]="Enter distribution list/security group: "

)

Rem Loop to go through distribution lists

For /L %%i in (%DLSI%,1,%DLEI%) do (

                rem Loop to go through users

                for /L %%A in (!UsrSI!,1,!UsrEI!) DO (

                                rem i is just a variable to toggle yes or no for the compairison

                                set i=0

                                rem checks to see if the user is a member of a specified group

                                for /f %%f in ('"net user !UsrArray[%%A]! /domain | findstr /l !DLArray[%%i]!"') do set /a i=!i!+1

                                rem outputs if the user is in the group or not.

                                if !i!==1 (echo !UsrArray[%%A]! is a member of !DLArray[%%i]!) ELSE (echo !UsrArray[%%A]! is not a member of !DLArray[%%i]!)

                )

)

rem prompt to ask if the user wants to clear the screen (only triggers on y)

set /P clsscreen="Clear screen? (y/n) "

rem clears screen if the previous prompt was answered with y

if "%clsscreen%"=="y" (cls)

rem loops back to start to allow for repeated compairisons.

goto :start
