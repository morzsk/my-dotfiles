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
                esbenp.prettier-vscode
                dbaeumer.vscode-eslint
                ms-vscode.vscode-typescript-next
                roblox-ts.vscode-roblox-ts
                evaera.vscode-rojo
                nightrains.robloxlsp
                continue.continue
                # shd101wyy.markdown-preview-enhanced
                # ms-vscode-remote.remote-ssh
                # coder.coder-remote
                # dustypomerleau.rust-syntax
                # ms-python.python
                # ms-dotnettools.csharp
                # ms-dotnettools.csdevkit
                # ms-dotnettools.vscode-dotnet-runtime
                # visualstudiotoolsforunity.vstuc
                # kleber-swf.unity-code-snippets
                # redhat.java
                # vscjava.vscode-java-debug
                # vscjava.vscode-java-test
                # vscjava.vscode-java-dependency
                # vscjava.vscode-maven
                # vscjava.vscode-gradle
                # tobiah.language-pde
                # dan-c-underwood.arm
                # mcu-debug.peripheral-viewer
                # mcu-debug.rtos-views
                # mcu-debug.memory-view
                # mcu-debug.debug-tracker-vscode
                # marus25.cortex-debug
                # marus25.cortex-debug-dp-stm32f1
            ]);
        };
    };
}
