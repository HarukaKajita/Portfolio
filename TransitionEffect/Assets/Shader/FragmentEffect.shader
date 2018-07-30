Shader "Transition/Fragment"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Threshold("Threshold", Range(0,1)) = 1
		_lazerHeight("LazerHeight", Range(0,1)) = 0.1
		_lazerTex("LazerTexture", 2D) = "white"{}
		[Toggle] _EffectOn("Switch Effect", Range(0,1)) = 0
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" }
		LOD 100
		Cull off
		ColorMask RGBA
		Blend SrcAlpha OneMinusSrcAlpha

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			// make fog work
			#pragma multi_compile_fog
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
				float2 projectionUV: TEXCOORD1;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float2 projectionUV: TEXCOORD1;
				UNITY_FOG_COORDS(1)
				float4 vertex : SV_POSITION;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;
			float _Threshold;
			float _lazerHeight;
			sampler2D _lazerTex;
			bool _EffectOn;
			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				o.projectionUV = v.projectionUV;
				UNITY_TRANSFER_FOG(o,o.vertex);
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 col = tex2D(_MainTex, i.uv);
				if(_EffectOn){
				    _Threshold = _CosTime.z / 2 + 0.5;
                    float diff = _Threshold -i.projectionUV.y;
                    clip(diff);
                    if(diff < _lazerHeight){
                        fixed4 lazerCol = tex2D(_lazerTex, diff / _lazerHeight);
                        if(lazerCol.a == 1 || diff < _lazerHeight/2){
                            col = lazerCol;
                        } else {
                            col += lazerCol;
                        }
                    }
				}
				UNITY_APPLY_FOG(i.fogCoord, col);
				return col;
			}
			ENDCG
		}
	}
}
