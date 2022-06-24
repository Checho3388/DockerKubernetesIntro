# Ejercicio 10
## Step 1
Creo un archivo de variables de entorno en la carpeta y luego corro el container de la siguiente manera:
```shell
docker run --env-file=.env nicopaez/telegrambot:0.0.7
```
Al enviar `/version` el bot me responde con `0.0.7` tal como se muestra a continuación:

![Screenshot](https://github.com/Checho3388/DockerKubernetesIntro/blob/main/ejercicio10/Screenshot%20from%202022-06-24%2016-41-41.png "Screenshot")


## Step 2
Una vez creado el deployment (`deployment.yml`), inicializo la aplicación con el siguiente comando:

```shell
$ minikube start
# ...
$ kubectl apply -f deployment.yml
deployment.apps/telegrambot created
```

Luego valido la correcta inicialización del container:
```shell
$ kubectl get pods                     
NAME                           READY   STATUS    RESTARTS   AGE
telegrambot-5c7c75fdfc-clkxf   1/1     Running   0          3m38s
```

Al enviar `/version` nuevamente el bot responde con `0.0.7`. Es posible conectarme a los logs del contenedor para 
validar que los mensajes llegan al mismo:
```shell
$ kubectl logs telegrambot-5c7c75fdfc-clkxf -f
I, [2022-06-24T19:50:31.194033 #1]  INFO -- : Starting bot version:0.0.7
I, [2022-06-24T19:50:31.194083 #1]  INFO -- : token is <TOKEN_HERE>
I, [2022-06-24T19:50:31.194106 #1]  INFO -- : Starting bot
I, [2022-06-24T19:53:46.116698 #1]  INFO -- : Incoming message: text="/version" uid=5547620475
D, [2022-06-24T19:53:46.117200 #1] DEBUG -- : From: @, message: #<Telegram::Bot::Types::Message:0x000055f8505a5458 @message_id=11, @from=#<Telegram::Bot::Types::User:0x000055f850595e40 @id=5547620475, @is_bot=false, @first_name="Ezequiel", @last_name="Grondona", @language_code="en", @username=nil>, @chat=#<Telegram::Bot::Types::Chat:0x000055f85058f130 @id=5547620475, @first_name="Ezequiel", @last_name="Grondona", @type="private", @title=nil, @username=nil, @all_members_are_administrators=nil, @photo=nil, @description=nil, @invite_link=nil, @pinned_message=nil>, @date=1656100425, @text="/version", @entities=[#<Telegram::Bot::Types::MessageEntity:0x000055f8505872a0 @offset=0, @length=8, @type="bot_command", @url=nil, @user=nil>], @forward_from=nil, @forward_from_chat=nil, @forward_from_message_id=nil, @forward_signature=nil, @forward_sender_name=nil, @forward_date=nil, @reply_to_message=nil, @edit_date=nil, @media_group_id=nil, @author_signature=nil, @caption_entities=[], @audio=nil, @document=nil, @animation=nil, @game=nil, @photo=[], @sticker=nil, @video=nil, @voice=nil, @video_note=nil, @caption=nil, @contact=nil, @location=nil, @venue=nil, @poll=nil, @new_chat_members=[], @left_chat_member=nil, @new_chat_title=nil, @new_chat_photo=[], @delete_chat_photo=nil, @group_chat_created=nil, @supergroup_chat_created=nil, @channel_chat_created=nil, @migrate_to_chat_id=nil, @migrate_from_chat_id=nil, @pinned_message=nil, @invoice=nil, @successful_payment=nil, @connected_website=nil>
I, [2022-06-24T19:54:51.529932 #1]  INFO -- : Incoming message: text="/version" uid=5547620475
D, [2022-06-24T19:54:51.530065 #1] DEBUG -- : From: @, message: #<Telegram::Bot::Types::Message:0x000055f850359f28 @message_id=13, @from=#<Telegram::Bot::Types::User:0x000055f850359eb0 @id=5547620475, @is_bot=false, @first_name="Ezequiel", @last_name="Grondona", @language_code="en", @username=nil>, @chat=#<Telegram::Bot::Types::Chat:0x000055f8503591e0 @id=5547620475, @first_name="Ezequiel", @last_name="Grondona", @type="private", @title=nil, @username=nil, @all_members_are_administrators=nil, @photo=nil, @description=nil, @invite_link=nil, @pinned_message=nil>, @date=1656100491, @text="/version", @entities=[#<Telegram::Bot::Types::MessageEntity:0x000055f85034b3b0 @offset=0, @length=8, @type="bot_command", @url=nil, @user=nil>], @forward_from=nil, @forward_from_chat=nil, @forward_from_message_id=nil, @forward_signature=nil, @forward_sender_name=nil, @forward_date=nil, @reply_to_message=nil, @edit_date=nil, @media_group_id=nil, @author_signature=nil, @caption_entities=[], @audio=nil, @document=nil, @animation=nil, @game=nil, @photo=[], @sticker=nil, @video=nil, @voice=nil, @video_note=nil, @caption=nil, @contact=nil, @location=nil, @venue=nil, @poll=nil, @new_chat_members=[], @left_chat_member=nil, @new_chat_title=nil, @new_chat_photo=[], @delete_chat_photo=nil, @group_chat_created=nil, @supergroup_chat_created=nil, @channel_chat_created=nil, @migrate_to_chat_id=nil, @migrate_from_chat_id=nil, @pinned_message=nil, @invoice=nil, @successful_payment=nil, @connected_website=nil>
```
