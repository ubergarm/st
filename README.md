Simple Terminal
===

[st](st.suckless.org) is a simple terminal implementation for X.

## Motivation

I want pretty colors for [neovim](https://github.com/neovim/neovim) but rxvt-unicode only supports 256 colors witout a true color patch. [Alpine Linux](http://www.alpinelinux.org/) keeps the package size down to a minimum ~15MB so let's try `st`!

## Build

    docker build -t ubergarm/st .

## Run

    docker run --rm -it \
           -e DISPLAY=$DISPLAY \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v ~/.Xauthority:/root/.Xauthority \
           --net=host \
           ubergarm/st

## Color Test

    awk 'BEGIN{
        s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
        for (colnum = 0; colnum<77; colnum++) {
            r = 255-(colnum*255/76);
            g = (colnum*510/76);
            b = (colnum*255/76);
            if (g>255) g = 510-g;
            printf "\033[48;2;%d;%d;%dm", r,g,b;
            printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
            printf "%s\033[0m", substr(s,colnum+1,1);
        }
        printf "\n";
    }'

## References

[XVilka/TrueColour.md](https://gist.github.com/XVilka/8346728)
