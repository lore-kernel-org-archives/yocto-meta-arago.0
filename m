Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 180A9529B6
	for <meta-arago@arago-project.org>;
	Sun,  6 Nov 2016 22:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1676A2098D;
	Sun,  6 Nov 2016 22:54:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ZBI0yjlGXmnz; Sun,  6 Nov 2016 22:54:46 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EB94920567;
	Sun,  6 Nov 2016 22:54:44 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 118F7162182;
	Sun,  6 Nov 2016 17:54:44 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun,  6 Nov 2016 17:54:43 -0500
Message-Id: <1478472883-16273-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] external-linaro-toolchain: install libc bindir binaries
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
X-List-Received-Date: Sun, 06 Nov 2016 22:54:46 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/external-linaro-toolchain.bbappend             | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
index def3aec..85fec2a 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -6,7 +6,7 @@ ALLOW_EMPTY_ldd = "1"
 ALLOW_EMPTY_libstdc++ = "1"
 ALLOW_EMPTY_libgomp = "1"
 
-PR_append = ".arago30"
+PR_append = ".arago31"
 
 PROVIDES := "${@oe_filter_out('virtual/linux-libc-headers', '${PROVIDES}', d)}"
 PROVIDES := "${@oe_filter_out('linux-libc-headers', '${PROVIDES}', d)}"
@@ -110,6 +110,9 @@ do_install_append() {
 	sed -i -e "s# /lib/${ELT_TARGET_SYS}# ../../lib#g" -e "s# /usr/lib/${ELT_TARGET_SYS}# .#g" ${D}${libdir}/libpthread.so
 	sed -i -e "s# /lib/# ../../lib/#g" -e "s# /usr/lib/# ./#g" ${D}${libdir}/libpthread.so
 
+	if [ -d ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/libc/${bindir} ]; then
+		cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/libc/${bindir}/* ${D}${bindir}
+	fi
 
 	install -d ${D}${base_sbindir}
 	cp -a ${TOOLCHAIN_PATH}/${ELT_TARGET_SYS}/libc/${base_sbindir}/ldconfig ${D}${base_sbindir}/
-- 
2.7.4


