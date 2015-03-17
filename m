Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 23E0B52A0B
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2015 16:07:26 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2HG7OuI020611
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 11:07:24 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HG7KcD017253
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 21:37:22 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.03.0224.002; Tue, 17 Mar 2015 21:37:20 +0530
From: "R, Karthik" <karthik.ramanan@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [meta-arago 0/4] GStreamer 1.0 adapatations for
	TI Platforms
Thread-Index: AQHQVcsL8li5I9sGGUiK9ho3+OxLT50giviAgABiVs0=
Date: Tue, 17 Mar 2015 16:07:20 +0000
Message-ID: <24B88602B5904F49971CAF899152529B34C08307@DBDE04.ent.ti.com>
References: <1425398366-6614-1-git-send-email-a0393906@ti.com>,
	<20150317154522.GI4669@edge>
In-Reply-To: <20150317154522.GI4669@edge>
Accept-Language: en-IN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [meta-arago 0/4] GStreamer 1.0 adapatations for TI Platforms
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
X-List-Received-Date: Tue, 17 Mar 2015 16:07:26 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_24B88602B5904F49971CAF899152529B34C08307DBDE04entticom_"

--_000_24B88602B5904F49971CAF899152529B34C08307DBDE04entticom_
Content-Type: text/plain; charset="windows-1256"
Content-Transfer-Encoding: quoted-printable

Denys,

If I recall correctly, that line is required because the required .so's of =
the various get plugins do not get populated into the targetfs. There are a=
 lot of them that we need, both default and TI added plugins.

I had earlier made the change in the oe-core recipe and sent it to you for =
requesting upstream submission but I reworked it to have them in the indivi=
dual recipes.

This is tested on dra7xx and I can confirm that it's needed. Please include=
 it.

Regards
Karthik

________________________________
From: Dmytriyenko, Denys<mailto:denys@ti.com>
Sent: =FD3/=FD17/=FD2015 9:15 PM
To: R, Karthik<mailto:karthik.ramanan@ti.com>
Cc: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
Subject: Re: [meta-arago] [meta-arago 0/4] GStreamer 1.0 adapatations for T=
I Platforms

Ok, I'm fine with these patches, except one thing:

FILES_${PN} +=3D "${libdir}/gstreamer-1.0/*.so"

What is the specific reason for this? I'm going to drop it when applying
these patches later today...


On Tue, Mar 03, 2015 at 09:29:21PM +0530, Karthik Ramanan wrote:
> Difference from v1:
>  * Add gst-plugins-ducati for GST 1.x
>  * Add gst-plugins-vpe for GST 1.x
>  * Add FILES_PN explicitly for all GST 1.x recipes
>
> Karthik Ramanan (4):
>   gstreamer1.0-plugins-base: Add DMA Buf support
>   gstreamer1.0-plugins-good: Add DMABuf support v4l2src
>   gstreamer1.0-plugins-bad: Add various features
>   gstreamer1.0-plugins-ti: Add ducati and vpe GST plugins
>
>  .../gstreamer1.0-plugins-ducati_git.bb             |   10 +
>  .../gst-plugins-ti/gstreamer1.0-plugins-ti.inc     |   19 +
>  .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb |   11 +
>  .../0001-Added-GstDRMBufferPool-support.patch      |  774 +++++++++++
>  ...odified-waylandsink-to-accept-NV12-format.patch | 1017 ++++++++++++++
>  .../0003-Added-KMSsink-support.patch               | 1457 ++++++++++++++=
++++++
>  ...04-waylandsink-Removed-dependency-on-dri2.patch |   26 +
>  ...vc1parse-and-jpegparse-Fixes-plugin-ranks.patch |   54 +
>  .../gstreamer1.0-plugins-bad_1.2.3.bbappend        |   14 +
>  .../0001-Added-GstMetaDmaBuf-features.patch        |  441 ++++++
>  .../gstreamer1.0-plugins-base_1.2.3.bbappend       |    8 +
>  ...ST_V4L2_IO_DMABUF-mode-support-in-capture.patch |  298 ++++
>  .../gstreamer1.0-plugins-good_1.2.3.bbappend       |    8 +
>  13 files changed, 4137 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/g=
streamer1.0-plugins-ducati_git.bb
>  create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/g=
streamer1.0-plugins-ti.inc
>  create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/g=
streamer1.0-plugins-vpe_git.bb
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-bad/0001-Added-GstDRMBufferPool-support.patch
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-bad/0002-Modified-waylandsink-to-accept-NV12-format.patch
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-bad/0003-Added-KMSsink-support.patch
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-bad/0004-waylandsink-Removed-dependency-on-dri2.patch
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-bad/0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-bad_1.2.3.bbappend
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-base/0001-Added-GstMetaDmaBuf-features.patch
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-base_1.2.3.bbappend
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-good/0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.pa=
tch
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-good_1.2.3.bbappend
>
> --
> 1.7.9.5
>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_24B88602B5904F49971CAF899152529B34C08307DBDE04entticom_
Content-Type: text/html; charset="windows-1256"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-1=
256">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div>
<div style=3D"font-family:Calibri,sans-serif; font-size:11pt">Denys,<br>
<br>
If I recall correctly, that line is required because the required .so's of =
the various get plugins do not get populated into the targetfs. There are a=
 lot of them that we need, both default and TI added plugins.
