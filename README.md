# DecoBocoShader
デコボコシェーダー<br>

<img src="http://many.chu.jp/Unity/DecoBocoShader/Sample3.gif" alt="ロゴサンプル">

Copyright(C) 2020 [㊥Maruchu](http://maruchu.nobody.jp/ "㊥Maruchu")

<br><br><br><br>
## サンプル

DecoBocoShader のフォルダにサンプルのシーンが入っているので開いて実行してみてください。

> DecoBocoShader/Sample1.unity　：　地形(山)のサンプルシーン<br>
> DecoBocoShader/Sample2.unity　：　間取りのサンプルシーン<br>
> DecoBocoShader/Sample3.unity　：　ロゴのサンプルシーン

<img src="http://many.chu.jp/Unity/DecoBocoShader/Sample1.gif" alt="地形サンプル"> <img src="http://many.chu.jp/Unity/DecoBocoShader/Sample2.gif" alt="間取りサンプル">


<br><br><br><br>
## 使い方

ゲーム開発などで間取り図のような画像一枚からサクッと壁のようなものを作れると便利ですよね。<br>
というわけで白黒の画像から高低差のある見た目を生成するシェーダーです。<br>
(やっていることは Unity の Terrain の簡易版です)

Projectビューから DecoBocoShader/DecoBocoMaterial を選択して、<br>
Inspector から「Offset Texture」に白黒のテクスチャが設定されていることを確認します。

テクスチャが設定されていたら、「Offset Value(White)」の「Y」の値を変更してみてください。

<img src="http://many.chu.jp/Unity/DecoBocoShader/Inspector1.png" alt="Inspector">

> Color Texture 　　　　　：　色情報のテクスチャ(透過は使えません)<br>
> Offset Texture　　　　　：　オフセット情報のテクスチャ(白黒の画像を設定します)<br>
> Offset Value(White)　 　 ：　白い部分のオフセット(X,Y,Z)<br>
> Offset Value(Black)　　　：　黒い部分のオフセット(X,Y,Z)


<br><br><br><br>
## ライセンス
デコボコシェーダーにはMITライセンスが適用されています<br>
