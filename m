Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by arago-project.org (Postfix) with ESMTPS id 20C81529B5
	for <meta-arago@arago-project.org>;
	Wed,  6 Jan 2016 21:19:38 +0000 (UTC)
Received: by mail-vk0-f51.google.com with SMTP id a123so132281357vkh.1
	for <meta-arago@arago-project.org>;
	Wed, 06 Jan 2016 13:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=594eHHW1rFrSAj4YIgbk49P6fW3X97jq7Wu3N/Tew2M=;
	b=h3OOwcogewFcVlvz9nnvdjfD0lnf7nYFdnl5afeBSWu/dgf5rMDf7+Y6cPj4r3C+cC
	1IG51IAwV3Lv4L6nDLMYTx6OBakxXy3ogxli3wuphXysIKSmT2G7CKzfVoMBd5sfWoZf
	7SGXKFXEgnOh04C8QOx9QcY6Bl5nIgCBjfKX4DQHWp3Rekafrtwe3FMOH17WoeXyp/uB
	m/BNOPlXUMbzi5vgZHM5jYMM4Y+kVkZBdQKqpvhkKTXVioa7FMrYQ1FhL1A7andwSr6/
	fAhFpDx8TdqWLMxtFofCPrx0YvLbb0elcmk9xpth0DZdD6GCAsjnDa83A5Ri44b/LV+Y
	jNdQ==
X-Received: by 10.31.131.203 with SMTP id f194mr72324519vkd.90.1452115177500; 
	Wed, 06 Jan 2016 13:19:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.166.146 with HTTP; Wed, 6 Jan 2016 13:19:18 -0800 (PST)
In-Reply-To: <CADySD0HySFRYxkFF6SnE1zfKh3+E1k7-aGFbVAR-vivP1NrsWA@mail.gmail.com>
References: <CADySD0FHQNG=r-um9qpbW1SQbnvZpum8mvnb19rD-4iOuZEujQ@mail.gmail.com>
	<CADySD0E+jJHqmsx+MsO-hwVr0iioSYGgRzYVs3o8RT-TzLO90w@mail.gmail.com>
	<20151217232009.GP27464@edge>
	<CADySD0HySFRYxkFF6SnE1zfKh3+E1k7-aGFbVAR-vivP1NrsWA@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 7 Jan 2016 10:19:18 +1300
Message-ID: <CADySD0GzYXdxzK3VOQ5NECRE==RNAiPMqdMOVV80Hq4N=VOY1Q@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: Bluetooth agent can't get default adapter
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jan 2016 21:19:38 -0000
Content-Type: multipart/alternative; boundary=001a1145817a53f4c80528b0e9ab

--001a1145817a53f4c80528b0e9ab
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Managed to get it working by disabling TI's shared transport in kernel
along with kim, uim.

On Fri, Dec 18, 2015 at 12:58 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
wrote:

