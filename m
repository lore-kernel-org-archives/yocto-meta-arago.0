Return-Path: <mrinmayee@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0F36E5299B
	for <meta-arago@arago-project.org>;
	Wed, 16 Oct 2013 05:46:12 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9G5k9ad005224
	for <meta-arago@arago-project.org>; Wed, 16 Oct 2013 00:46:10 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9G5k7hu006774
	for <meta-arago@arago-project.org>; Wed, 16 Oct 2013 00:46:08 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.02.0342.003; Wed, 16 Oct 2013 13:46:07 +0800
From: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Thread-Topic: [meta-arago] Startup scripts
Thread-Index: Ac7HKIxLor2UwtjGRBi58mcW0SZaK///3jUA//nJXkA=
Date: Wed, 16 Oct 2013 05:46:06 +0000
Message-ID: <CF956B779D819D41BBC043B7082161D5459776@DBDE04.ent.ti.com>
References: <CF956B779D819D41BBC043B7082161D5459395@DBDE04.ent.ti.com>
	<A69A75DF-2372-46DF-BBDA-700AEA6A5870@ti.com>
In-Reply-To: <A69A75DF-2372-46DF-BBDA-700AEA6A5870@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Startup scripts
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
X-List-Received-Date: Wed, 16 Oct 2013 05:46:12 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CF956B779D819D41BBC043B7082161D5459776DBDE04entticom_"

--_000_CF956B779D819D41BBC043B7082161D5459776DBDE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Franklin.

Regards,
Mrinmayee

From: Cooper Jr., Franklin
Sent: Saturday, October 12, 2013 8:23 PM
To: Hingolikar, Mrinmayee
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] Startup scripts

You can use Sysvinit.

Take a look at the init scripts training the goes into a lot more details.

http://processors.wiki.ti.com/index.php/Sitara_Linux_Training

On Oct 12, 2013, at 3:53 AM, "Hingolikar, Mrinmayee" <mrinmayee@ti.com<mail=
to:mrinmayee@ti.com>> wrote:
Hi all,

In the GLSDK we need some commands to be run at boot time.
In the Ubuntu filesystsem, such commands are part of the /etc/rc.local. In =
the Yocto filesystem there is no rc.local file.
I would like to know what method is followed for Yocto builds for such task=
s? Is there any recipe existing for it?


Regards,
Mrinmayee

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_CF956B779D819D41BBC043B7082161D5459776DBDE04entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
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
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Thanks Franklin.<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Regards,<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Mrinmayee<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Cooper J=
r., Franklin
<br>
<b>Sent:</b> Saturday, October 12, 2013 8:23 PM<br>
<b>To:</b> Hingolikar, Mrinmayee<br>
<b>Cc:</b> meta-arago@arago-project.org<br>
<b>Subject:</b> Re: [meta-arago] Startup scripts<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">You can use Sysvinit.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Take a look at the init scripts training the goes in=
to a lot more details.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><a href=3D"http://processors.wiki.ti.com/index.php/S=
itara_Linux_Training">http://processors.wiki.ti.com/index.php/Sitara_Linux_=
Training</a><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><br>
On Oct 12, 2013, at 3:53 AM, &quot;Hingolikar, Mrinmayee&quot; &lt;<a href=
=3D"mailto:mrinmayee@ti.com">mrinmayee@ti.com</a>&gt; wrote:<o:p></o:p></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt;-webkit-text-size=
-adjust: auto">
<div>
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">In the GLSDK we need some commands to be run at boot=
 time.<o:p></o:p></p>
<p class=3D"MsoNormal">In the Ubuntu filesystsem, such commands are part of=
 the /etc/rc.local. In the Yocto filesystem there is no rc.local file.<o:p>=
</o:p></p>
<p class=3D"MsoNormal">I would like to know what method is followed for Yoc=
to builds for such tasks? Is there any recipe existing for it?<o:p></o:p></=
p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Mrinmayee<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</blockquote>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt;-webkit-text-size=
-adjust: auto">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;">____________________________________=
___________<br>
meta-arago mailing list<br>
<a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago-project.or=
g</a><br>
<a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">ht=
tp://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><o:p></o:p></=
span></p>
</div>
</blockquote>
</div>
</div>
</body>
</html>

--_000_CF956B779D819D41BBC043B7082161D5459776DBDE04entticom_--
