Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 59B2052A6D
	for <meta-arago@arago-project.org>;
	Tue, 10 Mar 2015 16:53:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2AGrIYI020397
	for <meta-arago@arago-project.org>; Tue, 10 Mar 2015 11:53:18 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2AGrH5q013971
	for <meta-arago@arago-project.org>; Tue, 10 Mar 2015 11:53:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Mar 2015 11:53:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2AGrH4j006766;
	Tue, 10 Mar 2015 11:53:17 -0500
Date: Tue, 10 Mar 2015 12:53:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20150310165316.GF21244@edge>
References: <1425398366-6614-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1425398366-6614-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
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
X-List-Received-Date: Tue, 10 Mar 2015 16:53:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Vivek, Jake,

Do you have any comments for these 2 sets of GST 1.x patches?


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
>  .../0003-Added-KMSsink-support.patch               | 1457 ++++++++++++++++++++
>  ...04-waylandsink-Removed-dependency-on-dri2.patch |   26 +
>  ...vc1parse-and-jpegparse-Fixes-plugin-ranks.patch |   54 +
>  .../gstreamer1.0-plugins-bad_1.2.3.bbappend        |   14 +
>  .../0001-Added-GstMetaDmaBuf-features.patch        |  441 ++++++
>  .../gstreamer1.0-plugins-base_1.2.3.bbappend       |    8 +
>  ...ST_V4L2_IO_DMABUF-mode-support-in-capture.patch |  298 ++++
>  .../gstreamer1.0-plugins-good_1.2.3.bbappend       |    8 +
>  13 files changed, 4137 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
>  create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ti.inc
>  create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Added-GstDRMBufferPool-support.patch
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-Modified-waylandsink-to-accept-NV12-format.patch
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-Added-KMSsink-support.patch
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Removed-dependency-on-dri2.patch
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Added-GstMetaDmaBuf-features.patch
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bbappend
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
> 
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

