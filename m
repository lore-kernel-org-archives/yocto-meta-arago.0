Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A8E5C52099
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2015 16:28:31 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2HGSTw8031897
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 11:28:30 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HGSPq8018448
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 21:58:27 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.03.0224.002; Tue, 17 Mar 2015 21:58:25 +0530
From: "R, Karthik" <karthik.ramanan@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [meta-arago 0/4] GStreamer 1.0 adapatations for
	TI Platforms
Thread-Index: AQHQVcsL8li5I9sGGUiK9ho3+OxLT50giviAgABiVs3//6gAAIAAXeN/
Date: Tue, 17 Mar 2015 16:28:24 +0000
Message-ID: <24B88602B5904F49971CAF899152529B34C08376@DBDE04.ent.ti.com>
References: <1425398366-6614-1-git-send-email-a0393906@ti.com>
	<20150317154522.GI4669@edge>
	<24B88602B5904F49971CAF899152529B34C08307@DBDE04.ent.ti.com>,
	<20150317162222.GJ4669@edge>
In-Reply-To: <20150317162222.GJ4669@edge>
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
X-List-Received-Date: Tue, 17 Mar 2015 16:28:32 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_24B88602B5904F49971CAF899152529B34C08376DBDE04entticom_"

--_000_24B88602B5904F49971CAF899152529B34C08376DBDE04entticom_
Content-Type: text/plain; charset="windows-1256"
Content-Transfer-Encoding: quoted-printable

Ok Denys, thanks for this additional pointer. I will take a look at this an=
d let you know if I need some additional inputs.

You can drop the line and merge the patch.

Regards
Karthik

________________________________
From: Dmytriyenko, Denys<mailto:denys@ti.com>
Sent: =FD3/=FD17/=FD2015 9:52 PM
To: R, Karthik<mailto:karthik.ramanan@ti.com>
Cc: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
Subject: Re: [meta-arago] [meta-arago 0/4] GStreamer 1.0 adapatations for T=
I Platforms

Karthik,

As I explained the last time around - all the plugins get split out into
individual subpackages and you can decide which ones you want to pull into =
the
rootfs. Alternatively, there is an empty -meta package, that automatically
RDEPENDS on all the individual plugin subpackages, so if you want to pull i=
n
all the plugins, all you have to do is pull the -meta package. And that's w=
hat
we already do:

$ cat tisdk-rootfs-image-am335x-*.rootfs.manifest|sort|grep gst-plugins|cut=
 -f1 -d' '
