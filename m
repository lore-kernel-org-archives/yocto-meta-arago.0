Return-Path: <mrinmayee@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 77F0C5296F
	for <meta-arago@arago-project.org>;
	Mon, 21 Oct 2013 08:11:48 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9L8Bk4g004690
	for <meta-arago@arago-project.org>; Mon, 21 Oct 2013 03:11:47 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9L8Bhfc020479
	for <meta-arago@arago-project.org>; Mon, 21 Oct 2013 03:11:45 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.02.0342.003; Mon, 21 Oct 2013 16:11:43 +0800
From: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: Help on packaging
Thread-Index: Ac7L4eBEE/aECHhbQBeFw8AgiIu94gALr5hwAIkde5A=
Date: Mon, 21 Oct 2013 08:11:43 +0000
Message-ID: <CF956B779D819D41BBC043B7082161D545A7F2@DBDE04.ent.ti.com>
References: <CF956B779D819D41BBC043B7082161D545A2D3@DBDE04.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C57BA8D@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C57BA8D@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: Re: Help on packaging
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
X-List-Received-Date: Mon, 21 Oct 2013 08:11:48 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CF956B779D819D41BBC043B7082161D545A7F2DBDE04entticom_"

--_000_CF956B779D819D41BBC043B7082161D545A7F2DBDE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks a lot Franklin! It really helps.

Regards,
Mrinmayee

From: Cooper Jr., Franklin
Sent: Friday, October 18, 2013 8:52 PM
To: Hingolikar, Mrinmayee; meta-arago@arago-project.org
Subject: RE: Help on packaging

So first I will definitely recommend looking at the Openembedded manual. I =
have that document bookmarked, printed out, on my ipad and kindle.

http://docs.openembedded.org/usermanual/usermanual.html

