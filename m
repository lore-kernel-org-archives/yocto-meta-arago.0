Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4010DC35FFC
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 19:05:23 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.23085.1741892718682037165
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 12:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=opt4z+db;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52DJ5HXX1464897
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 14:05:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741892717;
	bh=BAV4XMlYtAdKe1Gi2/dpYhSav+YdJ/lrO1fsvz6zLPU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=opt4z+dbh6n7qJvcCYhJFG3lgFMnAaVbU9EfDq8FY440O+L8VQgY3BqDAMrTskQmH
	 MsmknZc+/4oqmrgJVAiIQstfv0f6eGUD2h5rt/zUoHSLhs/NnA5/h3EMl1HuYsF3q8
	 t4M/7mesTN15tA6NecVnVnagCJ0qwEN/G+PMcffY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52DJ5HOh008941
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Mar 2025 14:05:17 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 14:05:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 14:05:17 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52DJ5He9090116;
	Thu, 13 Mar 2025 14:05:17 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsnrp-0005sn-BK; Thu, 13 Mar 2025 14:05:17 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2 07/14] sysrepo: move and clean up
Date: Thu, 13 Mar 2025 14:05:09 -0500
Message-ID: <20250313190516.22522-8-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250313190516.22522-1-reatmon@ti.com>
References: <20250313190516.22522-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Mar 2025 19:05:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16036

From: Denys Dmytriyenko <denys@konsulko.com>

* Move into recipes-extended
* Shorten SUMMARY and don't empty DESCRIPTION
* Don't hardode /usr and /etc when passing to CMake
* No need to change SYSROOT_DIRS

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...-Hardcode-correct-path-to-tar-binary.patch |  0
 .../sysrepo/sysrepo/sysrepo                   |  0
 .../sysrepo/sysrepo/sysrepod.service          |  0
 .../sysrepo/sysrepo_git.bb                    | 31 ++++++++++---------
 4 files changed, 16 insertions(+), 15 deletions(-)
 rename meta-arago-extras/{recipes-sysrepo => recipes-extended}/sysrepo/sysrepo/0001-Hardcode-correct-path-to-tar-binary.patch (100%)
 rename meta-arago-extras/{recipes-sysrepo => recipes-extended}/sysrepo/sysrepo/sysrepo (100%)
 rename meta-arago-extras/{recipes-sysrepo => recipes-extended}/sysrepo/sysrepo/sysrepod.service (100%)
 rename meta-arago-extras/{recipes-sysrepo => recipes-extended}/sysrepo/sysrepo_git.bb (68%)

diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/0001-Hardcode-correct-path-to-tar-binary.patch b/meta-arago-extras/recipes-extended/sysrepo/sysrepo/0001-Hardcode-correct-path-to-tar-binary.patch
similarity index 100%
rename from meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/0001-Hardcode-correct-path-to-tar-binary.patch
rename to meta-arago-extras/recipes-extended/sysrepo/sysrepo/0001-Hardcode-correct-path-to-tar-binary.patch
diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepo b/meta-arago-extras/recipes-extended/sysrepo/sysrepo/sysrepo
similarity index 100%
rename from meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepo
rename to meta-arago-extras/recipes-extended/sysrepo/sysrepo/sysrepo
diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepod.service b/meta-arago-extras/recipes-extended/sysrepo/sysrepo/sysrepod.service
similarity index 100%
rename from meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepod.service
rename to meta-arago-extras/recipes-extended/sysrepo/sysrepo/sysrepod.service
diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb b/meta-arago-extras/recipes-extended/sysrepo/sysrepo_git.bb
similarity index 68%
rename from meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
rename to meta-arago-extras/recipes-extended/sysrepo/sysrepo_git.bb
index 0877a65f..2dbfa55f 100644
--- a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
+++ b/meta-arago-extras/recipes-extended/sysrepo/sysrepo_git.bb
@@ -1,15 +1,13 @@
-# Recipe created by recipetool
-SUMMARY = "YANG-based configuration and operational state data store for Unix/Linux applications."
-DESCRIPTION = ""
+SUMMARY = "YANG-based configuration and operational state data store"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ef345f161efb68c3836e6f5648b2312f"
 
-SRC_URI = "git://github.com/sysrepo/sysrepo.git;protocol=https;branch=master \
-           file://0001-Hardcode-correct-path-to-tar-binary.patch \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', \
-                'file://sysrepo','', d)} \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
-                'file://sysrepod.service','', d)}"
+SRC_URI = " \
+    git://github.com/sysrepo/sysrepo.git;protocol=https;branch=master \
+    file://0001-Hardcode-correct-path-to-tar-binary.patch \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'file://sysrepo','', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'file://sysrepod.service','', d)} \
+"
 
 PV = "3.3.10+git"
 SRCREV = "ef93a1253cc97f13671759f6e7790cbf729a5ae9"
@@ -23,9 +21,15 @@ FILES:${PN} += "${datadir}/yang/* ${libdir}/sysrepo-plugind/* ${bindir}/*"
 inherit cmake pkgconfig python3native python3-dir
 inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}
 
-
-# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
-EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE:String=Release -DBUILD_EXAMPLES:String=False -DENABLE_TESTS:String=False -DREPOSITORY_LOC:PATH=/etc/sysrepo  -DCALL_TARGET_BINS_DIRECTLY=False -DGEN_LANGUAGE_BINDINGS:String=False "
+EXTRA_OECMAKE = " \
+    -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
+    -DCMAKE_BUILD_TYPE:String=Release \
+    -DBUILD_EXAMPLES:String=False \
+    -DENABLE_TESTS:String=False \
+    -DREPOSITORY_LOC:PATH=${sysconfdir}/sysrepo \
+    -DCALL_TARGET_BINS_DIRECTLY=False \
+    -DGEN_LANGUAGE_BINDINGS:String=False \
+"
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE:${PN} = "sysrepod.service"
@@ -52,6 +56,3 @@ do_install:append:class-target () {
 }
 
 BBCLASSEXTEND = "native"
-
-SYSROOT_DIRS:append = " ${bindir}"
-
-- 
2.17.1


