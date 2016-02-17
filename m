Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 4FD3B52982
	for <meta-arago@arago-project.org>;
	Wed, 17 Feb 2016 00:09:08 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.154])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O2O0034J0EPQJ10@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 16 Feb 2016 18:09:02 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=Ut/DdBcw22SB5hFy08yqCQ==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=IYZ789X0YjAvCs46fvgA:9
Received: by 100.15.86.14 with SMTP id 2e0e7cc7; Wed, 17 Feb 2016 00:09:02 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A2C28161E9E;	Tue,
	16 Feb 2016 19:08:49 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 16 Feb 2016 19:08:49 -0500
Message-id: <1455667729-16323-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] conf: generate source package for systest kernel
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
X-List-Received-Date: Wed, 17 Feb 2016 00:09:08 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago-source-ipk.conf     | 5 +++++
 meta-arago-distro/conf/distro/include/branding-core.inc | 1 +
 2 files changed, 6 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 49002ea..aec669e 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -152,6 +152,11 @@ SRCIPK_INSTALL_DIR_pn-linux-ti-staging-rt = "board-support/linux-rt-${PV}${KERNE
 SRCIPK_PRESERVE_GIT_pn-linux-ti-staging-rt = "true"
 SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging-rt = "true"
 
+CREATE_SRCIPK_pn-linux-ti-staging-systest = "1"
+SRCIPK_INSTALL_DIR_pn-linux-ti-staging-systest = "board-support/linux-systest-${PV}${KERNEL_LOCALVERSION}"
+SRCIPK_PRESERVE_GIT_pn-linux-ti-staging-systest = "true"
+SRCIPK_SHALLOW_CLONE_pn-linux-ti-staging-systest = "true"
+
 CREATE_SRCIPK_pn-sitara-linux-ti-staging = "1"
 SRCIPK_INSTALL_DIR_pn-sitara-linux-ti-staging = "board-support/linux-${PV}${KERNEL_LOCALVERSION}"
 SRCIPK_PRESERVE_GIT_pn-sitara-linux-ti-staging = "true"
diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index de4fbe6..1982f2a 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -8,6 +8,7 @@
 # Auto rev important packages to pick up latest
 SRCREV_pn-linux-ti-staging = "${AUTOREV}"
 SRCREV_pn-linux-ti-staging-rt = "${AUTOREV}"
+SRCREV_pn-linux-ti-staging-systest = "${AUTOREV}"
 SRCREV_pn-u-boot-ti-staging = "${AUTOREV}"
 SRCREV_pn-ltp-ddt = "${AUTOREV}"
 
-- 
2.2.0


