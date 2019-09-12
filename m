Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 7DF5752A4D
	for <meta-arago@arago-project.org>;
	Thu, 12 Sep 2019 15:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7517C40C10;
	Thu, 12 Sep 2019 15:38:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id nFvQvOhnyF7T; Thu, 12 Sep 2019 15:38:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 586CE40C0E;
	Thu, 12 Sep 2019 15:38:48 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D2AEC17421C;
	Thu, 12 Sep 2019 11:38:44 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 12 Sep 2019 11:38:33 -0400
Message-Id: <1568302717-46518-29-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568302717-46518-1-git-send-email-denys@ti.com>
References: <1568302717-46518-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 28/32] voxelsdk, packagegroups: require "dsp" machine feature
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
X-List-Received-Date: Thu, 12 Sep 2019 15:40:11 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-apps/voxelsdk/voxelsdk_%.bbappend        | 3 +++
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb    | 7 ++++---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb  | 7 ++++---
 3 files changed, 11 insertions(+), 6 deletions(-)
 create mode 100644 meta-arago-distro/recipes-apps/voxelsdk/voxelsdk_%.bbappend

diff --git a/meta-arago-distro/recipes-apps/voxelsdk/voxelsdk_%.bbappend b/meta-arago-distro/recipes-apps/voxelsdk/voxelsdk_%.bbappend
new file mode 100644
index 0000000..bc885a4
--- /dev/null
+++ b/meta-arago-distro/recipes-apps/voxelsdk/voxelsdk_%.bbappend
@@ -0,0 +1,3 @@
+inherit machine_features_check
+
+REQUIRED_MACHINE_FEATURES = "dsp"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 5d9f56e..a59d796 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -154,19 +154,20 @@ EXTRA_LIBS_append_k2e = " libulm-staticdev \
 "
 
 ARMNN_PACKAGES = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'armnn-dev', '', d)}"
+VOXEL_PACKAGES = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'voxelsdk-dev', '', d)}"
 
 EXTRA_PACKAGES = ""
-EXTRA_PACKAGES_append_ti33x = " voxelsdk-dev \
+EXTRA_PACKAGES_append_ti33x = " ${VOXEL_PACKAGES} \
                                 arm-compute-library-dev \
                                 ${ARMNN_PACKAGES} \
                                 pdm-anomaly-detection-dev \
 "
-EXTRA_PACKAGES_append_ti43x = " voxelsdk-dev \
+EXTRA_PACKAGES_append_ti43x = " ${VOXEL_PACKAGES} \
                                 arm-compute-library-dev \
                                 ${ARMNN_PACKAGES} \
                                 pdm-anomaly-detection-dev \
 "
-EXTRA_PACKAGES_append_omap-a15 = " voxelsdk-dev \
+EXTRA_PACKAGES_append_omap-a15 = " ${VOXEL_PACKAGES} \
                                 arm-compute-library-dev \
                                 ${ARMNN_PACKAGES} \
                                 pdm-anomaly-detection-dev \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index b6380e3..3542a84 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -149,20 +149,21 @@ EXTRA_PACKAGES_omapl138 = " \
 "
 
 ARMNN_PACKAGES = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'armnn', '', d)}"
+VOXEL_PACKAGES = "${@bb.utils.contains('MACHINE_FEATURES', 'dsp', 'voxelsdk', '', d)}"
 
-EXTRA_PACKAGES_append_ti33x = " voxelsdk \
+EXTRA_PACKAGES_append_ti33x = " ${VOXEL_PACKAGES} \
                                 arm-compute-library \
                                 ${ARMNN_PACKAGES} \
                                 pdm-anomaly-detection \
 "
 
-EXTRA_PACKAGES_append_ti43x = " voxelsdk \
+EXTRA_PACKAGES_append_ti43x = " ${VOXEL_PACKAGES} \
                                 arm-compute-library \
                                 ${ARMNN_PACKAGES} \
                                 pdm-anomaly-detection \
 "
 
-EXTRA_PACKAGES_append_omap-a15 = " voxelsdk \
+EXTRA_PACKAGES_append_omap-a15 = " ${VOXEL_PACKAGES} \
                                    big-data-ipc-demo-linux \
                                    big-data-ipc-demo-linux-firmware \
                                    arm-compute-library \
-- 
2.7.4


