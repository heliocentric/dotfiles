class workstation() {
	$global_packages = [
		"git",
		"ruby",
		"vagrant",
		"filezilla",
		"openvpn",
		"keepass",

	]
	$win_packages = [
		"sourcetree",
		"virtualbox",
		"mobaxterm",
		"notepadplusplus.install",
		"7zip",
		"netbeans-jee",
		"sysinternals",
		"powershell",
		"ruby2.devkit",
		"syncthing",
		"syncthing-gtk",
		"putty",
		"slack",
		"vmwarevsphereclient",
	]
	$nix_packages = [
		"dwm",
		"chromium",
		"firefox",
		"inkscape",
		"blender",
		"quassel",
		"nmap",
		"bash",
		"krdc",
		"libgdiplus",
		"gitflow",
		"sudo",
		"shutter",
		"synergy",
		"x11vnc",
		"dmenu",
		"lxterminal",
		"slock",

	]
	case downcase($osfamily) {
		"windows" : {
			$packages = $global_packages + $win_packages
			include ::chocolatey
			$package_provider = "chocolatey"
		}
		"freebsd" : {
			$freebsd_packages = [
				"virtualbox-ose",
				"syncthing",
				"netbeans",
				"gimp-app",
				"mono",
				"docker-freebsd",
				"zxfer",
				"iocage",
			]
			$packages = $global_packages + $nix_packages + $freebsd_packages
			$package_provider = "pkgng"
			file { "/usr/local/bin/dwm-syn":
				source => "puppet:///modules/workstation/dwm-syn.freebsd",
				mode => "755",
				owner => "root",
			}
			file { "/usr/local/share/xsessions/49dwm.desktop":
				source => "puppet:///modules/workstation/49dwm.desktop",
				mode => "755",
				owner => "root",
			}
		}
		"redhat" : {
			$rhel_packages = [
				"mono-core",
				"gimp",
				"docker",
			]
			$packages = $global_packages + $nix_packages + $rhel_packages
			$package_provider = "yum"
			file { "/usr/local/bin/dwm-syn":
				source => "puppet:///modules/workstation/dwm-syn.linux",
				mode => "755",
				owner => "root",
			}
			file { "/usr/share/xsessions/49dwm.desktop":
				source => "puppet:///modules/workstation/49dwm.desktop",
				mode => "755",
				owner => "root",
			}
		}
	}
	package { $packages:
		ensure => "installed",
		provider => $package_provider,
	}
}
