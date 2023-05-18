Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CC4C77B75
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 01:22:23 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.4616.1684372942283163757
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 17 May 2023 18:22:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lViHlLth;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34I1MGU0117891;
	Wed, 17 May 2023 20:22:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684372936;
	bh=oWivP6mh/3zXwvp24ok9s8cr6xTid2/5WhhaeNwtOHw=;
	h=From:To:CC:Subject:Date;
	b=lViHlLthknD+sjrELOtHD+3fz2uEVcq2FLGVZCD0VDiZNCp9tht9I2xnkED8ma7rU
	 8V/ZxOSsAHTiUo24KOCDbILT5qMcSryDyh9LFbfqf86o6PvV7ymyFlpWPnGCWkD9HI
	 8qd5CtYIhxgnXxVDEe9Sg2JX9oQA9WjAClJiw6Kg=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34I1MGh7021240
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 May 2023 20:22:16 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 May 2023 20:22:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 May 2023 20:22:16 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34I1MGR8117112;
	Wed, 17 May 2023 20:22:16 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <reatmon@ti.com>, <denis@denix.org>, <bb@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] meta-arago-distro: drop all the rng-tools stuff
Date: Wed, 17 May 2023 20:22:09 -0500
Message-ID: <20230518012209.1869587-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 18 May 2023 01:22:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14416

From: Randolph Sapp <rs@ti.com>

OE-core has dropped rng-tools by default. A direct quote from them:

	It appears that rngd is not needed as of linux-5.6 and later[1]
	and should not be installed by default since the purpose of rngd
	is to provide additional trusted sources of entropy.

	We did some testing on real hardware, the result seems to support that
	we no longer need rngd by default on kernel v5.6 and later.

	[1] https://github.com/torvalds/linux/commit/30c08efec8884fb106b8e57094baa51bb4c44e32

There's no need to drag it around in our package groups.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../packagegroup-arago-base-tisdk-server-extra.bb |  1 -
 .../packagegroups/packagegroup-arago-bootstrap.bb |  1 -
 .../recipes-core/packagegroups/ti-test.bb         |  1 -
 .../rng-tools/rng-tools/rngd.rules                |  1 -
 .../rng-tools/rng-tools_%.bbappend                | 15 ---------------
 5 files changed, 19 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-support/rng-tools/rng-tools/rngd.rules
 delete mode 100644 meta-arago-distro/recipes-support/rng-tools/rng-tools_%.bbappend

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 50122f11..891449b7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -38,7 +38,6 @@ RDEPENDS:${PN} = "\
     libdnet \
     bridge-utils \
     ebtables \
-    rng-tools \
     elfutils \
     zip \
     libsdl \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
index e7f852da..b0ec64b0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-bootstrap.bb
@@ -23,7 +23,6 @@ UTILS = " \
 	 net-tools \
 	 ethtool  \
 	 pciutils \
-	 rng-tools \
 	 stress-ng \
 	 iperf \
 	 lmbench \
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 0b6e1eed..3e45077b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -20,7 +20,6 @@ ARAGO_TEST = "\
     stress \
     stress-ng \
     yavta \
-    rng-tools \
     perf \
     v4l-utils \
     smcroute \
diff --git a/meta-arago-distro/recipes-support/rng-tools/rng-tools/rngd.rules b/meta-arago-distro/recipes-support/rng-tools/rng-tools/rngd.rules
deleted file mode 100644
index a21c99b7..00000000
--- a/meta-arago-distro/recipes-support/rng-tools/rng-tools/rngd.rules
+++ /dev/null
@@ -1 +0,0 @@
-ACTION=="add", SUBSYSTEM=="module", KERNEL=="omap_rng", TAG+="systemd", ENV{SYSTEMD_WANTS}+="rngd.service"
diff --git a/meta-arago-distro/recipes-support/rng-tools/rng-tools_%.bbappend b/meta-arago-distro/recipes-support/rng-tools/rng-tools_%.bbappend
deleted file mode 100644
index 975e2535..00000000
--- a/meta-arago-distro/recipes-support/rng-tools/rng-tools_%.bbappend
+++ /dev/null
@@ -1,15 +0,0 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-
-PR:append = ".arago0"
-
-SRC_URI += "file://rngd.rules"
-
-do_install:append() {
-	# remove duplicate initscript
-	rm -f ${D}${sysconfdir}/init.d/rng-tools
-
-	install -d ${D}${sysconfdir}/udev/rules.d/
-	install -m0644 ${WORKDIR}/rngd.rules ${D}${sysconfdir}/udev/rules.d/
-}
-
-INHIBIT_UPDATERCD_BBCLASS = "1"
-- 
2.40.1


