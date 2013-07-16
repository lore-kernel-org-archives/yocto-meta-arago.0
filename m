Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 2EF3D52A91
	for <meta-arago@arago-project.org>;
	Tue, 16 Jul 2013 17:55:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6GHtZgD019972;
	Tue, 16 Jul 2013 12:55:35 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6GHtZHM015558;
	Tue, 16 Jul 2013 12:55:35 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Tue, 16 Jul 2013 12:55:35 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "chgans@gna.org" <chgans@gna.org>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] ofono broken with arago-danny-config (was Re:
	qt4-embedded-gles broken with arago-danny-config)
Thread-Index: AQHOfpWLgDRG4VBUjkOcJ0PwaZFlz5lnTWvAgACOxwD//8F+4A==
Date: Tue, 16 Jul 2013 17:55:34 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159658F23@DLEE11.ent.ti.com>
References: <51DF4A26.6070407@gna.org> <51DF4BA2.7080408@gna.org>,
	<7D46E86EC0A8354091174257B2FED101596577EC@DLEE11.ent.ti.com>
	<B0581B5571079145BA1CD78C126DBDE72E837104@DLEE08.ent.ti.com>
In-Reply-To: <B0581B5571079145BA1CD78C126DBDE72E837104@DLEE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
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
X-List-Received-Date: Tue, 16 Jul 2013 17:55:36 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7D46E86EC0A8354091174257B2FED10159658F23DLEE11entticom_"

--_000_7D46E86EC0A8354091174257B2FED10159658F23DLEE11entticom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

From: Dmytriyenko, Denys
Sent: Tuesday, July 16, 2013 11:38 AM
To: chgans@gna.org; meta-arago@arago-project.org; Maupin, Chase
Subject: RE: [meta-arago] ofono broken with arago-danny-config (was Re: qt4=
-embedded-gles broken with arago-danny-config)

Seems like using wrong branches - mixing Dylan with Danny.
Good point.  The master of arago which works with Dylan has a bluez4 versio=
n for 4.101 which should be enough.  The Danny branch has 4.98 pinned.



Denys


-----Original Message-----
From: Maupin, Chase [chase.maupin@ti.com]
Received: Tuesday, 16 Jul 2013, 9:08
To: Christian Gagneraud [chgans@gna.org]; meta-arago@arago-project.org<mail=
to:meta-arago@arago-project.org> [meta-arago@arago-project.org]
Subject: Re: [meta-arago] ofono broken with arago-danny-config (was Re: qt4=
-embedded-gles broken with arago-danny-config)
>-----Original Message-----
>From: meta-arago-bounces@arago-project.org<mailto:meta-arago-bounces@arago=
-project.org> [mailto:meta-arago-
>bounces@arago-project.org<mailto:bounces@arago-project.org>] On Behalf Of =
Christian Gagneraud
>Sent: Thursday, July 11, 2013 7:20 PM
>To: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
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
>meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_7D46E86EC0A8354091174257B2FED10159658F23DLEE11entticom_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.emailquote, li.emailquote, div.emailquote
	{mso-style-name:emailquote;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:1.0pt;
	border:none;
	padding:0in;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Dmytriye=
nko, Denys
<br>
<b>Sent:</b> Tuesday, July 16, 2013 11:38 AM<br>
<b>To:</b> chgans@gna.org; meta-arago@arago-project.org; Maupin, Chase<br>
<b>Subject:</b> RE: [meta-arago] ofono broken with arago-danny-config (was =
Re: qt4-embedded-gles broken with arago-danny-config)<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:bla=
ck">Seems like using wrong branches - mixing Dylan with Danny.</span><span =
style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&=
quot;;color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1F=
497D">Good point.&nbsp; The master of arago which works with Dylan has a bl=
uez4 version for 4.101 which should be enough.&nbsp; The Danny branch
 has 4.98 pinned.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:bla=
ck"><br>
<br>
<br>
Denys<br>
<br>
<br>
-----Original Message----- <br>
<b>From:</b> Maupin, Chase [chase.maupin@ti.com]<br>
<b>Received:</b> Tuesday, 16 Jul 2013, 9:08<br>
<b>To:</b> Christian Gagneraud [chgans@gna.org]; <a href=3D"mailto:meta-ara=
go@arago-project.org">
meta-arago@arago-project.org</a> [meta-arago@arago-project.org]<br>
<b>Subject:</b> Re: [meta-arago] ofono broken with arago-danny-config (was =
Re: qt4-embedded-gles broken with arago-danny-config)<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt">&gt;-----Original M=
essage-----<br>
&gt;From: <a href=3D"mailto:meta-arago-bounces@arago-project.org">meta-arag=
o-bounces@arago-project.org</a> [mailto:meta-arago-<br>
&gt;<a href=3D"mailto:bounces@arago-project.org">bounces@arago-project.org<=
/a>] On Behalf Of Christian Gagneraud<br>
&gt;Sent: Thursday, July 11, 2013 7:20 PM<br>
&gt;To: <a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago-pr=
oject.org</a><br>
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
&gt;<a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago-projec=
t.org</a><br>
&gt;<a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago=
">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
_______________________________________________<br>
meta-arago mailing list<br>
<a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago-project.or=
g</a><br>
<a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">ht=
tp://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><o:p></o:p></=
span></p>
</div>
</div>
</div>
</body>
</html>

--_000_7D46E86EC0A8354091174257B2FED10159658F23DLEE11entticom_--
