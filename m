Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 19E54529FC
	for <meta-arago@arago-project.org>;
	Thu, 30 Apr 2020 17:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E5A0C40C0F;
	Thu, 30 Apr 2020 17:02:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id m-hqakFiVjgp; Thu, 30 Apr 2020 17:02:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 729C5400E7;
	Thu, 30 Apr 2020 17:02:37 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DDBBB17272F;
	Thu, 30 Apr 2020 13:02:36 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 30 Apr 2020 13:02:33 -0400
Message-Id: <1588266153-49990-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Benoit Parrot <bparrot@ti.com>
Subject: [PATCH] gstreamer1.0-plugins-vpe: drop modprobe config for ti-vip and ti-vpe
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
X-List-Received-Date: Thu, 30 Apr 2020 17:05:01 -0000

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit 167b8838b5c03cb52fdec3610fe987f302d8c635.

Back in 2016 the plugin was updated to use the
/dev/v4l/by-path/platform-489d0000.vpe-video-index0 which is stable across
boot regardless of boot order.

See, https://git.ti.com/cgit/glsdk/gst-plugin-vpe/commit/?id=f1d4d67fa7a76f97a49114b1543ee72ecb0192f0

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Benoit Parrot <bparrot@ti.com>
---
 .../gst-plugins-ti/gstreamer1.0-plugins-vpe/ti-video.conf           | 1 -
 .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb                  | 6 ------
 2 files changed, 7 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/ti-video.conf

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/ti-video.conf b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/ti-video.conf
deleted file mode 100644
index 339a0c1..0000000
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/ti-video.conf
+++ /dev/null
@@ -1 +0,0 @@
-install ti-vip /sbin/modprobe ti-vpe; /sbin/modprobe --ignore-install ti-vip
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
index 96c678d..841a403 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
@@ -13,11 +13,5 @@ PR = "${INC_PR}.20"
 SRCREV = "b9dba5a8bc7d14d55125abdce04672e3dc30bbdf"
 
 SRC_URI = "git://git.ti.com/glsdk/gst-plugin-vpe.git;protocol=git \
-           file://ti-video.conf \
            file://0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch \
 "
-
-do_install_append() {
-    install -d ${D}/etc/modprobe.d
-    install -m 644 ${WORKDIR}/ti-video.conf ${D}/etc/modprobe.d
-}
-- 
2.7.4


