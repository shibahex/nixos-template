{
	inputs,
		host,
		lib,
		pkgs,
		config,
		...
}: {
#variables = import ../../hosts/${host}/variables.nix;
services.xserver = {
	enable = true;
	windowManager.dwm.enable = true;
};

services.displayManager.ly.enable = true;
nixpkgs.overlays = [
	(final: prev: {

	 dwm = prev.dwm.overrideAttrs (oldAttrs: {
			 patches = [];
			 postPatch = ''
			 cp ${../../config/dwm/config.h} config.h
			 '';
			 });

	 dmenu = prev.dmenu.overrideAttrs (oldAttrs: {
			 patches = [];
			 postPatch = ''
			 cp ${../../config/dmenu/config.h} config.h
			 '';
			 });


	 st = prev.st.overrideAttrs (oldAttrs: {
			 patches = [];
			 postPatch = ''
			 cp ${../../config/st/config.h} config.h
			 '';
			 });

	 slstatus = prev.slstatus.overrideAttrs (oldAttrs: {
			 patches = [];
			 postPatch = ''
			 cp ${../../config/slstatus/config.h} config.h
			 '';
			 });
	})
];

environment.systemPackages = with pkgs; [
	dwm
	dmenu
	st
	slstatus
];
}
