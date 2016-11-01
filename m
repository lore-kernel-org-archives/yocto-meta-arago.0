Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id A580952093
	for <meta-arago@arago-project.org>;
	Tue,  1 Nov 2016 20:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C1297209DE;
	Tue,  1 Nov 2016 20:17:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id qoUnx9VtnJIK; Tue,  1 Nov 2016 20:17:00 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A2415203C9;
	Tue,  1 Nov 2016 20:16:59 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id D4DAF162186;
	Tue,  1 Nov 2016 16:16:58 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  1 Nov 2016 16:16:58 -0400
Message-Id: <1478031418-15227-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] optee-os: bump SRCREV to pull newer baseline with fixes
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
X-List-Received-Date: Tue, 01 Nov 2016 20:17:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

Using older OPTEE OS baseline to apply our patches caused boot issues.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-security/optee/optee-os_git.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index fe3a575..b31b55a 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -1,10 +1,10 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = ".arago2"
+PR_append = ".arago3"
 
 is_armv7 = "1"
 
-SRCREV = "bfdfbe74610fc692ddedf45d5f2da520cebccb83"
+SRCREV = "8dceff9b18e7c2e0cb879ea458e85a1806dff447"
 
 EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
                 CROSS_COMPILE_ta_arm32=${HOST_PREFIX}  \
-- 
2.7.4


