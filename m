Return-Path: <vchengalvala@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 61798529AF
	for <meta-arago@arago-project.org>;
	Mon, 23 Mar 2015 14:19:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2NEJ4U3003627
	for <meta-arago@arago-project.org>; Mon, 23 Mar 2015 09:19:04 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2NEJ3vk017131
	for <meta-arago@arago-project.org>; Mon, 23 Mar 2015 09:19:03 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Mon, 23 Mar 2015 09:19:03 -0500
From: "Chengalvala, Vivek" <vchengalvala@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "Stiffler, Jacob"
	<j-stiffler@ti.com>
Thread-Topic: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on
	libdrm and libdce due to KMSsink
Thread-Index: AQHQYovfRtJY28FBuUSUEYaPgD6O+50kuQUAgAB51GCAACdNUIAABcLMgABWUAD//7CP34AAEp4AgASpHsA=
Date: Mon, 23 Mar 2015 14:19:01 +0000
Deferred-Delivery: Mon, 23 Mar 2015 14:19:00 +0000
Message-ID: <FCB36D0BED1F0D4EA8E6242507E4245B0C896F81@DFLE08.ent.ti.com>
References: <1426800578-7496-1-git-send-email-denis@denix.org>
	<20150319223632.GH11557@edge>
	,<4B26FB5A64EBA14C87266869E037F958141102CB@DFLE09.ent.ti.com>
	<2E478A96-8197-4C5A-90C1-8A4ABA78F000@ti.com>,
	<4B26FB5A64EBA14C87266869E037F9581411031E@DFLE09.ent.ti.com>
	<3DCCA74A-3656-4D5E-A5F1-F0A0EBC3C43C@ti.com>
	<FCB36D0BED1F0D4EA8E6242507E4245B0C8940CA@DFLE08.ent.ti.com>
In-Reply-To: <FCB36D0BED1F0D4EA8E6242507E4245B0C8940CA@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"Balagopalakrishnan, Anand" <anandb@ti.com>
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
X-List-Received-Date: Mon, 23 Mar 2015 14:19:05 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_FCB36D0BED1F0D4EA8E6242507E4245B0C896F81DFLE08entticom_"

--_000_FCB36D0BED1F0D4EA8E6242507E4245B0C896F81DFLE08entticom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Karthik, Anand,

Any updates on this? We're checking regarding #2 on AM57x using ARM codecs =
and will post our observations..

Thanks,
Vivek


From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Chengalvala, Vivek
Sent: Friday, March 20, 2015 2:17 PM
To: Cooper Jr., Franklin; Stiffler, Jacob
Cc: meta-arago@arago-project.org; Balagopalakrishnan, Anand
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

--_000_FCB36D0BED1F0D4EA8E6242507E4245B0C896F81DFLE08entticom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
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
	font-family:"Calibri","sans-serif";}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
span.EmailStyle22
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
/* List Definitions */
@list l0
	{mso-list-id:721367406;
	mso-list-type:hybrid;
	mso-list-template-ids:-350563438 67698703 67698691 67698693 67698689 67698=
691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Karthik, Anand,<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Any updates on this? W=
e&#8217;re checking regarding #2 on AM57x using ARM codecs and will post ou=
r observations..<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Thanks,<o:p></o:p></sp=
an></p>
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
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> meta-ara=
go-bounces@arago-project.org [mailto:meta-arago-bounces@arago-project.org]
<b>On Behalf Of </b>Chengalvala, Vivek<br>
<b>Sent:</b> Friday, March 20, 2015 2:17 PM<br>
<b>To:</b> Cooper Jr., Franklin; Stiffler, Jacob<br>
<b>Cc:</b> meta-arago@arago-project.org; Balagopalakrishnan, Anand<br>
<b>Subject:</b> Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPE=
NDS on libdrm and libdce due to KMSsink<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Karthik, Anand, Denys,<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Upgrade to GST 1.0 (using commit <span style=3D"f=
ont-size:9.0pt;font-family:&quot;Courier New&quot;;color:black;background:w=
hite">
b5747ce8caa13e4528e2d3055fa81cc9ca7b48fd</span> on meta-arago) is causing t=
he following problems:<o:p></o:p></p>
<p class=3D"MsoPlainText" style=3D"margin-left:.5in;text-indent:-.25in;mso-=
list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">1.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>Broken build for AM3. Not sure how AM4 build succee=
ds.<o:p></o:p></p>
<p class=3D"MsoPlainText" style=3D"margin-left:.5in;text-indent:-.25in;mso-=
list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">2.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>AM4x: Performance drop with ARM only decode of H264=
 (not sure if it is due to a) base GST upgrade b) ffmpeg_dec
