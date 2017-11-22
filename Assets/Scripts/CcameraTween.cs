using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CcameraTween : MonoBehaviour {

	private int pointsNum = 50;
	public Vector3[] movePoints; //Tweenの移動ルートのパス
	[SerializeField] private Transform target;

	[SerializeField] private int cycleNum = 3;
	void OnEnable(){

		movePoints = new Vector3[pointsNum];
		for(int i = 0; i < pointsNum; i++){
			
			var x = -6 * Mathf.Sin (i * ((Mathf.PI * 2 * cycleNum) /(pointsNum) ));
			var z = -6 * Mathf.Cos (i * ((Mathf.PI * 2 * cycleNum) /(pointsNum) ));
			var y = 10 - (i * (9f / pointsNum));

			movePoints [i] = new Vector3 (x,y,z);
		}
	}

	void Start (){
	}

	void Update () {
		transform.LookAt (target);
	}
}
