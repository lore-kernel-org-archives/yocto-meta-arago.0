Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1F56A529DD
	for <meta-arago@arago-project.org>;
	Mon, 14 Jan 2013 19:00:31 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r0EJ0To4020220;
	Mon, 14 Jan 2013 13:00:29 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r0EJ0TcV030691;
	Mon, 14 Jan 2013 13:00:29 -0600
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Mon, 14 Jan 2013 13:00:29 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Paul Kovitz <paul.kovitz@welchallyn.com>
Thread-Topic: [meta-arago] 805 warning messages when I build 05.06.00.00?
Thread-Index: AQHN6tpTfSbjSmS4dUyIT4BXQZTrzpg+HJEggAcYroCAA/ZBgA==
Date: Mon, 14 Jan 2013 19:00:28 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015935CB64@DLEE12.ent.ti.com>
References: <CA+edY+R9ONv039-fdmdqB7v+POf_ig=ea5-Zhh0=u1s8DPUecw@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED101593475C5@DLEE12.ent.ti.com>
	<CA+edY+QUZ9p6G=tR_=rGo0KDu6sJzGx-fFE0XX=UdjX9wWCitA@mail.gmail.com>
In-Reply-To: <CA+edY+QUZ9p6G=tR_=rGo0KDu6sJzGx-fFE0XX=UdjX9wWCitA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Mon, 14 Jan 2013 19:00:32 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7D46E86EC0A8354091174257B2FED1015935CB64DLEE12entticom_"

--_000_7D46E86EC0A8354091174257B2FED1015935CB64DLEE12entticom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


From: Paul Kovitz [mailto:paul.kovitz@welchallyn.com]
Sent: Friday, January 11, 2013 5:27 PM
To: Maupin, Chase
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] 805 warning messages when I build 05.06.00.00?

Hi Chase.

Took me a while to get back to this.

I am attaching a tarball with all the separate warning files for the other =
issues. I created the file manually so I could analyze it better. There are=
 46 separate log files if I ignore the failed to fetch warnings.

do_populate_lic failed to find the CC-BY-SA license for 14 files in ./all-o=
e-linux/matrix-gui-* and for ./all-oe-linux-gnueabi/matrix-gui-generic-pm-2=
.0-r10.0 and for ./armv7a-vfp-neon-oe-linux-gnueabi/matrix-gui-3d-demos-2.0=
-r10.1

do_populate_lic failed to find the TI-TSPA license  ./all-oe-linux-gnueabi/=
wl12xx-firmware-git-r1-gitrol_R5.SP3.05 ./am335x_evm-oe-linux-gnueabi/bt-fi=
rmware-git-r0+gitrdb43d1f05efda9777d7ac1ac366637e29e21f77f

do_populate_lic failed to find the TI-BSP license armv7a-vfp-neon-oe-linux-=
gnueabi/am33x-cm3-05.06.00.00-r0-arago0
do_populate_lic failed to find the TSPA license armv7a-vfp-neon-oe-linux-gn=
ueabi/libgles-omap3-4.08.00.01-r35

[CEM] I would need to look at this further but this is just a warning that =
the generic license file like CC-BY-SA was not found to be copied into the =
deploy/licenses directories.

The other packages with license issues are debianutiils, iozone3, iperf, li=
bc-client, nbench, orc and php.

Th ia32-libs warning appears twice for me, but it is not clear to me what p=
ackage caused the warnings because I running 8 threads on 8 cores. Is is do=
_configure? Here are small snips from the cooker log

[CEM] Many times if you are unsure reduce your BB threads to 1.

NOTE: package libpcre-8.21-r1: task do_configure: Started
WARNING: TI installer requires 32bit glibc libraries for proper operation
run 'yum install glibc.i686' on Fedora or 'apt-get install ia32-libs' on Ub=
untu/Debian

NOTE: Running task 975 of 3742 (ID: 2421, /home/bone/oe/oe-layersetup/sourc=
es/oe-core/meta/recipes-support/lzo/lzo_2.06.bb<http://lzo_2.06.bb>, do_con=
figure)
WARNING: TI installer requires 32bit glibc libraries for proper operation
run 'yum install glibc.i686' on Fedora or 'apt-get install ia32-libs' on Ub=
untu/Debian
NOTE: package lzo-2.06-r1: task do_configure: Started

It appears that far as ubunutu is concerned, ia32-libs package is not avail=
able

$ sudo apt-get install ia32-libs
Reading package lists... Done
Building dependency tree
Reading state information... Done
Package ia32-libs is not available, but is referred to by another package.
This may mean that the package is missing, has been obsoleted, or
is only available from another source

