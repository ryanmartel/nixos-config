{ config }:
''
    * {
        border: none;
        margin-top: 2px;
        font-family: JetBrainsMono;
        font-size: 14px;
    }

    window#waybar {
        color: #${config.colorScheme.palette.base07};
        background: rgba(22,25,28,0.8);
        border-radius: 20px;
    }


    #workspaces, #clock, .modules-right {
        background: #${config.colorScheme.palette.base02};
        border-radius: 20px
    }


    #workspaces button {
        color: #${config.colorScheme.palette.base07};
        padding: 0 5px;
    }
    #workspaces button.active {
        color: #${config.colorScheme.palette.base0F};
        padding: 0 5px;
    }
    #workspaces button.focus {
        background:  #${config.colorScheme.palette.base04};
    }
    #clock {
        margin: 0px 16px 0px 10px;
        min-width: 140px;
    }
	#network {
		padding: 0 20px 0 10px;
	}
    #battery,
    #cpu,
    #temperature,
    #memory,
    #disk,
    #pulseaudio {
        padding: 0 10px;
    }
''
