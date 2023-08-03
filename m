Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062B3C04A6A
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 20:45:33 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.5117.1691095529366128277
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 03 Aug 2023 13:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ed870RBo;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 373KjReY087561;
	Thu, 3 Aug 2023 15:45:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1691095527;
	bh=ZhT38bHNh5/FKGOPyAx5eQlQsVWsS5bwxFWY1cWJwPA=;
	h=From:To:Subject:Date;
	b=Ed870RBo+3CUHF89GPJ6C1dn6m8vOLu3JW3iipsRHYVez0Qg29ir9dJW7IUpa4l2V
	 omI7+Q3x0QaJg4sv9jYzux1btY5bFpdc4MV9/C6CGjhqi+vwrcbBe+k0SXeAbf4WE/
	 /Ce6AcCfXaONKPkmv52Kk/49vr4TqLpI4OCT9xd8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 373KjRHq017397
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 3 Aug 2023 15:45:27 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 3
 Aug 2023 15:45:27 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 3 Aug 2023 15:45:27 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 373KjRhx016352;
	Thu, 3 Aug 2023 15:45:27 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qRfCJ-0002Dv-AV; Thu, 03 Aug 2023 15:45:27 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] init-manager-*: Mimic poky method of choosing init manager
Date: Thu, 3 Aug 2023 15:45:27 -0500
Message-ID: <20230803204527.8508-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 03 Aug 2023 20:45:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14818

Change arago over to a single init-manager for all images instead of a
mixture of systemd/sysvinit based on perceived image size.  With the
migration to a more targeted initramfs we have the space in the image to
support systemd and not require sysvinit for the smaller images.

We will still support setups that use ARAGO_SYSVINIT, but the preferred
method will be to set ARAGO_INIT_MANAGER in the local.conf with the
deault being systemd.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf              |  9 ++-------
 .../conf/distro/include/init-manager-systemd.inc      | 11 +++++++++++
 .../conf/distro/include/init-manager-sysvinit.inc     | 11 +++++++++++
 meta-arago-distro/recipes-core/images/arago-image.inc |  2 +-
 .../recipes-core/images/arago-tiny-image.inc          |  4 ----
 5 files changed, 25 insertions(+), 12 deletions(-)
 create mode 100644 meta-arago-distro/conf/distro/include/init-manager-systemd.inc
 create mode 100644 meta-arago-distro/conf/distro/include/init-manager-sysvinit.inc

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 38c42ef8..7f70e24f 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -59,13 +59,8 @@ DISTRO_FEATURES_FILTER_NATIVESDK:append = " opencl opencv openmp"
 
 # Set global runtime providers for major components
 ARAGO_SYSVINIT ?= "0"
-VIRTUAL-RUNTIME_dev_manager = "${@'udev' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd'}"
-VIRTUAL-RUNTIME_init_manager = "${@'sysvinit' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd'}"
-VIRTUAL-RUNTIME_initscripts = "${@'initscripts' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd-compat-units'}"
-VIRTUAL-RUNTIME_initramfs = "${@'sysvinit-initramfs' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'systemd-initramfs'}"
-VIRTUAL-RUNTIME_login_manager = "${@'busybox' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'shadow-base'}"
-
-DISTRO_FEATURES:append = " ${@'' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else ' systemd'}"
+ARAGO_INIT_MANAGER ??= "${@['systemd','sysvinit'][int(d.getVar('ARAGO_SYSVINIT'))]}"
+require conf/distro/include/init-manager-${ARAGO_INIT_MANAGER}
 
 # Distro-specific package configuration
 PACKAGECONFIG:append:pn-systemd = " coredump networkd resolved serial-getty-generator"
diff --git a/meta-arago-distro/conf/distro/include/init-manager-systemd.inc b/meta-arago-distro/conf/distro/include/init-manager-systemd.inc
new file mode 100644
index 00000000..188079f1
--- /dev/null
+++ b/meta-arago-distro/conf/distro/include/init-manager-systemd.inc
@@ -0,0 +1,11 @@
+# Use systemd for system initialization
+
+DISTRO_FEATURES:append = " systemd"
+DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " sysvinit"
+
+VIRTUAL-RUNTIME_dev_manager ??= "systemd"
+VIRTUAL-RUNTIME_init_manager ??= "systemd"
+VIRTUAL-RUNTIME_initscripts ??= "systemd-compat-units"
+VIRTUAL-RUNTIME_initramfs ??= "systemd-initramfs"
+VIRTUAL-RUNTIME_login_manager ??= "shadow-base"
+
diff --git a/meta-arago-distro/conf/distro/include/init-manager-sysvinit.inc b/meta-arago-distro/conf/distro/include/init-manager-sysvinit.inc
new file mode 100644
index 00000000..b1d8fd69
--- /dev/null
+++ b/meta-arago-distro/conf/distro/include/init-manager-sysvinit.inc
@@ -0,0 +1,11 @@
+# Use sysvinit for system initialization
+
+DISTRO_FEATURES:append = " sysvinit"
+DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " systemd"
+
+VIRTUAL-RUNTIME_dev_manager ??= ""
+VIRTUAL-RUNTIME_init_manager ??= "sysvinit"
+VIRTUAL-RUNTIME_initscripts ??= "initscripts"
+VIRTUAL-RUNTIME_initramfs ??= "sysvinit-initramfs"
+VIRTUAL-RUNTIME_login_manager ??= "busybox"
+
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
-- 
2.17.1


