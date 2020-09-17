Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id B9C5D52979
	for <meta-arago@arago-project.org>;
	Thu, 17 Sep 2020 19:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 22F2840C28;
	Thu, 17 Sep 2020 19:36:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id JVRS94AEzfij; Thu, 17 Sep 2020 19:36:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1077F40B66;
	Thu, 17 Sep 2020 19:36:23 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id C5C1317408E;
	Thu, 17 Sep 2020 15:36:22 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 17 Sep 2020 15:36:22 -0400
Message-Id: <1600371382-54119-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell/master][PATCH] meta-toolchain-arago: export few more OE specific variables
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
X-List-Received-Date: Thu, 17 Sep 2020 19:39:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Those may potentially be used by other nativesdk components in devkit.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index bdaf9cc..e59c518 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -62,9 +62,13 @@ toolchain_create_sdk_env_script () {
 	echo 'export LDFLAGS="${TARGET_LD_ARCH} --sysroot=$SDK_PATH_TARGET"' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT=$SDK_PATH_NATIVE' >> $script
 	echo 'export OECORE_TARGET_SYSROOT=$SDK_PATH_TARGET' >> $script
+	echo 'export SDKTARGETSYSROOT=$SDK_PATH_TARGET' >> $script
 	echo 'export OECORE_ACLOCAL_OPTS="-I $SDK_PATH_NATIVE/usr/share/aclocal"' >> $script
 	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
+	echo 'export OECORE_BASELIB="${baselib}"' >> $script
+	echo 'export OECORE_TARGET_ARCH="${TARGET_ARCH}"' >>$script
+	echo 'export OECORE_TARGET_OS="${TARGET_OS}"' >>$script
 
         # Borrowed from oe-core/meta/classes/toolchain-scripts.bbclass
 	cat >> $script <<EOF
-- 
2.7.4


