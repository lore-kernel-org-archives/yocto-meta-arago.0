Return-Path: <Joshua.Vanderpool@raymondcorp.com>
Received: from smtp.raymondcorp.com (smtp.raymondcorp.com [24.97.209.121])
	by arago-project.org (Postfix) with ESMTPS id EEC0452986
	for <meta-arago@arago-project.org>;
	Wed, 15 Jan 2014 18:47:20 +0000 (UTC)
Received: from smtp.raymondcorp.com (localhost [127.0.0.1])
	by smtp.raymondcorp.com (8.14.3/8.14.3) with ESMTP id s0FIlLd5022955
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-arago@arago-project.org>; Wed, 15 Jan 2014 12:47:21 -0600
Received: from localhost (localhost [[UNIX: localhost]])
	by smtp.raymondcorp.com (8.14.3/8.14.3/Submit) with SMTP id
	s0FIkM6x022465
	for <meta-arago@arago-project.org>; Wed, 15 Jan 2014 12:46:22 -0600
Received: from USNYGRMBX4.raymondcorp.local ([169.254.4.152]) by usnygrcas1
	([130.1.155.198]) with mapi id 14.03.0158.001; Wed, 15 Jan 2014 13:46:19
	-0500
From: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>, "meta-openembedded@openembedded.org"
	<meta-openembedded@openembedded.org>
Thread-Topic: image fails to fetch php
Thread-Index: AQHPEiITAbXFYyH96kaPGrjjGfGkgw==
Date: Wed, 15 Jan 2014 18:46:19 +0000
Message-ID: <7D1F292BE8E4CC4F93079C1A7A58D5622BA33F59@USNYGRMBX4.raymondcorp.local>
References: <7D1F292BE8E4CC4F93079C1A7A58D5622BA33E9E@USNYGRMBX4.raymondcorp.local>
	<7D46E86EC0A8354091174257B2FED101598F6EC4@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.150.131]
MIME-Version: 1.0
X-MessageScreenMessageID: 1389811581.969679.1642.932659211
X-MessageScreenContentScore: Score of 0 assigned to Content
X-MessageScreenUCEScore: Score of 0 assigned to UCE
X-MessageScreen: Analyzed by IntelliReach MessageScreen(tm)
Subject: Re: image fails to fetch php
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
X-List-Received-Date: Wed, 15 Jan 2014 18:47:21 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7D1F292BE8E4CC4F93079C1A7A58D5622BA33F59USNYGRMBX4raymo_"

--_000_7D1F292BE8E4CC4F93079C1A7A58D5622BA33F59USNYGRMBX4raymo_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

On 01/15/2014 11:54 AM, Maupin, Chase wrote:
From: meta-arago-bounces@arago-project.org<mailto:meta-arago-bounces@arag=
o-project.org> [mailto:meta-arago-bounces@arago-project.org] On Behalf Of=
 Vanderpool Josh
Sent: Wednesday, January 15, 2014 10:20 AM
To: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
Subject: [meta-arago] Building the tisdk image fails to fetch php

This is in the meta-openembeded layer but might be fixed in the master...=

I use the git://arago-project.org/git/projects/oe-layersetup.git to get r=
elease configs.

Anyway the SRC_URI is invalid for php-5.5.14 as they move them

[CEM] Do you mean 5.4.14?
/JDV yes 5.4.14

from: http://www.php.net/distributions/php-${PV}.tar.bz2
to: http://museum.php.net/php5/php-${PV}.tar.bz2

I just changed the php.inc at /tisdk/sources/meta-openembedded/meta-oe/re=
cipes-devtools/php/php.inc

I am just learning about layers i assume there is something i could have =
done in my local.conf but have not discovered yet...

Just wanted it to be noted in case others run into the issue.

[CEM] Josh, you may want to submit this patch to meta-openembedded@openem=
bedded.org<mailto:meta-openembedded@openembedded.org>.  I don=92t see tha=
t the master, dora, or dylan branches have been updated.  I didn=92t noti=
ce anything on the list for this already
/JDV ok maybe the http://museum.php.net/php5<http://museum.php.net/php5/p=
hp-$> should be added as a mirror??


-Josh

