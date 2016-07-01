Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id 3F9D1529A0
	for <meta-arago@arago-project.org>;
	Fri,  1 Jul 2016 17:23:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u61HN6PZ030913
	for <meta-arago@arago-project.org>; Fri, 1 Jul 2016 12:23:06 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u61HN6af000540
	for <meta-arago@arago-project.org>; Fri, 1 Jul 2016 12:23:06 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 1 Jul 2016 12:23:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u61HN5LI028834;
	Fri, 1 Jul 2016 12:23:05 -0500
Date: Fri, 1 Jul 2016 13:23:05 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20160701172305.GD29380@edge>
References: <1467308269-31242-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1467308269-31242-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] gstreamer1.0: Remove gst 1.2 recipes and patches
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
X-List-Received-Date: Fri, 01 Jul 2016 17:23:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

If past history taught me anything - we'll be switching between 1.2 and 1.6 
few more times before we settle and the new version is stable enough. I.e. I'm 
already seeing issues on am3 and am4 devices caused by gst upgrade. So, nack 
for now.

-- 
Denys


On Thu, Jun 30, 2016 at 11:07:49PM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../gstreamer/gstreamer1.0-libav_1.2.3.bbappend    |     1 -
>  .../gstreamer/gstreamer1.0-libav_1.2.3.bb          |    25 -
>  ...-mouse-movement-for-videos-on-waylandsink.patch |   404 -
>  .../gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb    |    13 -
>  .../gstreamer1.0-plugins-bad_1.2.3.bbappend        |    42 -
>  .../0001-Added-GstMetaDmaBuf-features.patch        |   441 -
>  ...t-use-videoconvert-from-version-1.3.1-to-.patch | 11652 -------------------
>  .../gstreamer/gstreamer1.0-plugins-base_1.2.3.bb   |     9 -
>  .../gstreamer1.0-plugins-base_1.2.3.bbappend       |     8 -
>  ...ST_V4L2_IO_DMABUF-mode-support-in-capture.patch |   298 -
>  ...0002-gstv4l2src-Optimize-delay-in-capture.patch |    31 -
>  .../gstreamer/gstreamer1.0-plugins-good_1.2.3.bb   |     8 -
>  .../gstreamer1.0-plugins-good_1.2.3.bbappend       |     7 -
>  .../gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb   |     7 -
>  .../gstreamer/gstreamer1.0_1.2.3.bb                |    14 -
>  15 files changed, 12960 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bbappend
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bb
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Enable-mouse-movement-for-videos-on-waylandsink.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Added-GstMetaDmaBuf-features.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-videoconvert-use-videoconvert-from-version-1.3.1-to-.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bb
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bbappend
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-gstv4l2src-Optimize-delay-in-capture.patch
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bb
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb
>  delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.2.3.bb
> 
> diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bbappend
> deleted file mode 100644
> index f32ed69..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bb
> deleted file mode 100644
> index 3e99273..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Enable-mouse-movement-for-videos-on-waylandsink.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Enable-mouse-movement-for-videos-on-waylandsink.patch
> deleted file mode 100644
> index 06d28bc..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb
> deleted file mode 100644
> index 6dc8a3c..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
> deleted file mode 100644
> index 3580bde..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Added-GstMetaDmaBuf-features.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Added-GstMetaDmaBuf-features.patch
> deleted file mode 100644
> index ff1d471..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-videoconvert-use-videoconvert-from-version-1.3.1-to-.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-videoconvert-use-videoconvert-from-version-1.3.1-to-.patch
> deleted file mode 100644
> index 9fc2eff..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bb
> deleted file mode 100644
> index 0097137..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bbappend
> deleted file mode 100644
> index ca675bd..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch
> deleted file mode 100644
> index 3913208..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-gstv4l2src-Optimize-delay-in-capture.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-gstv4l2src-Optimize-delay-in-capture.patch
> deleted file mode 100644
> index 07c2f24..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bb
> deleted file mode 100644
> index 52e4542..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
> deleted file mode 100644
> index 90ba547..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb
> deleted file mode 100644
> index ed48039..0000000
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.2.3.bb
> deleted file mode 100644
> index 75a42eb..0000000
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

