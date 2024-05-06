Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A39DC41513
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 15:47:36 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.24000.1715010454359276437
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 06 May 2024 08:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tmZT+hZT;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 446FlWtN072414;
	Mon, 6 May 2024 10:47:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715010453;
	bh=wSfyS5fQAtuXhFVZxuPFAplStXkgO5UmVcOfYByqaLk=;
	h=From:To:Subject:Date;
	b=tmZT+hZTS2SQivxAVUk3w2VuEXUgtW8erSU+CgNQeBc7a2raI2KPMdBiRgHmbqJwL
	 fYyAtelYCR2bwTjeuDsYMHw3VxosU3Chkpl01dT2KJTYkcY6gftCRZml50XtdJEztg
	 4n7YwLS4b7uRz+rb2EQTLKugYGRYQMbZCrvlfxRg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 446FlW0N077873
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 May 2024 10:47:32 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 May 2024 10:47:33 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 May 2024 10:47:32 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 446FlWKP118623;
	Mon, 6 May 2024 10:47:32 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1s40Yu-0007iN-E0; Mon, 06 May 2024 10:47:32 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 1/2] recipes: Update S = WORKDIR recipes to use ${S} correctly
Date: Mon, 6 May 2024 10:47:31 -0500
Message-ID: <20240506154732.29615-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 06 May 2024 15:47:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15329

This is a correspnding patch to match one from Richard Purdie in
oe-core. [1]

Where recipes use S = ${WORKDIR}, ensure they are referencing ${S} correctly
to access files as soon we want to stop doing this in WORKDIR at which point
they would break unless corrected.

[1] https://git.openembedded.org/openembedded-core/commit/?id=f25dd633fffe6560f191526d1869e657e129bad9

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb  | 2 +-
 .../recipes-connectivity/systemd-telnetd/systemd-telnetd.bb     | 2 +-
 .../recipes-core/arago-gpl-notice/arago-gpl-notice.bb           | 2 +-
 .../recipes-graphics/tslib/ts-calibrate-init_1.0.bb             | 2 +-
 .../recipes-sysrepo/nw-configurator/nw-configurator.bb          | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb b/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb
index c932e67f..f9ef7881 100644
--- a/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb
+++ b/meta-arago-demos/recipes-core/matrix/matrix-lighttpd-config.bb
@@ -16,7 +16,7 @@ S = "${WORKDIR}"
 
 do_install() {
 	install -d ${D}${sysconfdir}/lighttpd
-	install -m 0644 ${WORKDIR}/lighttpd.conf.matrix ${D}${sysconfdir}/lighttpd/lighttpd.conf.matrix
+	install -m 0644 ${S}/lighttpd.conf.matrix ${D}${sysconfdir}/lighttpd/lighttpd.conf.matrix
 }
 
 FILES:${PN} = "${sysconfdir}/lighttpd/lighttpd.conf.matrix"
diff --git a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb b/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
index 3158da5a..471e2c78 100644
--- a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
+++ b/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-telnetd.bb
@@ -16,5 +16,5 @@ SYSTEMD_AUTO_ENABLE:${PN} = "enable"
 do_install:append () {
     # install systemd unit files
     install -d ${D}${systemd_system_unitdir}
-    install -m 0644 ${WORKDIR}/telnetd.service ${D}${systemd_system_unitdir}
+    install -m 0644 ${S}/telnetd.service ${D}${systemd_system_unitdir}
 }
diff --git a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
index 6cb428a5..309e72df 100644
--- a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
+++ b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
@@ -24,7 +24,7 @@ do_install(){
 		install -d ${D}${bindir}
 		install -d ${D}${systemd_system_unitdir}
 		install -m 0755 ${S}/print-gplv3-packages.sh ${D}${bindir}/gplv3-notice
-		install -m 0644 ${WORKDIR}/gplv3-notice.service ${D}${systemd_system_unitdir}
+		install -m 0644 ${S}/gplv3-notice.service ${D}${systemd_system_unitdir}
 	fi
 }
 
diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
index db48d746..f67ba558 100644
--- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
+++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
@@ -26,5 +26,5 @@ do_install(){
 	# Install the init script
 	# TODO: replace init script with systemd files
 	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/ts-calibrate
+	install -m 0755 ${S}/init ${D}${sysconfdir}/init.d/ts-calibrate
 }
diff --git a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb b/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
index c5d9a86b..65dff2cc 100644
--- a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
+++ b/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
@@ -14,7 +14,7 @@ DEPENDS = "sysrepo"
 inherit autotools pkgconfig
 
 do_compile() {
-	${CC} ${CFLAGS} ${LDFLAGS} -I=${STAGING_INCDIR}	${WORKDIR}/nw-configurator.c -o nw-configurator -lsysrepo
+	${CC} ${CFLAGS} ${LDFLAGS} -I=${STAGING_INCDIR}	${S}/nw-configurator.c -o nw-configurator -lsysrepo
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


