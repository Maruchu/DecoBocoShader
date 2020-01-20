# DecoBocoShader
デコボコシェーダー<br>

<img src="http://many.chu.jp/Unity/DecoBocoShader/d/Sample3.gif" alt="ロゴサンプル">

Copyright(C) 2020 [㊥Maruchu](https://twitter.com/Maruchu "㊥Maruchu")

> 制作環境：Unity2018.4<br>
> 動作確認：Unity2018.4、Unity2019.2<br>


<br><br><br><br>
## 概要

ゲーム開発などで白黒の画像一枚からサクッと壁のようなものを作れると便利ですよね。<br>
というわけでグレースケールの画像から高低差のある見た目を生成するシェーダーです。<br>
(やっていることは Unity の Terrain の簡易版です)

<img src="http://many.chu.jp/Unity/DecoBocoShader/d/Sample1.gif" alt="地形サンプル">


<br><br><br><br>
## サンプル

DecoBocoShader のフォルダにサンプルのシーンが入っているので開いて実行してみてください。

> DecoBocoShader/Sample1.unity　：　地形(山)のサンプルシーン<br>
> DecoBocoShader/Sample2.unity　：　間取りのサンプルシーン<br>
> DecoBocoShader/Sample3.unity　：　ロゴのサンプルシーン

<img src="http://many.chu.jp/Unity/DecoBocoShader/d/Sample2.gif" alt="間取りサンプル">


<br><br><br><br>
## 使い方

Projectタブから Assets/DecoBocoShader/Sample3 をダブルクリックで開いて、<br>
次に Assets/DecoBocoShader/Graphics/LogoMaterial のマテリアル(青い球のアイコン)を選択してください。

各シーンに入っているマテリアル<br>
> Sample1　：　MountainMaterial<br>
> Sample2　：　HouseMaterial<br>
> Sample3　：　LogoMaterial


Inspector から「Offset Texture」に白黒のテクスチャが設定されていることを確認したら、<br>
「Offset Value(White)」の値を変更して 見た目を変化させてみてください。

<img src="http://many.chu.jp/Unity/DecoBocoShader/d/Inspector1.png" alt="Inspector">

> Color Texture 　　　　　：　色情報のテクスチャ(透過は使えません)<br>
> Offset Texture　　　　　：　オフセット情報のテクスチャ(白黒の画像を設定します)<br>
> Offset Value(White)　 　 ：　白い部分のオフセット<br>
> Offset Value(Black)　　　：　黒い部分のオフセット


<br><br><br><br>
## 応用編

このシェーダーは色味(Color Texture)を変えることで様々なものに使えます<br>
気になったテクスチャを入れてみて どのような見た目が作れるか、いろいろ実験してみてください！

<img src="http://many.chu.jp/Unity/DecoBocoShader/d/Variation1.png" alt="応用例">


<br><br><br><br>
## ライセンス
デコボコシェーダーにはMITライセンスが適用されています<br>

