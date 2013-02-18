Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 3279852A10
	for <meta-arago@arago-project.org>;
	Mon, 18 Feb 2013 15:14:18 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1IFEIap018595;
	Mon, 18 Feb 2013 09:14:18 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1IFEHYi018484;
	Mon, 18 Feb 2013 09:14:17 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Mon, 18 Feb 2013 09:14:17 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Paul Kovitz <paul.kovitz@welchallyn.com>, "fcooperjr27@gmail.com"
	<fcooperjr27@gmail.com>
Thread-Topic: [meta-arago] [PATCH 07/18] arago.conf: Add SUPPORTS_SGX variable
Thread-Index: AQHOCLpsMGflxzqAp0WHcPg8Stwd3Jh8C5cAgAOyCHA=
Date: Mon, 18 Feb 2013 15:14:17 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C3946F1@DFLE09.ent.ti.com>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
	<1360629979-24789-7-git-send-email-fcooper@ti.com>
	<CA+edY+TJcTewZLGNf5WTjsZE3a+3cg0UCRBjaHPhtFQ344iM8Q@mail.gmail.com>
In-Reply-To: <CA+edY+TJcTewZLGNf5WTjsZE3a+3cg0UCRBjaHPhtFQ344iM8Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 07/18] arago.conf: Add SUPPORTS_SGX variable
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
X-List-Received-Date: Mon, 18 Feb 2013 15:14:19 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8F29D6B095ED194EA1980491A5E029710C3946F1DFLE09entticom_"

--_000_8F29D6B095ED194EA1980491A5E029710C3946F1DFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

In this case ?=3D and =3D would be equivalent. If your setting SUPPORTS_SGX=
 in your local.conf then it will override the value in the arago.conf file.

I do see your point for the other two recipes. Currently it isn't friendly =
for people wanting to support am3352.  I'll send updated patches. Thanks!

From: Paul Kovitz [mailto:paul.kovitz@welchallyn.com]
Sent: Friday, February 15, 2013 6:26 PM
To: fcooperjr27@gmail.com
Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
Subject: Re: [meta-arago] [PATCH 07/18] arago.conf: Add SUPPORTS_SGX variab=
le

Please comment on coding SUPPORTS_SGX ?=3D "YES" instead of SUPPORTS_SGX =
=3D "YES" For example, if you want to simulate an AM3352 device on an AM335=
x eval board, you could write SUPPORTS_SGX =3D "NO" in local.conf. This cha=
nge requires a base_conditional checks for SUPPORTS_SGX in task-arago-tisdk=
-matrix.bb<http://task-arago-tisdk-matrix.bb> and task-arago-tisdk-graphics=
-sdk-target.bb<http://task-arago-tisdk-graphics-sdk-target.bb> to avoid oth=
er dependencies on OpenGL for the AM3352. I have a similar patch in the cod=
e I am currently using for my own development.

Thanks for your help.



--_000_8F29D6B095ED194EA1980491A5E029710C3946F1DFLE09entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
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
span.EmailStyle17
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
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
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Hi Paul,<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">In this case ?=3D and =3D=
 would be equivalent. If your setting SUPPORTS_SGX in your local.conf then =
it will override the value in the arago.conf file.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">I do see your point for t=
he other two recipes. Currently it isn&#8217;t friendly for people wanting =
to support am3352.&nbsp; I&#8217;ll send updated patches. Thanks!<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Paul Kov=
itz [mailto:paul.kovitz@welchallyn.com]
<br>
<b>Sent:</b> Friday, February 15, 2013 6:26 PM<br>
<b>To:</b> fcooperjr27@gmail.com<br>
<b>Cc:</b> meta-arago@arago-project.org; Cooper Jr., Franklin<br>
<b>Subject:</b> Re: [meta-arago] [PATCH 07/18] arago.conf: Add SUPPORTS_SGX=
 variable<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">Please comment on coding SUPPORTS_SGX ?=3D &quot;YES=
&quot; instead of SUPPORTS_SGX =3D &quot;YES&quot; For example, if you want=
 to simulate an AM3352 device on an AM335x eval board, you could write&nbsp=
;SUPPORTS_SGX =3D &quot;NO&quot; in local.conf. This change requires a base=
_conditional
 checks for SUPPORTS_SGX in&nbsp;<a href=3D"http://task-arago-tisdk-matrix.=
bb" target=3D"_blank">task-arago-tisdk-matrix.bb</a> and&nbsp;<a href=3D"ht=
tp://task-arago-tisdk-graphics-sdk-target.bb" target=3D"_blank">task-arago-=
tisdk-graphics-sdk-target.bb</a>&nbsp;to avoid other dependencies
 on OpenGL for the AM3352. I have a similar patch in the code I am currentl=
y using for my own development.<o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks for your help.<o:p></o:p></p>
<div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_8F29D6B095ED194EA1980491A5E029710C3946F1DFLE09entticom_--