gst-plugins-bad-adpcmdec
gst-plugins-bad-adpcmenc
gst-plugins-bad-aiff
gst-plugins-bad-asfmux
gst-plugins-bad-audiovisualizers
gst-plugins-bad-autoconvert
gst-plugins-bad-bayer
gst-plugins-bad-bz2
gst-plugins-bad-camerabin2
gst-plugins-bad-camerabin
gst-plugins-bad-cdxaparse
gst-plugins-bad-coloreffects
gst-plugins-bad-colorspace
gst-plugins-bad
gst-plugins-bad-curl
gst-plugins-bad-dataurisrc
gst-plugins-bad-dccp
gst-plugins-bad-debugutilsbad
gst-plugins-bad-decklink
gst-plugins-bad-dtmf
gst-plugins-bad-dvb
gst-plugins-bad-dvbsuboverlay
gst-plugins-bad-dvdspu
gst-plugins-bad-faad
gst-plugins-bad-faceoverlay
gst-plugins-bad-fbdevsink
gst-plugins-bad-festival
gst-plugins-bad-fieldanalysis
gst-plugins-bad-fragmented
gst-plugins-bad-freeverb
gst-plugins-bad-freeze
gst-plugins-bad-frei0r
gst-plugins-bad-gaudieffects
gst-plugins-bad-geometrictransform
gst-plugins-bad-gsettingselements
gst-plugins-bad-h264parse
gst-plugins-bad-hdvparse
gst-plugins-bad-id3tag
gst-plugins-bad-inter
gst-plugins-bad-interlace
gst-plugins-bad-ivfparse
gst-plugins-bad-jp2kdecimator
gst-plugins-bad-jpegformat
gst-plugins-bad-legacyresample
gst-plugins-bad-linsys
gst-plugins-bad-liveadder
gst-plugins-bad-meta
gst-plugins-bad-mpegdemux
gst-plugins-bad-mpegpsmux
gst-plugins-bad-mpegtsdemux
gst-plugins-bad-mpegtsmux
gst-plugins-bad-mpegvideoparse
gst-plugins-bad-mve
gst-plugins-bad-mxf
gst-plugins-bad-nsf
gst-plugins-bad-nuvdemux
gst-plugins-bad-patchdetect
gst-plugins-bad-pcapparse
gst-plugins-bad-pnm
gst-plugins-bad-rawparse
gst-plugins-bad-removesilence
gst-plugins-bad-rfbsrc
gst-plugins-bad-rtpmux
gst-plugins-bad-rtpvp8
gst-plugins-bad-scaletempoplugin
gst-plugins-bad-sdi
gst-plugins-bad-sdpelem
gst-plugins-bad-segmentclip
gst-plugins-bad-shm
gst-plugins-bad-siren
gst-plugins-bad-smooth
gst-plugins-bad-speed
gst-plugins-bad-stereo
gst-plugins-bad-subenc
gst-plugins-bad-tta
gst-plugins-bad-vcdsrc
gst-plugins-bad-videofiltersbad
gst-plugins-bad-videomaxrate
gst-plugins-bad-videomeasure
gst-plugins-bad-videoparsersbad
gst-plugins-bad-videosignal
gst-plugins-bad-vmnc
gst-plugins-bad-y4mdec
gst-plugins-base-adder
gst-plugins-base-alsa
gst-plugins-base-app
gst-plugins-base-apps
gst-plugins-base-audioconvert
gst-plugins-base-audiorate
gst-plugins-base-audioresample
gst-plugins-base-audiotestsrc
gst-plugins-base
gst-plugins-base-decodebin2
gst-plugins-base-decodebin
gst-plugins-base-encodebin
gst-plugins-base-ffmpegcolorspace
gst-plugins-base-gdp
gst-plugins-base-gio
gst-plugins-base-ivorbisdec
gst-plugins-base-meta
gst-plugins-base-ogg
gst-plugins-base-playbin
gst-plugins-base-subparse
gst-plugins-base-tcp
gst-plugins-base-theora
gst-plugins-base-typefindfunctions
gst-plugins-base-videorate
gst-plugins-base-videoscale
gst-plugins-base-videotestsrc
gst-plugins-base-volume
gst-plugins-base-vorbis
gst-plugins-good-alaw
gst-plugins-good-alphacolor
gst-plugins-good-alpha
gst-plugins-good-annodex
gst-plugins-good-apetag
gst-plugins-good-audiofx
gst-plugins-good-audioparsers
gst-plugins-good-auparse
gst-plugins-good-autodetect
gst-plugins-good-avi
gst-plugins-good-cairo
gst-plugins-good
gst-plugins-good-cutter
gst-plugins-good-debug
gst-plugins-good-deinterlace
gst-plugins-good-efence
gst-plugins-good-effectv
gst-plugins-good-equalizer
gst-plugins-good-flac
gst-plugins-good-flv
gst-plugins-good-flxdec
gst-plugins-good-goom2k1
gst-plugins-good-goom
gst-plugins-good-icydemux
gst-plugins-good-id3demux
gst-plugins-good-imagefreeze
gst-plugins-good-interleave
gst-plugins-good-isomp4
gst-plugins-good-jpeg
gst-plugins-good-level
gst-plugins-good-matroska
gst-plugins-good-meta
gst-plugins-good-mulaw
gst-plugins-good-multifile
gst-plugins-good-multipart
gst-plugins-good-navigationtest
gst-plugins-good-oss4audio
gst-plugins-good-ossaudio
gst-plugins-good-png
gst-plugins-good-pulse
gst-plugins-good-replaygain
gst-plugins-good-rtp
gst-plugins-good-rtpmanager
gst-plugins-good-rtsp
gst-plugins-good-shapewipe
gst-plugins-good-smpte
gst-plugins-good-souphttpsrc
gst-plugins-good-spectrum
gst-plugins-good-speex
gst-plugins-good-udp
gst-plugins-good-video4linux2
gst-plugins-good-videobox
gst-plugins-good-videocrop
gst-plugins-good-videofilter
gst-plugins-good-videomixer
gst-plugins-good-wavenc
gst-plugins-good-wavparse
gst-plugins-good-y4menc



