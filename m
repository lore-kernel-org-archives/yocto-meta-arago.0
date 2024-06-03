Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F41C25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 09:23:06 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.79033.1717406580683676508
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 03 Jun 2024 02:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=UIbwRbRj;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4539N0GJ080784
	for <meta-arago@lists.yoctoproject.org>; Mon, 3 Jun 2024 04:23:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717406580;
	bh=i8Si7Wemg46bWHzPPEmaCKbzkZyw6WBlY45AxUbaDyY=;
	h=From:To:CC:Subject:Date;
	b=UIbwRbRjvEu0oJLlTgvGX3z4WN9m44bdFPtq2i+ye0wXEzTuyGs7Ebd/93Zht1S3K
	 d08/85X7jUemvyeZj0aDuV5SYfqjG21zlHGamfAr+qocsevjMqNy+9j3sgJ9sXReXY
	 f9pem7MkaAYcpsbOpbjOjXOaV7BgBI/Xvl3FvW7I=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4539N0AR008211
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 3 Jun 2024 04:23:00 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Jun 2024 04:22:59 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Jun 2024 04:22:59 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4539Mwqi084967;
	Mon, 3 Jun 2024 04:22:59 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] recipes-qt: qt5: Add xkbcommon to qtbase PACKAGECONFIG
Date: Mon, 3 Jun 2024 14:52:55 +0530
Message-ID: <20240603092255.2930095-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 03 Jun 2024 09:23:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15352

From: Sai Sree Kartheek Adivi <s-adivi@ti.com>

- For QT apps to use physical keyboard, xkbcommon has to be added in
PACKAGECONFIG. This was supported until 09.01 using xkbcommon-evdev which at
present is an invalid PACKAGECONFIG & hence was dropped from meta-arago [1].

- Hence, add xkbcommon to PACKAGECONFIG which will enable the use of
physical keyboard in QT apps.

[1]: https://git.ti.com/cgit/arago-project/meta-arago/commit/?h=scarthgap&id=de16946741249265a38acb7bb503b39a0c2b4175

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
index b1205b5a..6f94c574 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
@@ -4,6 +4,8 @@ GLES_EXTRA_DEPS = "libdrm wayland"
 
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
 
+PACKAGECONFIG:append:k3 = " xkbcommon"
+
 PR:append = ".arago17"
 
 QT_CONFIG_FLAGS += "-qpa ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
-- 
2.34.1


