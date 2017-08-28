Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id C68635299D
	for <meta-arago@arago-project.org>;
	Mon, 28 Aug 2017 19:23:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7SJNWSI002833
	for <meta-arago@arago-project.org>; Mon, 28 Aug 2017 14:23:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503948212;
	bh=s6BDCD0gXulcHez6pqSNtTo7A7lqhgyXCYnZzvfTIFU=;
	h=From:To:Subject:Date;
	b=NKpZ2cYxLGQdfR7+AZwu+S0sboY/pa0n3D2R+zPDsCkLzqdmdOAK73nrr83X3Zyni
	ae4DDZaLbSBuPtaI3J5d36hmt+MA3gQG0ci4GV3rmjl36pLwdR8i81DcRPJS5/dixH
	t/HSgFsLzKCMeO670E+bQgPXvru7nYMK79L0wBVU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7SJNWj0003099
	for <meta-arago@arago-project.org>; Mon, 28 Aug 2017 14:23:32 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 28 Aug 2017 14:23:32 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 28 Aug 2017 14:23:31 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7SJNV0T029115
	for <meta-arago@arago-project.org>; Mon, 28 Aug 2017 14:23:31 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 28 Aug 2017 15:23:23 -0400
Message-ID: <1503948203-51821-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [matrix-gui-v2-apps][PATCH] qt5_browser: replace webkit-based demo browser with webengine-based one
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
X-List-Received-Date: Mon, 28 Aug 2017 19:23:33 -0000
Content-Type: text/plain

Replace webkit-based demo browser because webkit is obsolete and will be
removed soon.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 qt5_apps/qt5_browser/qt5_browser.desktop | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qt5_apps/qt5_browser/qt5_browser.desktop b/qt5_apps/qt5_browser/qt5_browser.desktop
index 2f6636f..a5d3953 100644
--- a/qt5_apps/qt5_browser/qt5_browser.desktop
+++ b/qt5_apps/qt5_browser/qt5_browser.desktop
@@ -4,7 +4,7 @@
 Name=Browser
 GenericName=Demo App
 Icon=/usr/share/matrix-gui-2.0/apps/images/web-icon.png
-Exec=/usr/share/qt5/examples/webkitwidgets/browser/browser http://www.ti.com
+Exec=/usr/share/qt5/examples/webenginewidgets/demobrowser/demobrowser http://www.ti.com
 Type=Application
 ProgramType=gui
 Categories=Qt5
-- 
1.9.1


