Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 1A51C529B2
	for <meta-arago@arago-project.org>;
	Thu, 12 Apr 2018 15:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DA42320B70;
	Thu, 12 Apr 2018 15:12:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id k_y6-mmIcl_l; Thu, 12 Apr 2018 15:12:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A7ACA2017D;
	Thu, 12 Apr 2018 15:12:53 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 2E7BD1633B1;
	Thu, 12 Apr 2018 11:12:53 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 12 Apr 2018 11:12:52 -0400
Message-Id: <1523545972-19262-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] am-sysinfo: avoid no GNU_HASH warning, drop deprecated variable
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
X-List-Received-Date: Thu, 12 Apr 2018 15:12:57 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
index 207c24d..4df536f 100644
--- a/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
+++ b/meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://mem_util/mem_util.c;beginline=1;endline=37;md5=8aa8e7
 
 SECTION = "system"
 
-PACKAGE_STRIP = "no"
 PR = "r10"
 
 BRANCH ?= "master"
@@ -26,3 +25,5 @@ do_install() {
 	install -d ${D}/${bindir}
 	install -m 0755 ${S}/mem_util/Release/mem_util ${D}/${bindir}
 }
+
+INSANE_SKIP_${PN} = "ldflags"
-- 
2.7.4