E: Package 'ia32-libs' has no installation candidate

I don't have experience handling this sort of issue. It looks like I can in=
stall ia32-libs-multiarch. Should that do it?

[CEM] I think that should be OK

I wonder about some of the other errors, especially the ones about no GNU_H=
ASH. I sourced the toolchain arago-2011.09/armv7a/evironment-setup script b=
efore I ran bitbake. Should I have just put the toolchain in my path? I won=
der if some of the other environment variables are used differently by the =
bitbake recipes.

I usually just add the TC to my PATH, I don=92t source environment setup.


Thanks for your help

--Paul Kovitz


On Mon, Jan 7, 2013 at 9:12 AM, Maupin, Chase <chase.maupin@ti.com<mailto:c=
hase.maupin@ti.com>> wrote:

From: meta-arago-bounces@arago-project.org<mailto:meta-arago-bounces@arago-=
project.org> [mailto:meta-arago-bounces@arago-project.org<mailto:meta-arago=
-bounces@arago-project.org>] On Behalf Of Paul Kovitz
Sent: Friday, January 04, 2013 6:19 PM
To: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
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



--
Paul Kovitz
Lead Embedded Software Engineer
Welch Allyn
8500 SW Creekside Place
Beaverton, OR 97008
503-530-7304<tel:503-530-7304> (voice)

