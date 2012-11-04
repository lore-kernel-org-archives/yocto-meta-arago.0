Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B4BFC5208C
	for <meta-arago@arago-project.org>;
	Sun,  4 Nov 2012 14:06:03 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id qA4E62tC008918
	for <meta-arago@arago-project.org>; Sun, 4 Nov 2012 08:06:02 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qA4E62Yp024175
	for <meta-arago@arago-project.org>; Sun, 4 Nov 2012 08:06:02 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Sun, 4 Nov 2012 08:06:02 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: Switch from tar.bz2 to tar.gz
Thread-Index: Ac26TXcIFBHOW76MQ6+7fIyWSwBejA==
Date: Sun, 4 Nov 2012 14:06:01 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C315A45@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Switch from tar.bz2 to tar.gz
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
X-List-Received-Date: Sun, 04 Nov 2012 14:06:04 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8F29D6B095ED194EA1980491A5E029710C315A45DFLE09entticom_"

--_000_8F29D6B095ED194EA1980491A5E029710C315A45DFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

In our current setup tar.bz2 is the default file type used by image recipes=
. In classic arago we used tar.gz.

I was always curious why some of the image builds were taking a long time. =
I also noticed that installing the SDK using the installer also took a very=
 long time.

I took arago-amsdk-image contents and created and extracted tar.gz and tar.=
bz2 files and timed the results.

extract tar.bz2
real    2m20.402s
user    2m15.800s
sys     0m9.410s

extract tar.gz
real    0m47.641s
user    0m34.850s
sys     0m10.860s

create tar.gz
real    1m49.561s
user    1m39.130s
sys     0m4.420s

create tar.bz2
real    6m10.851s
user    6m8.490s
sys     0m4.420s

It seems tar.bz2 provides better compression at the cost of extraction and =
compression speed. From a SDK perspective  some savings in size is not wort=
h a significant increase in time to bitbake image recipes and neither is it=
 worth the extra time to install a full blown SDK. I would also note that t=
hese test are done on a 24 core machine. I'm unsure how much these differen=
t compression algorithms utilize all the different cores but I am sure time=
s on a traditional machine will be significantly longer. So is there any is=
sue with me changing the default file type for images from tar.bz2 to tar.g=
z?


Regards,
Franklin Cooper Jr.
Texas Instruments
Application Engineer
fcooper@ti.com<mailto:fcooper@ti.com>


--_000_8F29D6B095ED194EA1980491A5E029710C315A45DFLE09entticom_
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
/* List Definitions */
@list l0
	{mso-list-id:80685695;
	mso-list-template-ids:381215220;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">In our current setup tar.bz2 is the default file typ=
e used by image recipes. In classic arago we used tar.gz.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I was always curious why some of the image builds we=
re taking a long time. I also noticed that installing the SDK using the ins=
taller also took a very long time.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I took arago-amsdk-image contents and created and ex=
tracted tar.gz and tar.bz2 files and timed the results.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">extract tar.bz2<o:p></o:p></p>
<p class=3D"MsoNormal">real&nbsp; &nbsp; 2m20.402s<o:p></o:p></p>
<p class=3D"MsoNormal">user&nbsp; &nbsp; 2m15.800s<o:p></o:p></p>
<p class=3D"MsoNormal">sys &nbsp; &nbsp; 0m9.410s<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">extract tar.gz <o:p></o:p></p>
<p class=3D"MsoNormal">real&nbsp; &nbsp; 0m47.641s<o:p></o:p></p>
<p class=3D"MsoNormal">user&nbsp; &nbsp; 0m34.850s<o:p></o:p></p>
<p class=3D"MsoNormal">sys &nbsp; &nbsp; 0m10.860s<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">create tar.gz<o:p></o:p></p>
<p class=3D"MsoNormal">real&nbsp; &nbsp; 1m49.561s<o:p></o:p></p>
<p class=3D"MsoNormal">user&nbsp; &nbsp; 1m39.130s<o:p></o:p></p>
<p class=3D"MsoNormal">sys &nbsp; &nbsp; 0m4.420s<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">create tar.bz2<o:p></o:p></p>
<p class=3D"MsoNormal">real&nbsp; &nbsp; 6m10.851s<o:p></o:p></p>
<p class=3D"MsoNormal">user&nbsp; &nbsp; 6m8.490s<o:p></o:p></p>
<p class=3D"MsoNormal">sys &nbsp; &nbsp; 0m4.420s<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">It seems tar.bz2 provides better compression at the =
cost of extraction and compression speed. From a SDK perspective &nbsp;some=
 savings in size is not worth a significant increase in time to bitbake ima=
ge recipes and neither is it worth the
 extra time to install a full blown SDK. I would also note that these test =
are done on a 24 core machine. I&#8217;m unsure how much these different co=
mpression algorithms utilize all the different cores but I am sure times on=
 a traditional machine will be significantly
 longer. So is there any issue with me changing the default file type for i=
mages from tar.bz2 to tar.gz?<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Franklin Cooper Jr.<o:p></o:p></p>
<p class=3D"MsoNormal">Texas Instruments<o:p></o:p></p>
<p class=3D"MsoNormal">Application Engineer<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"mailto:fcooper@ti.com">fcooper@ti.com</a>=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_8F29D6B095ED194EA1980491A5E029710C315A45DFLE09entticom_--
