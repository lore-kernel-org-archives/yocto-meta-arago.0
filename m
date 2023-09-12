Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933E0CA0ED3
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 04:23:23 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.18193.1694492595397113071
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 11 Sep 2023 21:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B688440952;
	Tue, 12 Sep 2023 04:23:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A20yfzekkqhd; Tue, 12 Sep 2023 04:23:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 98C61408CD;
	Tue, 12 Sep 2023 04:23:13 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 5362B163CAA;
	Tue, 12 Sep 2023 00:23:13 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] libssh: remove old version
Date: Tue, 12 Sep 2023 04:23:13 +0000
Message-Id: <20230912042313.171928-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 12 Sep 2023 04:23:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14898

From: Denys Dmytriyenko <denys@konsulko.com>

As meta-openembedded/master already has newer version 0.10, remove local
version 0.9 that was added to kirkstone when meta-openembedded had an old=
er
version 0.8.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-sysrepo/libssh/libssh_0.9.5.bb    | 35 -------------------
 1 file changed, 35 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5=
.bb

diff --git a/meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb b/m=
eta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb
deleted file mode 100644
index 43a6827e..00000000
--- a/meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY =3D "Multiplatform C library implementing the SSHv2 and SSHv1 pr=
otocol"
-HOMEPAGE =3D "http://www.libssh.org"
-SECTION =3D "libs"
-LICENSE =3D "LGPLv2.1"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddabb4958b830e5df11d2b0ed8ea25=
5a0"
-
-DEPENDS =3D "zlib openssl"
-
-SRC_URI =3D "git://git.libssh.org/projects/libssh.git;branch=3Dstable-0.=
9"
-SRCREV =3D "0cceefd49d4d397eb21bd36e314ac87739da51ff"
-
-S =3D "${WORKDIR}/git"
-
-inherit cmake
-
-PACKAGECONFIG ??=3D""
-PACKAGECONFIG[gssapi] =3D "-DWITH_GSSAPI=3D1, -DWITH_GSSAPI=3D0, krb5, "
-
-ARM_INSTRUCTION_SET:armv5 =3D "arm"
-
-EXTRA_OECMAKE =3D " \
-    -DWITH_GCRYPT=3D0 \
-    -DWITH_PCAP=3D1 \
-    -DWITH_SFTP=3D1 \
-    -DWITH_ZLIB=3D1 \
-    -DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib', '')} \
-    "
-
-do_configure:prepend () {
-    # Disable building of examples
-    sed -i -e '/add_subdirectory(examples)/s/^/#DONOTWANT/' ${S}/CMakeLi=
sts.txt \
-        || bbfatal "Failed to disable examples"
-}
-
-TOOLCHAIN =3D "gcc"
--=20
2.25.1


