Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B942C35FF2
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 10:40:40 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.11391.1741862432080561782
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 03:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CqqPk0ON;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52DAeUNf1307654
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 05:40:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741862430;
	bh=YgcvaIG35v3oHMQnOL9rRM6/WBsClaOHqdLH9pdX/FM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=CqqPk0ONxIDMlvbUv4GC0yxHf2gd6w/Atu1qUdkhFx9wuN718CzC+lvCba+ov6XCm
	 D3aLbUIp7cBWAWF3QnDSaDugksMmwbbCld/BMetFYMjJ1axGlbpIqwWEmb8Y5gt4jx
	 BHguy5uM4WG2GUe3E5jlS6ifCZGxuZ0BlXJCCsKY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52DAeUeq023157
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Mar 2025 05:40:30 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 05:40:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 05:40:30 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52DAeUuW083620;
	Thu, 13 Mar 2025 05:40:30 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsfzJ-0003un-W1; Thu, 13 Mar 2025 05:40:30 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 04/13] sysrepo: Update to version 3.3.10
Date: Thu, 13 Mar 2025 05:40:20 -0500
Message-ID: <20250313104029.14977-5-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250313104029.14977-1-reatmon@ti.com>
References: <20250313104029.14977-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Mar 2025 10:40:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16024

With the update to libyang we need to move to a newer version of
sysrepo.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...-Hardcode-correct-path-to-tar-binary.patch |  4 ++--
 .../recipes-sysrepo/sysrepo/sysrepo_git.bb    | 23 +++++++++++--------
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/0001-Hardcode-correct-path-to-tar-binary.patch b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/0001-Hardcode-correct-path-to-tar-binary.patch
index c8768482..c8d22412 100644
--- a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/0001-Hardcode-correct-path-to-tar-binary.patch
+++ b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/0001-Hardcode-correct-path-to-tar-binary.patch
@@ -17,8 +17,8 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index 22c95420..2ba1f44e 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -402,10 +402,7 @@ check_symbol_exists(mkstemps "stdlib.h" SR_HAVE_MKSTEMPS)
- unset(CMAKE_REQUIRED_DEFINITIONS)
+@@ -558,10 +558,7 @@ target_link_libraries(sysrepo ${CMAKE_THREAD_LIBS_INIT})
+ set(CMAKE_REQUIRED_LIBRARIES pthread)
 
  # tar
 -find_program(TAR_BINARY "tar")
diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
index b893e281..0877a65f 100644
--- a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
+++ b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
@@ -4,21 +4,21 @@ DESCRIPTION = ""
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ef345f161efb68c3836e6f5648b2312f"
 
-SRC_URI = "git://github.com/sysrepo/sysrepo.git;protocol=https;branch=devel \
+SRC_URI = "git://github.com/sysrepo/sysrepo.git;protocol=https;branch=master \
            file://0001-Hardcode-correct-path-to-tar-binary.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', \
                 'file://sysrepo','', d)} \
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
                 'file://sysrepod.service','', d)}"
 
-PV = "2.2.71+git"
-SRCREV = "b828f0ab4693c613cc66efd053a146e05854d5c8"
+PV = "3.3.10+git"
+SRCREV = "ef93a1253cc97f13671759f6e7790cbf729a5ae9"
 
 S = "${WORKDIR}/git"
 
 DEPENDS = "libyang protobuf protobuf-c protobuf-c-native libredblack libev libnetconf2"
 
-FILES:${PN} += "${datadir}/yang/* ${libdir}/sysrepo-plugind/*"
+FILES:${PN} += "${datadir}/yang/* ${libdir}/sysrepo-plugind/* ${bindir}/*"
 
 inherit cmake pkgconfig python3native python3-dir
 inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}
@@ -27,20 +27,18 @@ inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}
 # Specify any options you want to pass to cmake using EXTRA_OECMAKE:
 EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE:String=Release -DBUILD_EXAMPLES:String=False -DENABLE_TESTS:String=False -DREPOSITORY_LOC:PATH=/etc/sysrepo  -DCALL_TARGET_BINS_DIRECTLY=False -DGEN_LANGUAGE_BINDINGS:String=False "
 
-BBCLASSEXTEND = "native nativesdk"
-
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE:${PN} = "sysrepod.service"
 SYSTEMD_AUTO_ENABLE:${PN} = "disable"
 
 RDEPENDS:${PN} += "tar"
 
-do_install:append () {
+do_install:append:class-target () {
     install -d ${D}${sysconfdir}/sysrepo/data/notifications
     install -d ${D}${sysconfdir}/sysrepo/yang
-    install -o root -g root ${S}/modules/ietf-netconf-notifications.yang ${D}${sysconfdir}/sysrepo/yang/ietf-netconf-notifications@2012-02-06.yang
-    install -o root -g root ${S}/modules/ietf-netconf-with-defaults.yang ${D}${sysconfdir}/sysrepo/yang/ietf-netconf-with-defaults@2011-06-01.yang
-    install -o root -g root ${S}/modules/ietf-netconf.yang ${D}${sysconfdir}/sysrepo/yang/ietf-netconf@2011-06-01.yang
+    install -o root -g root ${S}/modules/ietf-netconf-notifications@2012-02-06.yang ${D}${sysconfdir}/sysrepo/yang/ietf-netconf-notifications@2012-02-06.yang
+    install -o root -g root ${S}/modules/ietf-netconf-with-defaults@2011-06-01.yang ${D}${sysconfdir}/sysrepo/yang/ietf-netconf-with-defaults@2011-06-01.yang
+    install -o root -g root ${S}/modules/ietf-netconf@2013-09-29.yang ${D}${sysconfdir}/sysrepo/yang/ietf-netconf@2013-09-29.yang
     install -d ${D}${sysconfdir}/init.d
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -m 0775 ${UNPACKDIR}/sysrepo ${D}${sysconfdir}/init.d/
@@ -52,3 +50,8 @@ do_install:append () {
         install -m 0644 ${UNPACKDIR}/sysrepod.service ${D}${systemd_system_unitdir}
     fi
 }
+
+BBCLASSEXTEND = "native"
+
+SYSROOT_DIRS:append = " ${bindir}"
+
-- 
2.17.1