> Because our product is based on 3.14
>
> Now we are trying to add Wi-Fi, Bluetooth capability to it
>
> I am happy to back-port some stuff from 4.1 if it can fix it
>
> regards
> Ankur
>
> "Knowledge is knowing tomato is a fruit, wisdom is not putting it in a
> fruit salad"
>
> On Fri, Dec 18, 2015 at 12:20 PM, Denys Dmytriyenko <denys@ti.com> wrote:
>
>> Any specific reason you are trying 3.14? Can you try 4.1 instead?
>>
>> --
>> Denys
>>
>>
>> On Fri, Dec 18, 2015 at 11:38:40AM +1300, Ankur Tyagi wrote:
>> > Further debugged it to check dbus and bluez service
>> >
>> > =E2=80=8B=E2=80=8B
>> > dbus is running and service file is also present
>> >
>> > root@am335x-evm:~# cat
>> /usr/share/dbus-1/system-services/org.bluez.service
>> > [D-BUS Service]
>> > Name=3Dorg.bluez
>> > Exec=3D/bin/false
>> > User=3Droot
>> > SystemdService=3Ddbus-org.bluez.service
>> >
>> > root@am335x-evm:~# cat /etc/dbus-1/system.d/bluetooth.conf
>> > <!-- This configuration file specifies the required security policies
>> >      for Bluetooth core daemon to work. -->
>> > <!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuratio=
n
>> > 1.0//EN"
>> >  "<a href=3D"http://www.freedesktop.org/standards/dbus/1.0/busconfig.d=
td
>> ">
>> > www.freedesktop.org/.../busconfig.dtd"></a>
>> > <busconfig>
>> >   <!-- ../system.conf have denied everything, so we just punch some
>> holes
>> > -->
>> >   <policy user=3D"root">
>> >     <allow own=3D"org.bluez"/>
>> >     <allow send_destination=3D"org.bluez"/>
>> >     <allow send_interface=3D"org.bluez.Agent"/>
>> >     <allow send_interface=3D"org.bluez.PasskeyAgent"/>
>> >   </policy>
>> >
>> >   <policy context=3D"default">
>> >     <allow own=3D"org.bluez"/>
>> >     <allow send_destination=3D"org.bluez"/>
>> >     <allow send_interface=3D"org.bluez.Agent"/>
>> >   </policy>
>> >
>> > </busconfig>
>> >
>> >
>> > When I run bluetoothd, I can see org.bluez in dbus list
>> >
>> > root@am335x-evm:~# dbus-send --system --dest=3Dorg.freedesktop.DBus
>> > --type=3Dmethod_call --print-reply /org/freedesktop/DBus
>> > org.freedesktop.DBus.ListNames
>> > method return sender=3Dorg.freedesktop.DBus -> dest=3D:1.4 reply_seria=
l=3D2
>> >    array [
>> >       string "org.freedesktop.DBus"
>> >       string ":1.4"
>> >       string ":1.0"
>> >       string "org.bluez"
>> >    ]
>> >
>> > But when I query default adapter, I don't get a response
>> >
>> > root@am335x-evm:~# dbus-send --system --print-reply --dest=3Dorg.bluez=
 /
>> > org.bluez.Manager.ListAdapters
>> > method return sender=3D:1.0 -> dest=3D:1.5 reply_serial=3D2
>> >    array [
>> >    ]
>> >
>> > What's missing to get it working ? Any help is appreciated
>> >
>> > Thanks
>> > Ankur
>> >
>> > "Knowledge is knowing tomato is a fruit, wisdom is not putting it in a
>> > fruit salad"
>> >
>> > On Thu, Dec 17, 2015 at 7:24 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
>> > wrote:
>> >
>> > > =E2=80=8B=E2=80=8B
>> > > Hi,
>> > >
>> > > I am trying to use WL1835  bluetooth with AM335x EVM. Software is
>> > > meta-arago daisy.
>> > >
>> > > When I run bluetooth agent, I get error  "Can't get default adapter"
>> > >
>> > > Following is the sequence of commands:
>> > >
>> > > root@am335x-evm:~# bluetoothd
>> > >
>> > > root@am335x-evm:~# hciconfig hci0 up
>> > >
>> > > [  944.008593] (stc):  chnl_id list empty :4
>> > > [  944.012749] (stk) : st_kim_start(stk) :ldisc_install =3D 1uim:pol=
l
>> broke
>> > > due to event 10(PRI:2/ERR:8)
>> > >
>> > > uim:read 1 from install
>> > >
>> > > uim:@ st_uart_config
>> > > uim: signal received, opening /dev/ttyS1
>> > > uim:@ set_baud_rate
>> > > uim:set_baud_rate() done
>> > > uim:Setting speed to 3000000
>> > > uim:@ read_command_complete
>> > > uim: Command complete started
>> > > uim:@ read_hci_event
>> > > uim: read_hci_event
>> > > uim:Command complete done
>> > > [  944.180311] (stc): st_tty_open
>> > > uim:Speed changing to 3000000, 1
>> > > uim:@ set_custom_baud_rate
>> > > (stk) :line discipline installeduim:Installed N_TI_WL Line displine
>> > > [  944.194437] (stk) :TIInit_11.8.32.bts
>> > > uim:begin polling...
>> > > (stk) :change remote baud rate command in firmware
>> > > [  944.214516] (stk) :skipping the wait event of change remote baud[
>> > >  944.928331] (stc): add_channel_to_table: id 4
>> > > [  944.932771] (stc): add_channel_to_table: id 2
>> > > [  944.937149] (stc): add_channel_to_table: id 3
>> > >
>> > > root@am335x-evm:~# hcitool scan
>> > > Scanning ...
>> > >         00:02:72:E3:0F:7F       RS232 Dongle Slave
>> > >
>> > > root@am335x-evm:~# agent hci0 00:02:72:E3:0F:7F
>> > > Can't get default adapter
>> > > No such adapter
>> > >
>> > > root@am335x-evm:~# dmesg | grep Bluetooth
>> > > [    3.475348] Bluetooth: Core ver 2.18
>> > > [    3.483613] Bluetooth: HCI device and connection manager
>> initialized
>> > > [    3.663793] Bluetooth: HCI socket layer initialized
>> > > [    3.668731] Bluetooth: L2CAP socket layer initialized
>> > > [    3.814838] Bluetooth: SCO socket layer initialized
>> > > [   16.667945] Bluetooth: st_register failed -22
>> > >
>> > > What am I missing here ?
>> > >
>> > > thanks
>> > > Ankur
>> > >
>>
>> > _______________________________________________
>> > meta-arago mailing list
>> > meta-arago@arago-project.org
>> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>
>>
>

