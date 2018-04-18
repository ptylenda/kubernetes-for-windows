@echo off
setlocal enabledelayedexpansion

set args=%*
if not "%1"=="" (
  call set args=%%args:\=/%%
	set args=!args:A:=/mnt/a!
	set args=!args:B:=/mnt/b!
	set args=!args:C:=/mnt/c!
	set args=!args:D:=/mnt/d!
	set args=!args:E:=/mnt/e!
	set args=!args:F:=/mnt/f!
	set args=!args:G:=/mnt/g!
	set args=!args:H:=/mnt/h!
	set args=!args:I:=/mnt/i!
	set args=!args:J:=/mnt/j!
	set args=!args:K:=/mnt/k!
	set args=!args:L:=/mnt/l!
	set args=!args:M:=/mnt/m!
	set args=!args:N:=/mnt/n!
	set args=!args:O:=/mnt/o!
	set args=!args:P:=/mnt/p!
	set args=!args:Q:=/mnt/q!
	set args=!args:R:=/mnt/r!
	set args=!args:S:=/mnt/s!
	set args=!args:T:=/mnt/t!
	set args=!args:U:=/mnt/u!
	set args=!args:V:=/mnt/v!
	set args=!args:W:=/mnt/w!
	set args=!args:X:=/mnt/x!
	set args=!args:Y:=/mnt/y!
	set args=!args:Z:=/mnt/z!
)

set bashexe=bash.exe
if %PROCESSOR_ARCHITECTURE%==x86 (
	set bashexe=%windir%\Sysnative\bash.exe
)

@echo on
:: Very simple example of passing ansible-related windows environment variable (for example for usage with Packer and Hyper-V). Can be extended to more variables if needed
%bashexe% -c 'ANSIBLE_HOST_KEY_CHECKING=%ANSIBLE_HOST_KEY_CHECKING% %args%'