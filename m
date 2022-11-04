Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2343CC433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.234.1667598073372463137
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CF7BE40D52
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yu5oF82nkX2n for <meta-arago@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:41:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C553940D82
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:12 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 5B95B16367B
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:41:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 02/14] ti-crypto-examples: Remove ti-crypto-examples
Date: Fri,  4 Nov 2022 21:41:00 +0000
Message-Id: <20221104214112.1221365-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214112.1221365-1-denis@denix.org>
References: <20221104214112.1221365-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14096

From: Andrew Davis <afd@ti.com>

These examples have not been updated in a long time and are not
correct anymore. Remove this.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../packagegroup-arago-tisdk-crypto.bb        |  1 -
 .../ti-crypto-examples_git.bb                 | 30 -------------------
 2 files changed, 31 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-core/ti-crypto-examples/ti-=
crypto-examples_git.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-ar=
ago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-crypto.bb
index f217f7d8..d2189a50 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-crypto.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tis=
dk-crypto.bb
@@ -13,7 +13,6 @@ CRYPTO_SUPPORT =3D "\
     openssl-engines \
 "
=20
-#ti-crypto-examples
 CRYPTO_SUPPORT:append:ti33x =3D " cryptodev-module cryptodev-tests"
 CRYPTO_SUPPORT:append:ti43x =3D " cryptodev-module cryptodev-tests"
 CRYPTO_SUPPORT:append:dra7xx =3D " cryptodev-module cryptodev-tests"
diff --git a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-=
examples_git.bb b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-cr=
ypto-examples_git.bb
deleted file mode 100644
index 10f14478..00000000
--- a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-example=
s_git.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION =3D "TI Cryptography Example Applications"
-HOMEPAGE =3D "https://git.ti.com/cgit/arago-project-org/crypto-example-a=
pps/"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://AES/aes_256.c;beginline=3D9;endline=3D35;md=
5=3D8edbb4dee965d2f2eb5ca2822addcae5"
-SECTION =3D "console"
-DEPENDS +=3D "openssl"
-
-PR =3D "r7"
-
-BRANCH ?=3D "master"
-SRCREV =3D "6f4b09fffe970bb6b448369875874e798ef282f6"
-
-SRC_URI =3D "git://git.ti.com/git/git/arago-project-org/crypto-example-a=
pps.git;protocol=3Dhttps;branch=3D${BRANCH}"
-
-S =3D "${WORKDIR}/git"
-
-do_compile() {
-    export CROSS_COMPILE=3D${TARGET_PREFIX}
-    export CFLAGS=3D'${TARGET_CC_ARCH}'
-    # build the release version
-    oe_runmake release
-}
-
-do_install() {
-    oe_runmake DESTDIR=3D${D} install
-}
-
-python () {
-    raise bb.parse.SkipRecipe("skipping ti-crypto-examples")
-}
--=20
2.25.1