<br>
<br>
I had earlier made the change in the oe-core recipe and sent it to you for =
requesting upstream submission but I reworked it to have them in the indivi=
dual recipes.<br>
<br>
This is tested on dra7xx and I can confirm that it's needed. Please include=
 it.<br>
<br>
Regards<br>
Karthik<br>
<br>
</div>
</div>
<div dir=3D"ltr">
<hr>
<span style=3D"font-family:Calibri,sans-serif; font-size:11pt; font-weight:=
bold">From:
</span><span style=3D"font-family:Calibri,sans-serif; font-size:11pt"><a hr=
ef=3D"mailto:denys@ti.com">Dmytriyenko, Denys</a></span><br>
<span style=3D"font-family:Calibri,sans-serif; font-size:11pt; font-weight:=
bold">Sent:
</span><span style=3D"font-family:Calibri,sans-serif; font-size:11pt">=FD3/=
=FD17/=FD2015 9:15 PM</span><br>
<span style=3D"font-family:Calibri,sans-serif; font-size:11pt; font-weight:=
bold">To:
</span><span style=3D"font-family:Calibri,sans-serif; font-size:11pt"><a hr=
ef=3D"mailto:karthik.ramanan@ti.com">R, Karthik</a></span><br>
<span style=3D"font-family:Calibri,sans-serif; font-size:11pt; font-weight:=
bold">Cc:
</span><span style=3D"font-family:Calibri,sans-serif; font-size:11pt"><a hr=
ef=3D"mailto:meta-arago@arago-project.org">meta-arago@arago-project.org</a>=
</span><br>
<span style=3D"font-family:Calibri,sans-serif; font-size:11pt; font-weight:=
bold">Subject:
</span><span style=3D"font-family:Calibri,sans-serif; font-size:11pt">Re: [=
meta-arago] [meta-arago 0/4] GStreamer 1.0 adapatations for TI Platforms</s=
pan><br>
<br>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Ok, I'm fine with these patches, except one thing:=
<br>
<br>
FILES_${PN} &#43;=3D &quot;${libdir}/gstreamer-1.0/*.so&quot;<br>
<br>
What is the specific reason for this? I'm going to drop it when applying <b=
r>
these patches later today...<br>
<br>
<br>
On Tue, Mar 03, 2015 at 09:29:21PM &#43;0530, Karthik Ramanan wrote:<br>
&gt; Difference from v1:<br>
&gt;&nbsp; * Add gst-plugins-ducati for GST 1.x<br>
&gt;&nbsp; * Add gst-plugins-vpe for GST 1.x<br>
&gt;&nbsp; * Add FILES_PN explicitly for all GST 1.x recipes<br>
&gt; <br>
&gt; Karthik Ramanan (4):<br>
&gt;&nbsp;&nbsp; gstreamer1.0-plugins-base: Add DMA Buf support<br>
&gt;&nbsp;&nbsp; gstreamer1.0-plugins-good: Add DMABuf support v4l2src<br>
&gt;&nbsp;&nbsp; gstreamer1.0-plugins-bad: Add various features<br>
&gt;&nbsp;&nbsp; gstreamer1.0-plugins-ti: Add ducati and vpe GST plugins<br=
>
&gt; <br>
&gt;&nbsp; .../gstreamer1.0-plugins-ducati_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 10 &#43;<br>
&gt;&nbsp; .../gst-plugins-ti/gstreamer1.0-plugins-ti.inc&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 19 &#43;<br>
&gt;&nbsp; .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb |&nbsp;&nbsp;=
 11 &#43;<br>
