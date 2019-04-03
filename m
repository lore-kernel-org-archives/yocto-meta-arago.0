Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 24A0B52987
	for <meta-arago@arago-project.org>;
	Wed,  3 Apr 2019 20:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 57E9C40BC2;
	Wed,  3 Apr 2019 20:00:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id fBl0FkPMqaIz; Wed,  3 Apr 2019 20:00:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-81-231.washdc.fios.verizon.net
	[100.15.81.231])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3F32A40B96;
	Wed,  3 Apr 2019 20:00:50 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0FF7B16DA98;
	Wed,  3 Apr 2019 16:00:49 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  3 Apr 2019 16:00:47 -0400
Message-Id: <1554321647-3468-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554321647-3468-1-git-send-email-denys@ti.com>
References: <1554321647-3468-1-git-send-email-denys@ti.com>
Subject: [thud/master][PATCH 2/2] external-arm-toolchain: fix native compilation on the target
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
X-List-Received-Date: Wed, 03 Apr 2019 20:01:10 -0000

Overlay locally for now, will be sent upstream to meta-linaro later.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/external-arm-toolchain.bbappend     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
index 974bc7a..410b5cf 100644
--- a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
@@ -1,4 +1,19 @@
+ORIG_TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET_OS'), ''][d.getVar('TARGET_OS') == ('' or 'custom')]}"
+
 do_install_append() {
 	# libc.so linker script should use relative path to not clash with host libs
 	sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
+
+	if [ ${EAT_TARGET_SYS} != ${ORIG_TARGET_SYS} ]; then
+		ln -sf ${EAT_TARGET_SYS} ${D}${libdir}/${ORIG_TARGET_SYS}
+	fi
+
+	ln -sf libatomic.so.1 ${D}${libdir}/libatomic.so
+	ln -sf libgomp.so.1 ${D}${libdir}/libgomp.so
+	ln -sf libitm.so.1 ${D}${libdir}/libitm.so
+	ln -sf libssp.so.0 ${D}${libdir}/libssp.so
+	ln -sf libstdc++.so.6 ${D}${libdir}/libstdc++.so
+	ln -sf libubsan.so.1 ${D}${libdir}/libubsan.so
+	ln -sf libasan.so.5 ${D}${libdir}/libasan.so
+	ln -sf libgfortran.so.5 ${D}${libdir}/libgfortran.so
 }
-- 
2.7.4


