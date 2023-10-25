Return-Path: <s-adivi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899B2C0032E
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 13:34:08 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.173507.1698240843996110905
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Oct 2023 06:34:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=u/sTSJo6;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: s-adivi@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39PDXvRN099981;
	Wed, 25 Oct 2023 08:33:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698240837;
	bh=ic7JRcTfszb3iI5EHY395qfOxIRPFDA/351kyLl40gc=;
	h=From:To:CC:Subject:Date;
	b=u/sTSJo6T/iuyKmaOee94su1Sq+kWNpj2uiWz2q8aI+7bbKzm3k/42tBDJAz0h5pC
	 vXHWySQ7D67Jlmf1xiG+n/1SYLFuE/ctLeeaD4sKosxJkgN/yt4ZoFpijK9S3ILnPK
	 gVV/kjwjlMVjZeqORCmIZmYBBkSjXdbL/u5ay16k=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39PDXvgW026252
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Oct 2023 08:33:57 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 25
 Oct 2023 08:33:57 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 25 Oct 2023 08:33:57 -0500
Received: from SHIELD01.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39PDXsoJ034412;
	Wed, 25 Oct 2023 08:33:54 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>, <c-shilwant@ti.com>, <a-limaye@ti.com>
CC: <g-gupta@ti.com>, <khasim@ti.com>, <p-bhagat@ti.com>
Subject: [meta-arago][kirkstone][PATCH v2] matrix-gui: handle systemd and sysvinit scripts separately
Date: Wed, 25 Oct 2023 19:03:51 +0530
Message-ID: <20231025133351.3043121-1-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Oct 2023 13:34:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14970

- Install systemd service file or init script based on the distro_features
systemd/sysvinit.
- systemd service also needs to depend on lighttpd service so that matrix
won't start before the webserver.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
v2: Handle both sysvinit and systemd

 .../matrix/matrix-gui/matrix-gui-2.0.service      |  4 ++--
 .../recipes-core/matrix/matrix-gui_2.0.bb         | 15 +++++++++------
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service b/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
index 40a8f0f9..462803f3 100644
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
+++ b/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
@@ -1,6 +1,6 @@
 [Unit]
 Description=Matrix GUI
-After=weston.service
+After=weston.service lighttpd.service
 Requires=weston.service
 Before=graphical.target
 
@@ -12,7 +12,7 @@ IgnoreSIGPIPE=no
 KillMode=process
 GuessMainPID=no
 RemainAfterExit=yes
-ExecStart=/etc/init.d/matrix-gui-2.0 start
+ExecStart=/usr/share/matrix-gui-2.0/matrix-gui-2.0 start
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb
index 9299a929..508edb9b 100644
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb
@@ -50,12 +50,15 @@ do_install(){
 	sed -i -e "s/__SWITCH_FOREGROUND_VT__/${SWITCH_FOREGROUND_VT}/" ${WORKDIR}/${MATRIX_INITSCRIPT}
 
 	# Install the script
-	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT} ${D}${sysconfdir}/init.d/matrix-gui-2.0
-
-	# Install the systemd unit file
-	install -d ${D}${systemd_system_unitdir}
-	install -m 0644 ${WORKDIR}/matrix-gui-2.0.service ${D}${systemd_system_unitdir}
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/init.d
+		install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT} ${D}${sysconfdir}/init.d/matrix-gui-2.0
+	fi
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		install -d ${D}${systemd_system_unitdir}
+		install -m 0644 ${WORKDIR}/matrix-gui-2.0.service ${D}${systemd_system_unitdir}
+		install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT} ${D}${MATRIX_BASE_DIR}/matrix-gui-2.0
+	fi
 }
 
 GUIDEPS = "${@bb.utils.contains('DISTRO_FEATURES','opengl',"matrix-gui-browser refresh-screen",'',d)}"
-- 
2.34.1