On Tue, Mar 17, 2015 at 12:07:20PM -0400, R, Karthik wrote:
>    Denys,
>
>    If I recall correctly, that line is required because the required .so'=
s of
>    the various get plugins do not get populated into the targetfs. There =
are
>    a lot of them that we need, both default and TI added plugins.
>
>    I had earlier made the change in the oe-core recipe and sent it to you=
 for
>    requesting upstream submission but I reworked it to have them in the
>    individual recipes.
>
>    This is tested on dra7xx and I can confirm that it's needed. Please
>    include it.
>
>    Regards
>    Karthik
>
>      --------------------------------------------------------------------=
--
>
>    From: Dmytriyenko, Denys
>    Sent: (->)3/(->)17/(->)2015 9:15 PM
>    To: R, Karthik
>    Cc: meta-arago@arago-project.org
>    Subject: Re: [meta-arago] [meta-arago 0/4] GStreamer 1.0 adapatations =
for
>    TI Platforms
>
>    Ok, I'm fine with these patches, except one thing:
>
>    FILES_${PN} +=3D "${libdir}/gstreamer-1.0/*.so"
>
>    What is the specific reason for this? I'm going to drop it when applyi=
ng
>    these patches later today...
>
>    On Tue, Mar 03, 2015 at 09:29:21PM +0530, Karthik Ramanan wrote:
>    > Difference from v1:
>    >  * Add gst-plugins-ducati for GST 1.x
>    >  * Add gst-plugins-vpe for GST 1.x
>    >  * Add FILES_PN explicitly for all GST 1.x recipes
>    >
>    > Karthik Ramanan (4):
>    >   gstreamer1.0-plugins-base: Add DMA Buf support
>    >   gstreamer1.0-plugins-good: Add DMABuf support v4l2src
>    >   gstreamer1.0-plugins-bad: Add various features
>    >   gstreamer1.0-plugins-ti: Add ducati and vpe GST plugins
>    >
>    >  .../gstreamer1.0-plugins-ducati_git.bb             |   10 +
>    >  .../gst-plugins-ti/gstreamer1.0-plugins-ti.inc     |   19 +
>    >  .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb |   11 +
>    >  .../0001-Added-GstDRMBufferPool-support.patch      |  774 +++++++++=
++
>    >  ...odified-waylandsink-to-accept-NV12-format.patch | 1017
>    ++++++++++++++
>    >  .../0003-Added-KMSsink-support.patch               | 1457
>    ++++++++++++++++++++
>    >  ...04-waylandsink-Removed-dependency-on-dri2.patch |   26 +
>    >  ...vc1parse-and-jpegparse-Fixes-plugin-ranks.patch |   54 +
>    >  .../gstreamer1.0-plugins-bad_1.2.3.bbappend        |   14 +
>    >  .../0001-Added-GstMetaDmaBuf-features.patch        |  441 ++++++
>    >  .../gstreamer1.0-plugins-base_1.2.3.bbappend       |    8 +
>    >  ...ST_V4L2_IO_DMABUF-mode-support-in-capture.patch |  298 ++++
>    >  .../gstreamer1.0-plugins-good_1.2.3.bbappend       |    8 +
>    >  13 files changed, 4137 insertions(+)
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugi=
ns-ducati_git.bb
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugi=
ns-ti.inc
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugi=
ns-vpe_git.bb
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ba=
d/0001-Added-GstDRMBufferPool-support.patch
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ba=
d/0002-Modified-waylandsink-to-accept-NV12-format.patch
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ba=
d/0003-Added-KMSsink-support.patch
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ba=
d/0004-waylandsink-Removed-dependency-on-dri2.patch
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ba=
d/0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ba=
d_1.2.3.bbappend
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ba=
se/0001-Added-GstMetaDmaBuf-features.patch
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ba=
se_1.2.3.bbappend
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-go=
od/0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-go=
od_1.2.3.bbappend
>    >
>    > --
>    > 1.7.9.5
>    >
>    > _______________________________________________
>    > meta-arago mailing list
>    > meta-arago@arago-project.org
>    > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_24B88602B5904F49971CAF899152529B34C08376DBDE04entticom_
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
<div style=3D"font-family:Calibri,sans-serif; font-size:11pt">Ok Denys, tha=
nks for this additional pointer. I will take a look at this and let you kno=
w if I need some additional inputs.
<br>
<br>
You can drop the line and merge the patch.<br>
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
=FD17/=FD2015 9:52 PM</span><br>
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
<div class=3D"PlainText">Karthik,<br>
<br>
As I explained the last time around - all the plugins get split out into <b=
r>
individual subpackages and you can decide which ones you want to pull into =
the <br>
rootfs. Alternatively, there is an empty -meta package, that automatically =
<br>
RDEPENDS on all the individual plugin subpackages, so if you want to pull i=
n <br>
all the plugins, all you have to do is pull the -meta package. And that's w=
hat <br>
we already do:<br>
<br>
$ cat tisdk-rootfs-image-am335x-*.rootfs.manifest|sort|grep gst-plugins|cut=
 -f1 -d' '<br>
