Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 29EB4529F2
	for <meta-arago@arago-project.org>;
	Mon,  7 Jan 2013 17:12:46 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r07HCeEA026392;
	Mon, 7 Jan 2013 11:12:40 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r07HCeL9029988;
	Mon, 7 Jan 2013 11:12:40 -0600
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Mon, 7 Jan 2013 11:12:40 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Paul Kovitz <paul.kovitz@welchallyn.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] 805 warning messages when I build 05.06.00.00?
Thread-Index: AQHN6tpTfSbjSmS4dUyIT4BXQZTrzpg+HJEg
Date: Mon, 7 Jan 2013 17:12:39 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101593475C5@DLEE12.ent.ti.com>
References: <CA+edY+R9ONv039-fdmdqB7v+POf_ig=ea5-Zhh0=u1s8DPUecw@mail.gmail.com>
In-Reply-To: <CA+edY+R9ONv039-fdmdqB7v+POf_ig=ea5-Zhh0=u1s8DPUecw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: 805 warning messages when I build 05.06.00.00?
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
X-List-Received-Date: Mon, 07 Jan 2013 17:12:55 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7D46E86EC0A8354091174257B2FED101593475C5DLEE12entticom_"

--_000_7D46E86EC0A8354091174257B2FED101593475C5DLEE12entticom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Paul Kovitz
Sent: Friday, January 04, 2013 6:19 PM
To: meta-arago@arago-project.org
Subject: [meta-arago] 805 warning messages when I build 05.06.00.00?

Greetings. I am new to this list and relatively new to oe, so if this kind =
of post does not belong here, please tell me.

I did a build today of the 05.06.00.00 release using this toolchain:
http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/e=
xports/arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2

There seem to be several classes of warnings. I have questions about all of=
 them. Sorry if these were covered under a previous thread. I only went bac=
k in the archives a few months and didn't see it.

  *   Failed to fetch from some URL. I assume source was successfully gotte=
n from a mirror, so I can ignore this. True?
Yes.  Usually this means it didn=92t find the file in one of the mirrors an=
d will keep falling back until it does.

  *   File {path} from {some package} was already stripped, this will preve=
nt future debugging! Is this a consequence of using a prebuilt toolchain? A=
re these compile options that I can change if I need to?
Usually that is what causes this.  Just means that there were no symbols th=
at could be split into a dbg package

  *   For recipe {some recipe name}, the following files/directories were i=
nstalled but not shipped in any package: followed by a list of files. I ass=
ume this is harmless, but it adds to the build time. Is that correct?
Depends if you want that file.  I means that the do_install step put someth=
ing into the ${D} directory but that the FILES variable for the packages do=
esn=92t include it so it doesn=92t get packaged.  Shouldn=92t increase buil=
d time really, but is a hint to you in case there was a file there that you=
 =93need=94

  *   QA Issue: No GNU_HASH in the elf binary: {some path} What does this m=
ean? Is the code compliant with the appropriate license?
I think this means that the code was build without the GNU_HASH flag.  Mayb=
e an inclusion of a pre-built binary.

  *   QA Issue: non -staticdev package contains static .a library What does=
 this mean?
It means that there is a .a file in a =96dev package which expects .so file=
s be default is my understanding.  Not the end of the world.

  *   QA Issue: {some package: some path} links to something under exec_pre=
fix followed by QA Issue: ldd reports: followed by a number of symbolic lin=
ks. What does this mean?
Note sure without the message.

  *   TI installer requires 32bit glibc libraries for proper operation. Wha=
t does this mean? Is my build machine Linux environment not set up properly=
?
Where did this come from?  If you are running on a 64bit system you usually=
 need ia32-libs package installed for 32bit compatibility.

  *   {package name} No generic license file exists for: {License Name} in =
any provider. Is this a consequence of some automatic license detection sof=
tware failing, or something more serious (we don't know how this code is li=
censed)?
What recipe.  You need to have the license file declared in the recipe as w=
ell as the checksum.  This is to ensure the proper licensing of the package=
.

  *   QA Issue: {name}: Found a reference to /usr/ {some path} followed by =
WARNING: QA Issue: Shell scripts in base_bindir and base_sbindir should not=
 reference anything in exec_prefix What does this mean?
Not 100% here without looking at the script.  I=92m guessing that they don=
=92t want the script to use a hard coded /usr/bin, etc value but I could be=
 wrong here.

  *   QA Issue: package {name} contains bad RPATH {path} in file {path 2} W=
hat does this mean?
Not 100% on this.  Usually means that it may be trying to look in the wrong=
 place for a file.  What package throws this?
Are these all benign issues? Do any warrant me posting my cooker.log.x file=
? If so, what are the rules for doing that on this list?

Log files per error would be easiest.

--Paul

--_000_7D46E86EC0A8354091174257B2FED101593475C5DLEE12entticom_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
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
span.EmailStyle17
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1505433229;
	mso-list-template-ids:-1463493674;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
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
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> meta-ara=
go-bounces@arago-project.org [mailto:meta-arago-bounces@arago-project.org]
<b>On Behalf Of </b>Paul Kovitz<br>
<b>Sent:</b> Friday, January 04, 2013 6:19 PM<br>
<b>To:</b> meta-arago@arago-project.org<br>
<b>Subject:</b> [meta-arago] 805 warning messages when I build 05.06.00.00?=
<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Greetings. I am new to this list and relatively new =
to oe, so if this kind of post does not belong here, please tell me.<o:p></=
o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I did a build today of the 05.06.00.00 release using=
 this toolchain:<o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><a href=3D"http://software-dl.ti.com/sdoemb/sdoemb_p=
