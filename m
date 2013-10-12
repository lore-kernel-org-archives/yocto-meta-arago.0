Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 86016529E7
	for <meta-arago@arago-project.org>;
	Sat, 12 Oct 2013 14:52:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9CEqiMB032186
	for <meta-arago@arago-project.org>; Sat, 12 Oct 2013 09:52:44 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9CEqipx000993
	for <meta-arago@arago-project.org>; Sat, 12 Oct 2013 09:52:44 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Sat, 12 Oct 2013 09:52:44 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
Thread-Topic: [meta-arago] Startup scripts
Thread-Index: AQHOx1q1wfOXUCNgI0uwcPVdh6c43g==
Date: Sat, 12 Oct 2013 14:52:44 +0000
Message-ID: <A69A75DF-2372-46DF-BBDA-700AEA6A5870@ti.com>
References: <CF956B779D819D41BBC043B7082161D5459395@DBDE04.ent.ti.com>
In-Reply-To: <CF956B779D819D41BBC043B7082161D5459395@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
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
X-List-Received-Date: Sat, 12 Oct 2013 14:52:45 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_A69A75DF237246DFBBDA700AEA6A5870ticom_"

--_000_A69A75DF237246DFBBDA700AEA6A5870ticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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

--_000_A69A75DF237246DFBBDA700AEA6A5870ticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body dir=3D"auto">
<div style=3D"-webkit-text-size-adjust: auto;">You can use Sysvinit.</div>
<div style=3D"-webkit-text-size-adjust: auto;"><br>
</div>
<div style=3D"-webkit-text-size-adjust: auto;">Take a look at the init scri=
pts training the goes into a lot more details.</div>
<div style=3D"-webkit-text-size-adjust: auto;"><br>
</div>
<div><span style=3D"-webkit-text-size-adjust: auto;"><a href=3D"http://proc=
essors.wiki.ti.com/index.php/Sitara_Linux_Training">http://processors.wiki.=
ti.com/index.php/Sitara_Linux_Training</a></span></div>
<div style=3D"-webkit-text-size-adjust: auto;"><br>
On Oct 12, 2013, at 3:53 AM, &quot;Hingolikar, Mrinmayee&quot; &lt;<a href=
=3D"mailto:mrinmayee@ti.com">mrinmayee@ti.com</a>&gt; wrote:<br>
<br>
</div>
<blockquote type=3D"cite" style=3D"-webkit-text-size-adjust: auto;">
<div>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
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
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
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
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In the GLSDK we need some commands to be run at boot=
 time.<o:p></o:p></p>
<p class=3D"MsoNormal">In the Ubuntu filesystsem, such commands are part of=
 the /etc/rc.local. In the Yocto filesystem there is no rc.local file.<o:p>=
</o:p></p>
<p class=3D"MsoNormal">I would like to know what method is followed for Yoc=
to builds for such tasks? Is there any recipe existing for it?<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Mrinmayee<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</blockquote>
<blockquote type=3D"cite" style=3D"-webkit-text-size-adjust: auto;">
<div><span>_______________________________________________</span><br>
<span>meta-arago mailing list</span><br>
<span><a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago-proj=
ect.org</a></span><br>
<span><a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-ara=
go">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a></span>=
<br>
</div>
</blockquote>
</body>
</html>

--_000_A69A75DF237246DFBBDA700AEA6A5870ticom_--
