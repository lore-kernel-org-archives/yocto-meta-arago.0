Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 91AE952972
	for <meta-arago@arago-project.org>;
	Mon,  6 Jan 2014 14:21:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s06ELUhV016438;
	Mon, 6 Jan 2014 08:21:30 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s06ELUNb014792;
	Mon, 6 Jan 2014 08:21:30 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 6 Jan 2014 08:21:30 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Brad Litterell <brad@evidence.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: BB_NO_NETWORK failure with arago
Thread-Index: Ac7/hY1ku6Vs4nlyQcSO6dfw2y/QAALZOiRw
Date: Mon, 6 Jan 2014 14:21:29 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101598D17E7@DLEE11.ent.ti.com>
References: <E51394554A503C4E852F9BEE46B03E8D019AE6C5@TI-THOR.tasernet.com>
In-Reply-To: <E51394554A503C4E852F9BEE46B03E8D019AE6C5@TI-THOR.tasernet.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: BB_NO_NETWORK failure with arago
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
X-List-Received-Date: Mon, 06 Jan 2014 14:21:31 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7D46E86EC0A8354091174257B2FED101598D17E7DLEE11entticom_"

--_000_7D46E86EC0A8354091174257B2FED101598D17E7DLEE11entticom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Brad,

I think your issue is that the bbappend in meta-arago/meta-arago-distro/rec=
ipes-devtools/ltp-ddt is using SRCREV as AUTOREV which will ping the networ=
k for the latest commit.  You can change that SRCREV instead to the commit =
you want.

Sincerely,
Chase Maupin

From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Brad Litterell
Sent: Sunday, December 22, 2013 8:21 PM
To: meta-arago@arago-project.org
Subject: [meta-arago] BB_NO_NETWORK failure with arago

I am having trouble getting my build environment to work offline.  I follow=
ed the instructions here:
https://wiki.yoctoproject.org/wiki/How_do_I#Q:_How_do_I_create_my_own_sourc=
e_download_mirror_.3F

I've built my project, created the tarballs, etc.  However, it appears ther=
e is still something I'm missing.  When I enable BB_NO_NETWORK, I get an er=
ror here:

$ bitbake base-files
...
Loaded 57 entries from dependency cache.
NOTE: Error during finalise of /home/brad/etm2/sources/meta-arago/meta-arag=
o-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb
ERROR: ExpansionError during parsing /home/brad/etm2/sources/meta-arago/met=
a-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb: Failure expa=
nding variable S: ExpansionError: Failure expanding variable SRCPV, express=
ion was ${@bb.fetch2.get_srcrev(d)}<mailto:$%7b@bb.fetch2.get_srcrev(d)%7d>=
 which triggered exception NetworkAccess: Network access disabled through B=
B_NO_NETWORK but access requested with command git ls-remote git://arago-pr=
oject.org/git/projects/test-automation/ltp-ddt.git master (for url None)
ERROR: Command execution failed: Exited with 1

In this case, the SRC_URI looks like this:

SRCREV =3D "5fba3d42f126ce13333fb7d0412d729b753ee5a4"
BRANCH ?=3D "master"
SRC_URI =3D "git://arago-project.org/git/projects/test-automation/ltp-ddt.g=
it;protocol=3Dgit;branch=3D${BRANCH}"

So, I figured apply  the same fix as mentioned on the Wiki:

SRCREV =3D "5fba3d42f126ce13333fb7d0412d729b753ee5a4"
#BRANCH ?=3D "master"
#SRC_URI =3D "git://arago-project.org/git/projects/test-automation/ltp-ddt.=
git;protocol=3Dgit;branch=3D${BRANCH}"
SRC_URI =3D "git://arago-project.org/git/projects/test-automation/ltp-ddt.g=
it;protocol=3Dgit"

But I get the same error?  And I'm not even using ltp-ddt...

Is there something I'm missing in setting up BB_NO_NETWORK? Is there someth=
ing extra required for the arago project to run with no network?

Thanks,
Brad