<span style=3D"font-family:Wingdings">=E0</span> avdec_h264 or c) ffmpeg_co=
lor_space <span style=3D"font-family:Wingdings">
=E0</span> videoconvert)<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo2"><![if !supportLists]><span style=3D"mso-list:Ignore">3.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>AM57x: playbin pipeline internally triggers arm vid=
eo decoder (e.g., avdec_h264) instead of ducati decoder<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo2"><![if !supportLists]><span style=3D"mso-list:Ignore">4.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>AM57x: cannot run pipeline with video parse &#43; d=
ecode, e.g., &#8220;gst-launch-1.0 filesrc location=3DHistoryOfTI-480p.264 =
! h264parse ! ducatih264dec ! fakesink&#8221;
<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">All the above issues are not present with gst-0.1=
0.<o:p></o:p></p>
<p class=3D"MsoNormal">Please note that Issue #3 is not observed on Vayu wi=
th GLSDK EA release 7.0.0.4. Issue #4 is also happening on Vayu with GLSDK =
EA release 7.0.0.4.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">In addition to above, <o:p></o:p></p>
<p class=3D"MsoPlainText" style=3D"margin-left:.5in;text-indent:-.25in;mso-=
list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"mso-list:Ignore">5.<span style=3D"font:=
7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><![endif]>kmssink is missing from AM57x file system. <o:p></o=
:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">We wanted to do an SDF today for PROCESSOR-SDK on=
 AM3, AM4 and due to above failures, we are forced to freeze @ commit #5c2f=
