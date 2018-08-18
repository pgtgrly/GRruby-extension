# GRruby-extension

An extension for the GR library using the same interface as Rubyplot.

# Installation
Firstly, make sure that you have ruby-dev

```bash
sudo apt install ruby-dev
```

Now, we need to install the backend (GR Framework) the easiest way to install GR framework is to simply select your system configuration [here](https://software.opensuse.org/download.html?project=science:gr-framework&package=python-gr) and following the process mentioned.
But instead of installing python-gr replace it with just gr. [for example: sudo apt-get install python-gr (in case of Ubuntu) ]
(unless you also want GR Framework for Python)

This will install GR Framework in /usr . So we will create a symbolic link for the same by:

```bash
sudo ln -s /usr/gr /usr/local/gr
```
Now we install my version of Rubyplot by:

```bash
git clone https://github.com/pgtgrly/GRruby-extension
cd GRruby-extension
sudo gem install rspec ZenTest rspec-autotest hoe rmagick rake-compiler
rake compile
```

You can generate documents using

```bash
yard doc
```

and view them (on web browser) using:

```bash
yard server
```
