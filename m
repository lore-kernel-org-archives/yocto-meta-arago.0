Return-Path: <vchengalvala@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id EEA6A529AF
	for <meta-arago@arago-project.org>;
	Tue, 24 Mar 2015 00:09:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2O09ihj018445
	for <meta-arago@arago-project.org>; Mon, 23 Mar 2015 19:09:44 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2O09hbL026306
	for <meta-arago@arago-project.org>; Mon, 23 Mar 2015 19:09:43 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Mon, 23 Mar 2015 19:09:43 -0500
From: "Chengalvala, Vivek" <vchengalvala@ti.com>
To: "Balagopalakrishnan, Anand" <anandb@ti.com>, "Cooper Jr., Franklin"
	<fcooper@ti.com>, "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on
	libdrm and libdce due to KMSsink
Thread-Index: AQHQYovfRtJY28FBuUSUEYaPgD6O+50kuQUAgAB51GCAACdNUIAABcLMgABWUAD//7CP34AAEp4AgASpHsCAAAaUqIAAlvdg
Date: Tue, 24 Mar 2015 00:09:42 +0000
Deferred-Delivery: Tue, 24 Mar 2015 00:09:00 +0000
Message-ID: <FCB36D0BED1F0D4EA8E6242507E4245B0C8980EB@DFLE08.ent.ti.com>
References: <1426800578-7496-1-git-send-email-denis@denix.org>
	<20150319223632.GH11557@edge>
	,<4B26FB5A64EBA14C87266869E037F958141102CB@DFLE09.ent.ti.com>
	<2E478A96-8197-4C5A-90C1-8A4ABA78F000@ti.com>,
	<4B26FB5A64EBA14C87266869E037F9581411031E@DFLE09.ent.ti.com>
	<3DCCA74A-3656-4D5E-A5F1-F0A0EBC3C43C@ti.com>
	<FCB36D0BED1F0D4EA8E6242507E4245B0C8940CA@DFLE08.ent.ti.com>,
	<FCB36D0BED1F0D4EA8E6242507E4245B0C896F81@DFLE08.ent.ti.com>
	<05CF4794C98B244ABDC620C10903762272FB537E@DBDE04.ent.ti.com>
In-Reply-To: <05CF4794C98B244ABDC620C10903762272FB537E@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on libdrm and libdce due to KMSsink
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
X-List-Received-Date: Tue, 24 Mar 2015 00:09:55 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_FCB36D0BED1F0D4EA8E6242507E4245B0C8980EBDFLE08entticom_"

--_000_FCB36D0BED1F0D4EA8E6242507E4245B0C8980EBDFLE08entticom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


#2:
The root-cause is that the videoconvert plugin (converting  I420 -> BGRA) h=
as significantly lower performance in GST 1.2.3. This apparently is fixed i=
n newer version of GST (1.3.1).
Here is a bugzilla report on the problem: https://bugzilla.gnome.org/show_b=
ug.cgi?id=3D721701 and commits showing where the fixes are: http://code.met=
ager.de/source/history/freedesktop/gstreamer/gst/plugins-base/gst/videoconv=
ert/

In summary, decode-display demos aren't real-time/usable on AM3, AM4 with t=
his GST upgrade.  So, for the short-term, I'm thinking that we should stay =
with gst-0.10 for AM3, AM4 and upgrade GST only for AM5. In the mid-longer =
term, we should either back port this fixes to 1.2.3 or have a plan to migr=
ate to a newer version of GST (and the newer version would bring in HEVC pl=
ugins as well).

#1:
If we revert AM3, AM4 to gst-0.10, then we should no longer see the build i=
ssues..

#3, #5:
These issues appear due to incomplete/missing up-streaming of recipes. We w=
ill have a call to sort this out.

#4:
As we were missing kmssink in the filesystem, we were just trying to play t=
o a fakesink (just to make sure accelerated decode works fine) and that was=
 showing problem. This is an issue with GLSDK as well. Only playbin seems t=
o work with GLSDK and not the basic pipeline as described in the problem re=
port below. We can file an OMAPS IR for this and it can be lower priority i=
f issue #3 is resolved..


Vivek


From: Balagopalakrishnan, Anand
Sent: Monday, March 23, 2015 10:50 AM
To: Chengalvala, Vivek; Cooper Jr., Franklin; Stiffler, Jacob
Cc: meta-arago@arago-project.org
Subject: RE: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on =
libdrm and libdce due to KMSsink

