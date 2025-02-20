Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9693C021B3
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 23:19:19 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.11271.1740093550416443416
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Feb 2025 15:19:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=osR5ddQp;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51KNJ9Yb699210
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Feb 2025 17:19:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740093549;
	bh=ngfwjPg/R+VEyZTLFx/1BFKkkiImLyo3yPyJFfM6/qY=;
	h=From:To:Subject:Date;
	b=osR5ddQpm/egAcl/1bV5CbtJ2gjfYnuvhUwPuLNm6MWOuByddd4P0t+fLgMiTW0+u
	 xxlnpDM+Strjr1ifNRoqZ5hmV9LyigfkvGDL5OhR2552SmujTq9CtjS/U/pQoCYm4j
	 g1YXE46vCjf8BHx+jk2P3VVJarPi9aGsMX/MlymE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51KNJ9bw022441
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Feb 2025 17:19:09 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Feb 2025 17:19:08 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Feb 2025 17:19:08 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51KNJ8R7074490;
	Thu, 20 Feb 2025 17:19:08 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tlFoy-0006iy-Nz; Thu, 20 Feb 2025 17:19:08 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] templates: Fix paths for DL_DIR and SSTATE_DIR
Date: Thu, 20 Feb 2025 17:19:08 -0600
Message-ID: <20250220231908.25809-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Feb 2025 23:19:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15885

When the conversion to the new XML/XSLT system was done, the reference
to OEBASE was converted to TOPDIR.  The value for OEBASE was
historically the directory above the bitbake run dir which is what
TOPDIR is set to.  This made the downloads and sstate_cache directories
appear down a level of directory that was unintended.

This change updates the values for DL_DIR and SSTATE_DIR to be relative
to TOPDIR but back in the same location they were originally meant to be
in.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 conf/templates/arago-master-chromium-config/local.conf.sample | 4 ++--
 conf/templates/arago-master-config/local.conf.sample          | 4 ++--
 conf/templates/arago-master-next-config/local.conf.sample     | 4 ++--
 conf/templates/arago-master-selinux-config/local.conf.sample  | 4 ++--
 conf/templates/arago-master-wip-config/local.conf.sample      | 4 ++--
 .../arago-scarthgap-chromium-config/local.conf.sample         | 4 ++--
 conf/templates/arago-scarthgap-config/local.conf.sample       | 4 ++--
 conf/templates/arago-scarthgap-next-config/local.conf.sample  | 4 ++--
 .../arago-scarthgap-selinux-config/local.conf.sample          | 4 ++--
 conf/templates/arago-scarthgap-wip-config/local.conf.sample   | 4 ++--
 configs/arago-master-wip-config.txt                           | 2 +-
 kas/templates/local-arago64-v2.conf.yml                       | 4 ++--
 kas/templates/local-arago64-v3.conf.yml                       | 4 ++--
 kas/templates/local-poky-v2.conf.yml                          | 4 ++--
 kas/templates/local-poky-v3.conf.yml                          | 4 ++--
 kas/templates/local-v2.conf.yml                               | 4 ++--
 kas/templates/local-v3.conf.yml                               | 4 ++--
 sample-files/local-arago64-v2.conf.sample                     | 4 ++--
 sample-files/local-arago64-v3.conf.sample                     | 4 ++--
 sample-files/local-poky-v2.conf.sample                        | 4 ++--
 sample-files/local-poky-v3.conf.sample                        | 4 ++--
 sample-files/local-v2.conf.sample                             | 4 ++--
 sample-files/local-v3.conf.sample                             | 4 ++--
 src/bin/convert.pl                                            | 2 +-
 src/templates/local-arago64-v2.conf.xml                       | 4 ++--
 src/templates/local-arago64-v3.conf.xml                       | 4 ++--
 src/templates/local-poky-v2.conf.xml                          | 4 ++--
 src/templates/local-poky-v3.conf.xml                          | 4 ++--
 src/templates/local-v2.conf.xml                               | 4 ++--
 src/templates/local-v3.conf.xml                               | 4 ++--
 30 files changed, 58 insertions(+), 58 deletions(-)

diff --git a/conf/templates/arago-master-chromium-config/local.conf.sample b/conf/templates/arago-master-chromium-config/local.conf.sample
index f2e9587..720ce11 100644
--- a/conf/templates/arago-master-chromium-config/local.conf.sample
+++ b/conf/templates/arago-master-chromium-config/local.conf.sample
@@ -10,7 +10,7 @@ CONF_VERSION = "2"
 # wiping and rebuilding you can preserve this directory to speed up this part
 # of subsequent builds. This directory is safe to share between multiple builds
 # on the same machine too.