gst-plugins-bad-adpcmdec<br>
gst-plugins-bad-adpcmenc<br>
gst-plugins-bad-aiff<br>
gst-plugins-bad-asfmux<br>
gst-plugins-bad-audiovisualizers<br>
gst-plugins-bad-autoconvert<br>
gst-plugins-bad-bayer<br>
gst-plugins-bad-bz2<br>
gst-plugins-bad-camerabin2<br>
gst-plugins-bad-camerabin<br>
gst-plugins-bad-cdxaparse<br>
gst-plugins-bad-coloreffects<br>
gst-plugins-bad-colorspace<br>
gst-plugins-bad<br>
gst-plugins-bad-curl<br>
gst-plugins-bad-dataurisrc<br>
gst-plugins-bad-dccp<br>
gst-plugins-bad-debugutilsbad<br>
gst-plugins-bad-decklink<br>
gst-plugins-bad-dtmf<br>
gst-plugins-bad-dvb<br>
gst-plugins-bad-dvbsuboverlay<br>
gst-plugins-bad-dvdspu<br>
gst-plugins-bad-faad<br>
gst-plugins-bad-faceoverlay<br>
gst-plugins-bad-fbdevsink<br>
gst-plugins-bad-festival<br>
gst-plugins-bad-fieldanalysis<br>
gst-plugins-bad-fragmented<br>
gst-plugins-bad-freeverb<br>
gst-plugins-bad-freeze<br>
gst-plugins-bad-frei0r<br>
gst-plugins-bad-gaudieffects<br>
gst-plugins-bad-geometrictransform<br>
gst-plugins-bad-gsettingselements<br>
gst-plugins-bad-h264parse<br>
gst-plugins-bad-hdvparse<br>
gst-plugins-bad-id3tag<br>
gst-plugins-bad-inter<br>
gst-plugins-bad-interlace<br>
gst-plugins-bad-ivfparse<br>
gst-plugins-bad-jp2kdecimator<br>
gst-plugins-bad-jpegformat<br>
gst-plugins-bad-legacyresample<br>
gst-plugins-bad-linsys<br>
gst-plugins-bad-liveadder<br>
gst-plugins-bad-meta<br>
gst-plugins-bad-mpegdemux<br>
gst-plugins-bad-mpegpsmux<br>
gst-plugins-bad-mpegtsdemux<br>
gst-plugins-bad-mpegtsmux<br>
gst-plugins-bad-mpegvideoparse<br>
gst-plugins-bad-mve<br>
gst-plugins-bad-mxf<br>
gst-plugins-bad-nsf<br>
gst-plugins-bad-nuvdemux<br>
gst-plugins-bad-patchdetect<br>
gst-plugins-bad-pcapparse<br>
gst-plugins-bad-pnm<br>
gst-plugins-bad-rawparse<br>
gst-plugins-bad-removesilence<br>
gst-plugins-bad-rfbsrc<br>
gst-plugins-bad-rtpmux<br>
gst-plugins-bad-rtpvp8<br>
gst-plugins-bad-scaletempoplugin<br>
gst-plugins-bad-sdi<br>
gst-plugins-bad-sdpelem<br>
gst-plugins-bad-segmentclip<br>
gst-plugins-bad-shm<br>
gst-plugins-bad-siren<br>
gst-plugins-bad-smooth<br>
gst-plugins-bad-speed<br>
gst-plugins-bad-stereo<br>
gst-plugins-bad-subenc<br>
gst-plugins-bad-tta<br>
gst-plugins-bad-vcdsrc<br>
gst-plugins-bad-videofiltersbad<br>
gst-plugins-bad-videomaxrate<br>
gst-plugins-bad-videomeasure<br>
gst-plugins-bad-videoparsersbad<br>
gst-plugins-bad-videosignal<br>
gst-plugins-bad-vmnc<br>
gst-plugins-bad-y4mdec<br>
gst-plugins-base-adder<br>
gst-plugins-base-alsa<br>
gst-plugins-base-app<br>
gst-plugins-base-apps<br>
gst-plugins-base-audioconvert<br>
gst-plugins-base-audiorate<br>
gst-plugins-base-audioresample<br>
gst-plugins-base-audiotestsrc<br>
gst-plugins-base<br>
gst-plugins-base-decodebin2<br>
gst-plugins-base-decodebin<br>
gst-plugins-base-encodebin<br>
gst-plugins-base-ffmpegcolorspace<br>
gst-plugins-base-gdp<br>
gst-plugins-base-gio<br>
gst-plugins-base-ivorbisdec<br>
gst-plugins-base-meta<br>
gst-plugins-base-ogg<br>
gst-plugins-base-playbin<br>
gst-plugins-base-subparse<br>
gst-plugins-base-tcp<br>
gst-plugins-base-theora<br>
gst-plugins-base-typefindfunctions<br>
gst-plugins-base-videorate<br>
gst-plugins-base-videoscale<br>
gst-plugins-base-videotestsrc<br>
gst-plugins-base-volume<br>
gst-plugins-base-vorbis<br>
gst-plugins-good-alaw<br>
gst-plugins-good-alphacolor<br>
gst-plugins-good-alpha<br>
gst-plugins-good-annodex<br>
gst-plugins-good-apetag<br>
gst-plugins-good-audiofx<br>
gst-plugins-good-audioparsers<br>
gst-plugins-good-auparse<br>
gst-plugins-good-autodetect<br>
gst-plugins-good-avi<br>
gst-plugins-good-cairo<br>
gst-plugins-good<br>
gst-plugins-good-cutter<br>
gst-plugins-good-debug<br>
gst-plugins-good-deinterlace<br>
gst-plugins-good-efence<br>
gst-plugins-good-effectv<br>
gst-plugins-good-equalizer<br>
gst-plugins-good-flac<br>
gst-plugins-good-flv<br>
gst-plugins-good-flxdec<br>
gst-plugins-good-goom2k1<br>
gst-plugins-good-goom<br>
gst-plugins-good-icydemux<br>
gst-plugins-good-id3demux<br>
gst-plugins-good-imagefreeze<br>
gst-plugins-good-interleave<br>
gst-plugins-good-isomp4<br>
gst-plugins-good-jpeg<br>
gst-plugins-good-level<br>
gst-plugins-good-matroska<br>
gst-plugins-good-meta<br>
gst-plugins-good-mulaw<br>
gst-plugins-good-multifile<br>
gst-plugins-good-multipart<br>
gst-plugins-good-navigationtest<br>
gst-plugins-good-oss4audio<br>
gst-plugins-good-ossaudio<br>
gst-plugins-good-png<br>
gst-plugins-good-pulse<br>
gst-plugins-good-replaygain<br>
gst-plugins-good-rtp<br>
gst-plugins-good-rtpmanager<br>
gst-plugins-good-rtsp<br>
gst-plugins-good-shapewipe<br>
gst-plugins-good-smpte<br>
gst-plugins-good-souphttpsrc<br>
gst-plugins-good-spectrum<br>
gst-plugins-good-speex<br>
gst-plugins-good-udp<br>
gst-plugins-good-video4linux2<br>
gst-plugins-good-videobox<br>
gst-plugins-good-videocrop<br>
gst-plugins-good-videofilter<br>
gst-plugins-good-videomixer<br>
gst-plugins-good-wavenc<br>
gst-plugins-good-wavparse<br>
gst-plugins-good-y4menc<br>
<br>
<br>
<br>
On Tue, Mar 17, 2015 at 12:07:20PM -0400, R, Karthik wrote:<br>
&gt;&nbsp;&nbsp;&nbsp; Denys,<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp; If I recall correctly, that line is required because=
 the required .so's of<br>
