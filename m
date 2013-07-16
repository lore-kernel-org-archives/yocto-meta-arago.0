Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id C6F3252A91
	for <meta-arago@arago-project.org>;
	Tue, 16 Jul 2013 16:37:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6GGbYI4009699;
	Tue, 16 Jul 2013 11:37:34 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6GGbY04013517;
	Tue, 16 Jul 2013 11:37:34 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 16 Jul 2013 11:37:34 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "chgans@gna.org" <chgans@gna.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>, "Maupin, Chase" <chase.maupin@ti.com>
Thread-Topic: [meta-arago] ofono broken with arago-danny-config (was Re:
	qt4-embedded-gles broken with arago-danny-config)
Thread-Index: AQHOfpWLWcK27WeQl0C4URmQB/m/T5lnocEA///mn7g=
Date: Tue, 16 Jul 2013 16:37:34 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E837104@DLEE08.ent.ti.com>
References: <51DF4A26.6070407@gna.org> <51DF4BA2.7080408@gna.org>,
	<7D46E86EC0A8354091174257B2FED101596577EC@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED101596577EC@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: ofono broken with arago-danny-config (was Re: qt4-embedded-gles broken with arago-danny-config)
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
X-List-Received-Date: Tue, 16 Jul 2013 16:37:44 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE72E837104DLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE72E837104DLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Seems like using wrong branches - mixing Dylan with Danny.


Denys


-----Original Message-----
From: Maupin, Chase [chase.maupin@ti.com]
Received: Tuesday, 16 Jul 2013, 9:08
To: Christian Gagneraud [chgans@gna.org]; meta-arago@arago-project.org [met=
a-arago@arago-project.org]
Subject: Re: [meta-arago] ofono broken with arago-danny-config (was Re: qt4=
-embedded-gles broken with arago-danny-config)

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Christian Gagneraud
>Sent: Thursday, July 11, 2013 7:20 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] ofono broken with arago-danny-config (was
>Re: qt4-embedded-gles broken with arago-danny-config)
>
>Fixing the mail subject. Sorry about that.
>
>Chris
>
>On 12/07/13 12:13, Christian Gagneraud wrote:
>> Hi there,
>>
>> I've just updated my build env today because connman wouldn't
>compile
>> due to unmet dependencies on ofono (needed bluez >=3D4.99, had
>4.98),
>> and now it is solved, good!
>> Note: I updated my existing build env using "./oe-layertool-
>setup.sh
>> -f configs/arago-danny-config.txt"
>>
>> But now qt4-embedded-gles is broken:
>> christiaga@krys-red:~/projects/yocto/arago/build$ bitbake
>connman
>> ERROR: Unable to parse
>> /home/christiaga/projects/yocto/arago/sources/meta-arago/meta-
>arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.4.bb
>> Traceback (most recent call last):
>> [...]
>> OSError: [Errno 2] No such file or directory:
>> '/home/christiaga/projects/yocto/arago/sources/oe-
>core/meta/recipes-qt/qt4/qt4-4.8.4.inc'
>>
>> it seems that qt4-embedded-gles has been bumped to 4.8.4, but
>oe-core
>> is still at Qt 4.8.3.
>>
>> Then I realised, that I should as well update my arago build env
>using
>> git pull, and re-run ./oe-layertool-setup.sh, which I did, and
>now I'm
>> back on ofono/bluez unmet dependency...
>>
>> I tried to clean bluez4, connman and ofono and bitbake connman
>again,
>> but i get the same error while configuring ofono:
>> [...]
>> Requested 'bluez >=3D 4.99' but version of BlueZ is 4.98
>> | configure:13104: error: Bluetooth library >=3D 4.99 is required
>> [...]
>>

I think your issue is that the wireless connectivity team has set a preferr=
ed version for bluez4 to 4.98 in meta-arago-distro/conf/distro/include/arag=
o-prefs.inc.  They have some patches they append on top of bluez4 but have =
not updated to a later version.

Let's see if they have feedback here.  If you are not using the TI wireless=
 stack I would say just unset the PREFERRED_VERSION setting so you can pull=
 the latest bluez4 package.

