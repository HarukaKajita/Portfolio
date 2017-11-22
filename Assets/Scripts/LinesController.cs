using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LinesController : MonoBehaviour {

	private int linesNum;
	private LineRenderer[] lineRenderers;
	private List<Vector3> positions1 = new List<Vector3>();
	private List<Vector3> positions2 = new List<Vector3>();
	private Dictionary<string, float> seeds = new Dictionary<string, float>();
	private Vector3 vec1, vec2;
	[SerializeField] private Material mat;

	void Start () {
		linesNum = transform.childCount;
		lineRenderers = GetComponentsInChildren<LineRenderer> ();
		foreach( LineRenderer LR in lineRenderers){
			//LR.material   = new Material(Shader.Find("Particles/Additive"));
			LR.material = mat;
			LR.useWorldSpace = false;
			LR.startWidth = 0.02f;
			LR.endWidth   = 0.02f;

			LR.shadowCastingMode = UnityEngine.Rendering.ShadowCastingMode.TwoSided;
		}
			
		seeds.Add ("1x",Random.value*100);
		seeds.Add ("1y",Random.value*100);
		seeds.Add ("1z",Random.value*100);
		seeds.Add ("2x",Random.value*100);
		seeds.Add ("2y",Random.value*100);
		seeds.Add ("2z",Random.value*100);


		vec1 = new Vector3 ( 
			Perlin.Noise(seeds["1x"]),
			Perlin.Noise(seeds["1y"]),
			Perlin.Noise(seeds["1z"]));

		vec2 = new Vector3 ( 
			Perlin.Noise(seeds["2x"]),
			Perlin.Noise(seeds["2y"]),
			Perlin.Noise(seeds["2z"]));
		
		for(int i = 0; i < linesNum; i++){
			
			positions1.Add (vec1);
			positions2.Add (vec2);
			lineRenderers [i].SetPosition (0,positions1[positions1.Count-1]);
			lineRenderers [i].SetPosition (1,positions2[positions2.Count-1]);

			List<string> keys = new List<string> (seeds.Keys);
			foreach(string key in keys){
				seeds[key] += 0.02F;
			}

			vec1 = new Vector3 ( 
				Perlin.Noise(seeds["1x"]),
				Perlin.Noise(seeds["1y"]),
				Perlin.Noise(seeds["1z"]));

			vec2 = new Vector3 ( 
				Perlin.Noise(seeds["2x"]),
				Perlin.Noise(seeds["2y"]),
				Perlin.Noise(seeds["2z"]));
		}

	}
	
	// Update is called once per frame
	void Update () {
		for(int i = 0; i < linesNum-1; i++){
			positions1 [i] = positions1 [i + 1];
			positions2 [i] = positions2 [i + 1];
		}

		positions1 [positions1.Count - 1] = vec1;
		positions2 [positions2.Count - 1] = vec2;

		List<string> keys = new List<string> (seeds.Keys);
		foreach(string key in keys){
			seeds[key] += 0.02f;
		}

		vec1 = new Vector3 ( 
			Perlin.Noise(seeds["1x"]),
			Perlin.Noise(seeds["1y"]),
			Perlin.Noise(seeds["1z"]));

		vec2 = new Vector3 ( 
			Perlin.Noise(seeds["2x"]),
			Perlin.Noise(seeds["2y"]),
			Perlin.Noise(seeds["2z"]));

		for(int i = 0; i < linesNum; i++){
			lineRenderers[i].SetPosition (0, positions1[i]);
			lineRenderers[i].SetPosition (1, positions2[i]);

		}
	}
}
