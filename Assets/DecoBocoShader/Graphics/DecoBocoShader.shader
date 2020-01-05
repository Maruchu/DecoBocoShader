// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

/**
DecoBocoShader

Copyright(C) 2020 ㊥Maruchu

This software is released under the MIT License.
http://opensource.org/licenses/mit-license.php
*/


//デコボコシェーダー
Shader "Maruchu/DecoBocoShader"
{
    //Offset Textureに設定したテクスチャの色によって、表示される位置が変わるシェーダー

    //プロパティ
    Properties
    {
        _MainTex(   "Color Texture(RGB)",           2D)         = "white" {}        //色情報のテクスチャ
        _OffsetTex( "Offset Texture(GrayScale)",    2D)         = "black" {}        //高さ情報のテクスチャ
        _OffsetW(   "Offset Value(White)",          Vector)     = (0, 1, 0, 0)      //オフセット(白)
        _OffsetB(   "Offset Value(Black)",          Vector)     = (0, 0, 0, 0)      //オフセット(黒)
    }

    //シェーダー本体
    SubShader
    {
        LOD 100

        Tags
        {
            //不透明設定
            "Queue"="Geometry"
            "IgnoreProjector"="True"
            "RenderType"="Opaque"
        }

        ZWrite      On                      //Z更新
        Lighting    Off                     //ライトなし
        Cull        Off                     //カリングなし
        Blend       One Zero                //不透明

        Pass
        {
            CGPROGRAM

            #pragma     vertex      vert    //バーテックスシェーダー
            #pragma     fragment    frag    //フラグメントシェーダ―

            #include "UnityCG.cginc"

            //マテリアルから取得する情報
            sampler2D   _MainTex;           //メインテクスチャ
            sampler2D   _OffsetTex;         //オフセットテクスチャ
            float4      _MainTex_ST;        //テクスチャのUV情報
            float4      _OffsetW;           //オフセット(白)
            float4      _OffsetB;           //オフセット(黒)


            //バーテックスシェーダーへ渡すデータ
            struct appdata
            {
                float4  vertex      : POSITION;         //描画位置
                float4  texcoord    : TEXCOORD0;        //テクスチャ情報
            };
            //バーテックスシェーダーからフラグメントシェーダーへの渡すデータ
            struct v2f
            {
                float4  pos         : SV_POSITION;      //画面上の位置
                float2  uv          : TEXCOORD0;        //テクスチャ情報
                float4  color       : COLOR;            //乗算色情報
            };


            //バーテックスシェーダー
            v2f vert( appdata v)
            {
                v2f o;
                //テクスチャのUV情報取得
                o.uv          = TRANSFORM_TEX( v.texcoord, _MainTex);
                //オフセットを追加した位置を取得
                float4 ofsCol = tex2Dlod ( _OffsetTex, float4( o.uv, 0, 0));
                float  value  = ((ofsCol.r +ofsCol.g +ofsCol.b) /3);
                float4 ofsVal = (value *(_OffsetW -_OffsetB)) +_OffsetB;
                o.pos         = UnityObjectToClipPos( v.vertex + mul( unity_ObjectToWorld, ofsVal));
                //単純に高低差をつけただけだと分かりづらいので高さに応じた色を乗算する
                float4 ofsSub = (_OffsetW -_OffsetB);
                value        *= clamp((ofsSub.x +ofsSub.y +ofsSub.z), -0.3, 0.3);
                o.color       = float4(value,value,value,1);
                return o;
            }

            //フラグメントシェーダー
            float4 frag( v2f i) : COLOR0
            {
                //テクスチャの色情報を取得
                return tex2D( _MainTex, i.uv) +i.color;
            }

            ENDCG
        }
    }
}
