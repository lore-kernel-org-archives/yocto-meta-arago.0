Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by arago-project.org (Postfix) with ESMTPS id 8806D52976
	for <meta-arago@arago-project.org>;
	Thu, 17 Dec 2015 22:39:00 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id a189so55412251vkh.2
	for <meta-arago@arago-project.org>;
	Thu, 17 Dec 2015 14:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=pF1qL8QNfq7rTnFTGYFkpgWhlXxJ4IxKUR92Kj+DCrA=;
	b=ErTph0dIyPHxfLJBHrGUrFUUYFUTTwrxoJPrBvIzTyPCJ/e3HGTeBjemdUZ0vIvpJG
	hZO4E93zNR1++19BwZHsbI4mGetWR0UkVcH+yXtzyvsiJbyLXQWKEjMlLZxxG5CShERN
	sG6e3yKFtGfUQesLj210QerD/07VdsYc/EVurqDRDB5lyWfTUz11WQsX1oxqVszzIdtL
	c1Ee5U6aJmXZibSgWUZJHD7zpjPykGiBc+lIiKFaNzmy90vj1Ms5wcPrN2sYCoeS/u8z
	DDCUC8b0kc/I1+l9M4YV0tRA19eQS6BvYqTz4tQlRMSK2zbkjLV3zra8gNBNnv1NpX4y
	XM3A==
X-Received: by 10.31.147.81 with SMTP id v78mr180024vkd.58.1450391940001; Thu,
	17 Dec 2015 14:39:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.166.146 with HTTP; Thu, 17 Dec 2015 14:38:40 -0800 (PST)
In-Reply-To: <CADySD0FHQNG=r-um9qpbW1SQbnvZpum8mvnb19rD-4iOuZEujQ@mail.gmail.com>
References: <CADySD0FHQNG=r-um9qpbW1SQbnvZpum8mvnb19rD-4iOuZEujQ@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 18 Dec 2015 11:38:40 +1300
Message-ID: <CADySD0E+jJHqmsx+MsO-hwVr0iioSYGgRzYVs3o8RT-TzLO90w@mail.gmail.com>
To: meta-arago@arago-project.org
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
X-List-Received-Date: Thu, 17 Dec 2015 22:39:01 -0000
Content-Type: multipart/alternative; boundary=001a1141f7f25e791b05271fb09a

--001a1141f7f25e791b05271fb09a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Further debugged it to check dbus and bluez service

=E2=80=8B=E2=80=8B
dbus is running and service file is also present

root@am335x-evm:~# cat /usr/share/dbus-1/system-services/org.bluez.service
[D-BUS Service]
Name=3Dorg.bluez
Exec=3D/bin/false
User=3Droot
SystemdService=3Ddbus-org.bluez.service

root@am335x-evm:~# cat /etc/dbus-1/system.d/bluetooth.conf
<!-- This configuration file specifies the required security policies
     for Bluetooth core daemon to work. -->
<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration
1.0//EN"
 "<a href=3D"http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
www.freedesktop.org/.../busconfig.dtd"></a>
<busconfig>
  <!-- ../system.conf have denied everything, so we just punch some holes
-->
  <policy user=3D"root">
    <allow own=3D"org.bluez"/>
    <allow send_destination=3D"org.bluez"/>
    <allow send_interface=3D"org.bluez.Agent"/>
    <allow send_interface=3D"org.bluez.PasskeyAgent"/>
  </policy>

  <policy context=3D"default">
    <allow own=3D"org.bluez"/>
    <allow send_destination=3D"org.bluez"/>
    <allow send_interface=3D"org.bluez.Agent"/>
  </policy>

</busconfig>


When I run bluetoothd, I can see org.bluez in dbus list

root@am335x-evm:~# dbus-send --system --dest=3Dorg.freedesktop.DBus
--type=3Dmethod_call --print-reply /org/freedesktop/DBus
org.freedesktop.DBus.ListNames
method return sender=3Dorg.freedesktop.DBus -> dest=3D:1.4 reply_serial=3D2
   array [
      string "org.freedesktop.DBus"
      string ":1.4"
      string ":1.0"
      string "org.bluez"
   ]

But when I query default adapter, I don't get a response

root@am335x-evm:~# dbus-send --system --print-reply --dest=3Dorg.bluez /
org.bluez.Manager.ListAdapters
method return sender=3D:1.0 -> dest=3D:1.5 reply_serial=3D2
   array [
   ]

