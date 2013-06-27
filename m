Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A66C752A61
	for <meta-arago@arago-project.org>;
	Thu, 27 Jun 2013 13:38:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5RDc26o028379
	for <meta-arago@arago-project.org>; Thu, 27 Jun 2013 08:38:02 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5RDc14O011080
	for <meta-arago@arago-project.org>; Thu, 27 Jun 2013 08:38:02 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Thu, 27 Jun 2013 08:38:01 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
Thread-Topic: [meta-arago] Help needed- error locating kernel headers
Thread-Index: AQHOczuLHtqIqGqPa0aYVdwxzKFLfw==
Date: Thu, 27 Jun 2013 13:38:01 +0000
Message-ID: <E699D2B3-05F9-45CA-A348-0EB1CB92287D@ti.com>
References: <CF956B779D819D41BBC043B7082161D543CF0A@DBDE04.ent.ti.com>
In-Reply-To: <CF956B779D819D41BBC043B7082161D543CF0A@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Help needed- error locating kernel headers
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
X-List-Received-Date: Thu, 27 Jun 2013 13:38:03 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_E699D2B305F945CAA3480EB1CB92287Dticom_"

--_000_E699D2B305F945CAA3480EB1CB92287Dticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Does your recipe already "inherit module"?


On Jun 27, 2013, at 8:29 AM, "Hingolikar, Mrinmayee" <mrinmayee@ti.com<mail=
to:mrinmayee@ti.com>> wrote:

Hi all,

I am trying to create a recipe for a firmware that includes some of the ker=
nel header files.
I have these headers present in the sysroots directory, but still the build=
 fails saying unable to locate these header files.

In the asocfw.inc file I have :
EXTRA_OECONF +=3D "$(STAGING_KERNEL_DIR)"

Any suggestions? I have attached the error log for more details.

Regards,
Mrinmayee

<do_compile.log>
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_E699D2B305F945CAA3480EB1CB92287Dticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body dir=3D"auto">
<div>Does your recipe already &quot;inherit module&quot;?</div>
<div><br>
</div>
<div><br>
On Jun 27, 2013, at 8:29 AM, &quot;Hingolikar, Mrinmayee&quot; &lt;<a href=
=3D"mailto:mrinmayee@ti.com">mrinmayee@ti.com</a>&gt; wrote:<br>
<br>
</div>
<blockquote type=3D"cite">
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
<p class=3D"MsoNormal">I am trying to create a recipe for a firmware that i=
ncludes some of the kernel header files.
<o:p></o:p></p>
<p class=3D"MsoNormal">I have these headers present in the sysroots directo=
ry, but still the build fails saying unable to locate these header files.<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In the asocfw.inc file I have :<o:p></o:p></p>
<p class=3D"MsoNormal">EXTRA_OECONF &#43;=3D &quot;$(STAGING_KERNEL_DIR)&qu=
ot; <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Any suggestions? I have attached the error log for m=
ore details. &nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Mrinmayee<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</blockquote>
<blockquote type=3D"cite">
<div>&lt;do_compile.log&gt;</div>
</blockquote>
<blockquote type=3D"cite">
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

--_000_E699D2B305F945CAA3480EB1CB92287Dticom_--
