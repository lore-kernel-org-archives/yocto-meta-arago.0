Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id DB18D52AB1
	for <meta-arago@arago-project.org>;
	Tue, 22 Mar 2016 18:56:11 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.152])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4G00JN3F8E9G80@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 22 Mar 2016 13:55:37 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=Z6pEUyKhh6cp7L26gWQA:9
Received: by 100.15.86.14 with SMTP id 56f4297c; Tue, 22 Mar 2016 18:55:37 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5B39D161F44;	Tue,
	22 Mar 2016 14:55:26 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 22 Mar 2016 14:55:25 -0400
Message-id: <1458672925-16251-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1458672925-16251-1-git-send-email-denis@denix.org>
References: <1458672925-16251-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] linux-ti-staging: update with PRU PHY state change fix
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
X-List-Received-Date: Tue, 22 Mar 2016 18:56:12 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.1.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_4.1.bb    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
index d2c4b28..5671d45 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:"
 
 BRANCH = "ti-rt-linux-4.1.y"
 
-SRCREV = "b1e14d991256c58d564b50d4d0439521cff27749"
+SRCREV = "3bef1493dbbc61880f09cfda285cd0032a501d41"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index 8efb1c5..5d639b1 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -69,11 +69,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.1.y"
 
-SRCREV = "c23eecbb9f1d6f2eef11eebb3281b79fb26ff862"
+SRCREV = "6b41ca0b945d73ac8c8318083f79411639836643"
 PV = "4.1.18+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "j"
+MACHINE_KERNEL_PR_append = "k"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
-- 
2.2.0