&gt;&nbsp;&nbsp;&nbsp; the various get plugins do not get populated into th=
e targetfs. There are<br>
&gt;&nbsp;&nbsp;&nbsp; a lot of them that we need, both default and TI adde=
d plugins.<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp; I had earlier made the change in the oe-core recipe =
and sent it to you for<br>
&gt;&nbsp;&nbsp;&nbsp; requesting upstream submission but I reworked it to =
have them in the<br>
&gt;&nbsp;&nbsp;&nbsp; individual recipes.<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp; This is tested on dra7xx and I can confirm that it's=
 needed. Please<br>
&gt;&nbsp;&nbsp;&nbsp; include it.<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp; Regards<br>
&gt;&nbsp;&nbsp;&nbsp; Karthik<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ----------------------------------------=
------------------------------<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp; From: Dmytriyenko, Denys<br>
&gt;&nbsp;&nbsp;&nbsp; Sent: (-&gt;)3/(-&gt;)17/(-&gt;)2015 9:15 PM<br>
&gt;&nbsp;&nbsp;&nbsp; To: R, Karthik<br>
&gt;&nbsp;&nbsp;&nbsp; Cc: meta-arago@arago-project.org<br>
&gt;&nbsp;&nbsp;&nbsp; Subject: Re: [meta-arago] [meta-arago 0/4] GStreamer=
 1.0 adapatations for<br>