What's missing to get it working ? Any help is appreciated

Thanks
Ankur

"Knowledge is knowing tomato is a fruit, wisdom is not putting it in a
fruit salad"

On Thu, Dec 17, 2015 at 7:24 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
wrote:

> =E2=80=8B=E2=80=8B
> Hi,
>
> I am trying to use WL1835  bluetooth with AM335x EVM. Software is
> meta-arago daisy.
>
> When I run bluetooth agent, I get error  "Can't get default adapter"
>
> Following is the sequence of commands:
>
> root@am335x-evm:~# bluetoothd
>
> root@am335x-evm:~# hciconfig hci0 up
>
> [  944.008593] (stc):  chnl_id list empty :4
> [  944.012749] (stk) : st_kim_start(stk) :ldisc_install =3D 1uim:poll bro=
ke
> due to event 10(PRI:2/ERR:8)
>
> uim:read 1 from install
>
> uim:@ st_uart_config
> uim: signal received, opening /dev/ttyS1
> uim:@ set_baud_rate
> uim:set_baud_rate() done
> uim:Setting speed to 3000000
> uim:@ read_command_complete
> uim: Command complete started
> uim:@ read_hci_event
> uim: read_hci_event
> uim:Command complete done
> [  944.180311] (stc): st_tty_open
> uim:Speed changing to 3000000, 1
> uim:@ set_custom_baud_rate
> (stk) :line discipline installeduim:Installed N_TI_WL Line displine
> [  944.194437] (stk) :TIInit_11.8.32.bts
> uim:begin polling...
> (stk) :change remote baud rate command in firmware
> [  944.214516] (stk) :skipping the wait event of change remote baud[
>  944.928331] (stc): add_channel_to_table: id 4
> [  944.932771] (stc): add_channel_to_table: id 2
> [  944.937149] (stc): add_channel_to_table: id 3
>
> root@am335x-evm:~# hcitool scan
> Scanning ...
>         00:02:72:E3:0F:7F       RS232 Dongle Slave
>
> root@am335x-evm:~# agent hci0 00:02:72:E3:0F:7F
> Can't get default adapter
> No such adapter
>
> root@am335x-evm:~# dmesg | grep Bluetooth
> [    3.475348] Bluetooth: Core ver 2.18
> [    3.483613] Bluetooth: HCI device and connection manager initialized
> [    3.663793] Bluetooth: HCI socket layer initialized
> [    3.668731] Bluetooth: L2CAP socket layer initialized
> [    3.814838] Bluetooth: SCO socket layer initialized
> [   16.667945] Bluetooth: st_register failed -22
>
> What am I missing here ?
>
> thanks
> Ankur
>

--001a1141f7f25e791b05271fb09a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:rgb(51,51,153)">Further debugged it to check db=
us and bluez service</div><div class=3D"gmail_default" style=3D"font-family=
:georgia,serif;font-size:small;color:rgb(51,51,153)"><br></div><div class=
=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;color=
:rgb(51,51,153)">=E2=80=8B=E2=80=8B</div><div class=3D"gmail_default" style=
=3D""><div class=3D"gmail_default" style=3D""><font color=3D"#333399" face=
=3D"georgia, serif">dbus is running and service file is also present</font>=
</div><div class=3D"gmail_default" style=3D""><font color=3D"#333399" face=
=3D"georgia, serif">=C2=A0</font></div><div class=3D"gmail_default" style=
=3D""><font color=3D"#333399" face=3D"georgia, serif">root@am335x-evm:~# ca=
t /usr/share/dbus-1/system-services/org.bluez.service</font></div><div clas=
s=3D"gmail_default" style=3D""><font color=3D"#333399" face=3D"georgia, ser=
if">[D-BUS Service]</font></div><div class=3D"gmail_default" style=3D""><fo=
nt color=3D"#333399" face=3D"georgia, serif">Name=3Dorg.bluez</font></div><=
div class=3D"gmail_default" style=3D""><font color=3D"#333399" face=3D"geor=
gia, serif">Exec=3D/bin/false</font></div><div class=3D"gmail_default" styl=
e=3D""><font color=3D"#333399" face=3D"georgia, serif">User=3Droot</font></=
div><div class=3D"gmail_default" style=3D""><font color=3D"#333399" face=3D=
"georgia, serif">SystemdService=3Ddbus-org.bluez.service</font></div><div c=
lass=3D"gmail_default" style=3D""><font color=3D"#333399" face=3D"georgia, =
serif">=C2=A0</font></div><div class=3D"gmail_default" style=3D""><font col=
or=3D"#333399" face=3D"georgia, serif">root@am335x-evm:~# cat /etc/dbus-1/s=
ystem.d/bluetooth.conf</font></div><div class=3D"gmail_default" style=3D"">=
<font color=3D"#333399" face=3D"georgia, serif">&lt;!-- This configuration =
file specifies the required security policies</font></div><div class=3D"gma=
il_default" style=3D""><font color=3D"#333399" face=3D"georgia, serif">=C2=
=A0 =C2=A0 =C2=A0for Bluetooth core daemon to work. --&gt;</font></div><div=
 class=3D"gmail_default" style=3D""><font color=3D"#333399" face=3D"georgia=