-DL_DIR = "${TOPDIR}/downloads"
+DL_DIR = "${TOPDIR}/../downloads"
 
 #
 # Where to place shared-state files
@@ -23,7 +23,7 @@ DL_DIR = "${TOPDIR}/downloads"
 # regenerate from these files if no changes were made to the configuration.
 # If changes were made to the configuration, only shared state files where the
 # state was still valid would be used (done using checksums).
-SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
+SSTATE_DIR = "${TOPDIR}/sstate-cache"
 
 #
 # Shared-state files from other locations
diff --git a/conf/templates/arago-master-config/local.conf.sample b/conf/templates/arago-master-config/local.conf.sample
index f2e9587..720ce11 100644
--- a/conf/templates/arago-master-config/local.conf.sample
+++ b/conf/templates/arago-master-config/local.conf.sample
@@ -10,7 +10,7 @@ CONF_VERSION = "2"
 # wiping and rebuilding you can preserve this directory to speed up this part
 # of subsequent builds. This directory is safe to share between multiple builds
 # on the same machine too.
-DL_DIR = "${TOPDIR}/downloads"
+DL_DIR = "${TOPDIR}/../downloads"
 
 #
 # Where to place shared-state files
@@ -23,7 +23,7 @@ DL_DIR = "${TOPDIR}/downloads"
 # regenerate from these files if no changes were made to the configuration.
 # If changes were made to the configuration, only shared state files where the
 # state was still valid would be used (done using checksums).
-SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
+SSTATE_DIR = "${TOPDIR}/sstate-cache"
 
 #
 # Shared-state files from other locations
diff --git a/conf/templates/arago-master-next-config/local.conf.sample b/conf/templates/arago-master-next-config/local.conf.sample
index 6c32f4b..c1549ac 100644
--- a/conf/templates/arago-master-next-config/local.conf.sample
+++ b/conf/templates/arago-master-next-config/local.conf.sample
@@ -10,7 +10,7 @@ CONF_VERSION = "2"
 # wiping and rebuilding you can preserve this directory to speed up this part
 # of subsequent builds. This directory is safe to share between multiple builds
 # on the same machine too.
-DL_DIR = "${TOPDIR}/downloads"
+DL_DIR = "${TOPDIR}/../downloads"
 
 #
 # Where to place shared-state files
@@ -23,7 +23,7 @@ DL_DIR = "${TOPDIR}/downloads"
 # regenerate from these files if no changes were made to the configuration.
 # If changes were made to the configuration, only shared state files where the
 # state was still valid would be used (done using checksums).
-SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
+SSTATE_DIR = "${TOPDIR}/sstate-cache"
 
 #
 # Shared-state files from other locations
diff --git a/conf/templates/arago-master-selinux-config/local.conf.sample b/conf/templates/arago-master-selinux-config/local.conf.sample
index 5cc19d4..dfb4873 100644
--- a/conf/templates/arago-master-selinux-config/local.conf.sample
+++ b/conf/templates/arago-master-selinux-config/local.conf.sample
@@ -10,7 +10,7 @@ CONF_VERSION = "2"
 # wiping and rebuilding you can preserve this directory to speed up this part
 # of subsequent builds. This directory is safe to share between multiple builds
 # on the same machine too.
-DL_DIR = "${TOPDIR}/downloads"
+DL_DIR = "${TOPDIR}/../downloads"
 
 #
 # Where to place shared-state files
@@ -23,7 +23,7 @@ DL_DIR = "${TOPDIR}/downloads"
 # regenerate from these files if no changes were made to the configuration.
 # If changes were made to the configuration, only shared state files where the
 # state was still valid would be used (done using checksums).
-SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
+SSTATE_DIR = "${TOPDIR}/sstate-cache"
 
 #
 # Shared-state files from other locations
diff --git a/conf/templates/arago-master-wip-config/local.conf.sample b/conf/templates/arago-master-wip-config/local.conf.sample
index f2e9587..720ce11 100644
--- a/conf/templates/arago-master-wip-config/local.conf.sample
+++ b/conf/templates/arago-master-wip-config/local.conf.sample
@@ -10,7 +10,7 @@ CONF_VERSION = "2"
 # wiping and rebuilding you can preserve this directory to speed up this part
 # of subsequent builds. This directory is safe to share between multiple builds
 # on the same machine too.
