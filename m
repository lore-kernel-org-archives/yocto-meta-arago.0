Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 92B8952A2B
	for <meta-arago@arago-project.org>;
	Mon, 11 May 2015 19:33:00 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NO7006KJAAJAGW0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 11 May 2015 14:32:44 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=E6x6fhYN c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10
	a=sozttTNsAAAA:8	a=_gaCDgHeFURYsiqJEikA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 95EDA20091;	Mon,
	11 May 2015 15:32:43 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 11 May 2015 15:32:43 -0400
Message-id: <1431372763-27501-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] arago-source-ipk: mark omap3-sgx-modules sources as machine-specific
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
X-List-Received-Date: Mon, 11 May 2015 19:33:01 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago-source-ipk.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index ea9e37d..105f40d 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -96,6 +96,7 @@ SRCIPK_INSTALL_DIR_pn-ti-ocf-crypto-module = "board-support/extra-drivers/${PN}-
 
 CREATE_SRCIPK_pn-omap3-sgx-modules = "1"
 SRCIPK_INSTALL_DIR_pn-omap3-sgx-modules = "board-support/extra-drivers/sgx-modules-${PV}"
+SRCIPK_PACKAGE_ARCH_pn-omap3-sgx-modules = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-ti-compat-wireless-wl18xx = "1"
 SRCIPK_INSTALL_DIR_pn-ti-compat-wireless-wl18xx = "board-support/extra-drivers/${PN}-${PV}"
-- 
2.2.0


