# Easy linux configurations file store
  My linux configuration files
## Dependencies
  i3 (window manager), feh (set background), polybar (custom bar), alacritty (terminal emulator)<br>
  If you want to use different terminal emulator, update .config/i3/config - change every 'alacritty' to your terminal
## Fast setup
1. Clone repo to home directory<br>
    <code>cd ~ && git clone https://github.com/Sheeshlop/config.git</code>
2. Make git track home files<br>
<code>git config core.worktree "../../"</code>
3. To apply all configs need to make reset<br>
  <code>git reset --hard</code>
4. Check your files with <code>git status</code>, add with <code>git add ../somefile</code>

## Store your own config files with the same easy method
  Check out https://www.wangzerui.com/2017/03/06/using-git-to-manage-system-configuration-files/
