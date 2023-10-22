Return-Path: <s-adivi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D4FC001DF
	for <webhook@archiver.kernel.org>; Sun, 22 Oct 2023 13:09:24 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.98210.1697980159425746730
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 22 Oct 2023 06:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=plMOi9Ro;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: s-adivi@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39MD9Em0070866;
	Sun, 22 Oct 2023 08:09:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697980154;
	bh=uwmSyYOPXL6oKXUgFfqKVB462aotJ610Mn9FcbsWQ/4=;
	h=From:To:CC:Subject:Date;
	b=plMOi9Ro0nu1D0ZhaF3guhmqd2O3rIl2DIevsoHJQ+3IbPuwGwngFlmd0jq5QczvX
	 qFIY407klWVkJb97XEZOv6/deOWlivqqw9cuiCcQ/bpT/Up8o3Od7IpoM0oseiDawy
	 whqmia2Zgds9UNs4mWwvw7H3FQkNvaZIk4hXVROk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39MD9Eru060799
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 22 Oct 2023 08:09:14 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 22
 Oct 2023 08:09:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 22 Oct 2023 08:09:13 -0500
Received: from SHIELD01.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39MD9AvX013484;
	Sun, 22 Oct 2023 08:09:11 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>, <c-shilwant@ti.com>, <a-limaye@ti.com>
CC: <g-gupta@ti.com>, <khasim@ti.com>, <p-bhagat@ti.com>
Subject: [meta-arago][kirkstone][PATCH] matrix-gui: move script from /etc/init.d to data dir.
Date: Sun, 22 Oct 2023 18:39:05 +0530
Message-ID: <20231022130905.3962948-1-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 22 Oct 2023 13:09:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14964

since sysvinit is deprecated, avoid installing scripts in sysvinit.
Use data dir to install scripts which need to be called by the systemd services.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 .../recipes-core/matrix/matrix-gui/matrix-gui-2.0.service      | 2 +-
 meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb         | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service b/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
index 40a8f0f9..84e9195b 100644
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
+++ b/meta-arago-demos/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
@@ -12,7 +12,7 @@ IgnoreSIGPIPE=no
 KillMode=process
 GuessMainPID=no
 RemainAfterExit=yes
-ExecStart=/etc/init.d/matrix-gui-2.0 start
+ExecStart=/usr/share/matrix-gui-2.0/matrix-gui-2.0 start
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb
index 9299a929..18ccc0c9 100644
--- a/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-demos/recipes-core/matrix/matrix-gui_2.0.bb
@@ -50,8 +50,7 @@ do_install(){
 	sed -i -e "s/__SWITCH_FOREGROUND_VT__/${SWITCH_FOREGROUND_VT}/" ${WORKDIR}/${MATRIX_INITSCRIPT}
 
 	# Install the script
-	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT} ${D}${sysconfdir}/init.d/matrix-gui-2.0
+	install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT} ${D}${MATRIX_BASE_DIR}/matrix-gui-2.0
 
 	# Install the systemd unit file
 	install -d ${D}${systemd_system_unitdir}
-- 
2.34.1


