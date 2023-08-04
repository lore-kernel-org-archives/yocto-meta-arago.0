Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 799A5C001DF
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 18:55:38 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.5235.1691175331102468631
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 04 Aug 2023 11:55:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ETKr884O;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 374ItTIw032146;
	Fri, 4 Aug 2023 13:55:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1691175329;
	bh=fqTblZPJzHRW8WAVz8daDYAakwR8WQt1UYc6XzIPQx8=;
	h=From:To:Subject:Date;
	b=ETKr884Oey2wmgpLtpu3Qg6c2R/YAPVEhsczTT694JrRAu1kWqalvL8KqZ2gswT8X
	 I42u9h2lTTxJT0jN5rr6BUQljzj+rJb/bNgw2kOEDvrk0nAwLg5nZu48OUHfqeA+Xw
	 LiEHg622Gr17UpP+SKgIpNdL372qph2yBh+h0kr4=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 374ItTpt113786
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Aug 2023 13:55:29 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 4
 Aug 2023 13:55:29 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 4 Aug 2023 13:55:28 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 374ItTId121507;
	Fri, 4 Aug 2023 13:55:29 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qRzxR-0003Sv-1v; Fri, 04 Aug 2023 13:55:29 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH v2] init-manager-*: Mimic poky method of choosing init manager
Date: Fri, 4 Aug 2023 13:55:29 -0500
Message-ID: <20230804185529.13282-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 04 Aug 2023 18:55:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14822

Change arago over to a single init-manager for all images instead of a
mixture of systemd/sysvinit based on perceived image size.  With the
migration to a more targeted initramfs we have the space in the image to
support systemd and not require sysvinit for the smaller images.

We will still support setups that use ARAGO_SYSVINIT, but the preferred
method will be to set ARAGO_INIT_MANAGER in the local.conf with the
deault being systemd.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: - Add missing .inc in require.
    - Fix assignment in init-manager-*.inc files.
    - Remove packagegroup-arago-sysvinit-boot.bb since we stopped using
      it.

 meta-arago-distro/conf/distro/arago.conf          | 11 +++--------
 .../conf/distro/include/init-manager-systemd.inc  | 10 ++++++++++
 .../conf/distro/include/init-manager-sysvinit.inc | 10 ++++++++++
 .../recipes-core/images/arago-image.inc           |  2 +-
 .../recipes-core/images/arago-tiny-image.inc      |  4 ----
 .../packagegroup-arago-sysvinit-boot.bb           | 15 ---------------
 6 files changed, 24 insertions(+), 28 deletions(-)
 create mode 100644 meta-arago-distro/conf/distro/include/init-manager-systemd.inc
 create mode 100644 meta-arago-distro/conf/distro/include/init-manager-sysvinit.inc
 delete mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 38c42ef8..698053cb 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -58,14 +58,9 @@ DISTRO_FEATURES_FILTER_NATIVE:append = " opencl opencv openmp"
 DISTRO_FEATURES_FILTER_NATIVESDK:append = " opencl opencv openmp"
 
 # Set global runtime providers for major components
-ARAGO_SYSVINIT ?= "0"
-VIRTUAL-RUNTIME_dev_manager = "${@'udev' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd'}"
-VIRTUAL-RUNTIME_init_manager = "${@'sysvinit' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd'}"
-VIRTUAL-RUNTIME_initscripts = "${@'initscripts' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd-compat-units'}"
-VIRTUAL-RUNTIME_initramfs = "${@'sysvinit-initramfs' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd-initramfs'}"
-VIRTUAL-RUNTIME_login_manager = "${@'busybox' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'shadow-base'}"
-
-DISTRO_FEATURES:append = " ${@'' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else ' systemd'}"
+ARAGO_SYSVINIT ??= "0"
+ARAGO_INIT_MANAGER ??= "${@['systemd','sysvinit'][int(d.getVar('ARAGO_SYSVINIT'))]}"
+require conf/distro/include/init-manager-${ARAGO_INIT_MANAGER}.inc
 
 # Distro-specific package configuration
 PACKAGECONFIG:append:pn-systemd = " coredump networkd resolved serial-getty-generator"
diff --git a/meta-arago-distro/conf/distro/include/init-manager-systemd.inc b/meta-arago-distro/conf/distro/include/init-manager-systemd.inc
new file mode 100644
index 00000000..5d9d9a8e
--- /dev/null
+++ b/meta-arago-distro/conf/distro/include/init-manager-systemd.inc
@@ -0,0 +1,10 @@
+# Use systemd for system initialization
+
+DISTRO_FEATURES:append = " systemd"
+DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " sysvinit"
+
+VIRTUAL-RUNTIME_dev_manager = "systemd"
+VIRTUAL-RUNTIME_init_manager = "systemd"
+VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
+VIRTUAL-RUNTIME_initramfs = "systemd-initramfs"
+VIRTUAL-RUNTIME_login_manager = "shadow-base"
diff --git a/meta-arago-distro/conf/distro/include/init-manager-sysvinit.inc b/meta-arago-distro/conf/distro/include/init-manager-sysvinit.inc
new file mode 100644
index 00000000..6ee41d6c
--- /dev/null
+++ b/meta-arago-distro/conf/distro/include/init-manager-sysvinit.inc
@@ -0,0 +1,10 @@
+# Use sysvinit for system initialization
+
+DISTRO_FEATURES:append = " sysvinit"
+DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " systemd"
+
+VIRTUAL-RUNTIME_dev_manager = ""
+VIRTUAL-RUNTIME_init_manager = "sysvinit"
+VIRTUAL-RUNTIME_initscripts = "initscripts"
+VIRTUAL-RUNTIME_initramfs = "sysvinit-initramfs"
+VIRTUAL-RUNTIME_login_manager = "busybox"
diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
index d00c1f70..1c87afd5 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -30,6 +30,6 @@ BAD_RECOMMENDATIONS += " \
     coreutils \
     coreutils-dev \
 "
-BAD_RECOMMENDATIONS += "${@oe.utils.conditional("ARAGO_SYSVINIT", "1", "", "busybox-syslog", d)}"
+BAD_RECOMMENDATIONS += "${@oe.utils.conditional("ARAGO_INIT_MANAGER", "sysvinit", "", "busybox-syslog", d)}"
 
 inherit core-image remove-net-rules
diff --git a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
index 242e763c..6c726c4d 100644
--- a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
@@ -1,9 +1,5 @@
-ARAGO_SYSVINIT = "1"
 
 require arago-image.inc
 
 IMAGE_FEATURES:remove = "splash"
 
-IMAGE_INSTALL = " \
-	packagegroup-arago-sysvinit-boot \
-"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
deleted file mode 100644
index df7ff960..00000000
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-REQUIRED_DISTRO_FEATURES = "sysvinit"
-inherit features_check
-
-require recipes-core/packagegroups/packagegroup-core-boot.bb
-
-PR = "r0"
-
-# Cannot use eudev:
-#   "eudev was skipped: 'systemd' in DISTRO_FEATURES"
-#VIRTUAL-RUNTIME_dev_manager = "eudev"
-VIRTUAL-RUNTIME_dev_manager = ""
-VIRTUAL-RUNTIME_init_manager = "sysvinit"
-VIRTUAL-RUNTIME_initscripts = "initscripts"
-VIRTUAL-RUNTIME_initramfs = "sysvinit-initramfs"
-VIRTUAL-RUNTIME_login_manager = "busybox"
-- 
2.17.1