-DL_DIR = "${TOPDIR}/downloads"
+DL_DIR = "${TOPDIR}/../downloads"
 
 #
 # Where to place shared-state files
@@ -23,7 +23,7 @@ DL_DIR = "${TOPDIR}/downloads"
 # regenerate from these files if no changes were made to the configuration.
 # If changes were made to the configuration, only shared state files where the
 # state was still valid would be used (done using checksums).
-SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
+SSTATE_DIR = "${TOPDIR}/sstate-cache"
 
 #
 # Shared-state files from other locations
diff --git a/conf/templates/arago-scarthgap-chromium-config/local.conf.sample b/conf/templates/arago-scarthgap-chromium-config/local.conf.sample
index 7575b4b..8ad6f26 100644
--- a/conf/templates/arago-scarthgap-chromium-config/local.conf.sample
+++ b/conf/templates/arago-scarthgap-chromium-config/local.conf.sample
@@ -10,7 +10,7 @@ CONF_VERSION = "2"
 # wiping and rebuilding you can preserve this directory to speed up this part
 # of subsequent builds. This directory is safe to share between multiple builds
 # on the same machine too.
-DL_DIR = "${TOPDIR}/downloads"
+DL_DIR = "${TOPDIR}/../downloads"
 
 #
 # Where to place shared-state files
@@ -23,7 +23,7 @@ DL_DIR = "${TOPDIR}/downloads"
 # regenerate from these files if no changes were made to the configuration.
 # If changes were made to the configuration, only shared state files where the
 # state was still valid would be used (done using checksums).
-SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
+SSTATE_DIR = "${TOPDIR}/sstate-cache"
 
 #
 # Shared-state files from other locations
diff --git a/conf/templates/arago-scarthgap-config/local.conf.sample b/conf/templates/arago-scarthgap-config/local.conf.sample
index 7575b4b..8ad6f26 100644
--- a/conf/templates/arago-scarthgap-config/local.conf.sample
+++ b/conf/templates/arago-scarthgap-config/local.conf.sample
@@ -10,7 +10,7 @@ CONF_VERSION = "2"
 # wiping and rebuilding you can preserve this directory to speed up this part
 # of subsequent builds. This directory is safe to share between multiple builds
 # on the same machine too.
-DL_DIR = "${TOPDIR}/downloads"
+DL_DIR = "${TOPDIR}/../downloads"
 
 #
 # Where to place shared-state files
@@ -23,7 +23,7 @@ DL_DIR = "${TOPDIR}/downloads"
 # regenerate from these files if no changes were made to the configuration.
 # If changes were made to the configuration, only shared state files where the
 # state was still valid would be used (done using checksums).
-SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
+SSTATE_DIR = "${TOPDIR}/sstate-cache"
 
 #
 # Shared-state files from other locations
diff --git a/conf/templates/arago-scarthgap-next-config/local.conf.sample b/conf/templates/arago-scarthgap-next-config/local.conf.sample
index dbb184b..3ad6481 100644
--- a/conf/templates/arago-scarthgap-next-config/local.conf.sample
+++ b/conf/templates/arago-scarthgap-next-config/local.conf.sample
@@ -10,7 +10,7 @@ CONF_VERSION = "2"
 # wiping and rebuilding you can preserve this directory to speed up this part
 # of subsequent builds. This directory is safe to share between multiple builds
 # on the same machine too.
-DL_DIR = "${TOPDIR}/downloads"
+DL_DIR = "${TOPDIR}/../downloads"
 
 #
 # Where to place shared-state files
@@ -23,7 +23,7 @@ DL_DIR = "${TOPDIR}/downloads"
 # regenerate from these files if no changes were made to the configuration.
 # If changes were made to the configuration, only shared state files where the
 # state was still valid would be used (done using checksums).
-SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
+SSTATE_DIR = "${TOPDIR}/sstate-cache"
 
 #
 # Shared-state files from other locations
diff --git a/conf/templates/arago-scarthgap-selinux-config/local.conf.sample b/conf/templates/arago-scarthgap-selinux-config/local.conf.sample
index 46869ad..c862657 100644
--- a/conf/templates/arago-scarthgap-selinux-config/local.conf.sample
+++ b/conf/templates/arago-scarthgap-selinux-config/local.conf.sample
@@ -10,7 +10,7 @@ CONF_VERSION = "2"
 # wiping and rebuilding you can preserve this directory to speed up this part
 # of subsequent builds. This directory is safe to share between multiple builds
 # on the same machine too.
