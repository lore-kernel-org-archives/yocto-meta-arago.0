Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 8BB2A52A60
	for <meta-arago@arago-project.org>;
	Sat, 16 May 2020 02:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 961D340C20;
	Sat, 16 May 2020 02:46:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ND6G6wx-TMmG; Sat, 16 May 2020 02:46:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7CE0A409E7;
	Sat, 16 May 2020 02:46:41 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 42D621730D6;
	Fri, 15 May 2020 22:46:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 15 May 2020 22:46:41 -0400
Message-Id: <1589597201-44616-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell/master][PATCH] packagegroup-*-sdk-host: add new ti-sci-fw source package to SDK
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
X-List-Received-Date: Sat, 16 May 2020 02:49:08 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-source-ipk.inc            | 4 ----
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb         | 1 +
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
index 39d3be8..95a27bf 100644
--- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
+++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
@@ -398,9 +398,5 @@ SRCIPK_INSTALL_DIR_pn-vlib-c66x = "component-sources/vlib_c66x_${PV}"
 CREATE_SRCIPK_pn-big-data-ipc-demo-linux = "1"
 SRCIPK_INSTALL_DIR_pn-big-data-ipc-demo-linux = "example-applications/${PN}-${PV}"
 
-CREATE_SRCIPK_pn-ti-sci-fw_k3 = "1"
-SRCIPK_SRC_DIR_pn-ti-sci-fw_k3 = "${WORKDIR}/imggen"
-SRCIPK_INSTALL_DIR_pn-ti-sci-fw_k3 = "board-support/system-firmware-image-gen-${PV}"
-
 CREATE_SRCIPK_pn-jailhouse = "1"
 SRCIPK_INSTALL_DIR_pn-jailhouse = "board-support/extra-drivers/${PN}-${PV}"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index 4bc236f..9336687 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -38,6 +38,7 @@ UTILS_append_k2g = " \
 
 UTILS_append_k3 = " \
     jailhouse-src \
+    ti-sci-fw-source \
     arm-trusted-firmware-src \
 "
 
-- 
2.7.4


