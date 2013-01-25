Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by arago-project.org (Postfix) with ESMTPS id C16E5529AA
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:49:22 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id n9so1037879oag.27
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=iYZpIW0IYaKRRchkxedvDfeZTVEsmhc8metigcQaCZQ=;
	b=uVAAc/UafXX0mhZvUx+9c6PndO1AB0oz+srQIR6V4MMGi9FFpN+zfH7mrLtqzzSgF7
	iHzw5mdcLMmI7BAqwufX5wwKVDD+oAV+lsn2ByuJcvUqO8Dee0EmdLeESq88mdqdMaho
	86Ysa446lrzB2MzjLQMt8Y4ge6G2uSuYXaaiBX066uoy7ZrDjQUnApueLnaJ4ZHIwBeh
	1gNE8CiiCSCUv4yY8FIs2cVIpJ9xLjWZv1ONXb7V2GuNH37wZg/RJHHWeG++zYvRLbMe
	CqWKVticTzrsPujQLF7lZvAlJsl5R1IG1WWF6xNxp/J2G2nCE+kqOZ2nUflc45erBw01
	VF7g==
X-Received: by 10.60.169.240 with SMTP id ah16mr5898781oec.9.1359150562007;
	Fri, 25 Jan 2013 13:49:22 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id 9sm1567151obi.22.2013.01.25.13.49.19
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:49:20 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:49:05 -0600
Message-Id: <1359150545-23393-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Eyal Reizer <eyalr@ti.com>
Subject: [PATCH 01/31] obexd: increase opp push timeout
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
X-List-Received-Date: Fri, 25 Jan 2013 21:49:23 -0000

From: Eyal Reizer <eyalr@ti.com>

Add a patch which increase the opp  timeout as current timeout
is not long enough for users to confirm file reception.
As a result, OPP client may exit with errors on some phone types.

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../0001-obexd-make-OPP-push-timeout-longer.patch  |   44 ++++++++++++++++++++
 .../recipes-connectivity/obexd/obexd_0.34.bbappend |    3 +-
 2 files changed, 46 insertions(+), 1 deletions(-)
 create mode 100755 meta-arago-distro/recipes-connectivity/obexd/obexd-0.34/0001-obexd-make-OPP-push-timeout-longer.patch

diff --git a/meta-arago-distro/recipes-connectivity/obexd/obexd-0.34/0001-obexd-make-OPP-push-timeout-longer.patch b/meta-arago-distro/recipes-connectivity/obexd/obexd-0.34/0001-obexd-make-OPP-push-timeout-longer.patch
new file mode 100755
index 0000000..626f802
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/obexd/obexd-0.34/0001-obexd-make-OPP-push-timeout-longer.patch
@@ -0,0 +1,44 @@
+From 5d6d09c2338ae62796c2a326340e81320faf3593 Mon Sep 17 00:00:00 2001
+From: Vita Preskovsky <vitap@ti.com>
+Date: Wed, 19 Sep 2012 13:05:18 +0200
+Subject: [PATCH] obexd: make OPP push timeout longer
+
+Current OPP push timeout is not long enough for user to confirm on OPP server
+to receive file. As a result, OPP client exists with error.
+
+
+Signed-off-by: Vita Preskovsky <vitap@ti.com>
+---
+ plugins/bluetooth.c |    2 +-
+ src/manager.c       |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/plugins/bluetooth.c b/plugins/bluetooth.c
+index 851daa2..204ccf5 100644
+--- a/plugins/bluetooth.c
++++ b/plugins/bluetooth.c
+@@ -46,7 +46,7 @@
+ #define BT_RX_MTU 32767
+ #define BT_TX_MTU 32767
+ 
+-#define TIMEOUT 60*1000 /* Timeout for user response (miliseconds) */
++#define TIMEOUT 180*1000 /* Timeout for user response (miliseconds) */
+ 
+ struct pending_request {
+ 	DBusPendingCall *call;
+diff --git a/src/manager.c b/src/manager.c
+index 80140b6..e64a433 100644
+--- a/src/manager.c
++++ b/src/manager.c
+@@ -52,7 +52,7 @@
+ #define TRANSFER_INTERFACE OPENOBEX_SERVICE ".Transfer"
+ #define SESSION_INTERFACE OPENOBEX_SERVICE ".Session"
+ 
+-#define TIMEOUT 60*1000 /* Timeout for user response (miliseconds) */
++#define TIMEOUT 180*1000 /* Timeout for user response (miliseconds) */
+ 
+ struct agent {
+ 	char *bus_name;
+-- 
+1.7.9.5
+
diff --git a/meta-arago-distro/recipes-connectivity/obexd/obexd_0.34.bbappend b/meta-arago-distro/recipes-connectivity/obexd/obexd_0.34.bbappend
index d51c9da..820e00f 100644
--- a/meta-arago-distro/recipes-connectivity/obexd/obexd_0.34.bbappend
+++ b/meta-arago-distro/recipes-connectivity/obexd/obexd_0.34.bbappend
@@ -1,6 +1,7 @@
-PR_append = "-arago0"
+PR_append = "-arago1"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
 
 SRC_URI += "file://0001-obexd-fix-UTF-conversions.patch \
+            file://0001-obexd-make-OPP-push-timeout-longer.patch \
 "
-- 
1.7.0.4