-DL_DIR = "${TOPDIR}/downloads"
+DL_DIR = "${TOPDIR}/../downloads"
 
 #
 # Where to place shared-state files
@@ -23,7 +23,7 @@ DL_DIR = "${TOPDIR}/downloads"
 # regenerate from these files if no changes were made to the configuration.
 # If changes were made to the configuration, only shared state files where the
 # state was still valid would be used (done using checksums).
-SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
+SSTATE_DIR = "${TOPDIR}/sstate-cache"
 
 #
 # Shared-state files from other locations
diff --git a/conf/templates/arago-scarthgap-wip-config/local.conf.sample b/conf/templates/arago-scarthgap-wip-config/local.conf.sample
index 7575b4b..8ad6f26 100644
--- a/conf/templates/arago-scarthgap-wip-config/local.conf.sample
+++ b/conf/templates/arago-scarthgap-wip-config/local.conf.sample
@@ -10,7 +10,7 @@ CONF_VERSION = "2"
 # wiping and rebuilding you can preserve this directory to speed up this part
 # of subsequent builds. This directory is safe to share between multiple builds
 # on the same machine too.
-DL_DIR = "${TOPDIR}/downloads"
+DL_DIR = "${TOPDIR}/../downloads"
 
 #
 # Where to place shared-state files
@@ -23,7 +23,7 @@ DL_DIR = "${TOPDIR}/downloads"
 # regenerate from these files if no changes were made to the configuration.
 # If changes were made to the configuration, only shared state files where the
 # state was still valid would be used (done using checksums).
-SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
+SSTATE_DIR = "${TOPDIR}/sstate-cache"
 
 #
 # Shared-state files from other locations
diff --git a/configs/arago-master-wip-config.txt b/configs/arago-master-wip-config.txt
index eb9c49d..165a3d1 100644
--- a/configs/arago-master-wip-config.txt
+++ b/configs/arago-master-wip-config.txt
@@ -5,7 +5,7 @@ bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=meta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
-meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
diff --git a/kas/templates/local-arago64-v2.conf.yml b/kas/templates/local-arago64-v2.conf.yml
index c79388d..c6781be 100644
--- a/kas/templates/local-arago64-v2.conf.yml
+++ b/kas/templates/local-arago64-v2.conf.yml
@@ -15,7 +15,7 @@ local_conf_header:
     # wiping and rebuilding you can preserve this directory to speed up this part
     # of subsequent builds. This directory is safe to share between multiple builds
     # on the same machine too.
-    DL_DIR = "${TOPDIR}/downloads"
+    DL_DIR = "${TOPDIR}/../downloads"
     
     #
     # Where to place shared-state files
@@ -28,7 +28,7 @@ local_conf_header:
     # regenerate from these files if no changes were made to the configuration.
     # If changes were made to the configuration, only shared state files where the
     # state was still valid would be used (done using checksums).
-    SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
+    SSTATE_DIR = "${TOPDIR}/sstate-cache"
     
     #
     # Shared-state files from other locations
diff --git a/kas/templates/local-arago64-v3.conf.yml b/kas/templates/local-arago64-v3.conf.yml
index b182483..3fa683e 100644
--- a/kas/templates/local-arago64-v3.conf.yml
+++ b/kas/templates/local-arago64-v3.conf.yml
@@ -15,7 +15,7 @@ local_conf_header:
     # wiping and rebuilding you can preserve this directory to speed up this part
     # of subsequent builds. This directory is safe to share between multiple builds
     # on the same machine too.
-    DL_DIR = "${TOPDIR}/downloads"
+    DL_DIR = "${TOPDIR}/../downloads"
     
     #
     # Where to place shared-state files
@@ -28,7 +28,7 @@ local_conf_header:
     # regenerate from these files if no changes were made to the configuration.
     # If changes were made to the configuration, only shared state files where the
     # state was still valid would be used (done using checksums).
-    SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
+    SSTATE_DIR = "${TOPDIR}/sstate-cache"
     
     #
     # Shared-state files from other locations
diff --git a/kas/templates/local-poky-v2.conf.yml b/kas/templates/local-poky-v2.conf.yml
index 91995fe..075f535 100644
--- a/kas/templates/local-poky-v2.conf.yml
+++ b/kas/templates/local-poky-v2.conf.yml
@@ -15,7 +15,7 @@ local_conf_header:
     # wiping and rebuilding you can preserve this directory to speed up this part
     # of subsequent builds. This directory is safe to share between multiple builds
     # on the same machine too.
