Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id EAAF95298F
	for <meta-arago@arago-project.org>;
	Wed,  7 Feb 2018 20:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 786CA20AA4;
	Wed,  7 Feb 2018 20:33:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id SqmbTIzk2XDe; Wed,  7 Feb 2018 20:33:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 49D0820B01;
	Wed,  7 Feb 2018 20:33:18 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id DC9F1163286;
	Wed,  7 Feb 2018 15:33:17 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  7 Feb 2018 15:33:03 -0500
Message-Id: <1518035594-38357-4-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1518035594-38357-1-git-send-email-denys@ti.com>
References: <1518035594-38357-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 04/15] toolchain-external: can no longer determine toolchain from PATH
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
X-List-Received-Date: Wed, 07 Feb 2018 20:33:28 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-external.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-external.inc b/meta-arago-distro/conf/distro/include/toolchain-external.inc
index 4d14c00..c48b09d 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-external.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-external.inc
@@ -1,4 +1,4 @@
-# Locate the toolchain automatically from PATH
-TOOLCHAIN_SYSPATH := "${@os.path.abspath(os.path.dirname(bb.utils.which(d.getVar('PATH', d, 1), d.getVar('TOOLCHAIN_PREFIX', d, 1)+'cpp'))+'/../'+d.getVar('TOOLCHAIN_SYS', d, 1))}"
-TOOLCHAIN_PATH := "${@bool(d.getVar('TOOLCHAIN_SYSPATH', d, 1)) and (os.path.exists(d.getVar('TOOLCHAIN_SYSPATH', d, 1)) and os.path.dirname(d.getVar('TOOLCHAIN_SYSPATH', d, 1)) or bb.fatal('No valid toolchain in PATH')) or ''}"
+# Set some default toolchain location variables
+TOOLCHAIN_PATH ??= "/usr/local/sdk"
+TOOLCHAIN_SYSPATH = "${TOOLCHAIN_PATH}/${TOOLCHAIN_SYS}"
 EXTERNAL_TOOLCHAIN = "${TOOLCHAIN_PATH}"
-- 
2.7.4