, serif">&lt;!DOCTYPE busconfig PUBLIC &quot;-//freedesktop//DTD D-BUS Bus =
Configuration 1.0//EN&quot;</font></div><div class=3D"gmail_default" style=
=3D""><font color=3D"#333399" face=3D"georgia, serif">=C2=A0&quot;&lt;a hre=
f=3D&quot;<a href=3D"http://www.freedesktop.org/standards/dbus/1.0/busconfi=
g.dtd">http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd</a>&quot=
;&gt;<a href=3D"http://www.freedesktop.org/.../busconfig.dtd">www.freedeskt=
op.org/.../busconfig.dtd</a>&quot;&gt;&lt;/a&gt;</font></div><div class=3D"=
gmail_default" style=3D""><font color=3D"#333399" face=3D"georgia, serif">&=
lt;busconfig&gt;</font></div><div class=3D"gmail_default" style=3D""><font =
color=3D"#333399" face=3D"georgia, serif">=C2=A0 &lt;!-- ../system.conf hav=
e denied everything, so we just punch some holes --&gt;</font></div><div cl=
ass=3D"gmail_default" style=3D""><font color=3D"#333399" face=3D"georgia, s=
erif">=C2=A0 &lt;policy user=3D&quot;root&quot;&gt;</font></div><div class=
=3D"gmail_default" style=3D""><font color=3D"#333399" face=3D"georgia, seri=
f">=C2=A0 =C2=A0 &lt;allow own=3D&quot;org.bluez&quot;/&gt;</font></div><di=
v class=3D"gmail_default" style=3D""><font color=3D"#333399" face=3D"georgi=
a, serif">=C2=A0 =C2=A0 &lt;allow send_destination=3D&quot;org.bluez&quot;/=
&gt;</font></div><div class=3D"gmail_default" style=3D""><font color=3D"#33=
3399" face=3D"georgia, serif">=C2=A0 =C2=A0 &lt;allow send_interface=3D&quo=
t;org.bluez.Agent&quot;/&gt;</font></div><div class=3D"gmail_default" style=
=3D""><font color=3D"#333399" face=3D"georgia, serif">=C2=A0 =C2=A0 &lt;all=
ow send_interface=3D&quot;org.bluez.PasskeyAgent&quot;/&gt;</font></div><di=
v class=3D"gmail_default" style=3D""><font color=3D"#333399" face=3D"georgi=
a, serif">=C2=A0 &lt;/policy&gt;</font></div><div class=3D"gmail_default" s=
tyle=3D""><font color=3D"#333399" face=3D"georgia, serif"><br></font></div>=
<div class=3D"gmail_default" style=3D""><font color=3D"#333399" face=3D"geo=
rgia, serif">=C2=A0 &lt;policy context=3D&quot;default&quot;&gt;</font></di=
v><div class=3D"gmail_default" style=3D""><font color=3D"#333399" face=3D"g=
eorgia, serif">=C2=A0 =C2=A0 &lt;allow own=3D&quot;org.bluez&quot;/&gt;</fo=
nt></div><div class=3D"gmail_default" style=3D""><font color=3D"#333399" fa=
ce=3D"georgia, serif">=C2=A0 =C2=A0 &lt;allow send_destination=3D&quot;org.=
bluez&quot;/&gt;</font></div><div class=3D"gmail_default" style=3D""><font =
color=3D"#333399" face=3D"georgia, serif">=C2=A0 =C2=A0 &lt;allow send_inte=
rface=3D&quot;org.bluez.Agent&quot;/&gt;</font></div><div class=3D"gmail_de=
fault" style=3D""><font color=3D"#333399" face=3D"georgia, serif">=C2=A0 &l=
t;/policy&gt;</font></div><div class=3D"gmail_default" style=3D""><font col=
or=3D"#333399" face=3D"georgia, serif"><br></font></div><div class=3D"gmail=
_default" style=3D""><font color=3D"#333399" face=3D"georgia, serif">&lt;/b=
usconfig&gt;</font></div><div class=3D"gmail_default" style=3D""><font colo=
r=3D"#333399" face=3D"georgia, serif">=C2=A0</font></div><div class=3D"gmai=
l_default" style=3D""><font color=3D"#333399" face=3D"georgia, serif"><br><=
/font></div><div class=3D"gmail_default" style=3D""><font color=3D"#333399"=
 face=3D"georgia, serif">When I run bluetoothd, I can see org.bluez in dbus=
 list</font></div><div class=3D"gmail_default" style=3D""><font color=3D"#3=