&gt;&nbsp;&nbsp;&nbsp; TI Platforms<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp; Ok, I'm fine with these patches, except one thing:<b=
r>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp; FILES_${PN} &#43;=3D &quot;${libdir}/gstreamer-1.0/*=
.so&quot;<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp; What is the specific reason for this? I'm going to d=
rop it when applying<br>
&gt;&nbsp;&nbsp;&nbsp; these patches later today...<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp; On Tue, Mar 03, 2015 at 09:29:21PM &#43;0530, Karthi=
k Ramanan wrote:<br>
&gt;&nbsp;&nbsp;&nbsp; &gt; Difference from v1:<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; * Add gst-plugins-ducati for GST 1.x<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; * Add gst-plugins-vpe for GST 1.x<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; * Add FILES_PN explicitly for all GST 1.x=
 recipes<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp; &gt; Karthik Ramanan (4):<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&nbsp; gstreamer1.0-plugins-base: Add DMA =
Buf support<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&nbsp; gstreamer1.0-plugins-good: Add DMAB=
uf support v4l2src<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&nbsp; gstreamer1.0-plugins-bad: Add vario=
us features<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp;&nbsp; gstreamer1.0-plugins-ti: Add ducati=
 and vpe GST plugins<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; .../gstreamer1.0-plugins-ducati_git.bb&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbs=
