# Mario Golf 64 assembly

Assembly code for Mario Golf 64, currently targeting the US version only.

To build, use the armips assembler: https://github.com/Kingcom/armips

* Add armips to your path or place it in the base directory of this project
* Run `armips buildrom.asm` to patch a ROM named `mg64.z64`

OR

* Run `armips build.asm` to create binary files for each piece of code

Note that everything included will be enabled by default in the resulting patched ROM. This is controlled in `hackenabletable.asm`. These flags are intended to be controlled via an (currently undeveloped) external program post-patching.