4eea32afda6e68681470be664eb5a46fd984, and not pick up any further changes o=
n meta-arago.
<o:p></o:p></p>
<p class=3D"MsoPlainText">There is another release targeted for next week a=
nd we&#8217;d like to be get back to the latest of meta-arago as soon as po=
ssible. Appreciate your help in addressing the above issues.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Thanks,<o:p></o:p></p>
<p class=3D"MsoPlainText">Vivek<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">-----Original Message-----<br>
From: <a href=3D"mailto:meta-arago-bounces@arago-project.org">meta-arago-bo=
unces@arago-project.org</a> [<a href=3D"mailto:meta-arago-bounces@arago-pro=
ject.org">mailto:meta-arago-bounces@arago-project.org</a>] On Behalf Of Coo=
per Jr., Franklin<br>
Sent: Friday, March 20, 2015 9:58 AM<br>
To: Stiffler, Jacob<br>
Cc: <a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago-projec=
t.org</a><br>
Subject: Re: [meta-arago] [PATCH] gstreamer1.0-plugins-bad: add DEPENDS on =
libdrm and libdce due to KMSsink<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Well that's not good.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt; On Mar 20, 2015, at 8:42 AM, Stiffler, Jacob=
 &lt;<a href=3D"mailto:j-stiffler@ti.com"><span style=3D"color:windowtext;t=
ext-decoration:none">j-stiffler@ti.com</span></a>&gt; wrote:<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; I ran the demo while running &quot;top&quot;=
. It appears that CPU is near 100%. However, this demo was working fine wit=
h gstreamer 0.10.<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -----Original Message-----<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; From: Cooper Jr., Franklin <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Sent: Friday, March 20, 2015 9:34 AM<o:p></o=
:p></p>
<p class=3D"MsoPlainText">&gt; To: Stiffler, Jacob<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Cc: Dmytriyenko, Denys; <a href=3D"mailto:me=
ta-arago@arago-project.org">
<span style=3D"color:windowtext;text-decoration:none">meta-arago@arago-proj=
ect.org</span></a><o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Subject: Re: [meta-arago] [PATCH] gstreamer1=
.0-plugins-bad: add DEPENDS on libdrm and libdce due to KMSsink<o:p></o:p><=
/p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; On Mar 20, 2015, at 8:17 AM, Stiffler, J=
acob &lt;<a href=3D"mailto:j-stiffler@ti.com"><span style=3D"color:windowte=
xt;text-decoration:none">j-stiffler@ti.com</span></a>&gt; wrote:<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; I tried the matrix h264 decode demo on a=
m437x with gstreamer 1.0.
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; To get it to work, I had to modify runH2=
64Dec.sh to use the new pipelines. The new command is the following:<o:p></=
o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&nbsp;&nbsp; gst-launch-1.0 -v filesrc lo=
cation=3D$filename ! h264parse ! avdec_h264 ! videoconvert ! fbdevsink devi=
ce=3D/dev/fb0<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; Once this was done, I was able to run th=
e demo, but the framerate is extremely slow. Is this the correct command? O=
r is this behavior expected?<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; If slow as in stuttering and choppy then no.=
 If cpu utilization is high then that is expected.<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; Thanks,<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; Jake <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; -----Original Message-----<o:p></o:p></p=
>
<p class=3D"MsoPlainText">&gt;&gt; From: Stiffler, Jacob <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; Sent: Friday, March 20, 2015 6:56 AM<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; To: Dmytriyenko, Denys; <a href=3D"mailt=
o:meta-arago@arago-project.org">
<span style=3D"color:windowtext;text-decoration:none">meta-arago@arago-proj=
ect.org</span></a><o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; Subject: RE: [meta-arago] [PATCH] gstrea=
mer1.0-plugins-bad: add DEPENDS on libdrm and libdce due to KMSsink<o:p></o=
:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; It appears I got lucky with a successful=
 am437x-evm build. The package libdrm was installed and libdce was not.<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; However, I got a build failure for am335=
x-evm due to the missing libdrm dependency:<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; In file included from gstdrmbufferpool.c=
:42:0:<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; gstdrmbufferpool.h:42:22: fatal error: o=
map_drm.h: No such file or directory compilation terminated.<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; make[4]: *** [libgstdrm_1.0_la-gstdrmbuf=
ferpool.lo] Error 1<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; make[4]: Leaving directory `/home/gtblda=
dm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work=
/cortexa8t2hf-vfp-neon-oe-linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-a=
rago0/gst-plugins-bad-1.2.3/gst-libs/gst/drm'<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; make[3]: *** [all-recursive] Error 1<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; make[3]: Leaving directory `/home/gtblda=
dm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work=
/cortexa8t2hf-vfp-neon-oe-linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-a=
rago0/gst-plugins-bad-1.2.3/gst-libs/gst'<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; make[2]: *** [all-recursive] Error 1<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; make[2]: Leaving directory `/home/gtblda=
dm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work=
/cortexa8t2hf-vfp-neon-oe-linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-a=
rago0/gst-plugins-bad-1.2.3/gst-libs'<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; make[1]: *** [all-recursive] Error 1<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; make[1]: Leaving directory `/home/gtblda=
dm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work=
/cortexa8t2hf-vfp-neon-oe-linux-gnueabi/gstreamer1.0-plugins-bad/1.2.3-r0-a=
rago0/gst-plugins-bad-1.2.3'<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; make: *** [all] Error 2<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; ERROR: oe_runmake failed<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; - Jake<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; -----Original Message-----<o:p></o:p></p=
>
<p class=3D"MsoPlainText">&gt;&gt; From: <a href=3D"mailto:meta-arago-bounc=
es@arago-project.org">
<span style=3D"color:windowtext;text-decoration:none">meta-arago-bounces@ar=
ago-project.org</span></a> [<a href=3D"mailto:meta-arago-bounces@arago-proj=
ect.org"><span style=3D"color:windowtext;text-decoration:none">mailto:meta-=
arago-bounces@arago-project.org</span></a>]
 On Behalf Of Dmytriyenko, Denys<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; Sent: Thursday, March 19, 2015 6:37 PM<o=
:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; To: <a href=3D"mailto:meta-arago@arago-p=
roject.org"><span style=3D"color:windowtext;text-decoration:none">meta-arag=
o@arago-project.org</span></a><o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; Subject: Re: [meta-arago] [PATCH] gstrea=
mer1.0-plugins-bad: add DEPENDS on libdrm and libdce due to KMSsink<o:p></o=
:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; Karthik,<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; I had a question - I see that KMSsink in=
 plugins-bad checks for drm and dce headers. I was trying to set the depend=
ency accordingly, but it would break non dce platforms. Can you please elab=
orate on that a bit? Thanks.<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; --<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; Denys<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; On Thu, Mar 19, 2015 at 05:29:38PM -=
0400, Denys Dmytriyenko wrote:<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; From: Denys Dmytriyenko &lt;<a href=
=3D"mailto:denys@ti.com"><span style=3D"color:windowtext;text-decoration:no=
ne">denys@ti.com</span></a>&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; Signed-off-by: Denys Dmytriyenko &lt=
;<a href=3D"mailto:denys@ti.com"><span style=3D"color:windowtext;text-decor=
ation:none">denys@ti.com</span></a>&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; ---<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; .../gstreamer/gstreamer1.0-plugins-b=
ad_1.2.3.bbappend&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 4 &#43;&#43;&#43;-<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; 1 file changed, 3 insertions(&#43;),=
 1 deletion(-)<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; diff --git <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; a/meta-arago-extras/recipes-multimed=
ia/gstreamer/gstreamer1.0-plugins-<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; bad_1.2.3.bbappend <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; b/meta-arago-extras/recipes-multimed=
ia/gstreamer/gstreamer1.0-plugins-<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; bad_1.2.3.bbappend<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; index b1cacac..bd141a8 100644<o:p></=
o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; --- <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; a/meta-arago-extras/recipes-multimed=
ia/gstreamer/gstreamer1.0-plugins-<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; bad_1.2.3.bbappend<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; &#43;&#43;&#43; b/meta-arago-extras/=
recipes-multimedia/gstreamer/gstreamer1.0-plug<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; &#43;&#43;&#43; ins-bad_1.2.3.bbappe=
nd<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; @@ -2,6 &#43;2,8 @@ FILESEXTRAPATHS_=
prepend :=3D &quot;${THISDIR}/${PN}:&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; PACKAGECONFIG =3D &quot;faad wayland=
&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; &#43;DEPENDS &#43;=3D &quot;libdrm l=
ibdce&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; SRC_URI_append =3D &quot; \<o:p></o:=
p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; <a href=3D"file:///\\0001-Added-GstDRMBufferPool-support.patch">
<span style=3D"color:windowtext;text-decoration:none">file://0001-Added-Gst=
DRMBufferPool-support.patch</span></a> \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; <a href=3D"file:///\\0002-Modified-waylandsink-to-accept-NV12-format.=
patch">
<span style=3D"color:windowtext;text-decoration:none">file://0002-Modified-=
waylandsink-to-accept-NV12-format.patch</span></a>
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; \ @@ -9,4 &#43;11,4 @@ SRC_URI_appen=
d =3D &quot; \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; <a href=3D"file:///\\0004-waylandsink-Removed-dependency-on-dri2.patc=
h">
<span style=3D"color:windowtext;text-decoration:none">file://0004-waylandsi=
nk-Removed-dependency-on-dri2.patch</span></a> \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; <a href=3D"file:///\\0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.p=
atch">
<span style=3D"color:windowtext;text-decoration:none">file://0005-vc1parse-=
and-jpegparse-Fixes-plugin-ranks.patch</span></a>&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; -PR_append =3D &quot;-arago0&quot;<o=
:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; &#43;PR_append =3D &quot;-arago1&quo=
t;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; --<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt; 2.2.0<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; ________________________________________=
_______<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; meta-arago mailing list<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <a href=3D"mailto:meta-arago@arago-proje=
ct.org"><span style=3D"color:windowtext;text-decoration:none">meta-arago@ar=
ago-project.org</span></a><o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <a href=3D"http://arago-project.org/cgi-=
bin/mailman/listinfo/meta-arago">
<span style=3D"color:windowtext;text-decoration:none">http://arago-project.=
org/cgi-bin/mailman/listinfo/meta-arago</span></a><o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; ________________________________________=
_______<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; meta-arago mailing list<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <a href=3D"mailto:meta-arago@arago-proje=
ct.org"><span style=3D"color:windowtext;text-decoration:none">meta-arago@ar=
ago-project.org</span></a><o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <a href=3D"http://arago-project.org/cgi-=
bin/mailman/listinfo/meta-arago">
<span style=3D"color:windowtext;text-decoration:none">http://arago-project.=
org/cgi-bin/mailman/listinfo/meta-arago</span></a><o:p></o:p></p>
<p class=3D"MsoPlainText">_______________________________________________<o=
:p></o:p></p>
<p class=3D"MsoPlainText">meta-arago mailing list<o:p></o:p></p>
<p class=3D"MsoPlainText"><a href=3D"mailto:meta-arago@arago-project.org"><=
span style=3D"color:windowtext;text-decoration:none">meta-arago@arago-proje=
ct.org</span></a><o:p></o:p></p>
<p class=3D"MsoPlainText"><a href=3D"http://arago-project.org/cgi-bin/mailm=
an/listinfo/meta-arago"><span style=3D"color:windowtext;text-decoration:non=
e">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</span></a><=
o:p></o:p></p>
</div>
</body>
</html>

--_000_FCB36D0BED1F0D4EA8E6242507E4245B0C896F81DFLE08entticom_--
