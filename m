Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by arago-project.org (Postfix) with ESMTPS id B41EC52090
	for <meta-arago@arago-project.org>;
	Wed, 11 May 2016 16:13:00 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.153])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O7000HYDT10KR70@vms173009.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 11 May 2016 11:12:42 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=Di3ILfeZnJjti7YuCNoA:9
Received: by 100.15.86.14 with SMTP id 160c3e3a; Wed, 11 May 2016 16:12:42 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 562F7161FDF;	Wed,
	11 May 2016 12:12:36 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 11 May 2016 12:12:36 -0400
Message-id: <1462983156-29843-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] arago.conf: skip ubi images for systest builds due to size issues
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
X-List-Received-Date: Wed, 11 May 2016 16:13:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index aedbca8..75b3aab 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -69,6 +69,7 @@ ARAGO_KERNEL_SUFFIX_append = "${@base_conditional("ARAGO_RT_ENABLE", "1", "-rt",
 # Set systest kernel suffix
 ARAGO_SYSTEST_ENABLE ?= "0"
 ARAGO_KERNEL_SUFFIX_append = "${@base_conditional("ARAGO_SYSTEST_ENABLE", "1", "-systest", "", d)}"
+IMAGE_FSTYPES_remove = "${@['','ubi'][d.getVar('ARAGO_SYSTEST_ENABLE', True) == '1']}"
 
 # ARM9 is not supported by the Linaro toolchain so default back to the Arago
 # toolchain for ARM9 based SOCs.
-- 
2.2.0


