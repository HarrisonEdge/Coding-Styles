using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{

    #region Player Variables
    
    //Raycast hits
    RaycastHit hit1, hit2, hit3, hit4;


    [Header("Player Movement Restrictions")]
    public bool allowUp = true;
    public bool allowDown = true;
    public bool allowLeft = true;
    public bool allowRight = true;

    #endregion

    //check tag - collision
    //block tag is checking to see if there's anything else other than wall that can stop the player from moving
    string blockTag, wallTag;
    GameObject PlayerSpawn;


    // Start is called before the first frame update

    void Awake()
    {
        PlayerSpawn = GameObject.FindGameObjectWithTag("PlayerSpawn");
    }

    void Start()
    {
    //write object/wall tags 
        blockTag = "Block";
        wallTag = "Wall";

        transform.position = PlayerSpawn.transform.position;

    }



    // Update is called once per frame
    void FixedUpdate()
    {

        var rayUp = new Ray(transform.position, transform.forward);
        var rayDown = new Ray(transform.position, -transform.forward);
        var rayRight = new Ray(transform.position, transform.right);
        var rayLeft = new Ray(transform.position, -transform.right);

        //trapped
        if (!allowUp && !allowDown && !allowLeft && !allowRight)
        {
        //end game
        }

        //Up
        if (Physics.Raycast(rayUp, out hit1, 1) && hit1.transform.CompareTag(blockTag) ||
            Physics.Raycast(rayUp, out hit1, 1) && hit1.transform.CompareTag(wallTag))
        {

            allowUp = false;
        }
        else
        {
            allowUp = true;
        }
        //down
        if (Physics.Raycast(rayDown, out hit2, 1) && hit2.transform.CompareTag(blockTag) ||
            Physics.Raycast(rayDown, out hit2, 1) && hit2.transform.CompareTag(wallTag))
        {

            allowDown = false;
        }
        else
        {
            allowDown = true;
        }
        //right
        if (Physics.Raycast(rayRight, out hit3, 1) && hit3.transform.CompareTag(blockTag) ||
            Physics.Raycast(rayRight, out hit3, 1) && hit3.transform.CompareTag(wallTag))
        {

            allowRight = false;
        }
        else
        {
            allowRight = true;
        }
        //left
        if (Physics.Raycast(rayLeft, out hit4, 1) && hit4.transform.CompareTag(blockTag) ||
            Physics.Raycast(rayLeft, out hit4, 1) && hit4.transform.CompareTag(wallTag))
        {

            allowLeft = false;
        }
        else
        {
            allowLeft = true;
        }


    }

    //player movements
    void Update()
    {
        if (Time.timeScale != 0)
        {
            if (Input.GetKeyDown(KeyCode.W) && allowUp)
            {
                transform.Translate(Vector3.forward);
            }
            else if (Input.GetKeyDown(KeyCode.S) && allowDown)
            {
                transform.Translate(Vector3.back);
            }
            else if (Input.GetKeyDown(KeyCode.D) && allowRight)
            {
                transform.Translate(Vector3.right);
            }
            else if (Input.GetKeyDown(KeyCode.A) && allowLeft)
            {
                transform.Translate(Vector3.left);
            }
        }

    }
}
