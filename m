Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id B82D5529AE
	for <meta-arago@arago-project.org>;
	Mon, 16 Jul 2018 18:37:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6GIbmTB054236
	for <meta-arago@arago-project.org>; Mon, 16 Jul 2018 13:37:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531766268;
	bh=xwFq4WAjR5g+Kv7Z5ONT3fBBJo4khpB2Yhw8wWNTUTc=;
	h=From:To:Subject:Date;
	b=nfe0ueBFJtTptLVvTrx21iU6oKGfw1JSh9I52P/xZAVloOpyjUpAO+r9d/F7yHQOM
	GYSzqJwi93RVVgPB9P1pon+NnycKe8zRbx0JO7O8Z5mp3HgGv1jo4M/t3SqFJ+LNDO
	m5u5DNxE5vApp9iCaVQdEYoq25nw+qklkjzyvCx0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6GIbmq4001776
	for <meta-arago@arago-project.org>; Mon, 16 Jul 2018 13:37:48 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 16 Jul 2018 13:37:48 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 16 Jul 2018 13:37:48 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6GIbm9g023924
	for <meta-arago@arago-project.org>; Mon, 16 Jul 2018 13:37:48 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Jul 2018 14:37:43 -0400
Message-ID: <1531766264-22936-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [matrix-gui-v2-apps][PATCH 1/2] qt5_deform: change from full-screen mode to window mode
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2018 18:37:56 -0000
Content-Type: text/plain

This may be a tentative change to work aroubd the Weston 2.0 full-screen
dispaly issue. It might be a permanent chnage because the full-screen
is no longer required with Weston/Wayland window system.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 qt5_apps/qt5_deform/qt5_deform.desktop | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qt5_apps/qt5_deform/qt5_deform.desktop b/qt5_apps/qt5_deform/qt5_deform.desktop
index 9ad1d6f..ffe8e8a 100644
--- a/qt5_apps/qt5_deform/qt5_deform.desktop
+++ b/qt5_apps/qt5_deform/qt5_deform.desktop
@@ -4,7 +4,7 @@
 Name=Deform
 GenericName=Demo App
 Icon=/usr/share/matrix-gui-2.0/apps/images/qt-icon.png
-Exec=/usr/share/qt5/examples/widgets/painting/deform/deform -small-screen
+Exec=/usr/share/qt5/examples/widgets/painting/deform/deform
 Type=Application
 Categories=Qt5
 ProgramType=gui
-- 
1.9.1


