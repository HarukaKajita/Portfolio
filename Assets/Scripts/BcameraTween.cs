using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BcameraTween : MonoBehaviour {

	private int pointsNum = 10;
	public Vector3[] movePoints;
	[SerializeField] private Transform _target;


	private void OnEnable(){

		movePoints = new Vector3[pointsNum];
		for(int i = 0; i < pointsNum-1; i++){
			var x = -6 * Mathf.Sin (i*((Mathf.PI * 2) /(pointsNum-1) ));
			var z = -6 * Mathf.Cos (i*((Mathf.PI * 2) /(pointsNum-1) ));

			movePoints [i] = new Vector3 (x,1,z);
		}

		movePoints [pointsNum-1] = new Vector3 (0,1,-6);

	}

	void Start (){
	}
	
	void Update () {
		transform.LookAt (_target);
	}
}
