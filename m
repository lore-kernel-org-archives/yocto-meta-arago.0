Return-Path: <dannenberg@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7069C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 11:41:22 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.6345.1665661277590356507
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Oct 2022 04:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YOM0uDlA;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dannenberg@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29DBfCMn093195;
	Thu, 13 Oct 2022 06:41:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665661272;
	bh=MzOSixuVgi7LDPFfY7EOUs0wvhJ+wotoAP5WF9jOy9k=;
	h=From:To:CC:Subject:Date;
	b=YOM0uDlAAYaYxjketRn2LxcDym8SNxwYggmkBsYnncU2En2qOUZALaKMJ4tgVyngy
	 1YCSOaHI8pfkK0FCdIQw8SC0a6BBr/F9w3bfDazKh1ooznQw0aL6FMNaxncuFRJXSh
	 IJRHBWiZ4n6jdzpbshy6wxAsmb8kumQacahuaIQQ=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29DBfChm118266
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Oct 2022 06:41:12 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 13
 Oct 2022 06:41:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 13 Oct 2022 06:41:12 -0500
Received: from dasso.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29DBfCV0031315;
	Thu, 13 Oct 2022 06:41:12 -0500
From: Andreas Dannenberg <dannenberg@ti.com>
To: <denys@konsulko.com>, <reatmon@ti.com>, <praneeth@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andreas Dannenberg <dannenberg@ti.com>
Subject: [master/kirkstone/dunfell][PATCH] meta-toolchain-arago: update executable fixup for Ubuntu 20.04+ compatibility
Date: Thu, 13 Oct 2022 06:41:04 -0500
Message-ID: <20221013114104.144903-1-dannenberg@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Oct 2022 11:41:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14083

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
/home/user/ti/processor-sdk-linux-am62axx-evm-08.04.00.20/linux-devkit/sysroots/x86_64-arago-linux/usr/bin/flex: error while loading shared libraries: libm.so.6: cannot open shared object file: No such file or directory
make[1]: *** [scripts/Makefile.host:9: scripts/kconfig/lexer.lex.c] Error 127

Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
---
I propose this patch to go into all current branches including
'dunfell', even though we don't officially support Ubunut 22.04 yet for
example. Enough folks try and use it. This patch makes it actually work.

 meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 95ed3ffa..8fed34f5 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -303,7 +303,7 @@ if [ "$dl_path" = "" ] ; then
 	echo "SDK could not be set up. Relocate script unable to find ld-linux.so. Abort!"
 	exit 1
 fi
-executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm /111 -exec file '{}' \;| grep "\(executable\|dynamically linked\)" | cut -f 1 -d ':')
+executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm /111 -exec file '{}' \;| grep "\(executable\|dynamically linked\|static-pie linked\)" | cut -f 1 -d ':')
 
 tdir=`mktemp -d`
 if [ x$tdir = x ] ; then
-- 
2.34.1


