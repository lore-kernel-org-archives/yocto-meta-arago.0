Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0288DC4167B
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 22:12:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.58846.1671747137162637308
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Dec 2022 14:12:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3A0B740027;
	Thu, 22 Dec 2022 22:12:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QKSSyTkyczYr; Thu, 22 Dec 2022 22:12:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1ACD540C2A;
	Thu, 22 Dec 2022 22:12:15 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B3CE51636B0;
	Thu, 22 Dec 2022 17:12:01 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell][PATCH 1/4] meta-toolchain-arago: fix bashisms
Date: Thu, 22 Dec 2022 22:12:02 +0000
Message-Id: <20221222221205.1312505-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 22 Dec 2022 22:12:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14137

From: Denys Dmytriyenko <denys@konsulko.com>

Fix bashisms - helps with making builds in vanilla Ubuntu containers.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-core/meta/meta-toolchain-arago.bb | 21 +++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb =
b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 8fed34f5..d2479ad1 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -106,13 +106,22 @@ arago_sdk_fixup () {
 		lexec=3D"${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/libexec/gcc=
/${TOOLCHAIN_SYS}"
 	fi
 	tcv=3D`ls -1 $lexec|head -1`
-	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/$tcv ] || ln -s . ${SDK_OUTP=
UT}/${SDKTARGETSYSROOT}/lib/$tcv
-	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tcv ] || ln -s . ${SDK_=
OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tcv
-	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/${TOOLCHAIN_SYS} ] || ln -s =
. ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/${TOOLCHAIN_SYS}
-	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/${TOOLCHAIN_SYS} ] || ln=
 -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/${TOOLCHAIN_SYS}
+	if [ ! -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/$tcv ]; then
+		ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/$tcv
+	fi
+	if [ ! -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tcv ]; then
+		ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tcv
+	fi
+	if [ ! -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/${TOOLCHAIN_SYS} ]; the=
n
+		ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/${TOOLCHAIN_SYS}
+	fi
+	if [ ! -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/${TOOLCHAIN_SYS} ];=
 then
+		ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/${TOOLCHAIN_SYS}
+	fi
 	tcpath=3D"${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/${TOOLCHAIN=
_SYS}"
 	mkdir -p $tcpath
-	pushd $tcpath
+	curdir=3D$(pwd)
+	cd $tcpath
 	ln -s ${SDKTARGETSYSROOT}/include include
 	if [ "${TOOLCHAIN_BRAND}" !=3D "arago" ]; then
 		mkdir -p libc
@@ -122,7 +131,7 @@ arago_sdk_fixup () {
 	ln -s ${SDKTARGETSYSROOT}/lib lib
 	ln -s ${SDKTARGETSYSROOT}/usr/lib usr/lib
 	ln -s ${SDKTARGETSYSROOT}/usr/include usr/include
-	popd
+	cd $curdir
 }
=20
 fakeroot create_sdk_files() {
--=20
2.25.1


