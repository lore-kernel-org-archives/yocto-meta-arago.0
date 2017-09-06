Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id D4F50529D3
	for <meta-arago@arago-project.org>;
	Wed,  6 Sep 2017 12:55:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v86CtRP2014843
	for <meta-arago@arago-project.org>; Wed, 6 Sep 2017 07:55:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504702527;
	bh=c85zNbYR7iC5+w6IznOLaDN4QFUOEw7pdNyIW0b4biM=;
	h=From:To:CC:Subject:Date;
	b=MVRPFT5ergIj8j10VBBz+89l5jMveBYuVoD7pZJ/a12+oMsdUuCp633FsX+s1oabC
	OR9ZFzMJ+ufa0D0zn0g2H4tDFU4x82Jj02SqBfMJ5R2ANi8eJxIF86LG8L8l51hySD
	8bqT3sdKD9VdjbMIBQRKT/dqw4sCTajrj1ZiXsxk=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v86CtRFE009485
	for <meta-arago@arago-project.org>; Wed, 6 Sep 2017 07:55:27 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 6 Sep 2017 07:55:27 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 6 Sep 2017 07:55:27 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v86CtREU006611;
	Wed, 6 Sep 2017 07:55:27 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 6 Sep 2017 08:55:23 -0400
Message-ID: <1504702523-46736-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [matrix-gui-v2-apps][PATCH v2] browser_chromium: fix runGoogleChrome.sh
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
X-List-Received-Date: Wed, 06 Sep 2017 12:55:28 -0000
Content-Type: text/plain

Cleanup runGoogleChrome.sh
- convert to unix format
- fix typo

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 browser_apps/browser_chromium/runGoogleChrome.sh | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)
 mode change 100755 => 100644 browser_apps/browser_chromium/runGoogleChrome.sh

diff --git a/browser_apps/browser_chromium/runGoogleChrome.sh b/browser_apps/browser_chromium/runGoogleChrome.sh
old mode 100755
new mode 100644
index c65830e..d7f58a9
--- a/browser_apps/browser_chromium/runGoogleChrome.sh
+++ b/browser_apps/browser_chromium/runGoogleChrome.sh
@@ -1,11 +1,11 @@
-#!/bin/sh
-
-#Check PROXY_SERVER setting
-#Example http=webproxy.ext.ti.com:80;https=webproxy.ext.ti.com:80
-
-if [ PROXY_SERVER == "" ]
-then
-    google-chrome --log-level=3
-else
-    google-chrome --log-level=3 --proxy-server="$PROXY_SERVER"0
-
+#!/bin/sh
+
+#Check PROXY_SERVER setting
+#Example http=webproxy.ext.ti.com:80;https=webproxy.ext.ti.com:80
+
+if [ PROXY_SERVER == "" ]
+then
+    google-chrome --log-level=3
+else
+    google-chrome --log-level=3 --proxy-server="$PROXY_SERVER"
+fi
-- 
1.9.1