&gt;&nbsp; .../0001-Added-GstDRMBufferPool-support.patch&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 774 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;<br>
&gt;&nbsp; ...odified-waylandsink-to-accept-NV12-format.patch | 1017 &#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp; .../0003-Added-KMSsink-support.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1457 &#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;<br>
&gt;&nbsp; ...04-waylandsink-Removed-dependency-on-dri2.patch |&nbsp;&nbsp;=
 26 &#43;<br>
&gt;&nbsp; ...vc1parse-and-jpegparse-Fixes-plugin-ranks.patch |&nbsp;&nbsp;=
 54 &#43;<br>
&gt;&nbsp; .../gstreamer1.0-plugins-bad_1.2.3.bbappend&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 14 &#43;<br>
&gt;&nbsp; .../0001-Added-GstMetaDmaBuf-features.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 441 &#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp; .../gstreamer1.0-plugins-base_1.2.3.bbappend&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 8 &#43;<br>
&gt;&nbsp; ...ST_V4L2_IO_DMABUF-mode-support-in-capture.patch |&nbsp; 298 &=
#43;&#43;&#43;&#43;<br>
&gt;&nbsp; .../gstreamer1.0-plugins-good_1.2.3.bbappend&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 8 &#43;<br>
&gt;&nbsp; 13 files changed, 4137 insertions(&#43;)<br>
&gt;&nbsp; create mode 100644 meta-arago-extras/recipes-multimedia/gst-plug=
ins-ti/gstreamer1.0-plugins-ducati_git.bb<br>
&gt;&nbsp; create mode 100644 meta-arago-extras/recipes-multimedia/gst-plug=
ins-ti/gstreamer1.0-plugins-ti.inc<br>
&gt;&nbsp; create mode 100644 meta-arago-extras/recipes-multimedia/gst-plug=
ins-ti/gstreamer1.0-plugins-vpe_git.bb<br>
&gt;&nbsp; create mode 100644 meta-arago-extras/recipes-multimedia/gstreame=
r/gstreamer1.0-plugins-bad/0001-Added-GstDRMBufferPool-support.patch<br>
&gt;&nbsp; create mode 100644 meta-arago-extras/recipes-multimedia/gstreame=
r/gstreamer1.0-plugins-bad/0002-Modified-waylandsink-to-accept-NV12-format.=
patch<br>
&gt;&nbsp; create mode 100644 meta-arago-extras/recipes-multimedia/gstreame=
r/gstreamer1.0-plugins-bad/0003-Added-KMSsink-support.patch<br>
&gt;&nbsp; create mode 100644 meta-arago-extras/recipes-multimedia/gstreame=
r/gstreamer1.0-plugins-bad/0004-waylandsink-Removed-dependency-on-dri2.patc=
h<br>
&gt;&nbsp; create mode 100644 meta-arago-extras/recipes-multimedia/gstreame=
r/gstreamer1.0-plugins-bad/0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.p=
atch<br>
&gt;&nbsp; create mode 100644 meta-arago-extras/recipes-multimedia/gstreame=
r/gstreamer1.0-plugins-bad_1.2.3.bbappend<br>
&gt;&nbsp; create mode 100644 meta-arago-extras/recipes-multimedia/gstreame=
r/gstreamer1.0-plugins-base/0001-Added-GstMetaDmaBuf-features.patch<br>
&gt;&nbsp; create mode 100644 meta-arago-extras/recipes-multimedia/gstreame=
r/gstreamer1.0-plugins-base_1.2.3.bbappend<br>
&gt;&nbsp; create mode 100644 meta-arago-extras/recipes-multimedia/gstreame=
r/gstreamer1.0-plugins-good/0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-ca=
pture.patch<br>
&gt;&nbsp; create mode 100644 meta-arago-extras/recipes-multimedia/gstreame=
r/gstreamer1.0-plugins-good_1.2.3.bbappend<br>
&gt; <br>
&gt; -- <br>
&gt; 1.7.9.5<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; meta-arago mailing list<br>
&gt; meta-arago@arago-project.org<br>
&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
</div>
</span></font>
</body>
</html>

--_000_24B88602B5904F49971CAF899152529B34C08307DBDE04entticom_--