-    DL_DIR = "${TOPDIR}/downloads"
+    DL_DIR = "${TOPDIR}/../downloads"
     
     #
     # Where to place shared-state files
@@ -28,7 +28,7 @@ local_conf_header:
     # regenerate from these files if no changes were made to the configuration.
     # If changes were made to the configuration, only shared state files where the
     # state was still valid would be used (done using checksums).
-    SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
+    SSTATE_DIR = "${TOPDIR}/sstate-cache"
     
     #
     # Shared-state files from other locations
diff --git a/kas/templates/local-poky-v3.conf.yml b/kas/templates/local-poky-v3.conf.yml
index 7368fb0..193a1ce 100644
--- a/kas/templates/local-poky-v3.conf.yml
+++ b/kas/templates/local-poky-v3.conf.yml
@@ -15,7 +15,7 @@ local_conf_header:
     # wiping and rebuilding you can preserve this directory to speed up this part
     # of subsequent builds. This directory is safe to share between multiple builds
     # on the same machine too.
-    DL_DIR = "${TOPDIR}/downloads"
+    DL_DIR = "${TOPDIR}/../downloads"
     
     #
     # Where to place shared-state files
@@ -28,7 +28,7 @@ local_conf_header:
     # regenerate from these files if no changes were made to the configuration.
     # If changes were made to the configuration, only shared state files where the
     # state was still valid would be used (done using checksums).
-    SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
+    SSTATE_DIR = "${TOPDIR}/sstate-cache"
     
     #
     # Shared-state files from other locations
diff --git a/kas/templates/local-v2.conf.yml b/kas/templates/local-v2.conf.yml
index 3d666e4..f33fd45 100644
--- a/kas/templates/local-v2.conf.yml
+++ b/kas/templates/local-v2.conf.yml
@@ -15,7 +15,7 @@ local_conf_header:
     # wiping and rebuilding you can preserve this directory to speed up this part
     # of subsequent builds. This directory is safe to share between multiple builds
     # on the same machine too.
-    DL_DIR = "${TOPDIR}/downloads"
+    DL_DIR = "${TOPDIR}/../downloads"
     
     #
     # Where to place shared-state files
@@ -28,7 +28,7 @@ local_conf_header:
     # regenerate from these files if no changes were made to the configuration.
     # If changes were made to the configuration, only shared state files where the
     # state was still valid would be used (done using checksums).
-    SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
+    SSTATE_DIR = "${TOPDIR}/sstate-cache"
     
     #
     # Shared-state files from other locations
diff --git a/kas/templates/local-v3.conf.yml b/kas/templates/local-v3.conf.yml
index 063b863..07eb5af 100644
--- a/kas/templates/local-v3.conf.yml
+++ b/kas/templates/local-v3.conf.yml
@@ -15,7 +15,7 @@ local_conf_header:
     # wiping and rebuilding you can preserve this directory to speed up this part
     # of subsequent builds. This directory is safe to share between multiple builds
     # on the same machine too.
-    DL_DIR = "${TOPDIR}/downloads"
+    DL_DIR = "${TOPDIR}/../downloads"
     
     #
     # Where to place shared-state files
@@ -28,7 +28,7 @@ local_conf_header:
     # regenerate from these files if no changes were made to the configuration.
     # If changes were made to the configuration, only shared state files where the
     # state was still valid would be used (done using checksums).
-    SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
+    SSTATE_DIR = "${TOPDIR}/sstate-cache"
     
     #
     # Shared-state files from other locations
diff --git a/sample-files/local-arago64-v2.conf.sample b/sample-files/local-arago64-v2.conf.sample
index 7575b4b..8ad6f26 100644
--- a/sample-files/local-arago64-v2.conf.sample
+++ b/sample-files/local-arago64-v2.conf.sample
@@ -10,7 +10,7 @@ CONF_VERSION = "2"
 # wiping and rebuilding you can preserve this directory to speed up this part
 # of subsequent builds. This directory is safe to share between multiple builds
 # on the same machine too.
-DL_DIR = "${TOPDIR}/downloads"
+DL_DIR = "${TOPDIR}/../downloads"
 
 #
 # Where to place shared-state files
@@ -23,7 +23,7 @@ DL_DIR = "${TOPDIR}/downloads"
 # regenerate from these files if no changes were made to the configuration.
 # If changes were made to the configuration, only shared state files where the
 # state was still valid would be used (done using checksums).
-SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
+SSTATE_DIR = "${TOPDIR}/sstate-cache"
 
 #
 # Shared-state files from other locations
diff --git a/sample-files/local-arago64-v3.conf.sample b/sample-files/local-arago64-v3.conf.sample
index f2e9587..720ce11 100644
--- a/sample-files/local-arago64-v3.conf.sample
+++ b/sample-files/local-arago64-v3.conf.sample
@@ -10,7 +10,7 @@ CONF_VERSION = "2"
 # wiping and rebuilding you can preserve this directory to speed up this part
 # of subsequent builds. This directory is safe to share between multiple builds
 # on the same machine too.
-DL_DIR = "${TOPDIR}/downloads"
+DL_DIR = "${TOPDIR}/../downloads"
 
 #
 # Where to place shared-state files
@@ -23,7 +23,7 @@ DL_DIR = "${TOPDIR}/downloads"
 # regenerate from these files if no changes were made to the configuration.
 # If changes were made to the configuration, only shared state files where the
 # state was still valid would be used (done using checksums).
-SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
+SSTATE_DIR = "${TOPDIR}/sstate-cache"
 
 #
 # Shared-state files from other locations
diff --git a/sample-files/local-poky-v2.conf.sample b/sample-files/local-poky-v2.conf.sample
index e67385d..12eacfc 100644
--- a/sample-files/local-poky-v2.conf.sample
+++ b/sample-files/local-poky-v2.conf.sample
@@ -10,7 +10,7 @@ CONF_VERSION = "2"
 # wiping and rebuilding you can preserve this directory to speed up this part
 # of subsequent builds. This directory is safe to share between multiple builds
 # on the same machine too.
-DL_DIR = "${TOPDIR}/downloads"
+DL_DIR = "${TOPDIR}/../downloads"
 
 #
 # Where to place shared-state files
@@ -23,7 +23,7 @@ DL_DIR = "${TOPDIR}/downloads"
 # regenerate from these files if no changes were made to the configuration.
 # If changes were made to the configuration, only shared state files where the
 # state was still valid would be used (done using checksums).
-SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
+SSTATE_DIR = "${TOPDIR}/sstate-cache"
 
 #
 # Shared-state files from other locations
diff --git a/sample-files/local-poky-v3.conf.sample b/sample-files/local-poky-v3.conf.sample
index 1fe5688..e0112c7 100644
--- a/sample-files/local-poky-v3.conf.sample
+++ b/sample-files/local-poky-v3.conf.sample
@@ -10,7 +10,7 @@ CONF_VERSION = "2"
 # wiping and rebuilding you can preserve this directory to speed up this part
 # of subsequent builds. This directory is safe to share between multiple builds
 # on the same machine too.
-DL_DIR = "${TOPDIR}/downloads"
+DL_DIR = "${TOPDIR}/../downloads"
 
 #
 # Where to place shared-state files
@@ -23,7 +23,7 @@ DL_DIR = "${TOPDIR}/downloads"
 # regenerate from these files if no changes were made to the configuration.
 # If changes were made to the configuration, only shared state files where the
 # state was still valid would be used (done using checksums).
-SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
+SSTATE_DIR = "${TOPDIR}/sstate-cache"
 
 #
 # Shared-state files from other locations
diff --git a/sample-files/local-v2.conf.sample b/sample-files/local-v2.conf.sample
index 46cb253..b499977 100644
--- a/sample-files/local-v2.conf.sample
+++ b/sample-files/local-v2.conf.sample
@@ -10,7 +10,7 @@ CONF_VERSION = "2"
 # wiping and rebuilding you can preserve this directory to speed up this part
 # of subsequent builds. This directory is safe to share between multiple builds
 # on the same machine too.
-DL_DIR = "${TOPDIR}/downloads"
+DL_DIR = "${TOPDIR}/../downloads"
 
 #
 # Where to place shared-state files
@@ -23,7 +23,7 @@ DL_DIR = "${TOPDIR}/downloads"
 # regenerate from these files if no changes were made to the configuration.
 # If changes were made to the configuration, only shared state files where the
 # state was still valid would be used (done using checksums).
-SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
+SSTATE_DIR = "${TOPDIR}/sstate-cache"
 
 #
 # Shared-state files from other locations
