Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id A8E2B529A5
	for <meta-arago@arago-project.org>;
	Wed,  5 Feb 2020 16:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DF3F040C2E;
	Wed,  5 Feb 2020 16:24:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id PwnYRUhIegiV; Wed,  5 Feb 2020 16:24:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B56B540C0A;
	Wed,  5 Feb 2020 16:24:48 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 617121743D8;
	Wed,  5 Feb 2020 11:24:47 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed,  5 Feb 2020 11:24:45 -0500
Message-Id: <1580919886-43718-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580919886-43718-1-git-send-email-denis@denix.org>
References: <1580919886-43718-1-git-send-email-denis@denix.org>
Subject: [RFC][PATCH 2/3] ti-demos: only install packages on compatible platforms
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
X-List-Received-Date: Wed, 05 Feb 2020 16:26:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/ti-demos.bb              | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
index 20d73b9..a20ed05 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
@@ -1,9 +1,22 @@
 SUMMARY = "TI World packagegroup"
 LICENSE = "MIT"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 inherit packagegroup
 
+VOXEL = ""
+VOXEL_ti33x = "voxelsdk"
+VOXEL_ti43x = "voxelsdk"
+VOXEL_omap-a15 = "voxelsdk"
+
+PDM_ANOMALY = ""
+PDM_ANOMALY_ti33x = "pdm-anomaly-detection"
+PDM_ANOMALY_ti43x = "pdm-anomaly-detection"
+PDM_ANOMALY_omap-a15 = "pdm-anomaly-detection"
+PDM_ANOMALY_am65xx = "pdm-anomaly-detection"
+
 RDEPENDS_${PN} = "\
-    voxelsdk \
-    pdm-anomaly-detection \
+    ${VOXEL} \
+    ${PDM_ANOMALY} \
 "
-- 
2.7.4


