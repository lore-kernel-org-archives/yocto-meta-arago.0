Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 733B952A63
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 18:06:52 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7H00F36BNFAM20@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 20 Jun 2014 13:06:52 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C1E54259AF; Fri,
	20 Jun 2014 13:57:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 20 Jun 2014 13:56:44 -0400
Message-id: <1403287009-11256-15-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1403287009-11256-1-git-send-email-denis@denix.org>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
Subject: [PATCH 14/19] toolchain-external: bb.which() is not part of bb.utils module
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
X-List-Received-Date: Fri, 20 Jun 2014 18:06:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-external.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-external.inc b/meta-arago-distro/conf/distro/include/toolchain-external.inc
index 5356082..4d14c00 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-external.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-external.inc
@@ -1,4 +1,4 @@
 # Locate the toolchain automatically from PATH
-TOOLCHAIN_SYSPATH := "${@os.path.abspath(os.path.dirname(bb.which(d.getVar('PATH', d, 1), d.getVar('TOOLCHAIN_PREFIX', d, 1)+'cpp'))+'/../'+d.getVar('TOOLCHAIN_SYS', d, 1))}"
+TOOLCHAIN_SYSPATH := "${@os.path.abspath(os.path.dirname(bb.utils.which(d.getVar('PATH', d, 1), d.getVar('TOOLCHAIN_PREFIX', d, 1)+'cpp'))+'/../'+d.getVar('TOOLCHAIN_SYS', d, 1))}"
 TOOLCHAIN_PATH := "${@bool(d.getVar('TOOLCHAIN_SYSPATH', d, 1)) and (os.path.exists(d.getVar('TOOLCHAIN_SYSPATH', d, 1)) and os.path.dirname(d.getVar('TOOLCHAIN_SYSPATH', d, 1)) or bb.fatal('No valid toolchain in PATH')) or ''}"
 EXTERNAL_TOOLCHAIN = "${TOOLCHAIN_PATH}"
-- 
2.0.0


