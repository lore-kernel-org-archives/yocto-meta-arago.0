Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id D6FD052A05
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 17:28:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81HSU3X023033
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 12:28:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504286910;
	bh=DUseRoAAQLfsFZ/j7YqmZE1dAHL3h7LlFa/DVhUn9gw=;
	h=From:To:Subject:Date;
	b=MIqjaIZyPjcrsj5iylAuga0S2JJpXRX9M5O9MkfURZSJMYaqTRrq9T4vL3NvoZq0R
	smwM/8XThHR6CaguRTcJ7HxewQkWbkHETmbPd/FBKwQHUxSx5GNU29kSQAWOIs95i8
	sPXpNiUfmQuyToeObo7HmnglEaJpC1aQYh2vbatc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81HSPlv026714
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 12:28:25 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 12:28:24 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 12:28:24 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81HSO9K006420
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 12:28:24 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Sep 2017 13:28:21 -0400
Message-ID: <1504286901-28585-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [matrix-gui-v2-apps][PATCH] browser_chromium: fix runGoogleChrome.sh
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
X-List-Received-Date: Fri, 01 Sep 2017 17:28:41 -0000
Content-Type: text/plain

Cleanup runGoogleChrome.sh:
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


