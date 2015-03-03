Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id ABDBC52A62
	for <meta-arago@arago-project.org>;
	Tue,  3 Mar 2015 15:59:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t23FxWeN000422
	for <meta-arago@arago-project.org>; Tue, 3 Mar 2015 09:59:32 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t23FxVM5021624
	for <meta-arago@arago-project.org>; Tue, 3 Mar 2015 09:59:31 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Mar 2015 09:59:31 -0600
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t23FxUoH010022;
	Tue, 3 Mar 2015 09:59:30 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Mar 2015 21:29:21 +0530
Message-ID: <1425398366-6614-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-arago 0/4] GStreamer 1.0 adapatations for TI Platforms
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
X-List-Received-Date: Tue, 03 Mar 2015 15:59:33 -0000
Content-Type: text/plain

Difference from v1:
 * Add gst-plugins-ducati for GST 1.x
 * Add gst-plugins-vpe for GST 1.x
 * Add FILES_PN explicitly for all GST 1.x recipes

Karthik Ramanan (4):
  gstreamer1.0-plugins-base: Add DMA Buf support
  gstreamer1.0-plugins-good: Add DMABuf support v4l2src
  gstreamer1.0-plugins-bad: Add various features
  gstreamer1.0-plugins-ti: Add ducati and vpe GST plugins

 .../gstreamer1.0-plugins-ducati_git.bb             |   10 +
 .../gst-plugins-ti/gstreamer1.0-plugins-ti.inc     |   19 +
 .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb |   11 +
 .../0001-Added-GstDRMBufferPool-support.patch      |  774 +++++++++++
 ...odified-waylandsink-to-accept-NV12-format.patch | 1017 ++++++++++++++
 .../0003-Added-KMSsink-support.patch               | 1457 ++++++++++++++++++++
 ...04-waylandsink-Removed-dependency-on-dri2.patch |   26 +
 ...vc1parse-and-jpegparse-Fixes-plugin-ranks.patch |   54 +
 .../gstreamer1.0-plugins-bad_1.2.3.bbappend        |   14 +
 .../0001-Added-GstMetaDmaBuf-features.patch        |  441 ++++++
 .../gstreamer1.0-plugins-base_1.2.3.bbappend       |    8 +
 ...ST_V4L2_IO_DMABUF-mode-support-in-capture.patch |  298 ++++
 .../gstreamer1.0-plugins-good_1.2.3.bbappend       |    8 +
 13 files changed, 4137 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ti.inc
 create mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Added-GstDRMBufferPool-support.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-Modified-waylandsink-to-accept-NV12-format.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-Added-KMSsink-support.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-waylandsink-Removed-dependency-on-dri2.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Added-GstMetaDmaBuf-features.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bbappend
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend

-- 
1.7.9.5