Vivek,

GST 1.x is a major upgrade from GST 0.10. There are design changes involved=
 especially from a buffer management perspective.

The list below doesn't give a clear picture. Can you add the issues to a ta=
ble and mark the the owner, debug history and next actions. For example, I =
am assuming issues #3, 5 will be owned by you. Issues #1,2 - not sure who w=
ill look at these.

Can you let me know what is pipeline #4 trying to achieve?

Regards,
Anand
________________________________
From: Chengalvala, Vivek
Sent: Monday, March 23, 2015 7:49 PM
To: Cooper Jr., Franklin; Stiffler, Jacob
Cc: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>; Bala=
gopalakrishnan, Anand
Subject: RE: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on =
libdrm and libdce due to KMSsink
Karthik, Anand,

Any updates on this? We're checking regarding #2 on AM57x using ARM codecs =
and will post our observations..

Thanks,
Vivek


From: meta-arago-bounces@arago-project.org<mailto:meta-arago-bounces@arago-=
project.org> [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Che=
ngalvala, Vivek
Sent: Friday, March 20, 2015 2:17 PM
To: Cooper Jr., Franklin; Stiffler, Jacob
Cc: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>; Bala=
gopalakrishnan, Anand
Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on =
libdrm and libdce due to KMSsink


Karthik, Anand, Denys,



Upgrade to GST 1.0 (using commit b5747ce8caa13e4528e2d3055fa81cc9ca7b48fd o=
n meta-arago) is causing the following problems:

1.       Broken build for AM3. Not sure how AM4 build succeeds.

2.       AM4x: Performance drop with ARM only decode of H264 (not sure if i=
t is due to a) base GST upgrade b) ffmpeg_dec --> avdec_h264 or c) ffmpeg_c=
olor_space --> videoconvert)

3.       AM57x: playbin pipeline internally triggers arm video decoder (e.g=
., avdec_h264) instead of ducati decoder

4.       AM57x: cannot run pipeline with video parse + decode, e.g., "gst-l=
aunch-1.0 filesrc location=3DHistoryOfTI-480p.264 ! h264parse ! ducatih264d=
ec ! fakesink"



All the above issues are not present with gst-0.10.
Please note that Issue #3 is not observed on Vayu with GLSDK EA release 7.0=
.0.4. Issue #4 is also happening on Vayu with GLSDK EA release 7.0.0.4.



In addition to above,

5.       kmssink is missing from AM57x file system.



We wanted to do an SDF today for PROCESSOR-SDK on AM3, AM4 and due to above=
 failures, we are forced to freeze @ commit #5c2f4eea32afda6e68681470be664e=
b5a46fd984, and not pick up any further changes on meta-arago.

There is another release targeted for next week and we'd like to be get bac=
k to the latest of meta-arago as soon as possible. Appreciate your help in =
addressing the above issues.



Thanks,

Vivek





