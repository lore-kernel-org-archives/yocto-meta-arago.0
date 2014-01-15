Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 49F9752998
	for <meta-arago@arago-project.org>;
	Wed, 15 Jan 2014 16:54:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0FGsKa8012876;
	Wed, 15 Jan 2014 10:54:20 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0FGsKwP010122;
	Wed, 15 Jan 2014 10:54:20 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Wed, 15 Jan 2014 10:54:19 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Vanderpool Josh <Joshua.Vanderpool@raymondcorp.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: Building the tisdk image fails to fetch php
Thread-Index: Ac8SDa017oWE3k2GRTKSnkTrc1gMQgAA5Ypg
Date: Wed, 15 Jan 2014 16:54:19 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101598F6EC4@DLEE11.ent.ti.com>
References: <7D1F292BE8E4CC4F93079C1A7A58D5622BA33E9E@USNYGRMBX4.raymondcorp.local>
In-Reply-To: <7D1F292BE8E4CC4F93079C1A7A58D5622BA33E9E@USNYGRMBX4.raymondcorp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: Building the tisdk image fails to fetch php
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
X-List-Received-Date: Wed, 15 Jan 2014 16:54:21 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7D46E86EC0A8354091174257B2FED101598F6EC4DLEE11entticom_"

--_000_7D46E86EC0A8354091174257B2FED101598F6EC4DLEE11entticom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Vanderpool Josh
Sent: Wednesday, January 15, 2014 10:20 AM
To: meta-arago@arago-project.org
Subject: [meta-arago] Building the tisdk image fails to fetch php

This is in the meta-openembeded layer but might be fixed in the master...
I use the git://arago-project.org/git/projects/oe-layersetup.git to get rel=
ease configs.

Anyway the SRC_URI is invalid for php-5.5.14 as they move them

[CEM] Do you mean 5.4.14?

from: http://www.php.net/distributions/php-${PV}.tar.bz2
to: http://museum.php.net/php5/php-${PV}.tar.bz2

I just changed the php.inc at /tisdk/sources/meta-openembedded/meta-oe/reci=
pes-devtools/php/php.inc

I am just learning about layers i assume there is something i could have do=
ne in my local.conf but have not discovered yet...

Just wanted it to be noted in case others run into the issue.

[CEM] Josh, you may want to submit this patch to meta-openembedded@openembe=
dded.org<mailto:meta-openembedded@openembedded.org>.  I don=92t see that th=
e master, dora, or dylan branches have been updated.  I didn=92t notice any=
thing on the list for this already


-Josh

Confidentiality Notice: The preceding e-mail message (including any attachm=
ents) contains information that may be confidential, protected by applicabl=
e legal privileges, or constitute non-public information. It is intended to=
 be conveyed only to the designated recipient(s). If you are not an intende=
d recipient of this message, please notify the sender by replying to this m=
essage and then delete it from your system. Use, dissemination, distributio=
n or reproduction of this message by unintended recipients is not authorize=
d and may be unlawful.

--_000_7D46E86EC0A8354091174257B2FED101598F6EC4DLEE11entticom_
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
	font-family:"Times New Roman","serif";
	color:black;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";
	color:black;}
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
<body bgcolor=3D"white" lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;;color:windowtext">From:</span></b><spa=
n style=3D"font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif=
&quot;;color:windowtext"> meta-arago-bounces@arago-project.org [mailto:meta=
-arago-bounces@arago-project.org]
<b>On Behalf Of </b>Vanderpool Josh<br>
<b>Sent:</b> Wednesday, January 15, 2014 10:20 AM<br>
<b>To:</b> meta-arago@arago-project.org<br>
<b>Subject:</b> [meta-arago] Building the tisdk image fails to fetch php<o:=
p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This is in the meta-openembeded layer but might be f=
ixed in the master...<br>
I use the git://arago-project.org/git/projects/oe-layersetup.git to get rel=
ease configs.<br>
<br>
Anyway the SRC_URI is invalid for php-5.5.14 as they move them<span style=
=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">[CEM] Do you mean 5.4.14?=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><br>
from: <a href=3D"http://www.php.net/distributions/php-$">http://www.php.net=
/distributions/php-$</a>{PV}.tar.bz2&nbsp;
<br>
to: <a href=3D"http://museum.php.net/php5/php-$">http://museum.php.net/php5=
/php-$</a>{PV}.tar.bz2
<br>
<br>
I just changed the php.inc at /tisdk/sources/meta-openembedded/meta-oe/reci=
pes-devtools/php/php.inc<br>
<br>
I am just learning about layers i assume there is something i could have do=
ne in my local.conf but have not discovered yet...<br>
<br>
Just wanted it to be noted in case others run into the issue.<span style=3D=
"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">[CEM] Josh, you may want =
to submit this patch to
<a href=3D"mailto:meta-openembedded@openembedded.org">meta-openembedded@ope=
nembedded.org</a>.&nbsp; I don=92t see that the master, dora, or dylan bran=
ches have been updated.&nbsp; I didn=92t notice anything on the list for th=
is already<o:p></o:p></span></p>
<p class=3D"MsoNormal"><br>
<br>
-Josh<o:p></o:p></p>
<p>Confidentiality Notice: The preceding e-mail message (including any atta=
chments) contains information that may be confidential, protected by applic=
able legal privileges, or constitute non-public information. It is intended=
 to be conveyed only to the designated
 recipient(s). If you are not an intended recipient of this message, please=
 notify the sender by replying to this message and then delete it from your=
 system. Use, dissemination, distribution or reproduction of this message b=
y unintended recipients is not authorized
 and may be unlawful. <o:p></o:p></p>
</div>
</div>
</body>
</html>

--_000_7D46E86EC0A8354091174257B2FED101598F6EC4DLEE11entticom_--