ublic_sw/arago_toolchain/2011_09/exports/arago-2011.09-armv7a-linux-gnueabi=
-sdk.tar.bz2">http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolc=
hain/2011_09/exports/arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2</a><o:p=
></o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">There seem to be several classes of warnings. I have=
 questions about all of them. Sorry if these were covered under a previous =
thread. I only went back in the archives a few months and didn't see it.&nb=
sp;<o:p></o:p></p>
</div>
<div>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto;mso-list:l0 level1 lfo1">
Failed to fetch from some URL. I assume source was successfully gotten from=
 a mirror, so I can ignore this. True?<o:p></o:p></li></ul>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">Yes.&nbsp; Usually this means it didn=
=92t find the file in one of the mirrors and will keep falling back
 until it does.<o:p></o:p></span></p>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto;mso-list:l0 level1 lfo1">
File {path}&nbsp;from {some package} was already stripped, this will preven=
t future debugging! Is this a consequence of using a prebuilt toolchain? Ar=
e these compile options that I can change if I need to?<o:p></o:p></li></ul=
>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">Usually that is what causes this.&nbsp;=
 Just means that there were no symbols that could be split into
 a dbg package<o:p></o:p></span></p>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto;mso-list:l0 level1 lfo1">
For recipe {some recipe name}, the following files/directories were install=
ed but not shipped in any package: followed by a list of files. I assume th=
is is harmless, but it adds to the build time. Is that correct?<o:p></o:p><=
/li></ul>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">Depends if you want that file.&nbsp; I =
means that the do_install step put something into the ${D} directory
 but that the FILES variable for the packages doesn=92t include it so it do=
esn=92t get packaged.&nbsp; Shouldn=92t increase build time really, but is =
a hint to you in case there was a file there that you =93need=94<o:p></o:p>=
</span></p>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto;mso-list:l0 level1 lfo1">
QA Issue: No GNU_HASH in the elf binary: {some path} What does this mean? I=
s the code compliant with the appropriate license?<o:p></o:p></li></ul>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">I think this means that the code was bu=
ild without the GNU_HASH flag.&nbsp; Maybe an inclusion of a pre-built
 binary.<o:p></o:p></span></p>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto;mso-list:l0 level1 lfo1">
QA Issue: non -staticdev package contains static .a library What does this =
mean?<o:p></o:p></li></ul>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">It means that there is a .a file in a =
=96dev package which expects .so files be default is my understanding.&nbsp=
;
 Not the end of the world.<o:p></o:p></span></p>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto;mso-list:l0 level1 lfo1">
QA Issue: {some package: some path} links to something under exec_prefix fo=
llowed by&nbsp;QA Issue: ldd reports: followed by a number of symbolic link=
s. What does this mean?<o:p></o:p></li></ul>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">Note sure without the message.<o:p></o:=
p></span></p>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto;mso-list:l0 level1 lfo1">
TI installer requires 32bit glibc libraries for proper operation. What does=
 this mean? Is my build machine Linux environment not set up properly?&nbsp=
;<o:p></o:p></li></ul>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">Where did this come from?&nbsp; If you =
are running on a 64bit system you usually need ia32-libs package
 installed for 32bit compatibility.<o:p></o:p></span></p>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto;mso-list:l0 level1 lfo1">
{package name} No generic license file exists for: {License Name} in any pr=
ovider. Is this a consequence of some automatic license detection software =
failing, or something more serious (we don't know how this code is licensed=
)?<o:p></o:p></li></ul>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">What recipe.&nbsp; You need to have the=
 license file declared in the recipe as well as the checksum.&nbsp;
 This is to ensure the proper licensing of the package.<o:p></o:p></span></=
p>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto;mso-list:l0 level1 lfo1">
QA Issue: {name}: Found a reference to /usr/ {some path} followed by&nbsp;W=
ARNING: QA Issue: Shell scripts in base_bindir and base_sbindir should not =
reference anything in exec_prefix What does this mean?<o:p></o:p></li></ul>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">Not 100% here without looking at the sc=
ript.&nbsp; I=92m guessing that they don=92t want the script to use
 a hard coded /usr/bin, etc value but I could be wrong here.<o:p></o:p></sp=
an></p>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto;mso-list:l0 level1 lfo1">
QA Issue: package {name} contains bad RPATH {path} in file {path 2} What do=
es this mean?<o:p></o:p></li></ul>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">Not 100% on this.&nbsp; Usually means t=
hat it may be trying to look in the wrong place for a file.&nbsp; What
 package throws this?<o:p></o:p></span></p>
<div>
<div>
<p class=3D"MsoNormal">Are these all benign issues? Do any warrant me posti=
ng my cooker.log.x file? If so, what are the rules for doing that on this l=
ist?&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Log files per error would=
 be easiest.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">--Paul<o:p></o:p></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_7D46E86EC0A8354091174257B2FED101593475C5DLEE12entticom_--