From: meta-arago-bounces@arago-project.org<mailto:meta-arago-bounces@arago-=
project.org> [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Hin=
golikar, Mrinmayee
Sent: Friday, October 18, 2013 4:10 AM
To: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
Subject: [meta-arago] Help on packaging

Hi all,

Is there any detailed documentation about the packaging in the yocto build =
system?
I would like to know more about the packaging specifically to answer:

1.      How to do a quick check as what files will go in the filesystem: in=
 the image directory or the sysroot-destdir?


[Franklin]
image
The image directory (or destination directory) is where the software needs =
to be installed into in order to be packaged. This directory is referred to=
 as D in recipes. So instead of installing binaries into /usr/bin and libra=
ries into /usr/lib for example you would need to install into ${D}/usr/bin =
and ${D}/usr/lib instead. When installed on the target the ${D} will be not=
 be included so they'll end up in the correct place. You definitely don't w=
ant files on your host system being replaced by cross-compiled binaries for=
 your target!
sysroots
rContains the staging area, which is used to store natively compiled tools =
and and libraries and headers for the target that are required for building=
 other software.

So the above is saying that the image directory is where the do_install ste=
p copies all the files that will end up being packaged. Sysroots is where a=
ll the critical headers and libraries that other software can point to grab=
 any external files it may need to build itself.
So to answer your original question of what is going into your filesystem. =
What goes into your file system are specific packages. If you look at the p=
ackage-split directory you will see all the different packages that are ava=
ilable to go into your filesystem. Looking at a single recipe to determine =
which specific packages will go into the filesystem is tough since it is re=
ally dependent on the RDEPENDS RRECOMMENDS that may be set by other recipes=
/packages.
Take a look at the following link: http://elinux.org/Bitbake_Cheat_Sheet. B=
itbake has a -g option that you can use to output dependency files that you=
 can work your way through to figure out exactly what package has a depende=
ncy on another package.
If for some reason a certain package isn't being included by default that y=
ou need then either can explicitly set RDEPENDS or RRECOMMENDS in an image,=
 packagegroup or recipe to make sure your filesystem gets what you need.



2.      How the do_package deals with symbolic links? (Since some of the sy=
mbolic links were missing in the target fs)
[Franklin] http://docs.openembedded.org/usermanual/usermanual.html#id325388
I would check if the symbolic link is found within the packages directory. =
If not then do_package is missing the symbolic link. What files are found i=
n each package is determined by each package's FILES_<package name> variabl=
e. So you want to check if the proper paths (relative to the image director=
y) is being set properly to insure that the files you're interested in isn'=
t missing anything.

Hopefully the above helps and if you need any clarification let me know!

Thanks and Regards,
Mrinmayee


--_000_CF956B779D819D41BBC043B7082161D545A7F2DBDE04entticom_
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
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.term
	{mso-style-name:term;}
span.EmailStyle22
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:507408283;
	mso-list-type:hybrid;
	mso-list-template-ids:-209651944 67698703 67698713 67698715 67698703 67698=
713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level4
	{mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level7
	{mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Thanks a lot Franklin!=
 It really helps.<o:p></o:p></span></p>
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
<b>Sent:</b> Friday, October 18, 2013 8:52 PM<br>
<b>To:</b> Hingolikar, Mrinmayee; meta-arago@arago-project.org<br>
<b>Subject:</b> RE: Help on packaging<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">So first I will defini=
tely recommend looking at the Openembedded manual. I have that document boo=
kmarked, printed out, on my ipad and kindle.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><a href=3D"http://docs=
.openembedded.org/usermanual/usermanual.html">http://docs.openembedded.org/=
usermanual/usermanual.html</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;">
<a href=3D"mailto:meta-arago-bounces@arago-project.org">meta-arago-bounces@=
arago-project.org</a> [<a href=3D"mailto:meta-arago-bounces@arago-project.o=
rg">mailto:meta-arago-bounces@arago-project.org</a>]
<b>On Behalf Of </b>Hingolikar, Mrinmayee<br>
<b>Sent:</b> Friday, October 18, 2013 4:10 AM<br>
<b>To:</b> <a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago=
-project.org</a><br>
<b>Subject:</b> [meta-arago] Help on packaging<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is there any detailed documentation about the packag=
ing in the yocto build system?<o:p></o:p></p>
<p class=3D"MsoNormal">I would like to know more about the packaging specif=
ically to answer:<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo2"><![if !supportLists]><span style=3D"mso-list:Ignore">1.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>How to do a quick check as what files will go in th=
e filesystem: in the image directory or the sysroot-destdir?<o:p></o:p></p>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b><i><span style=3D"color:#1F497D">[Franklin] </spa=
n></i></b><span style=3D"font-size:12.0pt;font-family:&quot;Times New Roman=
&quot;,&quot;serif&quot;"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:12.0pt;font-family:&quot;Times New Roman&=
quot;,&quot;serif&quot;">image
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<span style=3D"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,&qu=
ot;serif&quot;">The image directory (or destination directory) is where the=
 software needs to be installed into in order to be packaged. This director=
y is referred to as
<b>D</b> in recipes. So instead of installing binaries into <b>/usr/bin</b>=
 and libraries into
<b>/usr/lib</b> for example you would need to install into <b>${D}/usr/bin<=
/b> and
<b>${D}/usr/lib</b> instead. When installed on the target the ${D} will be =
not be included so they'll end up in the correct place. You definitely don'=
t want files on your host system being replaced by cross-compiled binaries =
for your target!<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;">sysroots<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:.5in">
<span style=3D"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,&qu=
ot;serif&quot;;color:#1F497D">r</span><span style=3D"font-size:12.0pt;font-=
family:&quot;Times New Roman&quot;,&quot;serif&quot;">Contains the staging =
area, which is used to store natively compiled tools and and libraries and =
headers
 for the target that are required for building other software.<o:p></o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:12.0pt;font-family:&quot;Times New Roman&=
quot;,&quot;serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:12.0pt;font-family:&quot;Times New Roman&=
quot;,&quot;serif&quot;">So the above is saying that the image directory is=
 where the do_install step copies all the files that will
 end up being packaged. Sysroots is where all the critical headers and libr=
aries that other software can point to grab any external files it may need =
to build itself.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:12.0pt;font-family:&quot;Times New Roman&=
quot;,&quot;serif&quot;">So to answer your original question of what is goi=
ng into your filesystem. What goes into your file system are
 specific packages. If you look at the package-split directory you will see=
 all the different packages that are available to go into your filesystem. =
Looking at a single recipe to determine which specific packages will go int=
o the filesystem is tough since
 it is really dependent on the RDEPENDS RRECOMMENDS that may be set by othe=
r recipes/packages.
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:12.0pt;font-family:&quot;Times New Roman&=
quot;,&quot;serif&quot;">Take a look at the following link:
<a href=3D"http://elinux.org/Bitbake_Cheat_Sheet">http://elinux.org/Bitbake=
_Cheat_Sheet</a>. Bitbake has a &#8211;g option that you can use to output =
dependency files that you can work your way through to figure out exactly w=
hat package has a dependency on another
 package.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:12.0pt;font-family:&quot;Times New Roman&=
quot;,&quot;serif&quot;">If for some reason a certain package isn&#8217;t b=
eing included by default that you need then either can explicitly
 set RDEPENDS or RRECOMMENDS in an image, packagegroup or recipe to make su=
re your filesystem gets what you need.<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:0in"><span style=3D"colo=
r:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo2"><![if !supportLists]><span style=3D"mso-list:Ignore">2.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>How the do_package deals with symbolic links? (Sinc=
e some of the symbolic links were missing in the target fs)<o:p></o:p></p>
<p class=3D"MsoNormal"><b><i><span style=3D"color:#1F497D">[Franklin] <a hr=
ef=3D"http://docs.openembedded.org/usermanual/usermanual.html#id325388">
http://docs.openembedded.org/usermanual/usermanual.html#id325388</a><o:p></=
o:p></span></i></b></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I would check if the s=
ymbolic link is found within the packages directory. If not then do_package=
 is missing the symbolic link. What files are found in each package is dete=
rmined by each package&#8217;s FILES_&lt;package
 name&gt; variable. So you want to check if the proper paths (relative to t=
he image directory) is being set properly to insure that the files you&#821=
7;re interested in isn&#8217;t missing anything. &nbsp;<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Hopefully the above he=
lps and if you need any clarification let me know!<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks and Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Mrinmayee<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_CF956B779D819D41BBC043B7082161D545A7F2DBDE04entticom_--
