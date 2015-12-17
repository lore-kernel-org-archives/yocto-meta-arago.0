Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by arago-project.org (Postfix) with ESMTPS id 95C3D52976
	for <meta-arago@arago-project.org>;
	Thu, 17 Dec 2015 23:59:02 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id a188so56964692vkc.0
	for <meta-arago@arago-project.org>;
	Thu, 17 Dec 2015 15:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=oTrY7CFHT4xpGvyyjLFawSnTi9D9zmTKngaRh+VouqU=;
	b=O5PxQnNXt7xDZhrC54a4eoPJ90XZ1Cka3rwVV3eY11iOcFxAncXYg1ATcYF4tz+KiI
	8ACA4qGrdF3/uTF6JuEaHRMkN+ohetVmibjyT0hPkNMxFJtHPR6sdGvx3zH+dqLlMj1b
	tQOKfYcgPfMPyjHkqESgB3DEAp74aiiS3OCelLti8MWf+2+8vfR8BBir7q8RYWtVfixs
	vS7afGC0OcvTMSIdTjxNvBF2DBrSIyKASMn1ehSB45BR+LJP/I8iZ4jZvxPrF58qUjf3
	h8k/WqEmphqA6h056+MsupidqNEhhNxaCFuDfMQYxzGQ4ir1Jg0Xhnfdz4H56g29NjNy
	orUw==
X-Received: by 10.31.171.83 with SMTP id u80mr371429vke.104.1450396742286;
	Thu, 17 Dec 2015 15:59:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.166.146 with HTTP; Thu, 17 Dec 2015 15:58:42 -0800 (PST)
In-Reply-To: <20151217232009.GP27464@edge>
References: <CADySD0FHQNG=r-um9qpbW1SQbnvZpum8mvnb19rD-4iOuZEujQ@mail.gmail.com>
	<CADySD0E+jJHqmsx+MsO-hwVr0iioSYGgRzYVs3o8RT-TzLO90w@mail.gmail.com>
	<20151217232009.GP27464@edge>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 18 Dec 2015 12:58:42 +1300
Message-ID: <CADySD0HySFRYxkFF6SnE1zfKh3+E1k7-aGFbVAR-vivP1NrsWA@mail.gmail.com>
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
X-List-Received-Date: Thu, 17 Dec 2015 23:59:02 -0000
Content-Type: multipart/alternative; boundary=001a114391e49b8338052720cef4

--001a114391e49b8338052720cef4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Because our product is based on 3.14

Now we are trying to add Wi-Fi, Bluetooth capability to it

I am happy to back-port some stuff from 4.1 if it can fix it

regards
Ankur

"Knowledge is knowing tomato is a fruit, wisdom is not putting it in a
fruit salad"

