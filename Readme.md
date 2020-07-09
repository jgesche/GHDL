#### Set up a toolchain for VHDL

The goal is the setup of a working docker based tool chain. 

### GHDL 

The setup in a docker container is straight forward.
Just build and run the provided Dockerfile.

### GTKWave

Setting up GtkWave was a little bit more involved.
The setup of GTKwave is based on the guide from 
https://ughe.github.io/2018/11/06/gtkwave-osx
Since I am using a Mac I used brew to install GTK

```
brew tap homebrew/cask
brew cask install gtkwave
```

Next you have to install Perl Switch otherwise GTKWave will throw an
error.

```
    cpan install Switch
    perl -V:'installsitelib'
```


The last command prints the location of your Switch installation.
If it is not in Library/Perl copy from the respective directory

```
sudo cp /usr/local/Cellar/perl/5.*/lib/perl5/site_perl/5.*/Switch.pm /Library/Perl/5.*/
```

#### Run GTKWave

Now you should be able to run GTK with the following commands

```
/Applications/gtkwave.app/Contents/Resources/bin/gtkwave
```


