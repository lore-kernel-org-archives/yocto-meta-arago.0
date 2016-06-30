Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C73D852AD2
	for <meta-arago@arago-project.org>;
	Thu, 30 Jun 2016 17:37:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5UHagmL029440
	for <meta-arago@arago-project.org>; Thu, 30 Jun 2016 12:36:42 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5UHbsMx030280
	for <meta-arago@arago-project.org>; Thu, 30 Jun 2016 12:37:54 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 30 Jun 2016 12:37:53 -0500
Received: from sditapps09.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u5UHbqWn019184;	Thu, 30 Jun 2016 12:37:53 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Jun 2016 23:07:49 +0530
Message-ID: <1467308269-31242-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] gstreamer1.0: Remove gst 1.2 recipes and patches
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
X-List-Received-Date: Thu, 30 Jun 2016 17:37:59 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../gstreamer/gstreamer1.0-libav_1.2.3.bbappend    |     1 -
 .../gstreamer/gstreamer1.0-libav_1.2.3.bb          |    25 -
 ...-mouse-movement-for-videos-on-waylandsink.patch |   404 -
 .../gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb    |    13 -
 .../gstreamer1.0-plugins-bad_1.2.3.bbappend        |    42 -
 .../0001-Added-GstMetaDmaBuf-features.patch        |   441 -
 ...t-use-videoconvert-from-version-1.3.1-to-.patch | 11652 -------------------
 .../gstreamer/gstreamer1.0-plugins-base_1.2.3.bb   |     9 -
 .../gstreamer1.0-plugins-base_1.2.3.bbappend       |     8 -
 ...ST_V4L2_IO_DMABUF-mode-support-in-capture.patch |   298 -
 ...0002-gstv4l2src-Optimize-delay-in-capture.patch |    31 -
 .../gstreamer/gstreamer1.0-plugins-good_1.2.3.bb   |     8 -
 .../gstreamer1.0-plugins-good_1.2.3.bbappend       |     7 -
 .../gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb   |     7 -
 .../gstreamer/gstreamer1.0_1.2.3.bb                |    14 -
 15 files changed, 12960 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bbappend
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bb
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Enable-mouse-movement-for-videos-on-waylandsink.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Added-GstMetaDmaBuf-features.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-videoconvert-use-videoconvert-from-version-1.3.1-to-.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bb
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bbappend
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-gstv4l2src-Optimize-delay-in-capture.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bb
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.2.3.bb

diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bbappend b/meta-arago-distro/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bbappend
deleted file mode 100644
index f32ed69..0000000
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.3.bb
deleted file mode 100644
index 3e99273..0000000
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Enable-mouse-movement-for-videos-on-waylandsink.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Enable-mouse-movement-for-videos-on-waylandsink.patch
deleted file mode 100644
index 06d28bc..0000000
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bb
deleted file mode 100644
index 6dc8a3c..0000000
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
deleted file mode 100644
index 3580bde..0000000
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Added-GstMetaDmaBuf-features.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Added-GstMetaDmaBuf-features.patch
deleted file mode 100644
index ff1d471..0000000
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-videoconvert-use-videoconvert-from-version-1.3.1-to-.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-videoconvert-use-videoconvert-from-version-1.3.1-to-.patch
deleted file mode 100644
index 9fc2eff..0000000
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bb
deleted file mode 100644
index 0097137..0000000
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.3.bbappend
deleted file mode 100644
index ca675bd..0000000
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-Adds-GST_V4L2_IO_DMABUF-mode-support-in-capture.patch
deleted file mode 100644
index 3913208..0000000
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-gstv4l2src-Optimize-delay-in-capture.patch b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-gstv4l2src-Optimize-delay-in-capture.patch
deleted file mode 100644
index 07c2f24..0000000
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bb
deleted file mode 100644
index 52e4542..0000000
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2.3.bbappend
deleted file mode 100644
index 90ba547..0000000
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2.3.bb
deleted file mode 100644
index ed48039..0000000
diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.2.3.bb b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.2.3.bb
deleted file mode 100644
index 75a42eb..0000000
-- 
1.9.1


