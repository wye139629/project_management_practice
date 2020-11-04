# README

此專案練習部署在Heroku上
1. 註冊Heroku帳號
2. 安裝Heroku Cli
```
brew tap heroku/brew && brew install heroku
```
3. 打開終端機登入
```
heroku login
```
4. 到專案的目錄下
```
heroku create 名稱
```
這個指令會幫我們在Heroku上開一台伺服器（instance）,如果後面名稱不打會隨機幫我們搭配
再來幫git加上一個heroku的遠端節點

5. 將專案推向Heroku
```
git push heroku main
```
看到 Verifying deploy.... done. 這段沒意外就代表部署成功了！
第一次部署的話還要再
```
heroku run rails db:migrate
```
確保所有的 Migration 都有被執行到。
接著打開瀏覽器，輸入網址 https://task-management-5x.herokuapp.com/ 應該就可以連上專案了