p;&nbsp; 10 &#43;<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; .../gst-plugins-ti/gstreamer1.0-plugins-t=
i.inc&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 19 &#43;<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; .../gst-plugins-ti/gstreamer1.0-plugins-v=
pe_git.bb |&nbsp;&nbsp; 11 &#43;<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; .../0001-Added-GstDRMBufferPool-support.p=
atch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 774 &#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; ...odified-waylandsink-to-accept-NV12-for=
mat.patch | 1017<br>
&gt;&nbsp;&nbsp;&nbsp; &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; .../0003-Added-KMSsink-support.patch&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 1457<br>
&gt;&nbsp;&nbsp;&nbsp; &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; ...04-waylandsink-Removed-dependency-on-d=
ri2.patch |&nbsp;&nbsp; 26 &#43;<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; ...vc1parse-and-jpegparse-Fixes-plugin-ra=
nks.patch |&nbsp;&nbsp; 54 &#43;<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; .../gstreamer1.0-plugins-bad_1.2.3.bbappe=
nd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 14 &#43;<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; .../0001-Added-GstMetaDmaBuf-features.pat=
ch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 441 &#43;&#43;&#43;&#4=
3;&#43;&#43;<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; .../gstreamer1.0-plugins-base_1.2.3.bbapp=
end&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 8 &#43;<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; ...ST_V4L2_IO_DMABUF-mode-support-in-capt=
ure.patch |&nbsp; 298 &#43;&#43;&#43;&#43;<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; .../gstreamer1.0-plugins-good_1.2.3.bbapp=
end&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 8 &#43;<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; 13 files changed, 4137 insertions(&#43;)<=
br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; create mode 100644<br>
&gt;&nbsp;&nbsp;&nbsp; meta-arago-extras/recipes-multimedia/gst-plugins-ti/=
gstreamer1.0-plugins-ducati_git.bb<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; create mode 100644<br>
&gt;&nbsp;&nbsp;&nbsp; meta-arago-extras/recipes-multimedia/gst-plugins-ti/=
gstreamer1.0-plugins-ti.inc<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; create mode 100644<br>
&gt;&nbsp;&nbsp;&nbsp; meta-arago-extras/recipes-multimedia/gst-plugins-ti/=
gstreamer1.0-plugins-vpe_git.bb<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; create mode 100644<br>
&gt;&nbsp;&nbsp;&nbsp; meta-arago-extras/recipes-multimedia/gstreamer/gstre=
amer1.0-plugins-bad/0001-Added-GstDRMBufferPool-support.patch<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; create mode 100644<br>
&gt;&nbsp;&nbsp;&nbsp; meta-arago-extras/recipes-multimedia/gstreamer/gstre=
amer1.0-plugins-bad/0002-Modified-waylandsink-to-accept-NV12-format.patch<b=
r>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; create mode 100644<br>
&gt;&nbsp;&nbsp;&nbsp; meta-arago-extras/recipes-multimedia/gstreamer/gstre=
amer1.0-plugins-bad/0003-Added-KMSsink-support.patch<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; create mode 100644<br>
&gt;&nbsp;&nbsp;&nbsp; meta-arago-extras/recipes-multimedia/gstreamer/gstre=
amer1.0-plugins-bad/0004-waylandsink-Removed-dependency-on-dri2.patch<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; create mode 100644<br>
&gt;&nbsp;&nbsp;&nbsp; meta-arago-extras/recipes-multimedia/gstreamer/gstre=
amer1.0-plugins-bad/0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch<br=
>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; create mode 100644<br>
&gt;&nbsp;&nbsp;&nbsp; meta-arago-extras/recipes-multimedia/gstreamer/gstre=
amer1.0-plugins-bad_1.2.3.bbappend<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; create mode 100644<br>
&gt;&nbsp;&nbsp;&nbsp; meta-arago-extras/recipes-multimedia/gstreamer/gstre=
amer1.0-plugins-base/0001-Added-GstMetaDmaBuf-features.patch<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; create mode 100644<br>
&gt;&nbsp;&nbsp;&nbsp; meta-arago-extras/recipes-multimedia/gstreamer/gstre=
amer1.0-plugins-base_1.2.3.bbappend<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; create mode 100644<br>
&gt;&nbsp;&nbsp;&nbsp; meta-arago-extras/recipes-multimedia/gstreamer/gstre=
amer1.0-plugins-good/0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.p=
atch<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;&nbsp; create mode 100644<br>
&gt;&nbsp;&nbsp;&nbsp; meta-arago-extras/recipes-multimedia/gstreamer/gstre=
amer1.0-plugins-good_1.2.3.bbappend<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp; &gt; --<br>
&gt;&nbsp;&nbsp;&nbsp; &gt; 1.7.9.5<br>
&gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt;&nbsp;&nbsp;&nbsp; &gt; _______________________________________________=
<br>
&gt;&nbsp;&nbsp;&nbsp; &gt; meta-arago mailing list<br>
&gt;&nbsp;&nbsp;&nbsp; &gt; meta-arago@arago-project.org<br>
&gt;&nbsp;&nbsp;&nbsp; &gt; <a href=3D"http://arago-project.org/cgi-bin/mai=
lman/listinfo/meta-arago">http://arago-project.org/cgi-bin/mailman/listinfo=
/meta-arago</a><br>
</div>
</span></font>
</body>
</html>

--_000_24B88602B5904F49971CAF899152529B34C08376DBDE04entticom_--
