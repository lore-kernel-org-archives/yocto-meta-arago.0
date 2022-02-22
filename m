Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.9790.1645510831584575151
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 22:20:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AdqEApyc;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: devarsht@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21M6KUJ5089122
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 00:20:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645510830;
	bh=Bcw8YqQhP6liGdVd9hoZT5qofGpLL80f862fndOpj4o=;
	h=From:To:CC:Subject:Date;
	b=AdqEApyc4DfYe6kvwyyfC8HIsZp2qgdeRxTBRFffr1qKwQLeCphWXLfGqOAJukuS4
	 bDh9Z8whq/tWR14C9xRR7YPBEiyhQ4qImb9P11pj/jZgy3edVJ5QZi3Ozrf15WVJyL
	 6jbLWNtM3fDJl5jCyITJLq9j35N2FFTSbQixndq0=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21M6KU5r083188
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 00:20:30 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Feb 2022 00:20:29 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Feb 2022 00:20:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21M6KRH2001630;
	Tue, 22 Feb 2022 00:20:28 -0600
From: devarsht@ti.com
To: <meta-arago@lists.yoctoproject.org>
CC: <nikhil.nd@ti.com>, <nsekhar@ti.com>, <devarsht@ti.com>, <vigneshr@ti.com>,
        <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>, <a-m1@ti.com>
Subject: [meta-arago][dunfell][PATCH] external-arm-toolchain: Remove EAT_TOOL_CHAIN symlinks
Date: Tue, 22 Feb 2022 11:50:27 +0530
Message-ID: <20220222062027.6390-1-devarsht@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

As per below commit in https://git.yoctoproject.org/meta-arm/log/?h=dunfell,

"1644922 external-arm-toolchain: Align glibc packaging to OE TARGET_SYS"

the upstream recipe external-arm-toolchain.bb doesn't use EAT_TARGET_SYS for
installing toolchain anymore and the recipe is directly using TARGET_SYS
for copying.

So remove EAT_TARGET_SYS symlinks as they are not required anymore and instead
copy directly to ORIG_TARGET_SYS.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
 .../recipes-core/meta/external-arm-toolchain.bbappend     | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
index 5a51aaa0..ea4df2ff 100644
--- a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
@@ -6,12 +6,6 @@ do_install_append() {
 	install -d ${D}${sysconfdir}
 	echo -e "/lib\n/usr/lib" >> ${D}${sysconfdir}/ld.so.conf
 
-	if [ ${EAT_TARGET_SYS} != ${ORIG_TARGET_SYS} ]; then
-		ln -sf ${EAT_TARGET_SYS} ${D}${libdir}/${ORIG_TARGET_SYS}
-		ln -sf ${EAT_TARGET_SYS} ${D}${includedir}/c++/${EAT_VER_GCC}/${ORIG_TARGET_SYS}
-		mv ${D}${libdir}/gcc/${EAT_TARGET_SYS} ${D}${libdir}/gcc/${ORIG_TARGET_SYS}
-		ln -sf ${ORIG_TARGET_SYS} ${D}${libdir}/gcc/${EAT_TARGET_SYS}
-	fi
 
 	ln -sf libatomic.so.1 ${D}${libdir}/libatomic.so
 	ln -sf libgomp.so.1 ${D}${libdir}/libgomp.so
@@ -22,7 +16,7 @@ do_install_append() {
 	ln -sf libasan.so.5 ${D}${libdir}/libasan.so
 	ln -sf libgfortran.so.5 ${D}${libdir}/libgfortran.so
 
-	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcc* ${D}${libdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/
+	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/libgcc* ${D}${libdir}/${ORIG_TARGET_SYS}/${EAT_VER_GCC}/
 }
 
 # Below FILES_* overrides are due to TARGET_SYS -> ORIG_TARGET_SYS move in ${libdir}/gcc
-- 
2.17.1

