Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 2DEBD529EF
	for <meta-arago@arago-project.org>;
	Mon, 13 Aug 2012 16:54:39 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7DGsch0013939
	for <meta-arago@arago-project.org>; Mon, 13 Aug 2012 11:54:38 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7DGscnS022246
	for <meta-arago@arago-project.org>; Mon, 13 Aug 2012 11:54:38 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 13 Aug 2012 11:54:38 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7DGscab026717;	Mon, 13 Aug 2012 11:54:38 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T0y34-0002JV-W3; Mon, 13 Aug 2012 12:03:26 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 Aug 2012 12:03:15 -0500
Message-ID: <1344877395-8449-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1344877395-8449-1-git-send-email-fcooper@ti.com>
References: <1344877395-8449-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH 2/2 v4] busybox: Enable vlan, tftpd, udpsvd, tcpsvd and inetd
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
X-List-Received-Date: Mon, 13 Aug 2012 16:54:39 -0000
Content-Type: text/plain

* Enable vconfig which is useful for devices that support the virtual
  lan kernel option such as the am335x

* Enable tftpd ,udpsvd and tcpsvd

* Enable inetd service which is used by various programs including tftpd

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/busybox/busybox/defconfig         |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
index 372d7b5..4aa0e7e 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
+++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
@@ -774,12 +774,12 @@ CONFIG_FEATURE_IFUPDOWN_IPV4=y
 CONFIG_FEATURE_IFUPDOWN_IPV6=y
 CONFIG_FEATURE_IFUPDOWN_MAPPING=y
 # CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP is not set
-# CONFIG_INETD is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN is not set
+CONFIG_INETD=y
+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO=y
+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD=y
+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME=y
+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME=y
+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN=y
 # CONFIG_FEATURE_INETD_RPC is not set
 CONFIG_IP=y
 CONFIG_FEATURE_IP_ADDRESS=y
@@ -806,7 +806,7 @@ CONFIG_NSLOOKUP=y
 # CONFIG_PSCAN is not set
 CONFIG_ROUTE=y
 # CONFIG_SLATTACH is not set
-# CONFIG_TCPSVD is not set
+CONFIG_TCPSVD=y
 CONFIG_TELNET=y
 # CONFIG_FEATURE_TELNET_TTYPE is not set
 CONFIG_FEATURE_TELNET_AUTOLOGIN=y
@@ -814,7 +814,7 @@ CONFIG_FEATURE_TELNET_AUTOLOGIN=y
 # CONFIG_FEATURE_TELNETD_STANDALONE is not set
 # CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
 CONFIG_TFTP=y
-# CONFIG_TFTPD is not set
+CONFIG_TFTPD=y
 
 #
 # Common options for tftp/tftpd
@@ -846,8 +846,8 @@ CONFIG_UDHCP_DEBUG=0
 CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
 CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"
-# CONFIG_UDPSVD is not set
-# CONFIG_VCONFIG is not set
+CONFIG_UDPSVD=y
+CONFIG_VCONFIG=y
 CONFIG_WGET=y
 CONFIG_FEATURE_WGET_STATUSBAR=y
 CONFIG_FEATURE_WGET_AUTHENTICATION=y
-- 
1.7.0.4


