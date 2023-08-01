import 'package:My_News/moduels/web_view/WebViewScreen.dart';
import 'package:flutter/material.dart';
Widget buildItem(articles,context)=> InkWell(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewScreen(articles['url'])));
  },
  child:   Padding(

    padding:  EdgeInsets.all(10.0),

    child: Row(

      children: [

        Container(

          height: 140,

          width: 120,

          decoration: BoxDecoration(

            borderRadius:BorderRadius.circular(20.0) ,

            image:DecorationImage(

              image: NetworkImage('${articles['urlToImage']}',),onError: (context,exeption){

                Image.asset('images/no-image-icon-15.png');

            },

              fit:BoxFit.cover,

            ),

          ),),

        SizedBox(width: 20,),

        Expanded(

          child: Container(

            height: 120,

            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Expanded(

                  child: Text('${articles['title']}',

                    style:Theme.of(context).textTheme.bodyText1,

                    maxLines: 3,

                    overflow:TextOverflow.ellipsis,),

                ),

                Text('${articles['publishedAt']}',style: TextStyle(color: Colors.grey),)

              ],

            ),

          ),

        ),

      ],

    ),

  ),
);
Widget myDivider()=>Padding(
  padding: const EdgeInsets.only(left: 10),
  child:   Container(
    width:double.infinity,
    height: 1,
    color: Colors.grey,

  ),
);
Widget default_Form({
  required TextEditingController control,
  required TextInputType keyboard,
  change,
  onTap,

  required  validate,
  required String label,
    hinttext,
  required Widget icon,
  IconData? suficon ,
  suffexpressed,
  bool ispassword= false ,
}) => Container(
  child: TextFormField(
    onTap: onTap,
    validator: validate,
    controller: control,
    keyboardType: keyboard,
    onChanged:change,
    obscureText:ispassword,
    decoration:   InputDecoration(
      prefixIcon: icon,
      suffixIcon: suficon !=null ? IconButton(icon:Icon(suficon,) ,onPressed: suffexpressed,):null,
      label: Text(label),
      labelStyle:const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w800),
      hintText: hinttext ,
      hintStyle: TextStyle(backgroundColor: Colors.white10),
      border: OutlineInputBorder(),
    ),
  ),);



