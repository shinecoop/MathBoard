

https://github.com/user-attachments/assets/fe19b8d9-c8cb-40b5-a4fd-77a63be6f777

# MathBoard
A mathematical keyboard layout designed for streamlined production in LaTeX. 

Currently only avaliable for Mac


## Setup

### Mac
Upon cloning the repository, you can symlink the layout file into your ```~\Library\Keyboard Layouts``` file via something akin to

```bash
ln -s ./MathBoard/mac/mathboard.keylayout ~/Library/Keyboard\ Layouts/ 
```
where you use the ideal path to your repository clone.

Once you have the symlink, you can 

1. Log out of your account
2. Log back in 
3. Navigate to ```Settings > Keyboard > Keyboard Settings > Text Input > Edit > + > Others ```
4. A layout like "Mathboard01" should appear. Install it, and you should be able to toggle between your layouts using the designated binding (I think its ctrl+space).

### Windows 
Since Windows sucks and their ```.klc``` files are unable to display long strings, we will have to circumvent using ```AutoHotKey```. 

#### Installing AHK
Install and run the executable from their page [autohotkey.com/v2](https://www.autohotkey.com/v2/)

#### Acquiring Script
Clone the repository onto your local machine or simply download the script located in ```/MathBoard/windows``` and save it locally. Then, run the script using the AutoHotKey Service.

You will be able to enter/exit "LaTeX Mode" using a binding listed in the script. As of right now, it is

```CTRL+SHIFT+SPACE```