Confidentiality Notice: The preceding e-mail message (including any attac=
hments) contains information that may be confidential, protected by appli=
cable legal privileges, or constitute non-public information. It is inten=
ded to be conveyed only to the designated recipient(s). If you are not an=
 intended recipient of this message, please notify the sender by replying=
 to this message and then delete it from your system. Use, dissemination,=
 distribution or reproduction of this message by unintended recipients is=
 not authorized and may be unlawful.



Confidentiality Notice:

The preceding e-mail message (including any attachments) contains informa=
tion that may be confidential, protected by applicable legal privileges, =
or constitute non-public information. It is intended to be conveyed only =
to the designated recipient(s). If you are not an intended recipient of t=
his message, please notify the sender by replying to this message and the=
n delete it from your system. Use, dissemination, distribution or reprodu=
ction of this message by unintended recipients is=20
not authorized and may be unlawful.



--_000_7D1F292BE8E4CC4F93079C1A7A58D5622BA33F59USNYGRMBX4raymo_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows=
-1252">
</head>
<body bgcolor=3D"#FFFFFF" text=3D"#000000">
<div class=3D"moz-cite-prefix">On 01/15/2014 11:54 AM, Maupin, Chase wrot=
e:<br>
</div>
<blockquote cite=3D"mid:7D46E86EC0A8354091174257B2FED101598F6EC4@DLEE11.e=
nt.ti.com" type=3D"cite">
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered=0A=
        medium)">
<style><!--=0A=
/* Font Definitions */=0A=
@font-face=0A=
	{font-family:"Cambria Math";=0A=
	panose-1:2 4 5 3 5 4 6 3 2 4;}=0A=
@font-face=0A=
	{font-family:Calibri;=0A=
	panose-1:2 15 5 2 2 2 4 3 2 4;}=0A=
@font-face=0A=
	{font-family:Tahoma;=0A=
	panose-1:2 11 6 4 3 5 4 4 2 4;}=0A=
/* Style Definitions */=0A=
p.MsoNormal, li.MsoNormal, div.MsoNormal=0A=
	{margin:0in;=0A=
	margin-bottom:.0001pt;=0A=
	font-size:12.0pt;=0A=
	font-family:"Times New Roman","serif";=0A=
	color:black;}=0A=
a:link, span.MsoHyperlink=0A=
	{mso-style-priority:99;=0A=
	color:blue;=0A=
	text-decoration:underline;}=0A=
a:visited, span.MsoHyperlinkFollowed=0A=
	{mso-style-priority:99;=0A=
	color:purple;=0A=
	text-decoration:underline;}=0A=
p=0A=
	{mso-style-priority:99;=0A=
	mso-margin-top-alt:auto;=0A=
	margin-right:0in;=0A=
	mso-margin-bottom-alt:auto;=0A=
	margin-left:0in;=0A=
	font-size:12.0pt;=0A=
	font-family:"Times New Roman","serif";=0A=
	color:black;}=0A=
