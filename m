Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 49B5C52099
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2015 16:22:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2HGMOVf022271
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 11:22:24 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HGMNZo025957
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 11:22:23 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 17 Mar 2015 11:22:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HGMNE4016339;
	Tue, 17 Mar 2015 11:22:23 -0500
Date: Tue, 17 Mar 2015 12:22:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "R, Karthik" <karthik.ramanan@ti.com>
Message-ID: <20150317162222.GJ4669@edge>
References: <1425398366-6614-1-git-send-email-a0393906@ti.com>
	<20150317154522.GI4669@edge>
	<24B88602B5904F49971CAF899152529B34C08307@DBDE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <24B88602B5904F49971CAF899152529B34C08307@DBDE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Tue, 17 Mar 2015 16:22:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Karthik,

As I explained the last time around - all the plugins get split out into 
individual subpackages and you can decide which ones you want to pull into the 
rootfs. Alternatively, there is an empty -meta package, that automatically 
RDEPENDS on all the individual plugin subpackages, so if you want to pull in 
all the plugins, all you have to do is pull the -meta package. And that's what 
we already do:

$ cat tisdk-rootfs-image-am335x-*.rootfs.manifest|sort|grep gst-plugins|cut -f1 -d' '
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
>    If I recall correctly, that line is required because the required .so's of
>    the various get plugins do not get populated into the targetfs. There are
>    a lot of them that we need, both default and TI added plugins.
> 
>    I had earlier made the change in the oe-core recipe and sent it to you for
>    requesting upstream submission but I reworked it to have them in the
>    individual recipes.
> 
>    This is tested on dra7xx and I can confirm that it's needed. Please
>    include it.
> 
>    Regards
>    Karthik
> 
>      ----------------------------------------------------------------------
> 
>    From: Dmytriyenko, Denys
>    Sent: (->)3/(->)17/(->)2015 9:15 PM
>    To: R, Karthik
>    Cc: meta-arago@arago-project.org
>    Subject: Re: [meta-arago] [meta-arago 0/4] GStreamer 1.0 adapatations for
>    TI Platforms
> 
>    Ok, I'm fine with these patches, except one thing:
> 
>    FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
> 
>    What is the specific reason for this? I'm going to drop it when applying
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
>    >  .../0001-Added-GstDRMBufferPool-support.patch      |  774 +++++++++++
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
>    meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ti.inc
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Added-GstDRMBufferPool-support.patch
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-Modified-waylandsink-to-accept-NV12-format.patch
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-Added-KMSsink-support.patch
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Removed-dependency-on-dri2.patch
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Added-GstMetaDmaBuf-features.patch
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bbappend
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch
>    >  create mode 100644
>    meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
>    >
>    > --
>    > 1.7.9.5
>    >
>    > _______________________________________________
>    > meta-arago mailing list
>    > meta-arago@arago-project.org
>    > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

