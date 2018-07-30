﻿Shader "Transition/Vertex"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_threshold("Threshold", float) = 0
		_lazerWidth("LazerWidth", float) = 0.1 
		_lazerTex("LazerTexture", 2D) = "white"{}
		[Toggle] _EffectOn("Switch Effect", Range(0,1)) = 0
	}
	SubShader
	{
		Tags { "RenderType"="Transparent" "Queue"="Transparent"}
		LOD 100
		Cull off
		ColorMask RGBA
		Blend SrcAlpha OneMinusSrcAlpha

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma multi_compile_fog
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				UNITY_FOG_COORDS(1)
				float4 vertex : SV_POSITION;
				
				float2 alpha : TEXCOORD1;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;
			float _threshold;
			float _lazerWidth;
			sampler2D _lazerTex;
			bool _EffectOn;
			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				UNITY_TRANSFER_FOG(o,o.vertex);
				if(_EffectOn){
                    _threshold = _CosTime.z*0.9;
                    o.alpha.x = step(v.vertex.y, _threshold);
				} else {
				    o.alpha.x = 1;
				}
				float diff = _threshold - v.vertex.y;
				o.alpha.y = diff;
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				clip(i.alpha.x - 0.9);
				fixed4 col = tex2D(_MainTex, i.uv);
				col.a = i.alpha.x;
				if(_lazerWidth > i.alpha.y && _EffectOn){
				    fixed4 lazerCol = tex2D(_lazerTex, i.alpha.y / _lazerWidth);
				    if(lazerCol.a == 1){
				        col = lazerCol;
				    } else {
				        col += lazerCol;
				    }
				}
				UNITY_APPLY_FOG(i.fogCoord, col);
				return col;
			}
			ENDCG
		}
	}
}