On Fri, Dec 18, 2015 at 12:20 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> Any specific reason you are trying 3.14? Can you try 4.1 instead?
>
> --
> Denys
>
>
> On Fri, Dec 18, 2015 at 11:38:40AM +1300, Ankur Tyagi wrote:
> > Further debugged it to check dbus and bluez service
> >
> > =E2=80=8B=E2=80=8B
> > dbus is running and service file is also present
> >
> > root@am335x-evm:~# cat
> /usr/share/dbus-1/system-services/org.bluez.service
> > [D-BUS Service]
> > Name=3Dorg.bluez
> > Exec=3D/bin/false
> > User=3Droot
> > SystemdService=3Ddbus-org.bluez.service
> >
> > root@am335x-evm:~# cat /etc/dbus-1/system.d/bluetooth.conf
> > <!-- This configuration file specifies the required security policies
> >      for Bluetooth core daemon to work. -->
> > <!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration
> > 1.0//EN"
> >  "<a href=3D"http://www.freedesktop.org/standards/dbus/1.0/busconfig.dt=
d">
> > www.freedesktop.org/.../busconfig.dtd"></a>
> > <busconfig>
> >   <!-- ../system.conf have denied everything, so we just punch some hol=
es
> > -->
> >   <policy user=3D"root">
> >     <allow own=3D"org.bluez"/>
> >     <allow send_destination=3D"org.bluez"/>
> >     <allow send_interface=3D"org.bluez.Agent"/>
> >     <allow send_interface=3D"org.bluez.PasskeyAgent"/>
> >   </policy>
> >
> >   <policy context=3D"default">
> >     <allow own=3D"org.bluez"/>
> >     <allow send_destination=3D"org.bluez"/>
> >     <allow send_interface=3D"org.bluez.Agent"/>
> >   </policy>
> >
> > </busconfig>
> >
> >
> > When I run bluetoothd, I can see org.bluez in dbus list
> >
> > root@am335x-evm:~# dbus-send --system --dest=3Dorg.freedesktop.DBus
> > --type=3Dmethod_call --print-reply /org/freedesktop/DBus
> > org.freedesktop.DBus.ListNames
> > method return sender=3Dorg.freedesktop.DBus -> dest=3D:1.4 reply_serial=
=3D2
> >    array [
> >       string "org.freedesktop.DBus"
> >       string ":1.4"
> >       string ":1.0"
> >       string "org.bluez"
> >    ]
> >
> > But when I query default adapter, I don't get a response
> >
> > root@am335x-evm:~# dbus-send --system --print-reply --dest=3Dorg.bluez =
/
> > org.bluez.Manager.ListAdapters
> > method return sender=3D:1.0 -> dest=3D:1.5 reply_serial=3D2
> >    array [
> >    ]
> >
> > What's missing to get it working ? Any help is appreciated
> >
> > Thanks
> > Ankur
> >
> > "Knowledge is knowing tomato is a fruit, wisdom is not putting it in a
> > fruit salad"
> >
> > On Thu, Dec 17, 2015 at 7:24 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> > wrote:
> >
> > > =E2=80=8B=E2=80=8B
> > > Hi,
> > >
> > > I am trying to use WL1835  bluetooth with AM335x EVM. Software is
> > > meta-arago daisy.
> > >
> > > When I run bluetooth agent, I get error  "Can't get default adapter"
> > >
> > > Following is the sequence of commands:
> > >
> > > root@am335x-evm:~# bluetoothd
> > >
> > > root@am335x-evm:~# hciconfig hci0 up
> > >
> > > [  944.008593] (stc):  chnl_id list empty :4
> > > [  944.012749] (stk) : st_kim_start(stk) :ldisc_install =3D 1uim:poll
> broke
> > > due to event 10(PRI:2/ERR:8)
> > >
> > > uim:read 1 from install
> > >
> > > uim:@ st_uart_config
> > > uim: signal received, opening /dev/ttyS1
> > > uim:@ set_baud_rate
> > > uim:set_baud_rate() done
> > > uim:Setting speed to 3000000
> > > uim:@ read_command_complete
> > > uim: Command complete started
> > > uim:@ read_hci_event
> > > uim: read_hci_event
> > > uim:Command complete done
> > > [  944.180311] (stc): st_tty_open
> > > uim:Speed changing to 3000000, 1
> > > uim:@ set_custom_baud_rate
> > > (stk) :line discipline installeduim:Installed N_TI_WL Line displine
> > > [  944.194437] (stk) :TIInit_11.8.32.bts
> > > uim:begin polling...
> > > (stk) :change remote baud rate command in firmware
> > > [  944.214516] (stk) :skipping the wait event of change remote baud[
> > >  944.928331] (stc): add_channel_to_table: id 4
> > > [  944.932771] (stc): add_channel_to_table: id 2
> > > [  944.937149] (stc): add_channel_to_table: id 3
> > >
> > > root@am335x-evm:~# hcitool scan
> > > Scanning ...
> > >         00:02:72:E3:0F:7F       RS232 Dongle Slave
> > >
> > > root@am335x-evm:~# agent hci0 00:02:72:E3:0F:7F
> > > Can't get default adapter
> > > No such adapter
> > >
> > > root@am335x-evm:~# dmesg | grep Bluetooth
> > > [    3.475348] Bluetooth: Core ver 2.18
> > > [    3.483613] Bluetooth: HCI device and connection manager initializ=
ed
> > > [    3.663793] Bluetooth: HCI socket layer initialized
> > > [    3.668731] Bluetooth: L2CAP socket layer initialized
> > > [    3.814838] Bluetooth: SCO socket layer initialized
> > > [   16.667945] Bluetooth: st_register failed -22
> > >
> > > What am I missing here ?
> > >
> > > thanks
> > > Ankur
> > >
>
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>
>

--001a114391e49b8338052720cef4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:#333399">Because our product is based on 3.14</=
div><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-si=
ze:small;color:#333399"><br></div><div class=3D"gmail_default" style=3D"fon=
t-family:georgia,serif;font-size:small;color:#333399">Now we are trying to =
add Wi-Fi, Bluetooth capability to it</div><div class=3D"gmail_default" sty=
le=3D"font-family:georgia,serif;font-size:small;color:#333399"><br></div><d=
iv class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:sma=
ll;color:#333399">I am happy to back-port some stuff from 4.1 if it can fix=
 it</div><div class=3D"gmail_default" style=3D"font-family:georgia,serif;fo=
nt-size:small;color:#333399"><br></div><div class=3D"gmail_default" style=
=3D"font-family:georgia,serif;font-size:small;color:#333399">regards</div><=
div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:sm=
all;color:#333399">Ankur</div></div><div class=3D"gmail_extra"><br clear=3D=
"all"><div><div class=3D"gmail_signature"><div dir=3D"ltr">&quot;Knowledge =
is knowing tomato is a fruit, wisdom is not putting it in a fruit salad&quo=
t;</div></div></div>
<br><div class=3D"gmail_quote">On Fri, Dec 18, 2015 at 12:20 PM, Denys Dmyt=
riyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_bl=
ank">denys@ti.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">A=
ny specific reason you are trying 3.14? Can you try 4.1 instead?<br>
<br>
--<br>
Denys<br>
<div><div class=3D"h5"><br>
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
tandards/dbus/1.0/busconfig.dtd" rel=3D"noreferrer" target=3D"_blank">http:=
//www.freedesktop.org/standards/dbus/1.0/busconfig.dtd</a>&quot;&gt;<br>
&gt; <a href=3D"http://www.freedesktop.org/.../busconfig.dtd" rel=3D"norefe=
rrer" target=3D"_blank">www.freedesktop.org/.../busconfig.dtd</a>&quot;&gt;=
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
ur.tyagi85@gmail.com">ankur.tyagi85@gmail.com</a>&gt;<br>
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
&gt; <a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago-proje=
ct.org</a><br>
&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o" rel=3D"noreferrer" target=3D"_blank">http://arago-project.org/cgi-bin/ma=
ilman/listinfo/meta-arago</a><br>
<br>
</blockquote></div><br></div>

--001a114391e49b8338052720cef4--
