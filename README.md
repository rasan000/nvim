# overview
neovimの自分用設定ファイル

# imeの自動切り替えについて
1. wslに以下をインストール
   - sudo apt install mingw-w64 g++ gcc m4 zip dos2unix
2. windows側にzenhanをインストールしておく
    - C:/users/{username}/zenhan
    - git clone https://github.com/iuchim/zenhan.git 
3. wslに切り替えてビルド
    - wsl
    - cd zenhan
    - dos2unix build.sh
    - bash build.sh
4. zenhan.exeが作成されたことを確認したら、wsl2側の.profileに以下を追記(エラーが出る場合はエラー内容を確認すること)
    - export zenhan='/mnt/c/users/{username}/zenhan/zenhan/bin64/zenhan.exe'
