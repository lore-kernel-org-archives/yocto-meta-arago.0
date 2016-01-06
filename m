Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by arago-project.org (Postfix) with ESMTPS id 154BE52A60
	for <meta-arago@arago-project.org>;
	Wed,  6 Jan 2016 03:30:35 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id f2so238023420vkb.3
	for <meta-arago@arago-project.org>;
	Tue, 05 Jan 2016 19:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=5QWDTQ7gI/WX9ECKzt/y7j5kZ+Yd/UO/SMXLfUG1Z1g=;
	b=vy75aGMxTtsoP393E51RO13D7UHxP1aVYhAH9+o4KxF7YrtThjO1L5VTG3CWgfBP3F
	V+7KSCjB3mROX1j01SN+PtYLO02c+aDjNuuKNdExuDC9i1bgieyvXD7tB9zOKBhjQzni
	1qPuejZ1W0oKpeE3hNMWBVJbQlv+7Sivk1eic9AZsJi4+CjAa+9EOpb+sVORn56CKXbc
	3lcEttZgdrv5c4uxY+TNVsh8CZpKJq5pVuENygj1E/u2ysNUM/9s6LmSFax4/sRgv7Ro
	MR3uTxOpNIxsAui+YetKK27lhKTQyA/A7hlzafVJ+0UXcEiYz5sCH10ds5/EyuUD0lYJ
	k2Uw==
X-Received: by 10.31.147.82 with SMTP id v79mr32326529vkd.58.1452051034594;
	Tue, 05 Jan 2016 19:30:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.166.146 with HTTP; Tue, 5 Jan 2016 19:30:15 -0800 (PST)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 6 Jan 2016 16:30:15 +1300
Message-ID: <CADySD0H-jcsHE7ZxhEwDfObtGc-p7rdUGzPk8=KAotFq7Fbb8g@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: QT5.4.1 Bluetooth issue
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
X-List-Received-Date: Wed, 06 Jan 2016 03:30:35 -0000
Content-Type: multipart/alternative; boundary=001a1141dca21ce2870528a1fa01

--001a1141dca21ce2870528a1fa01
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=E2=80=8B
Hi,

I am using meta-arago daisy branch for TI AM335x-EVM.

When trying to use QT Bluetooth API, it fails to find the
=E2=80=8B
local
=E2=80=8B
device

QBluetoothLocalDevice localDevice;
// Check if Bluetooth is available on this device
if (localDevice.isValid()) {
 qDebug("is Valid");
 QBluetoothAddress myAddress =3D localDevice.address();
 return true;
} else {
 qDebug("Not Valid");
 return false;
}

I am using
=E2=80=8B
QT5.4.1
=E2=80=8B
and BlueZ 4.101

I can use hciconfig , hcitool, rfcomm, sdptool to operate Bluetooth device


root@am335x-evm:~# hciconfig -a
hci0:   Type: BR/EDR  Bus: UART
        BD Address: 34:B1:F7:E1:49:09  ACL MTU: 1021:6  SCO MTU: 180:4
        UP RUNNING PSCAN ISCAN
        RX bytes:948 acl:0 sco:0 events:42 errors:0
        TX bytes:1294 acl:0 sco:0 commands:42 errors:0
        Features: 0xff 0xfe 0x2d 0xfe 0xdb 0xff 0x7b 0x87
        Packet type: DM1 DM3 DM5 DH1 DH3 DH5 HV1 HV2 HV3
        Link policy: RSWITCH HOLD SNIFF
        Link mode: SLAVE ACCEPT
        Name: 'at-bt'
        Class: 0x4c0100
        Service Classes: Rendering, Capturing, Telephony
        Device Class: Computer, Uncategorized
        HCI Version:  (0x7)  Revision: 0x0
        LMP Version:  (0x7)  Subversion: 0xac7c
        Manufacturer: Texas Instruments Inc. (13)


Is there any known limitation or am I missing something here ?

thanks
Ankur

--001a1141dca21ce2870528a1fa01
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr"><div style=3D"=
color:rgb(51,51,153);font-family:georgia,serif;font-size:small"><div class=
=3D"gmail_default" style=3D"color:rgb(51,51,153);font-family:georgia,serif;=
font-size:small">=E2=80=8B<br></div></div><div>Hi,<br><br>I am using meta-a=
rago daisy branch for TI AM335x-EVM.<br><br>When trying to use QT Bluetooth=
 API, it fails to find the<div class=3D"gmail_default" style=3D"color:rgb(5=
1,51,153);font-family:georgia,serif;font-size:small;display:inline">=E2=80=
=8B </div>local<div class=3D"gmail_default" style=3D"color:rgb(51,51,153);f=
ont-family:georgia,serif;font-size:small;display:inline">=E2=80=8B </div>de=
vice<br></div><div><br></div><div>QBluetoothLocalDevice localDevice;<br>// =
Check if Bluetooth is available on this device<br>if (localDevice.isValid()=
) {<br>=C2=A0qDebug(&quot;is Valid&quot;);<br>=C2=A0QBluetoothAddress myAdd=
ress =3D localDevice.address();<br>=C2=A0return true;<br>} else {<br>=C2=A0=
qDebug(&quot;Not Valid&quot;);<br>=C2=A0return false;<br>}<br><br>I am usin=
g<div style=3D"color:rgb(51,51,153);font-family:georgia,serif;font-size:sma=
ll;display:inline">=E2=80=8B </div>QT5.4.1<div style=3D"color:rgb(51,51,153=
);font-family:georgia,serif;font-size:small;display:inline">=E2=80=8B </div=
>and BlueZ 4.101<br><br>I can use hciconfig , hcitool, rfcomm, sdptool to o=
perate Bluetooth device</div><div><div style=3D"color:rgb(51,51,153);font-f=
amily:georgia,serif;font-size:small;display:inline"><br></div></div><div><d=
iv style=3D"color:rgb(51,51,153);font-family:georgia,serif;font-size:small;=
display:inline"><br></div></div><div>root@am335x-evm:~# hciconfig -a<br>hci=
0: =C2=A0 Type: BR/EDR =C2=A0Bus: UART<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 BD Ad=
dress: 34:B1:F7:E1:49:09 =C2=A0ACL MTU: 1021:6 =C2=A0SCO MTU: 180:4<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 UP RUNNING PSCAN ISCAN<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 RX bytes:948 acl:0 sco:0 events:42 errors:0<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 TX bytes:1294 acl:0 sco:0 commands:42 errors:0<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Features: 0xff 0xfe 0x2d 0xfe 0xdb 0xff 0x7b 0x87<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Packet type: DM1 DM3 DM5 DH1 DH3 DH5 HV1 HV2 HV3<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Link policy: RSWITCH HOLD SNIFF<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Link mode: SLAVE ACCEPT<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Name: &#3=
9;at-bt&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Class: 0x4c0100<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 Service Classes: Rendering, Capturing, Telephony<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 Device Class: Computer, Uncategorized<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 HCI Version: =C2=A0(0x7) =C2=A0Revision: 0x0<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 LMP Version: =C2=A0(0x7) =C2=A0Subversion: 0xac7c<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Manufacturer: Texas Instruments Inc. (13)</div>=
<div><br></div><br>Is there any known limitation or am I missing something =
here ?<br><br>thanks<span class=3D"HOEnZb"><font color=3D"#888888"><br>Anku=
r</font></span></div>
</div><br></div>

--001a1141dca21ce2870528a1fa01--