span.EmailStyle18=0A=
	{mso-style-type:personal-reply;=0A=
	font-family:"Calibri","sans-serif";=0A=
	color:#1F497D;}=0A=
=2EMsoChpDefault=0A=
	{mso-style-type:export-only;=0A=
	font-size:10.0pt;}=0A=
@page WordSection1=0A=
	{size:8.5in 11.0in;=0A=
	margin:1.0in 1.0in 1.0in 1.0in;}=0A=
div.WordSection1=0A=
	{page:WordSection1;}=0A=
--></style><!--[if gte mso 9]><xml>=0A=
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />=0A=
</xml><![endif]--><!--[if gte mso 9]><xml>=0A=
<o:shapelayout v:ext=3D"edit">=0A=
<o:idmap v:ext=3D"edit" data=3D"1" />=0A=
</o:shapelayout></xml><![endif]-->
<div class=3D"WordSection1">
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in=0A=
          0in 0in 4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF=0A=
              1.0pt;padding:3.0pt 0in 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&qu=
ot;Tahoma&quot;,&quot;sans-serif&quot;;color:windowtext">From:</span></b>=
<span style=3D"font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans=
-serif&quot;;color:windowtext">
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:meta-arago-bounces@a=
rago-project.org">
meta-arago-bounces@arago-project.org</a> [<a class=3D"moz-txt-link-freete=
xt" href=3D"mailto:meta-arago-bounces@arago-project.org">mailto:meta-arag=
o-bounces@arago-project.org</a>]
<b>On Behalf Of </b>Vanderpool Josh<br>
<b>Sent:</b> Wednesday, January 15, 2014 10:20 AM<br>
<b>To:</b> <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:meta-arag=
o@arago-project.org">
meta-arago@arago-project.org</a><br>
<b>Subject:</b> [meta-arago] Building the tisdk image fails to fetch php<=
o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This is in the meta-openembeded layer but might be=
 fixed in the master...<br>
I use the git://arago-project.org/git/projects/oe-layersetup.git to get r=
elease configs.<br>
<br>
Anyway the SRC_URI is invalid for php-5.5.14 as they move them<span style=
=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;=
Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;=
Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D">[CEM] Do you mean 5.4=
=2E14?</span></p>
</div>
</div>
</blockquote>
/JDV yes 5.4.14<br>
<blockquote cite=3D"mid:7D46E86EC0A8354091174257B2FED101598F6EC4@DLEE11.e=
nt.ti.com" type=3D"cite">
<div class=3D"WordSection1">
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in=0A=
          0in 0in 4.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;=
Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><br>
from: <a moz-do-not-send=3D"true" href=3D"http://www.php.net/distribution=
s/php-$">http://www.php.net/distributions/php-$</a>{PV}.tar.bz2&nbsp;
<br>
to: <a moz-do-not-send=3D"true" href=3D"http://museum.php.net/php5/php-$"=
>http://museum.php.net/php5/php-$</a>{PV}.tar.bz2
<br>
<br>
I just changed the php.inc at /tisdk/sources/meta-openembedded/meta-oe/re=
cipes-devtools/php/php.inc<br>
<br>
I am just learning about layers i assume there is something i could have =
done in my local.conf but have not discovered yet...<br>
<br>
Just wanted it to be noted in case others run into the issue.<span style=3D=
"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;=
Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;=
Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D">[CEM] Josh, you may w=
ant to submit this patch to
<a moz-do-not-send=3D"true" href=3D"mailto:meta-openembedded@openembedded=
=2Eorg">meta-openembedded@openembedded.org</a>.&nbsp; I don=92t see that =
the master, dora, or dylan branches have been updated.&nbsp; I didn=92t n=
otice anything on the list for this already</span></p>
</div>
</div>
</blockquote>
/JDV ok maybe the <a moz-do-not-send=3D"true" href=3D"http://museum.php.n=
et/php5/php-$">
http://museum.php.net/php5</a> should be added as a mirror??<br>
<blockquote cite=3D"mid:7D46E86EC0A8354091174257B2FED101598F6EC4@DLEE11.e=
nt.ti.com" type=3D"cite">
<div class=3D"WordSection1">
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in=0A=
          0in 0in 4.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;=
Calibri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><br>
<br>
-Josh<o:p></o:p></p>
<p>Confidentiality Notice: The preceding e-mail message (including any at=
tachments) contains information that may be confidential, protected by ap=
plicable legal privileges, or constitute non-public information. It is in=
tended to be conveyed only to the designated
 recipient(s). If you are not an intended recipient of this message, plea=
se notify the sender by replying to this message and then delete it from =
your system. Use, dissemination, distribution or reproduction of this mes=
sage by unintended recipients is not authorized
 and may be unlawful. <o:p></o:p></p>
</div>
</div>
</blockquote>
<br>
<p>
Confidentiality Notice:

The preceding e-mail message (including any attachments) contains informa=
tion that may be confidential, protected by applicable legal privileges, =
or constitute non-public information. It is intended to be conveyed only =
to the designated recipient(s). If you are not an intended recipient of t=
his message, please notify the sender by replying to this message and the=
n delete it from your system. Use, dissemination, distribution or reprodu=
ction of this message by unintended recipients is=20
not authorized and may be unlawful.

<p>

</body>
</html>

--_000_7D1F292BE8E4CC4F93079C1A7A58D5622BA33F59USNYGRMBX4raymo_--