>>
>> Am I missing something or is Arago temporary broken in that
>respect?
>>
>> Thx,
>> Chris
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_B0581B5571079145BA1CD78C126DBDE72E837104DLEE08entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11p=
t; color:black">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">Seems like using wrong branches - mixing Dylan with Danny.=
<br>
<br>
<br>
Denys<br>
<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Maupin, Chase [chase.maupin@ti.com]<br>
<b>Received:</b> Tuesday, 16 Jul 2013, 9:08<br>
<b>To:</b> Christian Gagneraud [chgans@gna.org]; meta-arago@arago-project.o=
rg [meta-arago@arago-project.org]<br>
<b>Subject:</b> Re: [meta-arago] ofono broken with arago-danny-config (was =
Re: qt4-embedded-gles broken with arago-danny-config)<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">&gt;-----Original Message-----<br>
&gt;From: meta-arago-bounces@arago-project.org [<a href=3D""></a>mailto:met=
a-arago-<br>
&gt;bounces@arago-project.org] On Behalf Of Christian Gagneraud<br>
&gt;Sent: Thursday, July 11, 2013 7:20 PM<br>
&gt;To: meta-arago@arago-project.org<br>
&gt;Subject: [meta-arago] ofono broken with arago-danny-config (was<br>
&gt;Re: qt4-embedded-gles broken with arago-danny-config)<br>
&gt;<br>
&gt;Fixing the mail subject. Sorry about that.<br>
&gt;<br>
&gt;Chris<br>
&gt;<br>
&gt;On 12/07/13 12:13, Christian Gagneraud wrote:<br>
&gt;&gt; Hi there,<br>
&gt;&gt;<br>
&gt;&gt; I've just updated my build env today because connman wouldn't<br>
&gt;compile<br>
&gt;&gt; due to unmet dependencies on ofono (needed bluez &gt;=3D4.99, had<=
br>
&gt;4.98),<br>
&gt;&gt; and now it is solved, good!<br>
&gt;&gt; Note: I updated my existing build env using &quot;./oe-layertool-<=
br>
&gt;setup.sh<br>
&gt;&gt; -f configs/arago-danny-config.txt&quot;<br>
&gt;&gt;<br>
&gt;&gt; But now qt4-embedded-gles is broken:<br>
&gt;&gt; christiaga@krys-red:~/projects/yocto/arago/build$ bitbake<br>
&gt;connman<br>
&gt;&gt; ERROR: Unable to parse<br>
&gt;&gt; /home/christiaga/projects/yocto/arago/sources/meta-arago/meta-<br>
&gt;arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.4.bb<br>
&gt;&gt; Traceback (most recent call last):<br>
&gt;&gt; [...]<br>
&gt;&gt; OSError: [Errno 2] No such file or directory:<br>
&gt;&gt; '/home/christiaga/projects/yocto/arago/sources/oe-<br>
&gt;core/meta/recipes-qt/qt4/qt4-4.8.4.inc'<br>
&gt;&gt;<br>
&gt;&gt; it seems that qt4-embedded-gles has been bumped to 4.8.4, but<br>
&gt;oe-core<br>
&gt;&gt; is still at Qt 4.8.3.<br>
&gt;&gt;<br>
&gt;&gt; Then I realised, that I should as well update my arago build env<b=
r>
&gt;using<br>
&gt;&gt; git pull, and re-run ./oe-layertool-setup.sh, which I did, and<br>
&gt;now I'm<br>
&gt;&gt; back on ofono/bluez unmet dependency...<br>
&gt;&gt;<br>
&gt;&gt; I tried to clean bluez4, connman and ofono and bitbake connman<br>
&gt;again,<br>
&gt;&gt; but i get the same error while configuring ofono:<br>
&gt;&gt; [...]<br>
&gt;&gt; Requested 'bluez &gt;=3D 4.99' but version of BlueZ is 4.98<br>
&gt;&gt; | configure:13104: error: Bluetooth library &gt;=3D 4.99 is requir=
ed<br>
&gt;&gt; [...]<br>
&gt;&gt;<br>
<br>
I think your issue is that the wireless connectivity team has set a preferr=
ed version for bluez4 to 4.98 in meta-arago-distro/conf/distro/include/arag=
o-prefs.inc.&nbsp; They have some patches they append on top of bluez4 but =
have not updated to a later version.<br>
<br>
Let's see if they have feedback here.&nbsp; If you are not using the TI wir=
eless stack I would say just unset the PREFERRED_VERSION setting so you can=
 pull the latest bluez4 package.<br>
<br>
&gt;&gt;<br>
&gt;&gt; Am I missing something or is Arago temporary broken in that<br>
&gt;respect?<br>
&gt;&gt;<br>
&gt;&gt; Thx,<br>
&gt;&gt; Chris<br>
&gt;<br>
&gt;_______________________________________________<br>
&gt;meta-arago mailing list<br>
&gt;meta-arago@arago-project.org<br>
&gt;<a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago=
">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
_______________________________________________<br>
meta-arago mailing list<br>
meta-arago@arago-project.org<br>
<a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">ht=
tp://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
</div>
</span></font>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE72E837104DLEE08entticom_--
