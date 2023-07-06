Return-Path: <j-luthra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2FFAC0015E
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 03:55:37 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.14142.1688615732681719417
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 20:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xgpUgfGi;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: j-luthra@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3663tUfj063605;
	Wed, 5 Jul 2023 22:55:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688615730;
	bh=nkuilAkevsSHtk3IK4AcvL65+pu1XCv9FQfwRQ+4Bxc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xgpUgfGiNdzr/LyFWCrqz8vQOkafNAdcvV/Ew7o/xBZNDZfBS9Tk/8E+G2PY4fZo5
	 WO8FXYpdRX5yq4BnBlXs0fdYDKcMQKJ1waBGpT7UvPu2UXrAYhDap4TgNxEXYu7Ft7
	 W78xWhelMB7CjA0UI92pMGIbo2Qcs+Hw8rxYioDo=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3663tUTk003802
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Jul 2023 22:55:30 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jul 2023 22:55:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Jul 2023 22:55:29 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3663tTnS054432;
	Wed, 5 Jul 2023 22:55:29 -0500
From: Jai Luthra <j-luthra@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Gyan
 Gupta <g-gupta@ti.com>, Sai Sree Kartheek Adivi <s-adivi@ti.com>,
        Chirag
 Shilwant <c-shilwant@ti.com>,
        Devarsh Thakkar <devarsht@ti.com>, Jai Luthra
	<j-luthra@ti.com>
Subject: [master/kirkstone][PATCH v2 3/3] meta-arago-distro: Package libcamera in tisdk
Date: Thu, 6 Jul 2023 09:25:22 +0530
Message-ID: <20230706035522.1817402-3-j-luthra@ti.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706035522.1817402-1-j-luthra@ti.com>
References: <20230706035522.1817402-1-j-luthra@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 03:55:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14760

Libcamera is useful for testing simple camera pipelines, without
requiring manual configuration of media graph for all v4l2-subdevs.

Enable it for TISDK images, along with the optional package for the
libcamerasrc gstreamer element [1]

Link: https://github.com/libcamera-org/libcamera/blob/master/src/gstreamer/gstlibcamerasrc.cpp [1]
Signed-off-by: Jai Luthra <j-luthra@ti.com>
---

v2: Add link to the gstreamer element
Link to v1: https://lore.kernel.org/all/20230705130928.1201894-3-j-luthra@ti.com/

 meta-arago-distro/conf/distro/arago.conf                       | 3 +++
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb       | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index e0087ab7..bb074478 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -128,6 +128,9 @@ PACKAGECONFIG:append:pn-gstreamer1.0 = " tracer-hooks"
 # Enable kmssink in gstreamer
 PACKAGECONFIG:append:pn-gstreamer1.0-plugins-bad = " kms"
 
+# Enable gstreamer plugin for libcamera
+PACKAGECONFIG:append:pn-libcamera = " gst"
+
 # Disable pulseaudio routing in alsa by default
 PACKAGECONFIG:remove:pn-alsa-plugins = "pulseaudio"
 RDEPENDS:pulseaudio-server:remove = "alsa-plugins-pulseaudio-conf"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index d06fbb6f..b4148882 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -8,6 +8,8 @@ inherit packagegroup
 
 MULTIMEDIA = " \
     amsdk-av-files \
+    libcamera \
+    libcamera-gst \
 "
 
 MULTIMEDIA:omapl138 = ""
-- 
2.41.0


