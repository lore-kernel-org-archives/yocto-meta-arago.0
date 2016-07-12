Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTPS id 2C25452A26
	for <meta-arago@arago-project.org>;
	Tue, 12 Jul 2016 00:46:07 +0000 (UTC)
Received: from vz-proxy-m003.mx.aol.com ([64.236.83.2])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OA600LOZFGUGE20@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 11 Jul 2016 19:46:06 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=EDCZS3Slg7tGr17y9w9vtg==:117
	a=cAmyUtKerLwA:10 a=sozttTNsAAAA:8	a=BR4D0QtkdDte-YJWLEoA:9
Received: by 100.15.86.14 with SMTP id 31d5b58b; Tue, 12 Jul 2016 00:46:06 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id C28EE1620AC;	Mon, 11 Jul 2016 20:46:05 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 11 Jul 2016 20:45:57 -0400
Message-id: <1468284359-16073-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-reply-to: <1468284359-16073-1-git-send-email-denis@denix.org>
References: <1468284359-16073-1-git-send-email-denis@denix.org>
Subject: [tisdk-build-scripts][PATCH 3/5] config-build-env: add SSTATE_MIRRORS support for configuring sstate mirrors
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
X-List-Received-Date: Tue, 12 Jul 2016 00:46:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 lib/oesdk/config-build-env | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/oesdk/config-build-env b/lib/oesdk/config-build-env
index 7af5fdd..984705f 100644
--- a/lib/oesdk/config-build-env
+++ b/lib/oesdk/config-build-env
@@ -92,6 +92,10 @@ config_build_dir() {
       sed -i "s+^PRSERV_HOST =.*+PRSERV_HOST = \"$PRSERV_HOST\"+" local.conf
     fi
 
+    if [ ! -z "$SSTATE_MIRRORS" ]; then
+      echo "SSTATE_MIRRORS = \"$SSTATE_MIRRORS\"" >> local.conf
+    fi
+
     if [ ! -z "$LOCAL_CONF_APPEND" ]; then
       cat "$LOCAL_CONF_APPEND" >> local.conf
     fi
-- 
2.7.4


