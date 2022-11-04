Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A0BC4167B
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.204.1667598074321096534
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 15D1C40D87
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rZtZgi4rehL9 for <meta-arago@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:41:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 084DC40D83
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:41:13 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 99656163681
	for <meta-arago@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:41:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 09/14] meta-toolchain-arago: update executable fixup for Ubuntu 20.04+ compatibility
Date: Fri,  4 Nov 2022 21:41:07 +0000
Message-Id: <20221104214112.1221365-10-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214112.1221365-1-denis@denix.org>
References: <20221104214112.1221365-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14103

From: Andreas Dannenberg <dannenberg@ti.com>

The linux devkit installer patches up the cross toolchain executables'
dynamic library dependencies after installation to reflect the actual
installation location. This is done through the 'file' tool which
starting with Ubuntu 20.04 returns a new link type called 'static-pie
 linked' for files that will need to be patched. To accomodate this
change update the command that is used to identify executables requiring
patching with this new link type.

This fixes dynamic loader errors with cross toolchain tools like flex,
qmake, and others similar to the below:

$ make ti_sdk_arm64_release_defconfig
  LEX     scripts/kconfig/lexer.lex.c
/home/user/ti/processor-sdk-linux-am62axx-evm-08.04.00.20/linux-devkit/sy=
sroots/x86_64-arago-linux/usr/bin/flex: error while loading shared librar=
ies: libm.so.6: cannot open shared object file: No such file or directory
make[1]: *** [scripts/Makefile.host:9: scripts/kconfig/lexer.lex.c] Error=
 127

Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb =
b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 9dfa6c85..ab484a1e 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -303,7 +303,7 @@ if [ "$dl_path" =3D "" ] ; then
 	echo "SDK could not be set up. Relocate script unable to find ld-linux.=
so. Abort!"
 	exit 1
 fi
-executable_files=3D$($SUDO_EXEC find $native_sysroot -type f -perm /111 =
-exec file '{}' \;| grep "\(executable\|dynamically linked\)" | cut -f 1 =
-d ':')
+executable_files=3D$($SUDO_EXEC find $native_sysroot -type f -perm /111 =
-exec file '{}' \;| grep "\(executable\|dynamically linked\|static-pie li=
nked\)" | cut -f 1 -d ':')
=20
 tdir=3D`mktemp -d`
 if [ x$tdir =3D x ] ; then
--=20
2.25.1