-----Original Message-----
From: meta-arago-bounces@arago-project.org<mailto:meta-arago-bounces@arago-=
project.org> [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Coo=
per Jr., Franklin
Sent: Friday, March 20, 2015 9:58 AM
To: Stiffler, Jacob
Cc: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on =
libdrm and libdce due to KMSsink



Well that's not good.



> On Mar 20, 2015, at 8:42 AM, Stiffler, Jacob <j-stiffler@ti.com<mailto:j-=
stiffler@ti.com>> wrote:

>

> I ran the demo while running "top". It appears that CPU is near 100%. How=
ever, this demo was working fine with gstreamer 0.10.

>

> -----Original Message-----

> From: Cooper Jr., Franklin

> Sent: Friday, March 20, 2015 9:34 AM

> To: Stiffler, Jacob

> Cc: Dmytriyenko, Denys; meta-arago@arago-project.org<mailto:meta-arago@ar=
ago-project.org>

> Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS o=
n libdrm and libdce due to KMSsink

>

>

>

>

>> On Mar 20, 2015, at 8:17 AM, Stiffler, Jacob <j-stiffler@ti.com<mailto:j=
-stiffler@ti.com>> wrote:

>>

>> I tried the matrix h264 decode demo on am437x with gstreamer 1.0.

>>

>> To get it to work, I had to modify runH264Dec.sh to use the new pipeline=
s. The new command is the following:

>>

>>   gst-launch-1.0 -v filesrc location=3D$filename ! h264parse ! avdec_h26=
4 ! videoconvert ! fbdevsink device=3D/dev/fb0

>>

>>

>> Once this was done, I was able to run the demo, but the framerate is ext=
remely slow. Is this the correct command? Or is this behavior expected?

> If slow as in stuttering and choppy then no. If cpu utilization is high t=
hen that is expected.

>>

>> Thanks,

>> Jake

>>

>>

>> -----Original Message-----

>> From: Stiffler, Jacob

>> Sent: Friday, March 20, 2015 6:56 AM

>> To: Dmytriyenko, Denys; meta-arago@arago-project.org<mailto:meta-arago@a=
rago-project.org>

>> Subject: RE: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS =
on libdrm and libdce due to KMSsink

>>

>> It appears I got lucky with a successful am437x-evm build. The package l=
ibdrm was installed and libdce was not.

>>

>> However, I got a build failure for am335x-evm due to the missing libdrm =
dependency:

>>

>> In file included from gstdrmbufferpool.c:42:0:

>> gstdrmbufferpool.h:42:22: fatal error: omap_drm.h: No such file or direc=
tory compilation terminated.

>> make[4]: *** [libgstdrm_1.0_la-gstdrmbufferpool.lo] Error 1

>> make[4]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-CORTEX=
_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux-=
gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3/gst-=
libs/gst/drm'

>> make[3]: *** [all-recursive] Error 1

>> make[3]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-CORTEX=
_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux-=
gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3/gst-=
libs/gst'

>> make[2]: *** [all-recursive] Error 1

>> make[2]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-CORTEX=
_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux-=
gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3/gst-=
libs'

>> make[1]: *** [all-recursive] Error 1

>> make[1]: Leaving directory `/home/gtbldadm/ti/oe-layersetup/build-CORTEX=
_1/arago-tmp-external-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux-=
gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3'

>> make: *** [all] Error 2

>> ERROR: oe_runmake failed

>>

>> - Jake

>>

>> -----Original Message-----

>> From: meta-arago-bounces@arago-project.org<mailto:meta-arago-bounces@ara=
go-project.org> [mailto:meta-arago-bounces@arago-project.org] On Behalf Of =
Dmytriyenko, Denys

>> Sent: Thursday, March 19, 2015 6:37 PM

>> To: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>

>> Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS =
on libdrm and libdce due to KMSsink

>>

>> Karthik,

>>

>> I had a question - I see that KMSsink in plugins-bad checks for drm and =
dce headers. I was trying to set the dependency accordingly, but it would b=
reak non dce platforms. Can you please elaborate on that a bit? Thanks.

>>

>> --

>> Denys

>>

>>

>>> On Thu, Mar 19, 2015 at 05:29:38PM -0400, Denys Dmytriyenko wrote:

>>> From: Denys Dmytriyenko <denys@ti.com<mailto:denys@ti.com>>

>>>

>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com<mailto:denys@ti.com>>

>>> ---

>>> .../gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend                 |=
 4 +++-

>>> 1 file changed, 3 insertions(+), 1 deletion(-)

>>>

>>> diff --git

>>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-

>>> bad_1.2.3.bbappend

>>> b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-

>>> bad_1.2.3.bbappend

>>> index b1cacac..bd141a8 100644

>>> ---

>>> a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-

>>> bad_1.2.3.bbappend

>>> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plug

>>> +++ ins-bad_1.2.3.bbappend

>>> @@ -2,6 +2,8 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"

>>>

>>> PACKAGECONFIG =3D "faad wayland"

>>>

>>> +DEPENDS +=3D "libdrm libdce"

>>> +

>>> SRC_URI_append =3D " \

>>>        file://0001-Added-GstDRMBufferPool-support.patch<file:///\\0001-=
Added-GstDRMBufferPool-support.patch> \

>>>        file://0002-Modified-waylandsink-to-accept-NV12-format.patch<fil=
e:///\\0002-Modified-waylandsink-to-accept-NV12-format.patch>

>>> \ @@ -9,4 +11,4 @@ SRC_URI_append =3D " \

>>>        file://0004-waylandsink-Removed-dependency-on-dri2.patch<file://=
/\\0004-waylandsink-Removed-dependency-on-dri2.patch> \

>>>        file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch<file=
:///\\0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch>"

>>>

>>> -PR_append =3D "-arago0"

>>> +PR_append =3D "-arago1"

>>> --

>>> 2.2.0

>> _______________________________________________

>> meta-arago mailing list

>> meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>

>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

>> _______________________________________________

>> meta-arago mailing list

>> meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>

>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

_______________________________________________

meta-arago mailing list

meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>

http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_FCB36D0BED1F0D4EA8E6242507E4245B0C8980EBDFLE08entticom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
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
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
p
	{mso-style-priority:99;
	margin:0in;
	margin-bottom:.0001pt;
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
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:Consolas;}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
p.msochpdefault, li.msochpdefault, div.msochpdefault
	{mso-style-name:msochpdefault;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Times New Roman","serif";}
span.plaintextchar0
	{mso-style-name:plaintextchar;
	font-family:"Calibri","sans-serif";}
span.balloontextchar0
	{mso-style-name:balloontextchar;
	font-family:"Tahoma","sans-serif";}
span.emailstyle22
	{mso-style-name:emailstyle22;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle27
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">#2:<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">The root-cause is that=
 the videoconvert plugin (converting &nbsp;I420 -&gt; BGRA) has significant=
ly lower performance in GST 1.2.3. This apparently is fixed in newer versio=
n of GST (1.3.1).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Here is a bugzilla rep=
ort on the problem:
<a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D721701">https://bug=
zilla.gnome.org/show_bug.cgi?id=3D721701</a> and commits showing where the =
fixes are:
<a href=3D"http://code.metager.de/source/history/freedesktop/gstreamer/gst/=
plugins-base/gst/videoconvert/">
http://code.metager.de/source/history/freedesktop/gstreamer/gst/plugins-bas=
e/gst/videoconvert/</a>
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">In summary, decode-dis=
play demos aren&#8217;t real-time/usable on AM3, AM4 with this GST upgrade.=
 &nbsp;So, for the short-term, I&#8217;m thinking that we should stay with =
gst-0.10 for AM3, AM4 and upgrade GST only for AM5. In
 the mid-longer term, we should either back port this fixes to 1.2.3 or hav=
e a plan to migrate to a newer version of GST (and the newer version would =
bring in HEVC plugins as well).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">#1:<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">If we revert AM3, AM4 =
to gst-0.10, then we should no longer see the build issues..<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">#3, #5:<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">These issues appear du=
e to incomplete/missing up-streaming of recipes. We will have a call to sor=
t this out.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">#4:<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">As we were missing kms=
sink in the filesystem, we were just trying to play to a fakesink (just to =
make sure accelerated decode works fine) and that was showing problem. This=
 is an issue with GLSDK as well. Only
 playbin seems to work with GLSDK and not the basic pipeline as described i=
n the problem report below. We can file an OMAPS IR for this and it can be =
lower priority if issue #3 is resolved..
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Vivek<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Balagopa=
lakrishnan, Anand
<br>
<b>Sent:</b> Monday, March 23, 2015 10:50 AM<br>
<b>To:</b> Chengalvala, Vivek; Cooper Jr., Franklin; Stiffler, Jacob<br>
<b>Cc:</b> meta-arago@arago-project.org<br>
<b>Subject:</b> RE: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPE=
NDS on libdrm and libdce due to KMSsink<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,&quot;sans-serif&quot;;color:black">Vivek,<br>
<br>
GST 1.x is a major upgrade from GST 0.10. There are design changes involved=
 especially from a buffer management perspective.
<br>
<br>
The list below doesn't give a clear picture. Can you add the issues to a ta=
ble and mark the the owner, debug history and next actions. For example, I =
am assuming issues #3, 5 will be owned by you. Issues #1,2 - not sure who w=
ill look at these.<br>
<br>
Can you let me know what is pipeline #4 trying to achieve?<br>
<br>
Regards,<br>
Anand<o:p></o:p></span></p>
<div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><span=
 style=3D"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;se=
rif&quot;;color:black">
<hr size=3D"2" width=3D"100%" align=3D"center">
</span></div>
<div id=3D"divRpF897192">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:b=
lack">From:</span></b><span style=3D"font-size:10.0pt;font-family:&quot;Tah=
oma&quot;,&quot;sans-serif&quot;;color:black"> Chengalvala, Vivek<br>
<b>Sent:</b> Monday, March 23, 2015 7:49 PM<br>
<b>To:</b> Cooper Jr., Franklin; Stiffler, Jacob<br>
<b>Cc:</b> <a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago=
-project.org</a>; Balagopalakrishnan, Anand<br>
<b>Subject:</b> RE: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPE=
NDS on libdrm and libdce due to KMSsink</span><span style=3D"font-size:12.0=
pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;;color:black"><=
o:p></o:p></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Karthik, Anand,</span>=
<span style=3D"color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;</span><span sty=
le=3D"color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Any updates on this? W=
e&#8217;re checking regarding #2 on AM57x using ARM codecs and will post ou=
r observations..</span><span style=3D"color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;</span><span sty=
le=3D"color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Thanks,</span><span st=
yle=3D"color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Vivek</span><span styl=
e=3D"color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;</span><span sty=
le=3D"color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;</span><span sty=
le=3D"color:black"><o:p></o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;;color:black">From:</span></b><span sty=
le=3D"font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot=
;;color:black">
<a href=3D"mailto:meta-arago-bounces@arago-project.org">meta-arago-bounces@=
arago-project.org</a> [<a href=3D"mailto:meta-arago-bounces@arago-project.o=
rg">mailto:meta-arago-bounces@arago-project.org</a>]
<b>On Behalf Of </b>Chengalvala, Vivek<br>
<b>Sent:</b> Friday, March 20, 2015 2:17 PM<br>
<b>To:</b> Cooper Jr., Franklin; Stiffler, Jacob<br>
<b>Cc:</b> <a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago=
-project.org</a>; Balagopalakrishnan, Anand<br>
<b>Subject:</b> Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPE=
NDS on libdrm and libdce due to KMSsink</span><span style=3D"color:black"><=
o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span style=3D"color:black">Karthik, Anand, Denys=
,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&nbsp;<o:p></o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">Upgrade to GST 1.0 (u=
sing commit
</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;c=
olor:black;background:white">b5747ce8caa13e4528e2d3055fa81cc9ca7b48fd</span=
><span style=3D"color:black"> on meta-arago) is causing the following probl=
ems:<o:p></o:p></span></p>
<p class=3D"MsoPlainText" style=3D"margin-left:.5in;text-indent:-.25in"><sp=
an style=3D"color:black">1.</span><span style=3D"font-size:7.0pt;font-famil=
y:&quot;Times New Roman&quot;,&quot;serif&quot;;color:black">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"color:black">Broken build for AM3. Not sure how AM4 b=
uild succeeds.<o:p></o:p></span></p>
<p class=3D"MsoPlainText" style=3D"margin-left:.5in;text-indent:-.25in"><sp=
an style=3D"color:black">2.</span><span style=3D"font-size:7.0pt;font-famil=
y:&quot;Times New Roman&quot;,&quot;serif&quot;;color:black">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"color:black">AM4x: Performance drop with ARM only dec=
ode of H264 (not sure if it is due to a) base GST upgrade b) ffmpeg_dec
</span><span style=3D"font-family:Wingdings;color:black">=E0</span><span st=
yle=3D"color:black"> avdec_h264 or c) ffmpeg_color_space
</span><span style=3D"font-family:Wingdings;color:black">=E0</span><span st=
yle=3D"color:black"> videoconvert)<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in"><span style=3D"c=
olor:black">3.</span><span style=3D"font-size:7.0pt;font-family:&quot;Times=
 New Roman&quot;,&quot;serif&quot;;color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;
</span><span style=3D"color:black">AM57x: playbin pipeline internally trigg=
ers arm video decoder (e.g., avdec_h264) instead of ducati decoder<o:p></o:=
p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in"><span style=3D"c=
olor:black">4.</span><span style=3D"font-size:7.0pt;font-family:&quot;Times=
 New Roman&quot;,&quot;serif&quot;;color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;
</span><span style=3D"color:black">AM57x: cannot run pipeline with video pa=
rse &#43; decode, e.g., &#8220;gst-launch-1.0 filesrc location=3DHistoryOfT=
I-480p.264 ! h264parse ! ducatih264dec ! fakesink&#8221;
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&nbsp;<o:p></o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">All the above issues =
are not present with gst-0.10.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Please note that Issue #=
3 is not observed on Vayu with GLSDK EA release 7.0.0.4. Issue #4 is also h=
appening on Vayu with GLSDK EA release 7.0.0.4.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&nbsp;<o:p></o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">In addition to above,=
 <o:p></o:p></span></p>
<p class=3D"MsoPlainText" style=3D"margin-left:.5in;text-indent:-.25in"><sp=
an style=3D"color:black">5.</span><span style=3D"font-size:7.0pt;font-famil=
y:&quot;Times New Roman&quot;,&quot;serif&quot;;color:black">&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"color:black">kmssink is missing from AM57x file syste=
m. <o:p>
</o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&nbsp;<o:p></o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">We wanted to do an SD=
F today for PROCESSOR-SDK on AM3, AM4 and due to above failures, we are for=
ced to freeze @ commit #5c2f4eea32afda6e68681470be664eb5a46fd984, and not p=
ick up any further changes on meta-arago.
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">There is another rele=
ase targeted for next week and we&#8217;d like to be get back to the latest=
 of meta-arago as soon as possible. Appreciate your help in addressing the =
above issues.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&nbsp;<o:p></o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">Thanks,<o:p></o:p></s=
pan></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">Vivek<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&nbsp;<o:p></o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&nbsp;<o:p></o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">-----Original Message=
-----<br>
From: <a href=3D"mailto:meta-arago-bounces@arago-project.org" target=3D"_bl=
ank">meta-arago-bounces@arago-project.org</a> [<a href=3D"mailto:meta-arago=
-bounces@arago-project.org" target=3D"_blank">mailto:meta-arago-bounces@ara=
go-project.org</a>] On Behalf Of Cooper
 Jr., Franklin<br>
Sent: Friday, March 20, 2015 9:58 AM<br>
To: Stiffler, Jacob<br>
Cc: <a href=3D"mailto:meta-arago@arago-project.org" target=3D"_blank">meta-=
arago@arago-project.org</a><br>
Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on =
libdrm and libdce due to KMSsink<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&nbsp;<o:p></o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">Well that's not good.=
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&nbsp;<o:p></o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt; On Mar 20, 2015,=
 at 8:42 AM, Stiffler, Jacob &lt;<a href=3D"mailto:j-stiffler@ti.com" targe=
t=3D"_blank"><span style=3D"color:windowtext;text-decoration:none">j-stiffl=
er@ti.com</span></a>&gt; wrote:<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt; <o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt; I ran the demo w=
hile running &quot;top&quot;. It appears that CPU is near 100%. However, th=
is demo was working fine with gstreamer 0.10.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt; <o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt; -----Original Me=
ssage-----<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt; From: Cooper Jr.=
, Franklin <o:p>
</o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt; Sent: Friday, Ma=
rch 20, 2015 9:34 AM<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt; To: Stiffler, Ja=
cob<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt; Cc: Dmytriyenko,=
 Denys; <a href=3D"mailto:meta-arago@arago-project.org" target=3D"_blank">
<span style=3D"color:windowtext;text-decoration:none">meta-arago@arago-proj=
ect.org</span></a><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt; Subject: Re: [me=
ta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on libdrm and libdc=
e due to KMSsink<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt; <o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt; <o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt; <o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt; <o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; On Mar 20, 2=
015, at 8:17 AM, Stiffler, Jacob &lt;<a href=3D"mailto:j-stiffler@ti.com" t=
arget=3D"_blank"><span style=3D"color:windowtext;text-decoration:none">j-st=
iffler@ti.com</span></a>&gt; wrote:<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; <o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; I tried the =
matrix h264 decode demo on am437x with gstreamer 1.0.
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; <o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; To get it to=
 work, I had to modify runH264Dec.sh to use the new pipelines. The new comm=
and is the following:<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; <o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&nbsp;&nbsp; =
gst-launch-1.0 -v filesrc location=3D$filename ! h264parse ! avdec_h264 ! v=
ideoconvert ! fbdevsink device=3D/dev/fb0<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; <o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; <o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; Once this wa=
s done, I was able to run the demo, but the framerate is extremely slow. Is=
 this the correct command? Or is this behavior expected?<o:p></o:p></span><=
/p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt; If slow as in st=
uttering and choppy then no. If cpu utilization is high then that is expect=
ed.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; <o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; Thanks,<o:p>=
</o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; Jake <o:p></=
o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; <o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; <o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; -----Origina=
l Message-----<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; From: Stiffl=
er, Jacob <o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; Sent: Friday=
, March 20, 2015 6:56 AM<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; To: Dmytriye=
nko, Denys; <a href=3D"mailto:meta-arago@arago-project.org" target=3D"_blan=
k">
<span style=3D"color:windowtext;text-decoration:none">meta-arago@arago-proj=
ect.org</span></a><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; Subject: RE:=
 [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on libdrm and l=
ibdce due to KMSsink<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; <o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; It appears I=
 got lucky with a successful am437x-evm build. The package libdrm was insta=
lled and libdce was not.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; <o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; However, I g=
ot a build failure for am335x-evm due to the missing libdrm dependency:<o:p=
></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; <o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; In file incl=
uded from gstdrmbufferpool.c:42:0:<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; gstdrmbuffer=
pool.h:42:22: fatal error: omap_drm.h: No such file or directory compilatio=
n terminated.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; make[4]: ***=
 [libgstdrm_1.0_la-gstdrmbufferpool.lo] Error 1<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; make[4]: Lea=
ving directory `/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-ex=
ternal-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux-gnueabi/gstream=
er1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3/gst-libs/gst/drm'<o=
:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; make[3]: ***=
 [all-recursive] Error 1<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; make[3]: Lea=
ving directory `/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-ex=
ternal-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux-gnueabi/gstream=
er1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3/gst-libs/gst'<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; make[2]: ***=
 [all-recursive] Error 1<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; make[2]: Lea=
ving directory `/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-ex=
ternal-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux-gnueabi/gstream=
er1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3/gst-libs'<o:p></o:p=
></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; make[1]: ***=
 [all-recursive] Error 1<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; make[1]: Lea=
ving directory `/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-ex=
ternal-linaro-toolchain/work/cortexa8t2hf-vfp-neon-oe-linux-gnueabi/gstream=
er1.0-plugins-bad/1.2.3-r0-arago0/gst-plugins-bad-1.2.3'<o:p></o:p></span><=
/p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; make: *** [a=
ll] Error 2<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; ERROR: oe_ru=
nmake failed<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; <o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; - Jake<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; <o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; -----Origina=
l Message-----<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; From: <a hre=
f=3D"mailto:meta-arago-bounces@arago-project.org" target=3D"_blank">
<span style=3D"color:windowtext;text-decoration:none">meta-arago-bounces@ar=
ago-project.org</span></a> [<a href=3D"mailto:meta-arago-bounces@arago-proj=
ect.org" target=3D"_blank"><span style=3D"color:windowtext;text-decoration:=
none">mailto:meta-arago-bounces@arago-project.org</span></a>]
 On Behalf Of Dmytriyenko, Denys<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; Sent: Thursd=
ay, March 19, 2015 6:37 PM<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; To: <a href=
=3D"mailto:meta-arago@arago-project.org" target=3D"_blank">
<span style=3D"color:windowtext;text-decoration:none">meta-arago@arago-proj=
ect.org</span></a><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; Subject: Re:=
 [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on libdrm and l=
ibdce due to KMSsink<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; <o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; Karthik,<o:p=
></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; <o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; I had a ques=
tion - I see that KMSsink in plugins-bad checks for drm and dce headers. I =
was trying to set the dependency accordingly, but it would break non dce pl=
atforms. Can you please elaborate on that
 a bit? Thanks.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; <o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; --<o:p></o:p=
></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; Denys<o:p></=
o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; <o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; <o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; On Thu, =
Mar 19, 2015 at 05:29:38PM -0400, Denys Dmytriyenko wrote:<o:p></o:p></span=
></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; From: De=
nys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank"><span=
 style=3D"color:windowtext;text-decoration:none">denys@ti.com</span></a>&gt=
;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; <o:p></o=
:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; Signed-o=
ff-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" target=3D"_bla=
nk"><span style=3D"color:windowtext;text-decoration:none">denys@ti.com</spa=
n></a>&gt;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; ---<o:p>=
</o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; .../gstr=
eamer/gstreamer1.0-plugins-bad_1.2.3.bbappend&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 4 &#43=
;&#43;&#43;-<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; 1 file c=
hanged, 3 insertions(&#43;), 1 deletion(-)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; <o:p></o=
:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; diff --g=
it <o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; a/meta-a=
rago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-<o:p></o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; bad_1.2.=
3.bbappend <o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; b/meta-a=
rago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-<o:p></o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; bad_1.2.=
3.bbappend<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; index b1=
cacac..bd141a8 100644<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; --- <o:p=
></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; a/meta-a=
rago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-<o:p></o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; bad_1.2.=
3.bbappend<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; &#43;&#4=
3;&#43; b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plug<=
o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; &#43;&#4=
3;&#43; ins-bad_1.2.3.bbappend<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; @@ -2,6 =
&#43;2,8 @@ FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<o:p>=
</o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; <o:p></o=
:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; PACKAGEC=
ONFIG =3D &quot;faad wayland&quot;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; <o:p></o=
:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; &#43;DEP=
ENDS &#43;=3D &quot;libdrm libdce&quot;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; &#43;<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; SRC_URI_=
append =3D &quot; \<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file:///\\0001-Added-GstDRMBuf=
ferPool-support.patch" target=3D"_blank">
<span style=3D"color:windowtext;text-decoration:none">file://0001-Added-Gst=
DRMBufferPool-support.patch</span></a> \<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file:///\\0002-Modified-waylan=
dsink-to-accept-NV12-format.patch" target=3D"_blank">
<span style=3D"color:windowtext;text-decoration:none">file://0002-Modified-=
waylandsink-to-accept-NV12-format.patch</span></a>
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; \ @@ -9,=
4 &#43;11,4 @@ SRC_URI_append =3D &quot; \<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file:///\\0004-waylandsink-Rem=
oved-dependency-on-dri2.patch" target=3D"_blank">
<span style=3D"color:windowtext;text-decoration:none">file://0004-waylandsi=
nk-Removed-dependency-on-dri2.patch</span></a> \<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file:///\\0005-vc1parse-and-jp=
egparse-Fixes-plugin-ranks.patch" target=3D"_blank">
<span style=3D"color:windowtext;text-decoration:none">file://0005-vc1parse-=
and-jpegparse-Fixes-plugin-ranks.patch</span></a>&quot;<o:p></o:p></span></=
p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; <o:p></o=
:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; -PR_appe=
nd =3D &quot;-arago0&quot;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; &#43;PR_=
append =3D &quot;-arago1&quot;<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; --<o:p><=
/o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt;&gt; 2.2.0<o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; ____________=
___________________________________<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; meta-arago m=
ailing list<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; <a href=3D"m=
ailto:meta-arago@arago-project.org" target=3D"_blank">
<span style=3D"color:windowtext;text-decoration:none">meta-arago@arago-proj=
ect.org</span></a><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; <a href=3D"h=
ttp://arago-project.org/cgi-bin/mailman/listinfo/meta-arago" target=3D"_bla=
nk">
<span style=3D"color:windowtext;text-decoration:none">http://arago-project.=
org/cgi-bin/mailman/listinfo/meta-arago</span></a><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; ____________=
___________________________________<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; meta-arago m=
ailing list<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; <a href=3D"m=
ailto:meta-arago@arago-project.org" target=3D"_blank">
<span style=3D"color:windowtext;text-decoration:none">meta-arago@arago-proj=
ect.org</span></a><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">&gt;&gt; <a href=3D"h=
ttp://arago-project.org/cgi-bin/mailman/listinfo/meta-arago" target=3D"_bla=
nk">
<span style=3D"color:windowtext;text-decoration:none">http://arago-project.=
org/cgi-bin/mailman/listinfo/meta-arago</span></a><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">_____________________=
__________________________<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black">meta-arago mailing li=
st<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black"><a href=3D"mailto:met=
a-arago@arago-project.org" target=3D"_blank"><span style=3D"color:windowtex=
t;text-decoration:none">meta-arago@arago-project.org</span></a><o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black"><a href=3D"http://ara=
go-project.org/cgi-bin/mailman/listinfo/meta-arago" target=3D"_blank"><span=
 style=3D"color:windowtext;text-decoration:none">http://arago-project.org/c=
gi-bin/mailman/listinfo/meta-arago</span></a><o:p></o:p></span></p>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_FCB36D0BED1F0D4EA8E6242507E4245B0C8980EBDFLE08entticom_--