33399" face=3D"georgia, serif">=C2=A0</font></div><div class=3D"gmail_defau=
lt" style=3D""><font color=3D"#333399" face=3D"georgia, serif">root@am335x-=
evm:~# dbus-send --system --dest=3Dorg.freedesktop.DBus --type=3Dmethod_cal=
l --print-reply /org/freedesktop/DBus org.freedesktop.DBus.ListNames</font>=
</div><div class=3D"gmail_default" style=3D""><font color=3D"#333399" face=
=3D"georgia, serif">method return sender=3Dorg.freedesktop.DBus -&gt; dest=
=3D:1.4 reply_serial=3D2</font></div><div class=3D"gmail_default" style=3D"=
"><font color=3D"#333399" face=3D"georgia, serif">=C2=A0 =C2=A0array [</fon=
t></div><div class=3D"gmail_default" style=3D""><font color=3D"#333399" fac=
e=3D"georgia, serif">=C2=A0 =C2=A0 =C2=A0 string &quot;org.freedesktop.DBus=
&quot;</font></div><div class=3D"gmail_default" style=3D""><font color=3D"#=
333399" face=3D"georgia, serif">=C2=A0 =C2=A0 =C2=A0 string &quot;:1.4&quot=
;</font></div><div class=3D"gmail_default" style=3D""><font color=3D"#33339=
9" face=3D"georgia, serif">=C2=A0 =C2=A0 =C2=A0 string &quot;:1.0&quot;</fo=
nt></div><div class=3D"gmail_default" style=3D""><font color=3D"#333399" fa=
ce=3D"georgia, serif">=C2=A0 =C2=A0 =C2=A0 string &quot;org.bluez&quot;</fo=
nt></div><div class=3D"gmail_default" style=3D""><font color=3D"#333399" fa=
ce=3D"georgia, serif">=C2=A0 =C2=A0]</font></div><div class=3D"gmail_defaul=
t" style=3D""><font color=3D"#333399" face=3D"georgia, serif"><br></font></=
div><div class=3D"gmail_default" style=3D""><font color=3D"#333399" face=3D=
"georgia, serif">But when I query default adapter, I don&#39;t get a respon=
se</font></div><div class=3D"gmail_default" style=3D""><font color=3D"#3333=
99" face=3D"georgia, serif">=C2=A0</font></div><div class=3D"gmail_default"=
 style=3D""><font color=3D"#333399" face=3D"georgia, serif">root@am335x-evm=
:~# dbus-send --system --print-reply --dest=3Dorg.bluez / org.bluez.Manager=
.ListAdapters</font></div><div class=3D"gmail_default" style=3D""><font col=
or=3D"#333399" face=3D"georgia, serif">method return sender=3D:1.0 -&gt; de=
st=3D:1.5 reply_serial=3D2</font></div><div class=3D"gmail_default" style=
=3D""><font color=3D"#333399" face=3D"georgia, serif">=C2=A0 =C2=A0array [<=
/font></div><div class=3D"gmail_default" style=3D""><font color=3D"#333399"=
 face=3D"georgia, serif">=C2=A0 =C2=A0]</font></div><div style=3D"color:rgb=
