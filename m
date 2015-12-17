Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by arago-project.org (Postfix) with ESMTPS id 0E1BB529B5
	for <meta-arago@arago-project.org>;
	Thu, 17 Dec 2015 06:24:36 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id a189so40750035vkh.2
	for <meta-arago@arago-project.org>;
	Wed, 16 Dec 2015 22:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=U/edcldxgkXPMGwcLRboQ0cxa6cab/y7RDOGCV4jc1w=;
	b=YqsRWXdM0aI9NxucvVj3qGjblE4oTPmFsldUghL7wGWbzXCPAFTTENDzeKelclDwkO
	L3/pI8hRjmx7MJl3bB96sU7MuKm5eDj49NtQ8Ea3nmEKxWKOFyDbHC8Gquhwou36mxsi
	Ncu6848ag0nazK2HPO3PS+7yDepkDzLG1efbnBs96c4BeekQq1+eNA+YvbhFObfX8PSF
	KNmaWES2mVP05MPFRPDNqCVBmTDEYIYfQhMAbQjfZk35of1AmMfZlLEo0mkNEBaak1pi
	bg+yJ/TQdKeAsrnCn/99dVAgfk2HCs/KexgCXJIeasknaoY2zpk8jY21YJYDSpqrZPiF
	fc9g==
X-Received: by 10.31.157.76 with SMTP id g73mr25455371vke.7.1450333475486;
	Wed, 16 Dec 2015 22:24:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.166.146 with HTTP; Wed, 16 Dec 2015 22:24:16 -0800 (PST)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 17 Dec 2015 19:24:16 +1300
Message-ID: <CADySD0FHQNG=r-um9qpbW1SQbnvZpum8mvnb19rD-4iOuZEujQ@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Bluetooth agent can't get default adapter
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
X-List-Received-Date: Thu, 17 Dec 2015 06:24:42 -0000
Content-Type: multipart/alternative; boundary=001a114168a89cbfd30527121376

--001a114168a89cbfd30527121376
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=E2=80=8B=E2=80=8B
Hi,

I am trying to use WL1835  bluetooth with AM335x EVM. Software is
meta-arago daisy.

When I run bluetooth agent, I get error  "Can't get default adapter"

Following is the sequence of commands:

root@am335x-evm:~# bluetoothd

root@am335x-evm:~# hciconfig hci0 up

[  944.008593] (stc):  chnl_id list empty :4
[  944.012749] (stk) : st_kim_start(stk) :ldisc_install =3D 1uim:poll broke
due to event 10(PRI:2/ERR:8)

uim:read 1 from install

uim:@ st_uart_config
uim: signal received, opening /dev/ttyS1
uim:@ set_baud_rate
uim:set_baud_rate() done
uim:Setting speed to 3000000
uim:@ read_command_complete
uim: Command complete started
uim:@ read_hci_event
uim: read_hci_event
uim:Command complete done
[  944.180311] (stc): st_tty_open
uim:Speed changing to 3000000, 1
uim:@ set_custom_baud_rate
(stk) :line discipline installeduim:Installed N_TI_WL Line displine
[  944.194437] (stk) :TIInit_11.8.32.bts
uim:begin polling...
(stk) :change remote baud rate command in firmware
[  944.214516] (stk) :skipping the wait event of change remote baud[
 944.928331] (stc): add_channel_to_table: id 4
[  944.932771] (stc): add_channel_to_table: id 2
[  944.937149] (stc): add_channel_to_table: id 3

root@am335x-evm:~# hcitool scan
Scanning ...
        00:02:72:E3:0F:7F       RS232 Dongle Slave

root@am335x-evm:~# agent hci0 00:02:72:E3:0F:7F
Can't get default adapter
No such adapter

root@am335x-evm:~# dmesg | grep Bluetooth
[    3.475348] Bluetooth: Core ver 2.18
[    3.483613] Bluetooth: HCI device and connection manager initialized
[    3.663793] Bluetooth: HCI socket layer initialized
[    3.668731] Bluetooth: L2CAP socket layer initialized
[    3.814838] Bluetooth: SCO socket layer initialized
[   16.667945] Bluetooth: st_register failed -22

What am I missing here ?

thanks
Ankur

--001a114168a89cbfd30527121376
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:rgb(51,51,153);display:inline">=E2=80=8B=E2=80=
=8B</div>Hi,<br><br>I am trying to use WL1835 =C2=A0bluetooth with AM335x E=
VM. Software is meta-arago daisy.<br><br>When I run bluetooth agent, I get =
error =C2=A0&quot;Can&#39;t get default adapter&quot;<br><br>Following is t=
he sequence of commands:<br><br>root@am335x-evm:~# bluetoothd<br><br>root@a=
m335x-evm:~# hciconfig hci0 up<br><br>[ =C2=A0944.008593] (stc): =C2=A0chnl=
_id list empty :4<br>[ =C2=A0944.012749] (stk) : st_kim_start(stk) :ldisc_i=
nstall =3D 1uim:poll broke due to event 10(PRI:2/ERR:8)<br><br>uim:read 1 f=
rom install<br><br>uim:@ st_uart_config<br>uim: signal received, opening /d=
ev/ttyS1<br>uim:@ set_baud_rate<br>uim:set_baud_rate() done<br>uim:Setting =
speed to 3000000<br>uim:@ read_command_complete<br>uim: Command complete st=
arted<br>uim:@ read_hci_event<br>uim: read_hci_event<br>uim:Command complet=
e done<br>[ =C2=A0944.180311] (stc): st_tty_open<br>uim:Speed changing to 3=
000000, 1<br>uim:@ set_custom_baud_rate<br>(stk) :line discipline installed=
uim:Installed N_TI_WL Line displine<br>[ =C2=A0944.194437] (stk) :TIInit_11=
.8.32.bts<br>uim:begin polling...<br>(stk) :change remote baud rate command=
 in firmware<br>[ =C2=A0944.214516] (stk) :skipping the wait event of chang=
e remote baud[ =C2=A0944.928331] (stc): add_channel_to_table: id 4<br>[ =C2=
=A0944.932771] (stc): add_channel_to_table: id 2<br>[ =C2=A0944.937149] (st=
c): add_channel_to_table: id 3<br><br>root@am335x-evm:~# hcitool scan<br>Sc=
anning ...<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 00:02:72:E3:0F:7F =C2=A0 =C2=A0 =
=C2=A0 RS232 Dongle Slave<br><br>root@am335x-evm:~# agent hci0 00:02:72:E3:=
0F:7F<br>Can&#39;t get default adapter<br>No such adapter<br><br>root@am335=
x-evm:~# dmesg | grep Bluetooth<br>[ =C2=A0 =C2=A03.475348] Bluetooth: Core=
 ver 2.18<br>[ =C2=A0 =C2=A03.483613] Bluetooth: HCI device and connection =
manager initialized<br>[ =C2=A0 =C2=A03.663793] Bluetooth: HCI socket layer=
 initialized<br>[ =C2=A0 =C2=A03.668731] Bluetooth: L2CAP socket layer init=
ialized<br>[ =C2=A0 =C2=A03.814838] Bluetooth: SCO socket layer initialized=
<br>[ =C2=A0 16.667945] Bluetooth: st_register failed -22<br><br>What am I =
missing here ?<br><br>thanks<br>Ankur
</div>

--001a114168a89cbfd30527121376--
