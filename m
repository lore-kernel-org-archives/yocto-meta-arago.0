Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF79CC6FD26
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.861.1663041771164233483
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B046740D73
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8k00X_gcrR4U for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A197940D98
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 4331C1749C8
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 52/52] all: fix up more bashisms
Date: Tue, 13 Sep 2022 04:02:46 +0000
Message-Id: <20220913040246.2365077-53-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14028

From: Denys Dmytriyenko <denys@konsulko.com>

Fix up additional bashisms thoughout the code.

This is far from being complete - there are plenty of bashisms left in
tisdk-bundle and manifest generation code, but at least the bundle can
be built now.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../classes/tisdk-bundle.bbclass              |  6 ++---
 .../recipes-core/images/arago-image.inc       |  1 +
 .../ti-tisdk-makefile_1.0.bb                  |  2 +-
 .../recipes-core/meta/meta-toolchain-arago.bb | 22 +++++++++----------
 4 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-=
distro/classes/tisdk-bundle.bbclass
index 6a0b4eca..b92ca0c0 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -500,7 +500,7 @@ generate_sw_manifest_table() {
         return 1
     fi
=20
-    if [ "$gplv3_only" =3D=3D "" ]
+    if [ "$gplv3_only" =3D "" ]
     then
         # The second parameter was not passed so set to false
         gplv3_only=3D"false"
@@ -633,7 +633,7 @@ EOF
             esac
         done
=20
-        if [ "$extra_files" =3D=3D "1" ]
+        if [ "$extra_files" =3D "1" ]
         then
             source=3D"$source"" <br>Files from:<br><a href=3Dhttps://git=
.yoctoproject.org/meta-arago>https://git.yoctoproject.org/meta-arago</a><=
br><a href=3Dhttps://git.yoctoproject.org/meta-ti>https://git.yoctoprojec=
t.org/meta-ti</a>"
         fi
@@ -662,7 +662,7 @@ echo "
 " >> ${SW_MANIFEST_FILE}
=20
 cat >> ${SW_MANIFEST_TEXT} << EOF
-| ${package} | ${version} | ${license//\|/or} | ${delivered_as} | ${modi=
fied} | ${location} | ${source}
+| ${package} | ${version} | ${license} | ${delivered_as} | ${modified} |=
 ${location} | ${source}
 EOF
     done
=20
diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta=
-arago-distro/recipes-core/images/arago-image.inc
index 73c49ce4..0bb3634b 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -22,6 +22,7 @@ IMAGE_LINGUAS =3D ""
 TOOLCHAIN_HOST_TASK +=3D "nativesdk-buildtools-perl-dummy"
 SDK_PACKAGE_ARCHS +=3D "buildtools-dummy-${SDKPKGSUFFIX}"
=20
+# FIXME: remove bashisms from this function (currently disabled)
 make_bootfiles_symlinks_relative() {
     for f in "${IMAGE_ROOTFS}/boot"/*
     do
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-m=
akefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tis=
dk-makefile_1.0.bb
index 85b99bf2..b991351f 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile=
_1.0.bb
@@ -267,7 +267,7 @@ do_install () {
=20
     cat ${D}/Makefile | grep "__DTB_DEPEND__" > /dev/null
=20
-    if [ "$?" =3D=3D "0" ]
+    if [ "$?" =3D "0" ]
     then
         sed -i -e "s|__KERNEL_DEVICETREE__|${KERNEL_DEVICETREE}|" ${D}/M=
akefile
         sed -i -e "s/__DTB_DEPEND__/linux-dtbs/" ${D}/Makefile
diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb =
b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index b89f54c7..9dfa6c85 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -112,17 +112,17 @@ arago_sdk_fixup () {
 	[ -e ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/${TOOLCHAIN_SYS} ] || ln=
 -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/${TOOLCHAIN_SYS}
 	tcpath=3D"${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/${TOOLCHAIN=
_SYS}"
 	mkdir -p $tcpath
-	pushd $tcpath
-	ln -s ${SDKTARGETSYSROOT}/include include
-	if [ "${TOOLCHAIN_BRAND}" !=3D "arago" ]; then
-		mkdir -p libc
-		cd libc
-	fi
-	mkdir -p usr
-	ln -s ${SDKTARGETSYSROOT}/lib lib
-	ln -s ${SDKTARGETSYSROOT}/usr/lib usr/lib
-	ln -s ${SDKTARGETSYSROOT}/usr/include usr/include
-	popd
+	( cd $tcpath; \
+		ln -s ${SDKTARGETSYSROOT}/include include; \
+		if [ "${TOOLCHAIN_BRAND}" !=3D "arago" ]; then \
+			mkdir -p libc; \
+			cd libc; \
+		fi; \
+		mkdir -p usr; \
+		ln -s ${SDKTARGETSYSROOT}/lib lib; \
+		ln -s ${SDKTARGETSYSROOT}/usr/lib usr/lib; \
+		ln -s ${SDKTARGETSYSROOT}/usr/include usr/include; \
+	)
 }
=20
 fakeroot create_sdk_files() {
--=20
2.25.1