--001a1145817a53f4c80528b0e9ab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"color:rgb(51,51,153)=
;font-family:georgia,serif;font-size:small">Managed to get it working by di=
sabling TI&#39;s shared transport in kernel along with kim, uim.</div><div =
class=3D"gmail_extra">
<br><div class=3D"gmail_quote">On Fri, Dec 18, 2015 at 12:58 PM, Ankur Tyag=
i <span dir=3D"ltr">&lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" target=
=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;bord=
er-left-color:rgb(204,204,204);border-left-width:1px;border-left-style:soli=
d"><div dir=3D"ltr"><div style=3D"color:rgb(51,51,153);font-family:georgia,=
serif;font-size:small">Because our product is based on 3.14</div><div style=
=3D"color:rgb(51,51,153);font-family:georgia,serif;font-size:small"><br></d=
iv><div style=3D"color:rgb(51,51,153);font-family:georgia,serif;font-size:s=
mall">Now we are trying to add Wi-Fi, Bluetooth capability to it</div><div =
style=3D"color:rgb(51,51,153);font-family:georgia,serif;font-size:small"><b=
r></div><div style=3D"color:rgb(51,51,153);font-family:georgia,serif;font-s=
ize:small">I am happy to back-port some stuff from 4.1 if it can fix it</di=
v><div style=3D"color:rgb(51,51,153);font-family:georgia,serif;font-size:sm=
all"><br></div><div style=3D"color:rgb(51,51,153);font-family:georgia,serif=
;font-size:small">regards</div><span class=3D"HOEnZb"><font color=3D"#88888=
8"><div style=3D"color:rgb(51,51,153);font-family:georgia,serif;font-size:s=
mall">Ankur</div></font></span></div><div class=3D"gmail_extra"><span><br c=
lear=3D"all"><div><div><div dir=3D"ltr">&quot;Knowledge is knowing tomato i=
s a fruit, wisdom is not putting it in a fruit salad&quot;</div></div></div=
>
<br></span><div><div class=3D"h5"><div class=3D"gmail_quote">On Fri, Dec 18=
, 2015 at 12:20 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mail=
to:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;padding-l=
eft:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;border-lef=
t-style:solid">Any specific reason you are trying 3.14? Can you try 4.1 ins=
tead?<br>
<br>
--<br>
Denys<br>
<div><div><br>
<br>
On Fri, Dec 18, 2015 at 11:38:40AM +1300, Ankur Tyagi wrote:<br>
&gt; Further debugged it to check dbus and bluez service<br>
&gt;<br>
&gt; =E2=80=8B=E2=80=8B<br>
&gt; dbus is running and service file is also present<br>
&gt;<br>
&gt; root@am335x-evm:~# cat /usr/share/dbus-1/system-services/org.bluez.ser=
vice<br>
&gt; [D-BUS Service]<br>
&gt; Name=3Dorg.bluez<br>
&gt; Exec=3D/bin/false<br>
&gt; User=3Droot<br>
&gt; SystemdService=3Ddbus-org.bluez.service<br>
&gt;<br>
&gt; root@am335x-evm:~# cat /etc/dbus-1/system.d/bluetooth.conf<br>
&gt; &lt;!-- This configuration file specifies the required security polici=
es<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for Bluetooth core daemon to work. --&gt;<br>
&gt; &lt;!DOCTYPE busconfig PUBLIC &quot;-//freedesktop//DTD D-BUS Bus Conf=
iguration<br>
&gt; 1.0//EN&quot;<br>
&gt;=C2=A0 &quot;&lt;a href=3D&quot;<a href=3D"http://www.freedesktop.org/s=
tandards/dbus/1.0/busconfig.dtd" target=3D"_blank" rel=3D"noreferrer">http:=
//www.freedesktop.org/standards/dbus/1.0/busconfig.dtd</a>&quot;&gt;<br>
&gt; <a href=3D"http://www.freedesktop.org/.../busconfig.dtd" target=3D"_bl=
ank" rel=3D"noreferrer">www.freedesktop.org/.../busconfig.dtd</a>&quot;&gt;=
&lt;/a&gt;<br>
&gt; &lt;busconfig&gt;<br>
&gt;=C2=A0 =C2=A0&lt;!-- ../system.conf have denied everything, so we just =
punch some holes<br>
&gt; --&gt;<br>
&gt;=C2=A0 =C2=A0&lt;policy user=3D&quot;root&quot;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;allow own=3D&quot;org.bluez&quot;/&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;allow send_destination=3D&quot;org.bluez&quot;/=
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;allow send_interface=3D&quot;org.bluez.Agent&qu=
ot;/&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;allow send_interface=3D&quot;org.bluez.PasskeyA=
gent&quot;/&gt;<br>
&gt;=C2=A0 =C2=A0&lt;/policy&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0&lt;policy context=3D&quot;default&quot;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;allow own=3D&quot;org.bluez&quot;/&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;allow send_destination=3D&quot;org.bluez&quot;/=
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;allow send_interface=3D&quot;org.bluez.Agent&qu=
ot;/&gt;<br>
&gt;=C2=A0 =C2=A0&lt;/policy&gt;<br>
&gt;<br>
&gt; &lt;/busconfig&gt;<br>
&gt;<br>
&gt;<br>
&gt; When I run bluetoothd, I can see org.bluez in dbus list<br>
&gt;<br>
&gt; root@am335x-evm:~# dbus-send --system --dest=3Dorg.freedesktop.DBus<br=
>
&gt; --type=3Dmethod_call --print-reply /org/freedesktop/DBus<br>
&gt; org.freedesktop.DBus.ListNames<br>
&gt; method return sender=3Dorg.freedesktop.DBus -&gt; dest=3D:1.4 reply_se=
rial=3D2<br>
&gt;=C2=A0 =C2=A0 array [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0string &quot;org.freedesktop.DBus&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0string &quot;:1.4&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0string &quot;:1.0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0string &quot;org.bluez&quot;<br>
&gt;=C2=A0 =C2=A0 ]<br>
&gt;<br>
&gt; But when I query default adapter, I don&#39;t get a response<br>
&gt;<br>
&gt; root@am335x-evm:~# dbus-send --system --print-reply --dest=3Dorg.bluez=
 /<br>
