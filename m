Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 207FB52998
	for <meta-arago@arago-project.org>;
	Tue, 11 Jun 2019 18:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BABB940BAE;
	Tue, 11 Jun 2019 18:45:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id xDN8ANWFr-yQ; Tue, 11 Jun 2019 18:45:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9F21840BAD;
	Tue, 11 Jun 2019 18:45:55 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id CBFDC16FEDF;
	Tue, 11 Jun 2019 14:45:54 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 11 Jun 2019 14:45:53 -0400
Message-Id: <1560278753-56122-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] meta-toolchain-arago: pass --sysroot= option to C, CXX, CPP, LD in environment setup
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
X-List-Received-Date: Tue, 11 Jun 2019 18:46:36 -0000

OE-built toolchain requires passing --sysroot= option to compiler/linker. Since
we always used prebuilt Linaro/Arm toolchain in the past, we never needed this.

Sync up with coresponding code in OE-Core to pass --sysroot= in the environment
setup script.

Most Makefiles and autotools will respect those variables being setup. When using
devkit to manually cross-compile, call $CC, $CXX, $LD instead of directly calling
corresponding compiler/linker, otherwise pass --sysroot= option manually.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 3d827a7..065531e 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -47,10 +47,11 @@ toolchain_create_sdk_env_script () {
 	echo 'export PKG_CONFIG_PATH=$SDK_PATH_TARGET${libdir}/pkgconfig' >> $script
 	echo 'export PKG_CONFIG_ALLOW_SYSTEM_LIBS=1' >> $script
 	echo 'export CONFIG_SITE=$SDK_PATH/site-config-$REAL_MULTIMACH_TARGET_SYS' >> $script
-	printf 'export CC=\x24{TOOLCHAIN_PREFIX}gcc\n' >> $script
-	printf 'export CXX=\x24{TOOLCHAIN_PREFIX}g++\n' >> $script
+	printf 'export CC="\x24{TOOLCHAIN_PREFIX}gcc --sysroot=$SDK_PATH_TARGET"\n' >> $script
+	printf 'export CXX="\x24{TOOLCHAIN_PREFIX}g++ --sysroot=$SDK_PATH_TARGET"\n' >> $script
 	printf 'export GDB=\x24{TOOLCHAIN_PREFIX}gdb\n' >> $script
-	printf 'export CPP="\x24{TOOLCHAIN_PREFIX}gcc -E"\n' >> $script
+	printf 'export CPP="\x24{TOOLCHAIN_PREFIX}gcc -E --sysroot=$SDK_PATH_TARGET"\n' >> $script
+	printf 'export LD="\x24{TOOLCHAIN_PREFIX}ld --sysroot=$SDK_PATH_TARGET"\n' >> $script
 	printf 'export NM=\x24{TOOLCHAIN_PREFIX}nm\n' >> $script
 	printf 'export AS=\x24{TOOLCHAIN_PREFIX}as\n' >> $script
 	printf 'export AR=\x24{TOOLCHAIN_PREFIX}ar\n' >> $script
-- 
2.7.4