(51,51,153);font-family:georgia,serif;font-size:small"><br></div><div style=
=3D"color:rgb(51,51,153);font-family:georgia,serif;font-size:small">What&#3=
9;s missing to get it working ? Any help is appreciated</div><div style=3D"=
color:rgb(51,51,153);font-family:georgia,serif;font-size:small"><br></div><=
div style=3D"color:rgb(51,51,153);font-family:georgia,serif;font-size:small=
">Thanks</div><div style=3D"color:rgb(51,51,153);font-family:georgia,serif;=
font-size:small">Ankur</div></div><div class=3D"gmail_extra"><br clear=3D"a=
ll"><div><div class=3D"gmail_signature"><div dir=3D"ltr">&quot;Knowledge is=
 knowing tomato is a fruit, wisdom is not putting it in a fruit salad&quot;=
</div></div></div>
<br><div class=3D"gmail_quote">On Thu, Dec 17, 2015 at 7:24 PM, Ankur Tyagi=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" target=3D=
"_blank">ankur.tyagi85@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><div style=3D"font-family:georgia,serif;font=
-size:small;color:rgb(51,51,153);display:inline">=E2=80=8B=E2=80=8B</div>Hi=
,<br><br>I am trying to use WL1835 =C2=A0bluetooth with AM335x EVM. Softwar=
e is meta-arago daisy.<br><br>When I run bluetooth agent, I get error =C2=
=A0&quot;Can&#39;t get default adapter&quot;<br><br>Following is the sequen=
ce of commands:<br><br>root@am335x-evm:~# bluetoothd<br><br>root@am335x-evm=
:~# hciconfig hci0 up<br><br>[ =C2=A0944.008593] (stc): =C2=A0chnl_id list =
empty :4<br>[ =C2=A0944.012749] (stk) : st_kim_start(stk) :ldisc_install =
=3D 1uim:poll broke due to event 10(PRI:2/ERR:8)<br><br>uim:read 1 from ins=
tall<br><br>uim:@ st_uart_config<br>uim: signal received, opening /dev/ttyS=
1<br>uim:@ set_baud_rate<br>uim:set_baud_rate() done<br>uim:Setting speed t=
o 3000000<br>uim:@ read_command_complete<br>uim: Command complete started<b=
r>uim:@ read_hci_event<br>uim: read_hci_event<br>uim:Command complete done<=
br>[ =C2=A0944.180311] (stc): st_tty_open<br>uim:Speed changing to 3000000,=
 1<br>uim:@ set_custom_baud_rate<br>(stk) :line discipline installeduim:Ins=
talled N_TI_WL Line displine<br>[ =C2=A0944.194437] (stk) :TIInit_11.8.32.b=
ts<br>uim:begin polling...<br>(stk) :change remote baud rate command in fir=
mware<br>[ =C2=A0944.214516] (stk) :skipping the wait event of change remot=
e baud[ =C2=A0944.928331] (stc): add_channel_to_table: id 4<br>[ =C2=A0944.=
932771] (stc): add_channel_to_table: id 2<br>[ =C2=A0944.937149] (stc): add=
_channel_to_table: id 3<br><br>root@am335x-evm:~# hcitool scan<br>Scanning =
...<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 00:02:72:E3:0F:7F =C2=A0 =C2=A0 =C2=A0 R=
S232 Dongle Slave<br><br>root@am335x-evm:~# agent hci0 00:02:72:E3:0F:7F<br=
>Can&#39;t get default adapter<br>No such adapter<br><br>root@am335x-evm:~#=
 dmesg | grep Bluetooth<br>[ =C2=A0 =C2=A03.475348] Bluetooth: Core ver 2.1=
8<br>[ =C2=A0 =C2=A03.483613] Bluetooth: HCI device and connection manager =
initialized<br>[ =C2=A0 =C2=A03.663793] Bluetooth: HCI socket layer initial=
ized<br>[ =C2=A0 =C2=A03.668731] Bluetooth: L2CAP socket layer initialized<=
br>[ =C2=A0 =C2=A03.814838] Bluetooth: SCO socket layer initialized<br>[ =
=C2=A0 16.667945] Bluetooth: st_register failed -22<br><br>What am I missin=
g here ?<br><br>thanks<span class=3D"HOEnZb"><font color=3D"#888888"><br>An=
kur
</font></span></div>
</blockquote></div><br></div></div>

--001a1141f7f25e791b05271fb09a--
