#### VHDL toolchain setup

Setup of a working docker based GHDL and GTKwave toolchain. 

### GHDL 

Build and run the Docker image. 

### GTKWave

Setting up GtkWave is a little bit more involved.
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


