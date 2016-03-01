Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTPS id D992C52993
	for <meta-arago@arago-project.org>;
	Tue,  1 Mar 2016 01:21:56 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.148])
	by vms173011.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O3C00I926G18720@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 29 Feb 2016 19:21:38 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=FhJsSChPhD4aHYaKt3IA:9
Received: by 100.15.86.14 with SMTP id 6c4b3d15; Tue, 01 Mar 2016 01:21:38 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5C8AE161EF9;	Mon,
	29 Feb 2016 20:21:37 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 29 Feb 2016 20:21:36 -0500
Message-id: <1456795296-15716-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1456795296-15716-1-git-send-email-denis@denix.org>
References: <1456795296-15716-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] busybox: stop hardcoding default udhcpc parameters, now in interfaces file
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
X-List-Received-Date: Tue, 01 Mar 2016 01:21:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/busybox/busybox/defconfig  | 2 +-
 meta-arago-distro/recipes-core/busybox/busybox_%.bbappend | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
index 2f50ad2..fd41aad 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
+++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
@@ -845,7 +845,7 @@ CONFIG_UDHCP_DEBUG=0
 # CONFIG_FEATURE_UDHCP_8021Q is not set
 CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
 CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
-CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -b"
+CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=""
 CONFIG_UDPSVD=y
 CONFIG_VCONFIG=y
 CONFIG_WGET=y
diff --git a/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
index 6e4e2aa..d85bfc5 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
+++ b/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
@@ -1,7 +1,7 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago18"
+PR_append = "-arago19"
 
 SRC_URI += " \
 	file://inetd \
-- 
2.2.0


