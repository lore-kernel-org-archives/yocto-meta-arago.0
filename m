Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 767C45299F
	for <meta-arago@arago-project.org>;
	Mon,  3 Apr 2017 14:25:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v33EPDaV001850
	for <meta-arago@arago-project.org>; Mon, 3 Apr 2017 09:25:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1491229513;
	bh=1RSCVwFo5LBxxMZii1VyBU7Fwscl8J6oWRwxfx+ggNA=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=CNjoqOYqBQADZ7PBKhSJzfdFjt7svn3YDXot0j5eEaq9OLsBDYD/ho01RLH9GDDIM
	P/VmHbXQ7XZfkcN/PkFfx2qZNucThx4BsdsS2wBNUthe3au/4RZfGRnS3PeB1PMdsp
	TudYeLI5qwITSdqq9mRdt/j95a8nJdIzRZAih2TY=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v33EP8hr029681
	for <meta-arago@arago-project.org>; Mon, 3 Apr 2017 09:25:08 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Mon, 3 Apr 2017 09:25:05 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Prajod, Pooja" <poojaprajod@ti.com>, "R, Karthik"
	<karthik.ramanan@ti.com>, "Balagopalakrishnan, Anand" <anandb@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: Patch for enabling waylandsink
Thread-Index: AdKpHl0SvA0XKOvVRfmSzPMgUC2jNwAMkEoQAAApRPAARi6f8ACAxKNwAAFaZEAAA1oJYAABeVsg
Date: Mon, 3 Apr 2017 14:25:04 +0000
Message-ID: <009C030982313E4589C6BC55FBF1E82A2535DE08@DFLE09.ent.ti.com>
References: <24B88602B5904F49971CAF899152529B8203FCD5@DBDE04.ent.ti.com>
	<009C030982313E4589C6BC55FBF1E82A2535BA54@DFLE09.ent.ti.com>
	<05CF4794C98B244ABDC620C109037622C040B78A@DBDE04.ent.ti.com>
	<009C030982313E4589C6BC55FBF1E82A2535D48B@DFLE09.ent.ti.com>
	<24B88602B5904F49971CAF899152529B82045FDB@DBDE04.ent.ti.com>
	<009C030982313E4589C6BC55FBF1E82A2535DC40@DFLE09.ent.ti.com>
	<6878EA727B2FBD4093953DF6369C4A0F81339CE1@DBDE04.ent.ti.com>
In-Reply-To: <6878EA727B2FBD4093953DF6369C4A0F81339CE1@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: Patch for enabling waylandsink
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
X-List-Received-Date: Mon, 03 Apr 2017 14:25:27 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_009C030982313E4589C6BC55FBF1E82A2535DE08DFLE09entticom_"

--_000_009C030982313E4589C6BC55FBF1E82A2535DE08DFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

+ meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>

Hi, Pooja:

Yes, it should be board independent and therefore you should apply this pat=
ches to AM4 and AM3 as well.

Best regards,

Eric



From: Prajod, Pooja
Sent: Monday, April 03, 2017 9:44 AM
To: Ruei, Eric; R, Karthik; Balagopalakrishnan, Anand
Subject: RE: Patch for enabling waylandsink

Eric,
      This is Weston version dependent. I dont think it is board dependent.=
 I have tested only on J6, but I don't have any reason to suspect its board=
 specific.

Regards,
Pooja Prajod

From: Ruei, Eric
Sent: Monday, April 03, 2017 5:40 PM
To: R, Karthik; Balagopalakrishnan, Anand; Prajod, Pooja
Subject: RE: Patch for enabling waylandsink

Hi, Karthik:

Sure,  I can run the tests.  Do you want me to update the meta-arago patch =
to include AM4?
Pooja, can the gstreamer1.0 patch be applicable to AM3?

Best regards,

Eric


From: R, Karthik
Sent: Monday, April 03, 2017 7:27 AM
To: Ruei, Eric; Balagopalakrishnan, Anand; Prajod, Pooja
Subject: RE: Patch for enabling waylandsink

Hi Eric,

Since I don't have the boards with me to test on the AM4 and AM5, can I req=
uest you to take care of posting the patches after verification?

Regards
Karthik

From: Ruei, Eric
Sent: Saturday, 01 April, 2017 3:30 AM
To: Balagopalakrishnan, Anand; R, Karthik; Prajod, Pooja
Subject: RE: Patch for enabling waylandsink

Hi, Karthik:

Do you plan to take care of this issue?

Best regards,

Eric
From: Balagopalakrishnan, Anand
Sent: Thursday, March 30, 2017 8:32 AM
To: Ruei, Eric; R, Karthik; Prajod, Pooja
Subject: RE: Patch for enabling waylandsink

All,

The right forum to address this question is on the patch review list.

All patches must go through respective review process - without fail. We ma=
y need to accept some patches for critical bug fixes even before review clo=
sure. Even then, patches must be posted for review.

Regards,
Anand

From: Ruei, Eric
Sent: Thursday, March 30, 2017 5:57 PM
To: R, Karthik; Prajod, Pooja
Cc: Balagopalakrishnan, Anand
Subject: RE: Patch for enabling waylandsink

Hi, Karthik and Pooja:

