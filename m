Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24010C3DA7A
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 22:12:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.58755.1671747137067099962
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Dec 2022 14:12:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 483E140BA9;
	Thu, 22 Dec 2022 22:12:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eWg7oNUn9fZE; Thu, 22 Dec 2022 22:12:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 24DEC40C2B;
	Thu, 22 Dec 2022 22:12:15 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C12AA1636B4;
	Thu, 22 Dec 2022 17:12:01 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell][PATCH 2/4] external-arm-sdk-toolchain: fix bashisms
Date: Thu, 22 Dec 2022 22:12:03 +0000
Message-Id: <20221222221205.1312505-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221222221205.1312505-1-denis@denix.org>
References: <20221222221205.1312505-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 22 Dec 2022 22:12:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14136

From: Denys Dmytriyenko <denys@konsulko.com>

Fix bashisms - helps with making builds in vanilla Ubuntu containers.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../meta/external-arm-sdk-toolchain.bb        | 33 ++++++++++++++++---
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-arm-sdk-toolcha=
in.bb b/meta-arago-extras/recipes-core/meta/external-arm-sdk-toolchain.bb
index e4323891..05783a74 100644
--- a/meta-arago-extras/recipes-core/meta/external-arm-sdk-toolchain.bb
+++ b/meta-arago-extras/recipes-core/meta/external-arm-sdk-toolchain.bb
@@ -115,9 +115,14 @@ do_install() {
 	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSL=
ATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'install -d ${D}${datad=
ir}/man/man1', '', d)}
 	install -d ${D}${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include
=20
-	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/${LIBDIR}/{libstdc++.*,libgcc=
_s.*,libsupc++.*} ${D}${prefix}/${EAT_TARGET_SYS}/lib
+	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/${LIBDIR}/libstdc++.* ${D}${p=
refix}/${EAT_TARGET_SYS}/lib
+	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/${LIBDIR}/libgcc_s.* ${D}${pr=
efix}/${EAT_TARGET_SYS}/lib
+	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/${LIBDIR}/libsupc++.* ${D}${p=
refix}/${EAT_TARGET_SYS}/lib
 	cp -a ${TOOLCHAIN_PATH}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/* ${D}=
${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}
-	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}{gcov,gcc*,g++,cpp} ${D}${b=
indir}
+	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcov ${D}${bindir}
+	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc* ${D}${bindir}
+	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}g++ ${D}${bindir}
+	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}cpp ${D}${bindir}
 	cp -a ${TOOLCHAIN_PATH}/libexec/* ${D}${libexecdir}
=20
 	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSL=
ATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH=
}/bin/${TARGET_PREFIX}gdb* ${D}${bindir}', '', d)}
@@ -125,7 +130,27 @@ do_install() {
 	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSL=
ATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH=
}/share/info/* ${D}${datadir}/info/', '', d)}
 	${@oe.utils.conditional('PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSL=
ATED_TARGET_ARCH}', 'external-arm-sdk-toolchain', 'cp -a ${TOOLCHAIN_PATH=
}/share/man/man1/${TARGET_PREFIX}* ${D}${datadir}/man/man1/', '', d)}
=20
-	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/bin/{ld*,objcopy,strip,nm,ran=
lib,as,ar,objdump} ${D}${prefix}/${EAT_TARGET_SYS}/bin
+	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/bin/ld* ${D}${prefix}/${EAT_T=
ARGET_SYS}/bin
+	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/bin/objcopy ${D}${prefix}/${E=
AT_TARGET_SYS}/bin
+	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/bin/strip ${D}${prefix}/${EAT=
_TARGET_SYS}/bin
+	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/bin/nm ${D}${prefix}/${EAT_TA=
RGET_SYS}/bin
+	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/bin/ranlib ${D}${prefix}/${EA=
T_TARGET_SYS}/bin
+	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/bin/as ${D}${prefix}/${EAT_TA=
RGET_SYS}/bin
+	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/bin/ar ${D}${prefix}/${EAT_TA=
RGET_SYS}/bin
+	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/bin/objdump ${D}${prefix}/${E=
AT_TARGET_SYS}/bin
 	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/lib/ldscripts/* ${D}${prefix}=
/${EAT_TARGET_SYS}/lib/ldscripts
-	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}{ld*,addr2line,objcopy,read=
elf,strip,nm,ranlib,gprof,as,c++filt,ar,strings,objdump,size} ${D}${bindi=
r}
+	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ld* ${D}${bindir}
+	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}addr2line ${D}${bindir}
+	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}objcopy ${D}${bindir}
+	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}readelf ${D}${bindir}
+	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}strip ${D}${bindir}
+	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}nm ${D}${bindir}
+	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ranlib ${D}${bindir}
+	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gprof ${D}${bindir}
+	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}as ${D}${bindir}
+	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}c++filt ${D}${bindir}
+	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ar ${D}${bindir}
+	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}strings ${D}${bindir}
+	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}objdump ${D}${bindir}
+	cp -a ${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}size ${D}${bindir}
 }
--=20
2.25.1


