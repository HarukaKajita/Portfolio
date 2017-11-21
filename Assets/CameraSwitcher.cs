using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraSwitcher : MonoBehaviour {

	[SerializeField] private Camera[] cameras;

	void Start () {
		for(int i = 0; i < cameras.Length; i++){
			if (i == 0) {
				cameras [i].gameObject.SetActive (true);
			} else {
				cameras [i].gameObject.SetActive (false);
			}
		}

	}
	
	void Update () {
		if(Input.GetKeyDown(KeyCode.A)){
			cameras [0].gameObject.SetActive (true);
			cameras [1].gameObject.SetActive (false);
			cameras [2].gameObject.SetActive (false);

		}else if(Input.GetKeyDown(KeyCode.B)){
			cameras [0].gameObject.SetActive (false);
			cameras [1].gameObject.SetActive (true);
			cameras [2].gameObject.SetActive (false);

		}else if(Input.GetKeyDown(KeyCode.C)){
			cameras [0].gameObject.SetActive (false);
			cameras [1].gameObject.SetActive (false);
			cameras [2].gameObject.SetActive (true);

		}
	}
}

/*
SetActive か enabled どっちが軽い？
キー入力の文字を数字にして指定したカメラだけをアクティブ化は負荷かかる？
*/