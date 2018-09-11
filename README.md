# Robot Framework

## Install homebrew
```sh
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## Install Python
```sh
brew install python
```
### Check Python Version
```sh
python --version
```

## Install pip
```sh
sudo easy_install pip
```
Install this via terminal if problems found during pip installation
`curl https://bootstrap.pypa.io/get-pip.py | python`
### Check pip Version
```sh
pip --version
```

## Install Robot Framework
```sh
pip install robotframework
```

## Install Robot Framework Library
```sh
pip install robotframework-seleniumlibrary
```
Documentation for SeleniumLibrary
> http://robotframework.org/SeleniumLibrary/SeleniumLibrary.html

## Install wxPython & RIDE (Robot Framework Integrated Development Environment) <--> OPTIONAL
```sh
brew install wxpython
```
```sh
pip install robotframework-ride
```
Try running in your terminal:
```sh
ride.py
```
If you get error like this:
`wxPython not found.
You need to install wxPython 2.8.12.1 with unicode support to run RIDE.
wxPython 2.8.12.1 can be downloaded from http://sourceforge.net/projects/wxpython/files/wxPython/2.8.12.1/`
Find your robotide python egg and open its \__init__.py.
On my machine this was located in /usr/local/lib/python2.7/site-packages/robotide.
You’ll have to update `wxversion` detection, so add following line:
> supported_versions.append("3.0")

So, it will become like this:
```sh
try:
    import wxversion
    from wxversion import VersionError
    if sys.platform == 'darwin': # CAN NOT IMPORT IS_MAC AS THERE IS A wx IMPORT
        supported_versions.append("2.9")
        supported_versions.append("3.0")
    wxversion.select(supported_versions)
    import wx
```
Then Try running in your terminal again:
```sh
ride.py
```

## Install chromedriver
```sh
brew install chromedriver
```

## Install geckodriver
```sh
brew install geckodriver
```

## Run Robot
> Run Specific Robot File
```sh
robot -d Results /path/path/file.robot
```
> Run Robot Specific Tags
```sh
robot -d Results --include tagName /path/path/folder/
```
> Run Specific Test Case from a Test Suite
```sh
robot -d Results -t "test case name here" /path/path/file.robot
```
