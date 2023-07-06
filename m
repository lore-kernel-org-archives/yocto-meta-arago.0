Return-Path: <j-luthra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8323EB64DC
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 04:17:07 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.14415.1688617021249996818
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 21:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vgLYmdJd;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: j-luthra@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3664GxA4068729;
	Wed, 5 Jul 2023 23:16:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688617019;
	bh=tQPVE/23NW5fEgq/BwddeAABySVnYss1gNwohu66fTc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vgLYmdJd8zcWXvqFZGxqpteP6uUX5Ri8FxO5BOW5F2TrWB8SKg6tJgLaTXjiQEnrd
	 i3f4S7cc79M7WSkG6Usjj0y0rGahROj7KeNWinbEYxhiFnHVbkdw+xkxKaEojl5Bv6
	 CN6D2h8LyTcQTx5wDqsf8AIWwZY0tnROYEZvEbjA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3664Gx5A017410
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Jul 2023 23:16:59 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jul 2023 23:16:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Jul 2023 23:16:59 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3664Gw4i037523;
	Wed, 5 Jul 2023 23:16:59 -0500
From: Jai Luthra <j-luthra@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Gyan
 Gupta <g-gupta@ti.com>, Sai Sree Kartheek Adivi <s-adivi@ti.com>,
        Chirag
 Shilwant <c-shilwant@ti.com>,
        Devarsh Thakkar <devarsht@ti.com>, Jai Luthra
	<j-luthra@ti.com>
Subject: [master/kirkstone][PATCH v3 3/3] meta-arago-distro: Package libcamera in tisdk
Date: Thu, 6 Jul 2023 09:46:52 +0530
Message-ID: <20230706041652.1843102-3-j-luthra@ti.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706041652.1843102-1-j-luthra@ti.com>
References: <20230706041652.1843102-1-j-luthra@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 04:17:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14765

Libcamera is useful for testing simple camera pipelines, without
requiring manual configuration of media graph for all v4l2-subdevs.

Enable it for TISDK images, along with the optional package for the
libcamerasrc gstreamer element [1]

Link: https://github.com/libcamera-org/libcamera/blob/master/src/gstreamer/gstlibcamerasrc.cpp [1]
Signed-off-by: Jai Luthra <j-luthra@ti.com>
---

v3: No changes
Link to v2: https://lore.kernel.org/all/20230706035522.1817402-3-j-luthra@ti.com/

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


