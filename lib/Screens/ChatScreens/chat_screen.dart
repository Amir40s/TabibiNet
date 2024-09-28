import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:tabibinet_project/constant.dart';
import 'package:tabibinet_project/model/res/appUtils/appUtils.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../Providers/chatProvider/chatProvider.dart';
import '../../global_provider.dart';
import '../../model/res/constant/app_fonts.dart';
import '../../model/res/constant/app_icons.dart';
import '../../model/res/widgets/header.dart';
import '../../model/res/widgets/text_widget.dart';

class ChatScreen extends StatelessWidget {
   ChatScreen({super.key, required this.chatRoomId, required this.patientEmail, required this.patientName, required this.profilePic});
  final String chatRoomId;
  final String patientEmail;
  final String patientName;
  final String profilePic;

  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChatProvider>(context);
    final doctorP = GlobalProviderAccess.profilePro;

    return Scaffold(
      backgroundColor: themeColor,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              color: themeColor
          ),
          child: Stack(
            children: [
              Column(
                children: [
                   ChatHeader(
                    name: patientName,
                    picture: profilePic,
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.only(top: 20),
                      decoration: const BoxDecoration(
                          color: secondaryGreenColor,
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(40)
                          )
                      ),
                      child: StreamBuilder(
                        stream: context.read<ChatProvider>().getMessages(chatRoomId),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          provider.markMessageAsRead(chatRoomId);
                          provider.updateDeliveryStatus(chatRoomId);
                          final messages = snapshot.data!.docs;
                          List<Widget> messageWidgets = [];
                          for (var message in messages) {
                            final messageText = message["text"];
                            final messageSender = message["sender"];
                            final messageTimestamp = message["timestamp"];
                            final isDelivered = message["delivered"];
                            final type = message["type"];
                            final documentId = message.id.toString();
        
                            final relativeTime = messageTimestamp != null
                                ? timeago.format(messageTimestamp.toDate())
                                : '';
        
                            // return ListView
                            final isCurrentUser = messageSender == AppUtils().getCurrentUserEmail();
        
                            final messageWidget = Dismissible(
                              key: Key(documentId),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                provider.deleteMessage(chatRoomId, documentId);
                                Fluttertoast.showToast(
                                  msg: "Message deleted",
                                  toastLength: Toast.LENGTH_SHORT,
                                );
                              },
                              background: Container(
                                color: Colors.red,
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(Icons.delete, color: Colors.white),
                              ),
                              child: Align(
                                alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
                                child: Column(
                                  mainAxisAlignment: isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
                                  crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: isCurrentUser  ? themeColor : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                      child: Column(
                                        crossAxisAlignment: isCurrentUser
                                            ? CrossAxisAlignment.end
                                            : CrossAxisAlignment.start,
                                        children: [
                                          type == "text" ?
                                          Text(
                                            messageText,
                                            style: TextStyle(color:  isCurrentUser ? Colors.white : Colors.black),
                                          ) :
                                          type == "image"  ?
                                          Image.network(message['url']!.toString(),width: 200.0,height: 200.0,)
                                              :
                                          // type == "document" ?
                                          // Container(
                                          //   width: 180.0,
                                          //   height: 180.0,
                                          //   child: Column(
                                          //     mainAxisAlignment: MainAxisAlignment.start,
                                          //     crossAxisAlignment: CrossAxisAlignment.center,
                                          //     children: [
                                          //       Stack(
                                          //           children: [
                                          //             Image.asset(AppImage.docImage),
                                          //             Positioned(
                                          //                 top: 0,
                                          //                 right: 0,
                                          //                 child: IconButton(
                                          //                   icon: Icon(Icons.save_alt_outlined,color: Colors.white,),
                                          //                   onPressed: () async{
                                          //                     log("message");
                                          //                     await provider.downloadFile(message['url'], message['text'],fallbackUrl: message['url']);
                                          //                   },
                                          //                 )
                                          //             ),
                                          //           ]),
                                          //       TextWidget(
                                          //         title: "Document: ${message['text']}",
                                          //         textColor: isCurrentUser ? Colors.white : Colors.black,
                                          //         fontSize: 12.0,
                                          //       )
                                          //     ],
                                          //   ),
                                          // ) : type == "voice" ?
                                          // Container(
                                          //   width: Get.width * 0.54,
                                          //   child: ListTile(
                                          //     title: Text("Voice Message"),
                                          //     trailing: PlayButton(audioUrl: message['text']),
                                          //   ),
                                          // ) : type == "location"
                                          //     ?
                                          //
                                          // Container(
                                          //   width: Get.width * 0.54,
                                          //   height: 150,
                                          //   child: Stack(
                                          //     children: [
                                          //       GoogleMap(
                                          //         initialCameraPosition: CameraPosition(
                                          //           target: LatLng(
                                          //             double.parse(message['latitude'].toString()),
                                          //             double.parse(message['longitude'].toString()),
                                          //           ),
                                          //           zoom: 15,
                                          //         ),
                                          //         markers: {
                                          //           Marker(
                                          //             markerId: MarkerId('location'),
                                          //             position: LatLng(
                                          //               double.parse(message['latitude'].toString()),
                                          //               double.parse(message['longitude'].toString()),
                                          //             ),
                                          //           ),
                                          //         },
                                          //         // Optional: Set map type or other properties
                                          //       ),
                                          //       Positioned(
                                          //         bottom: 0,
                                          //         right: 0,
                                          //         child: IconButton(
                                          //           icon: Icon(Icons.location_on_sharp, color: Colors.blue),
                                          //           onPressed: () {
                                          //             // log("Current Message ID ${message.id}");
                                          //             _openMap(message['latitude'].toString(), message['longitude'].toString());
                                          //           },
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // )
                                          //     : type == "offer" ?
                                          // ChatOfferWidget(
                                          //   price: message['text'],
                                          //   tax: message['tax'],
                                          //   fees: message['fees'],
                                          //   total: message['total'],
                                          //   description: message['details'],
                                          //   offerStatus: message['offerStatus'],
                                          //   messageID: documentId,
                                          //   chatRoomId: chatRoomId,
                                          //   otherEmail: otherEmail,
                                          // )
                                          //     :
                                          SizedBox.shrink(),
                                          SizedBox(height: 3),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                relativeTime,
                                                style: TextStyle(
                                                  color: isCurrentUser ?  Colors.white70 : Colors.grey,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              if (isCurrentUser) ...[
                                                SizedBox(width: 5),
                                                Icon(
                                                  message["read"] ? Icons.done_all : Icons.done,
                                                  color: message["read"] ? Colors.white :  Colors.white70,
                                                  size: 12,
                                                ),
                                              ],
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    if(isCurrentUser)
                                      Container(
                                          margin: EdgeInsets.symmetric(horizontal: 10),
                                          child: TextWidget(text: isDelivered ? "seen" : "deliver", fontSize:  12.0))
                                  ],
                                ),
                              ),
                            );
        
                            messageWidgets.add(messageWidget);
                          }
                          return ListView(
                            reverse: true,
                            children: messageWidgets,
                          );
                        },
                      ),
                    ),
                  ),
                  _buildMessageInput(context)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserMessage(String message, bool isSender) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        constraints: const BoxConstraints(maxWidth: 300),
        decoration: BoxDecoration(
          color: isSender ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isSender ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  // Widget _buildMessageInput(context) {
  //   TextEditingController messageController = TextEditingController();
  //
  //   // void sendMessage() async {
  //   //   if (messageController.text.isNotEmpty) {
  //   //     Map<String, dynamic> messageData = {
  //   //       'message': messageController.text,
  //   //       'sender': patientEmail,
  //   //       'time': FieldValue.serverTimestamp(),
  //   //     };
  //   //
  //   //     await FirebaseFirestore.instance
  //   //         .collection('chatRooms')
  //   //         .doc(chatRoomId)
  //   //         .collection('messages')
  //   //         .add(messageData);
  //   //
  //   //     // Clear the message field after sending
  //   //     messageController.clear();
  //   //   }
  //   // }
  //
  //   return Container(
  //     padding: const EdgeInsets.all(10),
  //     color: Colors.white,
  //     child: Row(
  //       children: [
  //         IconButton(
  //           icon: const Icon(Icons.camera_alt, color: Colors.grey),
  //           onPressed: () {
  //
  //           },
  //         ),
  //         Expanded(
  //           child: TextField(
  //             controller: messageController,
  //             decoration: InputDecoration(
  //               hintText: 'Message',
  //               border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(30),
  //                 borderSide: BorderSide.none,
  //               ),
  //               fillColor: Colors.grey[200],
  //               filled: true,
  //             ),
  //           ),
  //         ),
  //         IconButton(
  //           icon: const Icon(Icons.send, color: Colors.blueAccent),
  //           onPressed: () {
  //             final provider = Provider.of<ChatProvider>(context, listen: false);
  //             if (messageController.text.isNotEmpty) {
  //               provider.sendMessage(
  //                   chatRoomId: chatRoomId, message: messageController.text.toString(),
  //                   otherEmail: patientEmail.toString(), type: 'text'
  //               );
  //               messageController.clear();
  //             }
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }
  Widget _buildMessageInput(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: secondaryGreenColor,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.camera_alt, color: themeColor),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.photo, color: themeColor),
            onPressed: () {
              requestGalleryPermission(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.mic, color: themeColor),
            onPressed: () {},
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  const Icon(Icons.emoji_emotions_outlined, color: greyColor),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: greyColor,fontFamily: AppFonts.medium),
                        hintText: 'Message',
                        fillColor: bgColor,
                        filled: true,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        _showBottomSheet(context);
                      },
                      child: const Icon(Icons.attach_file, color: greyColor)),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              final provider = Provider.of<ChatProvider>(context, listen: false);
              provider.sendMessage(
                  chatRoomId: chatRoomId, message: messageController.text,otherEmail: patientEmail, type: 'text'
              );
              messageController.clear();
            },
            child: CircleAvatar(
              backgroundColor: themeColor,
              child: SvgPicture.asset(
                AppIcons.sendIcon,
                colorFilter: const ColorFilter.mode(
                    bgColor,
                    BlendMode.srcIn
                ),),
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildIconOption(
                icon: Icons.description,
                label: 'Document',
                color: Colors.purple,
              ),
              _buildIconOption(
                icon: Icons.photo,
                label: 'Gallery',
                color: Colors.red,
              ),
              _buildIconOption(
                icon: Icons.audiotrack,
                label: 'Audio',
                color: Colors.blue,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIconOption({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: Icon(icon, size: 30, color: Colors.white),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 16)),
      ],
    );
  }

  void _uploadPhoto(context) async{
    final provider = Provider.of<ChatProvider>(context);
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final file = result.files.single;
      final filePath = file.path!;
      final fileType = file.extension;
      String messageType;
      if (fileType == 'mp3' || fileType == 'wav') {
        messageType = 'voice';
      } else if (fileType == 'jpg' || fileType == 'png') {
        messageType = 'image';
      } else {
        messageType = 'document';
      }
      await provider.sendFileMessage(
        chatRoomId: chatRoomId,
        filePath: filePath,
        type: messageType,
        otherEmail: patientEmail,
      );
    }
  }

   Future<void> requestGalleryPermission(context) async {
     var status = await Permission.photos.status;
     if (!status.isGranted) {
       // Request permission
       if (await Permission.photos.request().isGranted) {
         _uploadPhoto(context);
         // Permission granted, proceed with gallery access
         // print("Gallery permission granted");
       } else {
         // Permission denied
         // print("Gallery permission denied");
       }
     } else {
       // Permission already granted
       // print("Gallery permission already granted");
     }
   }


}
