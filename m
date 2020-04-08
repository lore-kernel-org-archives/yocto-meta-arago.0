Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 598F152AA3
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2020 00:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5827B40A6E;
	Wed,  8 Apr 2020 00:45:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id uX97J-01s6H1; Wed,  8 Apr 2020 00:45:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 40C4240C1F;
	Wed,  8 Apr 2020 00:45:11 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 40F6C171C39;
	Tue,  7 Apr 2020 20:45:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  7 Apr 2020 20:44:54 -0400
Message-Id: <1586306702-7953-16-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586306702-7953-1-git-send-email-denis@denix.org>
References: <1586306702-7953-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 16/24] tiovx-app-host: require opencv distro feature, cleanup
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
X-List-Received-Date: Wed, 08 Apr 2020 00:47:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-ti/tiovx/tiovx-app-host.bb | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/tiovx/tiovx-app-host.bb b/meta-arago-extras/recipes-ti/tiovx/tiovx-app-host.bb
index 1480d5c..7400681 100644
--- a/meta-arago-extras/recipes-ti/tiovx/tiovx-app-host.bb
+++ b/meta-arago-extras/recipes-ti/tiovx/tiovx-app-host.bb
@@ -1,5 +1,7 @@
-SUMMARY = "TI OpenVX HOST (Linux A15) conformance verification application, Khronos tutorial example, and Host side IPC implementation "
-DESCRIPTION = "TI OpenVX implementation, TIOVX, includes Khronos defined conformance test and tutorial example, as well as additional TI specific tests. This package creates application which runs all the conformance tests (7K-8K) and Khronos tutorial exercise1. Same package includes IPC implementation (MessageQ based) needed for communication with DSP firmware (loaded at boot time) "
+SUMMARY = "TI OpenVX HOST (Linux A15) conformance verification application, Khronos tutorial example, and Host side IPC implementation"
+DESCRIPTION = "TI OpenVX implementation, TIOVX, includes Khronos defined conformance test and tutorial example, as well as additional TI \
+specific tests. This package creates application which runs all the conformance tests (7K-8K) and Khronos tutorial exercise1. \
+Same package includes IPC implementation (MessageQ based) needed for communication with DSP firmware (loaded at boot time)"
 
 LICENSE = "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM = "file://docs/manifest/TIOVX-APP-HOST_01.00.01.00_manifest.html;md5=247d7c56d783f583bf802490d5c93db3"
@@ -10,13 +12,15 @@ SRC_URI_append += "\
      file://setenv.sh \
 "
 
-inherit pkgconfig
+inherit pkgconfig features_check
+
+REQUIRED_DISTRO_FEATURES = "opencv"
 
 require recipes-ti/includes/arago-paths.inc
 require tiovx-sys.inc
 
-DEPENDS = " tiovx-sys-iface tiovx-lib-host ti-ipc cmem opencv udev"
-RDEPENDS_${PN} = " tiovx-sys-iface tiovx-sys-iface-firmware tiovx-lib-host ti-ipc cmem"
+DEPENDS = "tiovx-sys-iface tiovx-lib-host ti-ipc cmem opencv udev"
+RDEPENDS_${PN} = "tiovx-sys-iface tiovx-sys-iface-firmware tiovx-lib-host ti-ipc cmem"
 
 PR = "r3"
 
-- 
2.7.4


