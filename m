Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id A0774529CE
	for <meta-arago@arago-project.org>;
	Mon, 17 Feb 2020 17:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D2E4E40C0E;
	Mon, 17 Feb 2020 17:19:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id lc8XkFhsLEgX; Mon, 17 Feb 2020 17:19:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B580040BFD;
	Mon, 17 Feb 2020 17:19:25 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 4AEFE174408;
	Mon, 17 Feb 2020 12:19:24 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 17 Feb 2020 12:19:22 -0500
Message-Id: <1581959963-41208-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581959963-41208-1-git-send-email-denis@denix.org>
References: <1581959963-41208-1-git-send-email-denis@denix.org>
Subject: [zeus/master][PATCH 2/3] HACK: packagegroups: disable armnn and voxelsdk, require protobuf regeneration
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
X-List-Received-Date: Mon, 17 Feb 2020 17:21:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb     | 6 ++++--
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb   | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 6eb9b6a..26925f2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -155,8 +155,10 @@ EXTRA_LIBS_append_k2e = " libulm-staticdev \
                               gdbserver-c6x-dev \
 "
 
-ARMNN_PACKAGES = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'armnn-dev', '', d)}"
-VOXEL_PACKAGES = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'voxelsdk-dev', '', d)}"
+ARMNN_PACKAGES = ""
+VOXEL_PACKAGES = ""
+#ARMNN_PACKAGES = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'armnn-dev', '', d)}"
+#VOXEL_PACKAGES = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'voxelsdk-dev', '', d)}"
 
 EXTRA_PACKAGES = ""
 EXTRA_PACKAGES_append_ti33x = " ${VOXEL_PACKAGES} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 2c079d6..7845893 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -148,8 +148,10 @@ EXTRA_PACKAGES_omapl138 = " \
     protobuf \
 "
 
-ARMNN_PACKAGES = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'armnn', '', d)}"
-VOXEL_PACKAGES = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'voxelsdk', '', d)}"
+ARMNN_PACKAGES = ""
+VOXEL_PACKAGES = ""
+#ARMNN_PACKAGES = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'armnn', '', d)}"
+#VOXEL_PACKAGES = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'voxelsdk', '', d)}"
 
 EXTRA_PACKAGES_append_ti33x = " ${VOXEL_PACKAGES} \
                                 arm-compute-library \
-- 
2.7.4


