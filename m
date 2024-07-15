Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA5DC3DA4B
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 18:50:12 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.600.1721069412283595810
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 15 Jul 2024 11:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A5F3940C67;
	Mon, 15 Jul 2024 18:50:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PDwuc269lY6J; Mon, 15 Jul 2024 18:50:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 61702407DA;
	Mon, 15 Jul 2024 18:50:10 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id C8586163FEB;
	Mon, 15 Jul 2024 14:50:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] recipes: UNPACKDIR cleanup
Date: Mon, 15 Jul 2024 14:50:08 -0400
Message-Id: <20240715185008.15655-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 15 Jul 2024 18:50:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15439

From: Denys Dmytriyenko <denys@konsulko.com>

Fix warning that S does not exist, since it defaults to ${WORKDIR}/${BP}

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb        | 7 +++++--
 meta-arago-extras/recipes-core/llvm/llvm-common.bb         | 7 +++++--
 .../recipes-devtools/opkg/opkg-bash-completion.bb          | 5 ++++-
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb b/meta-a=
rago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
index 83a2cba3..bed03208 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
@@ -9,12 +9,15 @@ SRC_URI =3D "file://qt_env.sh \
            file://eglfs_kms_cfg.json \
           "
=20
+S =3D "${WORKDIR}/sources"
+UNPACKDIR =3D "${S}"
+
 # Add custom Arago qtbase Environment script and eglfs_kms configuration=
 file
 do_install () {
     install -d ${D}${sysconfdir}/profile.d
-    install -m 0644 ${UNPACKDIR}/qt_env.sh ${D}${sysconfdir}/profile.d/
+    install -m 0644 ${S}/qt_env.sh ${D}${sysconfdir}/profile.d/
     install -d ${D}${sysconfdir}/qt5
-    install -m 0644 ${UNPACKDIR}/eglfs_kms_cfg.json ${D}${sysconfdir}/qt=
5/
+    install -m 0644 ${S}/eglfs_kms_cfg.json ${D}${sysconfdir}/qt5/
 }
=20
 FILES:${PN} +=3D "${sysconfdir}/profile.d/* ${sysconfdir}/qt5/*"
diff --git a/meta-arago-extras/recipes-core/llvm/llvm-common.bb b/meta-ar=
ago-extras/recipes-core/llvm/llvm-common.bb
index 9668375e..cf03e434 100644
--- a/meta-arago-extras/recipes-core/llvm/llvm-common.bb
+++ b/meta-arago-extras/recipes-core/llvm/llvm-common.bb
@@ -4,17 +4,20 @@ LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;=
md5=3D0835ade698e0bcf8506ecda
=20
 SRC_URI =3D "file://llvm-config"
=20
+S =3D "${WORKDIR}/sources"
+UNPACKDIR =3D "${S}"
+
 ALLOW_EMPTY:${PN} =3D "1"
 SYSROOT_PREPROCESS_FUNCS:append:class-target =3D " llvm_common_sysroot_p=
reprocess"
=20
 llvm_common_sysroot_preprocess() {
     install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-    install -m 0755 ${UNPACKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_=
crossscripts}/
+    install -m 0755 ${S}/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscr=
ipts}/
 }
=20
 do_install:class-native() {
     install -d ${D}${bindir}
-    install -m 0755 ${UNPACKDIR}/llvm-config ${D}${bindir}
+    install -m 0755 ${S}/llvm-config ${D}${bindir}
 }
=20
 BBCLASSEXTEND =3D "native"
diff --git a/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion=
.bb b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
index a5c78ead..51f0dd3e 100644
--- a/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
+++ b/meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.bb
@@ -7,9 +7,12 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MI=
T;md5=3D3da9cfbcb788c80a0384
=20
 SRC_URI =3D "file://opkg-bash-completion"
=20
+S =3D "${WORKDIR}/sources"
+UNPACKDIR =3D "${S}"
+
 do_install() {
     install -d ${D}${datadir}/bash-completion/completions
-    install -m 0644 ${UNPACKDIR}/opkg-bash-completion \
+    install -m 0644 ${S}/opkg-bash-completion \
                     ${D}${datadir}/bash-completion/completions/opkg
 }
=20
--=20
2.35.3