--_000_7D46E86EC0A8354091174257B2FED101598D17E7DLEE11entticom_
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
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Brad,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">I think your issue is tha=
t the bbappend in meta-arago/meta-arago-distro/recipes-devtools/ltp-ddt is =
using SRCREV as AUTOREV which will ping the network for
 the latest commit.&nbsp; You can change that SRCREV instead to the commit =
you want.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Sincerely,<br>
Chase Maupin<br>
<br>
</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quo=
t;sans-serif&quot;;color:#1F497D"><o:p></o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> meta-ara=
go-bounces@arago-project.org [mailto:meta-arago-bounces@arago-project.org]
<b>On Behalf Of </b>Brad Litterell<br>
<b>Sent:</b> Sunday, December 22, 2013 8:21 PM<br>
<b>To:</b> meta-arago@arago-project.org<br>
<b>Subject:</b> [meta-arago] BB_NO_NETWORK failure with arago<o:p></o:p></s=
pan></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black">I am having trouble getting =
my build environment to work offline. &nbsp;I followed the instructions her=
e:<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black"><a href=3D"https://wiki.yoct=
oproject.org/wiki/How_do_I#Q:_How_do_I_create_my_own_source_download_mirror=
_.3F" target=3D"_blank">https://wiki.yoctoproject.org/wiki/How_do_I#Q:_How_=
do_I_create_my_own_source_download_mirror_.3F</a><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black">I've built my project, creat=
ed the tarballs, etc. &nbsp;However, it appears there is still something I'=
m missing. &nbsp;When I enable BB_NO_NETWORK, I get an error here:<o:p></o:=
p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black">$ bitbake base-files<o:p></o=
:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black">...<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black">Loaded 57 entries from depen=
dency cache.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black">NOTE: Error during finalise =
of /home/brad/etm2/sources/meta-arago/meta-arago-extras/recipes-devtools/lt=
p-ddt/ltp-ddt-legacy_1.0.bb<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black">ERROR: ExpansionError during=
 parsing /home/brad/etm2/sources/meta-arago/meta-arago-extras/recipes-devto=
ols/ltp-ddt/ltp-ddt-legacy_1.0.bb: Failure expanding variable
 S: ExpansionError: Failure expanding variable SRCPV, expression was <a hre=
f=3D"mailto:$%7b@bb.fetch2.get_srcrev(d)%7d">
${@bb.fetch2.get_srcrev(d)}</a> which triggered exception NetworkAccess: Ne=
twork access disabled through BB_NO_NETWORK but access requested with comma=
nd git ls-remote git://arago-project.org/git/projects/test-automation/ltp-d=
dt.git master (for url None)<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black">ERROR: Command execution fai=
led: Exited with 1<o:p></o:p></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black">In this case, the SRC_URI lo=
oks like this:<o:p></o:p></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black">SRCREV =3D &quot;5fba3d42f12=
6ce13333fb7d0412d729b753ee5a4&quot;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black">BRANCH ?=3D &quot;master&quo=
t;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black">SRC_URI =3D &quot;git://arag=
o-project.org/git/projects/test-automation/ltp-ddt.git;protocol=3Dgit;branc=
h=3D${BRANCH}&quot;<o:p></o:p></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black">So, I figured apply &nbsp;th=
e same fix as mentioned on the Wiki:<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black">SRCREV =3D &quot;5fba3d42f12=
6ce13333fb7d0412d729b753ee5a4&quot;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black">#BRANCH ?=3D &quot;master&qu=
ot;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black">#SRC_URI =3D &quot;git://ara=
go-project.org/git/projects/test-automation/ltp-ddt.git;protocol=3Dgit;bran=
ch=3D${BRANCH}&quot;<o:p></o:p></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black">SRC_URI =3D &quot;git://arag=
o-project.org/git/projects/test-automation/ltp-ddt.git;protocol=3Dgit&quot;=
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black">But I get the same error? &n=
bsp;And I'm not even using ltp-ddt...<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black">Is there something I'm missi=
ng in setting up BB_NO_NETWORK? Is there something extra required for the a=
rago project to run with no network?<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black">Thanks,<o:p></o:p></span></p=
>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black">Brad<o:p></o:p></span></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_7D46E86EC0A8354091174257B2FED101598D17E7DLEE11entticom_--
