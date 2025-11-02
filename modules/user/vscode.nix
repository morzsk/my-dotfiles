{ config, pkgs, ... }: 

{
    # https://github.com/arvigeus/nixos-config/blob/master/apps/vscode.nix
    programs.vscode = {
        enable = true;
        package = pkgs.vscode-fhs;
        mutableExtensionsDir = false;

        profiles.default = {
            enableUpdateCheck = false;
            enableExtensionUpdateCheck = false;
            extensions = with pkgs.open-vsx; [
                vscodevim.vim
                jnoortheen.nix-ide
                rust-lang.rust-analyzer
            ] ++ (with pkgs.vscode-marketplace; [
                dustypomerleau.rust-syntax
                ms-python.python
                redhat.java
                vscjava.vscode-java-debug
                vscjava.vscode-java-test
                vscjava.vscode-java-dependency
                vscjava.vscode-maven
                vscjava.vscode-gradle
                dan-c-underwood.arm
                mcu-debug.peripheral-viewer
                mcu-debug.rtos-views
                mcu-debug.memory-view
                mcu-debug.debug-tracker-vscode
                marus25.cortex-debug
            ]);
        };
    };
}