I think that both AM4 and AM5 should always share the same gstreamer1.0-plu=
gins-bad.

Best regards,

Eric

From: R, Karthik
Sent: Thursday, March 30, 2017 2:26 AM
To: Ruei, Eric; Prajod, Pooja
Cc: Balagopalakrishnan, Anand
Subject: Patch for enabling waylandsink

Hi Eric, Pooja,

Do you think that this patch is also applicable to AM4?
http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dcommit;h=3D7fceb01c514=
7baf41eda658060cd9a029b35088b

Regards
Karthik

--_000_009C030982313E4589C6BC55FBF1E82A2535DE08DFLE09entticom_
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
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle21
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle22
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle23
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle24
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle25
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle26
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43; <a href=3D"mailt=
o:meta-arago@arago-project.org">
meta-arago@arago-project.org</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Hi, Pooja:<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Yes, it should be boar=
d independent and therefore you should apply this patches to AM4 and AM3 as=
 well.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Best regards,<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Eric<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Prajod, =
Pooja
<br>
<b>Sent:</b> Monday, April 03, 2017 9:44 AM<br>
<b>To:</b> Ruei, Eric; R, Karthik; Balagopalakrishnan, Anand<br>
<b>Subject:</b> RE: Patch for enabling waylandsink<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Eric,<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; This is Weston version dependent. I dont think it is board depende=
nt. I have tested only on J6, but I don&#8217;t have any reason to suspect =
its board specific.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Regards,<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Pooja Prajod<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Ruei, Er=
ic
<br>
<b>Sent:</b> Monday, April 03, 2017 5:40 PM<br>
<b>To:</b> R, Karthik; Balagopalakrishnan, Anand; Prajod, Pooja<br>
<b>Subject:</b> RE: Patch for enabling waylandsink<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Hi, Karthik:<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Sure, &nbsp;I can run =
the tests. &nbsp;Do you want me to update the meta-arago patch to include A=
M4?
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Pooja, can the gstream=
er1.0 patch be applicable to AM3?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Best regards,<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Eric<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> R, Karth=
ik
<br>
<b>Sent:</b> Monday, April 03, 2017 7:27 AM<br>
<b>To:</b> Ruei, Eric; Balagopalakrishnan, Anand; Prajod, Pooja<br>
<b>Subject:</b> RE: Patch for enabling waylandsink<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Hi Eric,<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Since I don&#8217;t ha=
ve the boards with me to test on the AM4 and AM5, can I request you to take=
 care of posting the patches after verification?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Regards<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Karthik<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Ruei, Er=
ic
<br>
<b>Sent:</b> Saturday, 01 April, 2017 3:30 AM<br>
<b>To:</b> Balagopalakrishnan, Anand; R, Karthik; Prajod, Pooja<br>
<b>Subject:</b> RE: Patch for enabling waylandsink<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Hi, Karthik:<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Do you plan to take ca=
re of this issue?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Best regards,<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Eric<o:p></o:p></span>=
</p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Balagopa=
lakrishnan, Anand
<br>
<b>Sent:</b> Thursday, March 30, 2017 8:32 AM<br>
<b>To:</b> Ruei, Eric; R, Karthik; Prajod, Pooja<br>
<b>Subject:</b> RE: Patch for enabling waylandsink<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a name=3D"_MailEndCompose"><span style=3D"color:#1F=
497D">All,</span></a><span style=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">The right forum to add=
ress this question is on the patch review list.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">All patches must go th=
rough respective review process &#8211; without fail. We may need to accept=
 some patches for critical bug fixes even before review closure. Even then,=
 patches must be posted for review.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Regards,<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Anand<o:p></o:p></span=
></p>
</div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Ruei, Er=
ic
<br>
<b>Sent:</b> Thursday, March 30, 2017 5:57 PM<br>
<b>To:</b> R, Karthik; Prajod, Pooja<br>
<b>Cc:</b> Balagopalakrishnan, Anand<br>
<b>Subject:</b> RE: Patch for enabling waylandsink<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Hi, Karthik and Pooja:=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I think that both AM4 =
and AM5 should always share the same gstreamer1.0-plugins-bad.<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Best regards,<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Eric<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> R, Karth=
ik
<br>
<b>Sent:</b> Thursday, March 30, 2017 2:26 AM<br>
<b>To:</b> Ruei, Eric; Prajod, Pooja<br>
<b>Cc:</b> Balagopalakrishnan, Anand<br>
<b>Subject:</b> Patch for enabling waylandsink<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi Eric, Pooja,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Do you think that this patch is also applicable to A=
M4?<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"http://arago-project.org/git/?p=3Dmeta-ar=
ago.git;a=3Dcommit;h=3D7fceb01c5147baf41eda658060cd9a029b35088b">http://ara=
go-project.org/git/?p=3Dmeta-arago.git;a=3Dcommit;h=3D7fceb01c5147baf41eda6=
58060cd9a029b35088b</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards<o:p></o:p></p>
<p class=3D"MsoNormal">Karthik<o:p></o:p></p>
</div>
</body>
</html>

--_000_009C030982313E4589C6BC55FBF1E82A2535DE08DFLE09entticom_--
