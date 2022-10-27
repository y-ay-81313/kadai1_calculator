# 課題1:電卓アプリ(swift)

## 要件定義
 - 下記の計算を行える電卓アプリを作成すること
   - 加算（+）
   - 減算（-）
   - 乗算（×）
   - 除算（÷）
 - 整数は12桁まで表示すること
   - 13桁以上は入力しても無視すること
   - 計算結果が13桁以上になる場合は、`桁数オーバー`と表示。
 - 小数は小数点以下12桁まで表示すること
   - 小数点以下13桁以降は入力しても無視すること
   - 計算結果が小数点以下13桁以上になる場合は、13桁目で切り捨てとする。
 
## 画面イメージ
```
___________________
|                  |
|         12345678 |
|__________________|
|                  |
| [7]  [8]  [9] [÷]|
|                  |
| [4]  [5]  [6] [×]|
|                  |
| [1]  [2]  [3] [-]|
|                  |
| [0]  [.] [AC] [+]|
|                  |
| [      =       ] |
|__________________|
```