&gt; org.bluez.Manager.ListAdapters<br>
&gt; method return sender=3D:1.0 -&gt; dest=3D:1.5 reply_serial=3D2<br>
&gt;=C2=A0 =C2=A0 array [<br>
&gt;=C2=A0 =C2=A0 ]<br>
&gt;<br>
&gt; What&#39;s missing to get it working ? Any help is appreciated<br>
&gt;<br>
&gt; Thanks<br>
&gt; Ankur<br>
&gt;<br>
&gt; &quot;Knowledge is knowing tomato is a fruit, wisdom is not putting it=
 in a<br>
&gt; fruit salad&quot;<br>
&gt;<br>
&gt; On Thu, Dec 17, 2015 at 7:24 PM, Ankur Tyagi &lt;<a href=3D"mailto:ank=
ur.tyagi85@gmail.com" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt; &gt; =E2=80=8B=E2=80=8B<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; I am trying to use WL1835=C2=A0 bluetooth with AM335x EVM. Softwa=
re is<br>
&gt; &gt; meta-arago daisy.<br>
&gt; &gt;<br>
&gt; &gt; When I run bluetooth agent, I get error=C2=A0 &quot;Can&#39;t get=
 default adapter&quot;<br>
&gt; &gt;<br>
&gt; &gt; Following is the sequence of commands:<br>
&gt; &gt;<br>
&gt; &gt; root@am335x-evm:~# bluetoothd<br>
&gt; &gt;<br>
&gt; &gt; root@am335x-evm:~# hciconfig hci0 up<br>
&gt; &gt;<br>
&gt; &gt; [=C2=A0 944.008593] (stc):=C2=A0 chnl_id list empty :4<br>
&gt; &gt; [=C2=A0 944.012749] (stk) : st_kim_start(stk) :ldisc_install =3D =
1uim:poll broke<br>
&gt; &gt; due to event 10(PRI:2/ERR:8)<br>
&gt; &gt;<br>
&gt; &gt; uim:read 1 from install<br>
&gt; &gt;<br>
&gt; &gt; uim:@ st_uart_config<br>
&gt; &gt; uim: signal received, opening /dev/ttyS1<br>
&gt; &gt; uim:@ set_baud_rate<br>
&gt; &gt; uim:set_baud_rate() done<br>
&gt; &gt; uim:Setting speed to 3000000<br>
&gt; &gt; uim:@ read_command_complete<br>
&gt; &gt; uim: Command complete started<br>
&gt; &gt; uim:@ read_hci_event<br>
&gt; &gt; uim: read_hci_event<br>
&gt; &gt; uim:Command complete done<br>
&gt; &gt; [=C2=A0 944.180311] (stc): st_tty_open<br>
&gt; &gt; uim:Speed changing to 3000000, 1<br>
&gt; &gt; uim:@ set_custom_baud_rate<br>
&gt; &gt; (stk) :line discipline installeduim:Installed N_TI_WL Line displi=
ne<br>
&gt; &gt; [=C2=A0 944.194437] (stk) :TIInit_11.8.32.bts<br>
&gt; &gt; uim:begin polling...<br>
&gt; &gt; (stk) :change remote baud rate command in firmware<br>
&gt; &gt; [=C2=A0 944.214516] (stk) :skipping the wait event of change remo=
te baud[<br>
&gt; &gt;=C2=A0 944.928331] (stc): add_channel_to_table: id 4<br>
&gt; &gt; [=C2=A0 944.932771] (stc): add_channel_to_table: id 2<br>
&gt; &gt; [=C2=A0 944.937149] (stc): add_channel_to_table: id 3<br>
&gt; &gt;<br>
&gt; &gt; root@am335x-evm:~# hcitool scan<br>
&gt; &gt; Scanning ...<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A000:02:72:E3:0F:7F=C2=A0 =C2=A0 =
=C2=A0 =C2=A0RS232 Dongle Slave<br>
&gt; &gt;<br>
&gt; &gt; root@am335x-evm:~# agent hci0 00:02:72:E3:0F:7F<br>
&gt; &gt; Can&#39;t get default adapter<br>
&gt; &gt; No such adapter<br>
&gt; &gt;<br>
&gt; &gt; root@am335x-evm:~# dmesg | grep Bluetooth<br>
&gt; &gt; [=C2=A0 =C2=A0 3.475348] Bluetooth: Core ver 2.18<br>
&gt; &gt; [=C2=A0 =C2=A0 3.483613] Bluetooth: HCI device and connection man=
ager initialized<br>
&gt; &gt; [=C2=A0 =C2=A0 3.663793] Bluetooth: HCI socket layer initialized<=
br>
&gt; &gt; [=C2=A0 =C2=A0 3.668731] Bluetooth: L2CAP socket layer initialize=
d<br>
&gt; &gt; [=C2=A0 =C2=A0 3.814838] Bluetooth: SCO socket layer initialized<=
br>
&gt; &gt; [=C2=A0 =C2=A016.667945] Bluetooth: st_register failed -22<br>
&gt; &gt;<br>
&gt; &gt; What am I missing here ?<br>
&gt; &gt;<br>
&gt; &gt; thanks<br>
&gt; &gt; Ankur<br>
&gt; &gt;<br>
<br>
</div></div>&gt; _______________________________________________<br>
&gt; meta-arago mailing list<br>
&gt; <a href=3D"mailto:meta-arago@arago-project.org" target=3D"_blank">meta=
-arago@arago-project.org</a><br>
&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o" target=3D"_blank" rel=3D"noreferrer">http://arago-project.org/cgi-bin/ma=
ilman/listinfo/meta-arago</a><br>
<br>
</blockquote></div><br></div></div></div>
</blockquote></div><br></div></div>

--001a1145817a53f4c80528b0e9ab--
