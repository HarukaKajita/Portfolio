using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class CameraSwitcher : MonoBehaviour {

	[SerializeField] private Camera[] cameras;

	void Start () {
		SwitchToA ();

	}
	
	void Update () {
		if(Input.GetKeyDown(KeyCode.A)){
			SwitchToA ();

		}else if(Input.GetKeyDown(KeyCode.B)){
			SwitchToB ();

		}else if(Input.GetKeyDown(KeyCode.C)){
			SwitchToC ();
		}
	}



	void SwitchToA(){
		cameras [0].gameObject.SetActive (true);
		cameras [1].gameObject.SetActive (false);
		cameras [2].gameObject.SetActive (false);
	}

	void SwitchToB(){
		cameras [0].gameObject.SetActive (false);
		cameras [1].gameObject.SetActive (true);
		cameras [2].gameObject.SetActive (false);

		//Bのカメラワーク後Aに自動で切り替え
		Vector3[] movePoints = cameras [1].GetComponent<BcameraTween> ().movePoints;
		cameras[1].transform.DOLocalPath (movePoints,8f,PathType.CatmullRom,PathMode.Full3D,1000,Color.blue).OnComplete(() => {SwitchToA();});
	}

	void SwitchToC(){
		cameras [0].gameObject.SetActive (false);
		cameras [1].gameObject.SetActive (false);
		cameras [2].gameObject.SetActive (true);

		Vector3[] movePoints = cameras [2].GetComponent<CcameraTween> ().movePoints;
		cameras[2].transform.DOLocalPath (movePoints,45f,PathType.CatmullRom,PathMode.Full3D,1000,Color.blue).OnComplete(() => {SwitchToA();});
	}
}
	
/*
SetActive か enabled どっちが軽い？
キー入力の文字を数字にして指定したカメラだけをアクティブ化は負荷かかる？
要検証
*/