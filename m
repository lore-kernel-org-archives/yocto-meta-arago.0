Return-Path: <poojaprajod@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id A9FF252A65
	for <meta-arago@arago-project.org>;
	Fri,  5 May 2017 14:04:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v45E4bXH004215
	for <meta-arago@arago-project.org>; Fri, 5 May 2017 09:04:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493993077;
	bh=KXiPdXs0xdH9C8MbPdcvtajUpYZvlMpwOvIZE4w/mrw=;
	h=From:To:CC:Subject:Date;
	b=W7jv3LPYUXSSSa52lrIKl9j2O3HGaWDhnvSaQt5mP1jj2Q3KHri/OiQ0RkHPk8EOD
	9V4HBvQQeYnVOzm9lIQON6jm2TSfcED36r6UtWtnV6IiLx+dCbPpnPsuXxOLP+lQbF
	cIdosFexOYtWQOpqPVD0dUpP1ZEhUy7yaQ/+0bV0=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v45E4ba8014094
	for <meta-arago@arago-project.org>; Fri, 5 May 2017 09:04:37 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 5 May 2017 09:04:36 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v45E4Z2V001044;
	Fri, 5 May 2017 09:04:36 -0500
From: Pooja Prajod <a0132412@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 5 May 2017 19:34:31 +0530
Message-ID: <1493993071-109815-1-git-send-email-a0132412@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: Pooja Prajod <a0132412@ti.com>
Subject: [meta-arago/morty] gstreamer1.0-plugins-vpe: Update SRC_REV and bump PR
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
X-List-Received-Date: Fri, 05 May 2017 14:04:37 -0000
Content-Type: text/plain

Update SRC_REV to pick the following bug fixes:
1. gstvpe: Keep a copy of the negotiated v4l2 format
2. gstvpe: Change NV12 buffer to use one plane instead of two

Signed-off-by: Pooja Prajod <a0132412@ti.com>
---
 .../recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
index e0fb640..a991e00 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 require gstreamer1.0-plugins-ti.inc
 
-PR = "${INC_PR}.14"
-SRCREV = "6ec1a9c9fc17e0cae781aed067a2a6f2c1f92d68"
+PR = "${INC_PR}.15"
+SRCREV = "3c44b9f4769d8a2b1e3b3441d789a62047c7f940"
 
 SRC_URI = "git://git.ti.com/glsdk/gst-plugin-vpe.git;protocol=git \
            file://ti-video.conf \
-- 
1.9.1