diff --git a/sample-files/local-v3.conf.sample b/sample-files/local-v3.conf.sample
index bcdaaa4..7d218e8 100644
--- a/sample-files/local-v3.conf.sample
+++ b/sample-files/local-v3.conf.sample
@@ -10,7 +10,7 @@ CONF_VERSION = "2"
 # wiping and rebuilding you can preserve this directory to speed up this part
 # of subsequent builds. This directory is safe to share between multiple builds
 # on the same machine too.
-DL_DIR = "${TOPDIR}/downloads"
+DL_DIR = "${TOPDIR}/../downloads"
 
 #
 # Where to place shared-state files
@@ -23,7 +23,7 @@ DL_DIR = "${TOPDIR}/downloads"
 # regenerate from these files if no changes were made to the configuration.
 # If changes were made to the configuration, only shared state files where the
 # state was still valid would be used (done using checksums).
-SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
+SSTATE_DIR = "${TOPDIR}/sstate-cache"
 
 #
 # Shared-state files from other locations
diff --git a/src/bin/convert.pl b/src/bin/convert.pl
index 2787b86..42b9c2c 100755
--- a/src/bin/convert.pl
+++ b/src/bin/convert.pl
@@ -501,7 +501,7 @@ sub convert_local_conf_template
     {
         chomp($lpLine);
 
-        $lpLine =~ s/OEBASE/TOPDIR/;
+        $lpLine =~ s/OEBASE/TOPDIR\/\.\./;
         $lpLine =~ s/^MACHINE/#MACHINE/;
 
         $lpLine =~ s/&/&amp;/g;
diff --git a/src/templates/local-arago64-v2.conf.xml b/src/templates/local-arago64-v2.conf.xml
index b49f702..d9d2ae7 100644
--- a/src/templates/local-arago64-v2.conf.xml
+++ b/src/templates/local-arago64-v2.conf.xml
@@ -11,7 +11,7 @@
     <line># wiping and rebuilding you can preserve this directory to speed up this part</line>
     <line># of subsequent builds. This directory is safe to share between multiple builds</line>
     <line># on the same machine too.</line>
-    <line>DL_DIR = "${TOPDIR}/downloads"</line>
+    <line>DL_DIR = "${TOPDIR}/../downloads"</line>
     <line></line>
     <line>#</line>
     <line># Where to place shared-state files</line>
@@ -24,7 +24,7 @@
     <line># regenerate from these files if no changes were made to the configuration.</line>
     <line># If changes were made to the configuration, only shared state files where the</line>
     <line># state was still valid would be used (done using checksums).</line>
-    <line>SSTATE_DIR = "${TOPDIR}/build/sstate-cache"</line>
+    <line>SSTATE_DIR = "${TOPDIR}/sstate-cache"</line>
     <line></line>
     <line>#</line>
     <line># Shared-state files from other locations</line>
diff --git a/src/templates/local-arago64-v3.conf.xml b/src/templates/local-arago64-v3.conf.xml
index 35d151f..c8a5d51 100644
--- a/src/templates/local-arago64-v3.conf.xml
+++ b/src/templates/local-arago64-v3.conf.xml
@@ -11,7 +11,7 @@
     <line># wiping and rebuilding you can preserve this directory to speed up this part</line>
     <line># of subsequent builds. This directory is safe to share between multiple builds</line>
     <line># on the same machine too.</line>
-    <line>DL_DIR = "${TOPDIR}/downloads"</line>
+    <line>DL_DIR = "${TOPDIR}/../downloads"</line>
     <line></line>
     <line>#</line>
     <line># Where to place shared-state files</line>
@@ -24,7 +24,7 @@
     <line># regenerate from these files if no changes were made to the configuration.</line>
     <line># If changes were made to the configuration, only shared state files where the</line>
     <line># state was still valid would be used (done using checksums).</line>
-    <line>SSTATE_DIR = "${TOPDIR}/build/sstate-cache"</line>
+    <line>SSTATE_DIR = "${TOPDIR}/sstate-cache"</line>
     <line></line>
     <line>#</line>
     <line># Shared-state files from other locations</line>
diff --git a/src/templates/local-poky-v2.conf.xml b/src/templates/local-poky-v2.conf.xml
index 72160c9..b45d6c2 100644
--- a/src/templates/local-poky-v2.conf.xml
+++ b/src/templates/local-poky-v2.conf.xml
@@ -11,7 +11,7 @@
     <line># wiping and rebuilding you can preserve this directory to speed up this part</line>
     <line># of subsequent builds. This directory is safe to share between multiple builds</line>
     <line># on the same machine too.</line>
-    <line>DL_DIR = "${TOPDIR}/downloads"</line>
+    <line>DL_DIR = "${TOPDIR}/../downloads"</line>
     <line></line>
     <line>#</line>
     <line># Where to place shared-state files</line>
@@ -24,7 +24,7 @@
     <line># regenerate from these files if no changes were made to the configuration.</line>
     <line># If changes were made to the configuration, only shared state files where the</line>
     <line># state was still valid would be used (done using checksums).</line>
-    <line>SSTATE_DIR = "${TOPDIR}/build/sstate-cache"</line>
+    <line>SSTATE_DIR = "${TOPDIR}/sstate-cache"</line>
     <line></line>
     <line>#</line>
     <line># Shared-state files from other locations</line>
diff --git a/src/templates/local-poky-v3.conf.xml b/src/templates/local-poky-v3.conf.xml
index 1e66478..fa313eb 100644
--- a/src/templates/local-poky-v3.conf.xml
+++ b/src/templates/local-poky-v3.conf.xml
@@ -11,7 +11,7 @@
     <line># wiping and rebuilding you can preserve this directory to speed up this part</line>
     <line># of subsequent builds. This directory is safe to share between multiple builds</line>
     <line># on the same machine too.</line>
-    <line>DL_DIR = "${TOPDIR}/downloads"</line>
+    <line>DL_DIR = "${TOPDIR}/../downloads"</line>
     <line></line>
     <line>#</line>
     <line># Where to place shared-state files</line>
@@ -24,7 +24,7 @@
     <line># regenerate from these files if no changes were made to the configuration.</line>
     <line># If changes were made to the configuration, only shared state files where the</line>
     <line># state was still valid would be used (done using checksums).</line>
-    <line>SSTATE_DIR = "${TOPDIR}/build/sstate-cache"</line>
+    <line>SSTATE_DIR = "${TOPDIR}/sstate-cache"</line>
     <line></line>
     <line>#</line>
     <line># Shared-state files from other locations</line>
diff --git a/src/templates/local-v2.conf.xml b/src/templates/local-v2.conf.xml
index 40f30e7..49e060c 100644
--- a/src/templates/local-v2.conf.xml
+++ b/src/templates/local-v2.conf.xml
@@ -11,7 +11,7 @@
     <line># wiping and rebuilding you can preserve this directory to speed up this part</line>
     <line># of subsequent builds. This directory is safe to share between multiple builds</line>
     <line># on the same machine too.</line>
-    <line>DL_DIR = "${TOPDIR}/downloads"</line>
+    <line>DL_DIR = "${TOPDIR}/../downloads"</line>
     <line></line>
     <line>#</line>
     <line># Where to place shared-state files</line>
@@ -24,7 +24,7 @@
     <line># regenerate from these files if no changes were made to the configuration.</line>
     <line># If changes were made to the configuration, only shared state files where the</line>
     <line># state was still valid would be used (done using checksums).</line>
-    <line>SSTATE_DIR = "${TOPDIR}/build/sstate-cache"</line>
+    <line>SSTATE_DIR = "${TOPDIR}/sstate-cache"</line>
     <line></line>
     <line>#</line>
     <line># Shared-state files from other locations</line>
diff --git a/src/templates/local-v3.conf.xml b/src/templates/local-v3.conf.xml
index d0c9d92..e300aaf 100644
--- a/src/templates/local-v3.conf.xml
+++ b/src/templates/local-v3.conf.xml
@@ -11,7 +11,7 @@
     <line># wiping and rebuilding you can preserve this directory to speed up this part</line>
     <line># of subsequent builds. This directory is safe to share between multiple builds</line>
     <line># on the same machine too.</line>
-    <line>DL_DIR = "${TOPDIR}/downloads"</line>
+    <line>DL_DIR = "${TOPDIR}/../downloads"</line>
     <line></line>
     <line>#</line>
     <line># Where to place shared-state files</line>
@@ -24,7 +24,7 @@
     <line># regenerate from these files if no changes were made to the configuration.</line>
     <line># If changes were made to the configuration, only shared state files where the</line>
     <line># state was still valid would be used (done using checksums).</line>
-    <line>SSTATE_DIR = "${TOPDIR}/build/sstate-cache"</line>
+    <line>SSTATE_DIR = "${TOPDIR}/sstate-cache"</line>
     <line></line>
     <line>#</line>
     <line># Shared-state files from other locations</line>
-- 
2.17.1