--_000_7D46E86EC0A8354091174257B2FED1015935CB64DLEE12entticom_
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
	{mso-list-id:111630391;
	mso-list-template-ids:-610119368;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1
	{mso-list-id:235945730;
	mso-list-template-ids:20613172;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l2
	{mso-list-id:380058341;
	mso-list-template-ids:787241826;}
@list l2:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l3
	{mso-list-id:400056906;
	mso-list-template-ids:-563176324;}
@list l3:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l4
	{mso-list-id:538860654;
	mso-list-template-ids:1181645428;}
@list l4:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l5
	{mso-list-id:678653454;
	mso-list-template-ids:-1674943908;}
@list l5:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l6
	{mso-list-id:1285117464;
	mso-list-template-ids:564299386;}
@list l6:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l7
	{mso-list-id:1336957086;
	mso-list-template-ids:-874071444;}
@list l7:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l8
	{mso-list-id:1337726790;
	mso-list-template-ids:1013117100;}
@list l8:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l9
	{mso-list-id:2018581918;
	mso-list-template-ids:-350465950;}
@list l9:level1
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
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Paul Kov=
itz [mailto:paul.kovitz@welchallyn.com]
<br>
<b>Sent:</b> Friday, January 11, 2013 5:27 PM<br>
<b>To:</b> Maupin, Chase<br>
<b>Cc:</b> meta-arago@arago-project.org<br>
<b>Subject:</b> Re: [meta-arago] 805 warning messages when I build 05.06.00=
.00?<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">Hi Chase.&nbsp;<o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Took me a while to get back to this.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I am attaching a tarball with all the separate warni=
ng files for the other issues. I created the file manually so I could analy=
ze it better. There are 46 separate log files if I ignore the failed to fet=
ch warnings.&nbsp;<o:p></o:p></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">do_populate_lic failed to find the CC-BY-SA license =
for 14 files in ./all-oe-linux/matrix-gui-* and for ./all-oe-linux-gnueabi/=
matrix-gui-generic-pm-2.0-r10.0 and for ./armv7a-vfp-neon-oe-linux-gnueabi/=
matrix-gui-3d-demos-2.0-r10.1<o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">do_populate_lic failed to find the TI-TSPA&nbsp;lice=
nse &nbsp;./all-oe-linux-gnueabi/wl12xx-firmware-git-r1-gitrol_R5.SP3.05 ./=
am335x_evm-oe-linux-gnueabi/bt-firmware-git-r0&#43;gitrdb43d1f05efda9777d7a=
c1ac366637e29e21f77f<o:p></o:p></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">do_populate_lic failed to&nbsp;find the TI-BSP licen=
se&nbsp;armv7a-vfp-neon-oe-linux-gnueabi/am33x-cm3-05.06.00.00-r0-arago0&nb=
sp;<o:p></o:p></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">do_populate_lic failed to&nbsp;find the TSPA license=
&nbsp;armv7a-vfp-neon-oe-linux-gnueabi/libgles-omap3-4.08.00.01-r35<o:p></o=
:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">[CEM] I would need to loo=
k at this further but this is just a warning that the generic license file =
like CC-BY-SA was not found to be copied into the deploy/licenses
 directories.<o:p></o:p></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">The other packages with license issues are debianuti=
ils, iozone3, iperf, libc-client, nbench, orc and php.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Th ia32-libs warning appears twice for me, but it is=
 not clear to me what package caused the warnings because I running 8 threa=
ds on 8 cores. Is is do_configure? Here are small snips from the cooker log=
<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">[CEM] Many times if you a=
re unsure reduce your BB threads to 1.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
NOTE: package libpcre-8.21-r1: task do_configure: Started</span><o:p></o:p>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
WARNING: TI installer requires 32bit glibc libraries for proper operation</=
span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
run 'yum install glibc.i686' on Fedora or 'apt-get install ia32-libs' on Ub=
untu/Debian</span><o:p></o:p></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
NOTE: Running task 975 of 3742 (ID: 2421, /home/bone/oe/oe-layersetup/sourc=
es/oe-core/meta/recipes-support/lzo/<a href=3D"http://lzo_2.06.bb" target=
=3D"_blank">lzo_2.06.bb</a>, do_configure)</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
WARNING: TI installer requires 32bit glibc libraries for proper operation</=
span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
run 'yum install glibc.i686' on Fedora or 'apt-get install ia32-libs' on Ub=
untu/Debian</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
NOTE: package lzo-2.06-r1: task do_configure: Started</span><o:p></o:p></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">It appears that far as ubunutu is concerned, ia32-li=
bs package is not available<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
$ sudo apt-get install ia32-libs</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Reading package lists... Done</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Building dependency tree &nbsp; &nbsp; &nbsp;&nbsp;</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Reading state information... Done</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Package ia32-libs is not available, but is referred to by another package.<=
/span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
This may mean that the package is missing, has been obsoleted, or</span><o:=
p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
is only available from another source</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
E: Package 'ia32-libs' has no installation candidate</span><o:p></o:p></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I don't have experience handling this sort of issue.=
 It looks like I can install ia32-libs-multiarch. Should that do it?&nbsp;<=
o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">[CEM] I think that should=
 be OK<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I wonder about some of the other errors, especially =
the ones about no GNU_HASH. I sourced the toolchain&nbsp;arago-2011.09/armv=
7a/evironment-setup script before I ran bitbake. Should I have just put the=
 toolchain in my path? I wonder if some
 of the other environment variables are used differently by the bitbake rec=
ipes.<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">I usually just add the TC=
 to my PATH, I don=92t source environment setup.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks for your help<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">--Paul Kovitz<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">On Mon, Jan 7, 2013 at 9:12 AM, Maupin, Chase &lt;<a=
 href=3D"mailto:chase.maupin@ti.com" target=3D"_blank">chase.maupin@ti.com<=
/a>&gt; wrote:<o:p></o:p></p>
<div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">&nbsp;</span><o:p></o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><b><span style=3D"font-size:10.0pt;font-family:&quot;Tahoma&quot;,=
&quot;sans-serif&quot;">From:</span></b><span style=3D"font-size:10.0pt;fon=
t-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;">
<a href=3D"mailto:meta-arago-bounces@arago-project.org" target=3D"_blank">m=
eta-arago-bounces@arago-project.org</a> [mailto:<a href=3D"mailto:meta-arag=
o-bounces@arago-project.org" target=3D"_blank">meta-arago-bounces@arago-pro=
ject.org</a>]
<b>On Behalf Of </b>Paul Kovitz<br>
<b>Sent:</b> Friday, January 04, 2013 6:19 PM<br>
<b>To:</b> <a href=3D"mailto:meta-arago@arago-project.org" target=3D"_blank=
">meta-arago@arago-project.org</a><br>
<b>Subject:</b> [meta-arago] 805 warning messages when I build 05.06.00.00?=
</span><o:p></o:p></p>
</div>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Greetings. I am new to this list and relatively new to oe, so if t=
his kind of post does not belong here, please tell me.<o:p></o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">I did a build today of the 05.06.00.00 release using this toolchai=
n:<o:p></o:p></p>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><a href=3D"http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago=
_toolchain/2011_09/exports/arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2" =
target=3D"_blank">http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_t=
oolchain/2011_09/exports/arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2</a>=
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">There seem to be several classes of warnings. I have questions abo=
ut all of them. Sorry if these were covered under a previous thread. I only=
 went back in the archives a few months
 and didn't see it.&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto;mso-list:l5 level1 lfo1">
Failed to fetch from some URL. I assume source was successfully gotten from=
 a mirror, so I can ignore this. True?<o:p></o:p></li></ul>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">Yes.&nbsp; Usually this means it didn=
=92t find the file in one of the mirrors and will keep falling back
 until it does.</span><o:p></o:p></p>
<div>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto;mso-list:l2 level1 lfo2">
File {path}&nbsp;from {some package} was already stripped, this will preven=
t future debugging! Is this a consequence of using a prebuilt toolchain? Ar=
e these compile options that I can change if I need to?<o:p></o:p></li></ul=
>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">Usually that is what causes this.&nbsp;=
 Just means that there were no symbols that could be split into
 a dbg package</span><o:p></o:p></p>
<div>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto;mso-list:l6 level1 lfo3">
For recipe {some recipe name}, the following files/directories were install=
ed but not shipped in any package: followed by a list of files. I assume th=
is is harmless, but it adds to the build time. Is that correct?<o:p></o:p><=
/li></ul>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">Depends if you want that file.&nbsp; I =
means that the do_install step put something into the ${D} directory
 but that the FILES variable for the packages doesn=92t include it so it do=
esn=92t get packaged.&nbsp; Shouldn=92t increase build time really, but is =
a hint to you in case there was a file there that you =93need=94</span><o:p=
></o:p></p>
<div>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto;mso-list:l1 level1 lfo4">
QA Issue: No GNU_HASH in the elf binary: {some path} What does this mean? I=
s the code compliant with the appropriate license?<o:p></o:p></li></ul>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">I think this means that the code was bu=
ild without the GNU_HASH flag.&nbsp; Maybe an inclusion of a pre-built
 binary.</span><o:p></o:p></p>
<div>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto;mso-list:l7 level1 lfo5">
QA Issue: non -staticdev package contains static .a library What does this =
mean?<o:p></o:p></li></ul>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">It means that there is a .a file in a =
=96dev package which expects .so files be default is my understanding.&nbsp=
;
 Not the end of the world.</span><o:p></o:p></p>
<div>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto;mso-list:l8 level1 lfo6">
QA Issue: {some package: some path} links to something under exec_prefix fo=
llowed by&nbsp;QA Issue: ldd reports: followed by a number of symbolic link=
s. What does this mean?<o:p></o:p></li></ul>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">Note sure without the message.</span><o=
:p></o:p></p>
<div>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto;mso-list:l3 level1 lfo7">
TI installer requires 32bit glibc libraries for proper operation. What does=
 this mean? Is my build machine Linux environment not set up properly?&nbsp=
;<o:p></o:p></li></ul>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">Where did this come from?&nbsp; If you =
are running on a 64bit system you usually need ia32-libs package
 installed for 32bit compatibility.</span><o:p></o:p></p>
<div>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto;mso-list:l9 level1 lfo8">
{package name} No generic license file exists for: {License Name} in any pr=
ovider. Is this a consequence of some automatic license detection software =
failing, or something more serious (we don't know how this code is licensed=
)?<o:p></o:p></li></ul>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">What recipe.&nbsp; You need to have the=
 license file declared in the recipe as well as the checksum.&nbsp;
 This is to ensure the proper licensing of the package.</span><o:p></o:p></=
p>
<div>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto;mso-list:l4 level1 lfo9">
QA Issue: {name}: Found a reference to /usr/ {some path} followed by&nbsp;W=
ARNING: QA Issue: Shell scripts in base_bindir and base_sbindir should not =
reference anything in exec_prefix What does this mean?<o:p></o:p></li></ul>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">Not 100% here without looking at the sc=
ript.&nbsp; I=92m guessing that they don=92t want the script to use
 a hard coded /usr/bin, etc value but I could be wrong here.</span><o:p></o=
:p></p>
<div>
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto;mso-list:l0 level1 lfo10">
QA Issue: package {name} contains bad RPATH {path} in file {path 2} What do=
es this mean?<o:p></o:p></li></ul>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">Not 100% on this.&nbsp; Usually means t=
hat it may be trying to look in the wrong place for a file.&nbsp; What
 package throws this?</span><o:p></o:p></p>
<div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Are these all benign issues? Do any warrant me posting my cooker.l=
og.x file? If so, what are the rules for doing that on this list?&nbsp;<o:p=
></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">&nbsp;</span><o:p></o:p></p>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1F497D">Log files per error would be easiest.</=
span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">--Paul<o:p></o:p></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<p class=3D"MsoNormal"><br>
<br clear=3D"all">
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<p class=3D"MsoNormal">-- <br>
Paul Kovitz<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">Lead Embedded Software Engineer<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">Welch Allyn<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">8500 SW Creekside Place<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Beaverton, OR 97008<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><a href=3D"tel:503-530-7304" target=3D"_blank">503-5=
30-7304</a> (voice)<o:p></o:p></p>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_7D46E86EC0A8354091174257B2FED1015935CB64DLEE12entticom_--
