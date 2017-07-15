Return-Path: <denys@ti.com>
Received: from mailout3.zoneedit.com (mailout3.zoneedit.com [64.68.198.16])
	by arago-project.org (Postfix) with ESMTPS id F0126529BB
	for <meta-arago@arago-project.org>;
	Sat, 15 Jul 2017 19:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout3.zoneedit.com (Postfix) with ESMTP id DF4F540C2F;
	Sat, 15 Jul 2017 19:17:20 +0000 (UTC)
Received: from mailout3.zoneedit.com ([127.0.0.1])
	by localhost (zmo01-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id KcbGGF5kXqLd; Sat, 15 Jul 2017 19:17:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout3.zoneedit.com (Postfix) with ESMTPSA id C4346406EA;
	Sat, 15 Jul 2017 19:17:19 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 83A8B16200E;
	Sat, 15 Jul 2017 15:17:19 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Sat, 15 Jul 2017 15:17:18 -0400
Message-Id: <1500146238-89477-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] optee-os: add handling of OPTEE pager config
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
X-List-Received-Date: Sat, 15 Jul 2017 19:17:21 -0000

Requires separate build with enabled config option and install under different name.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-security/optee/optee-os_git.bbappend | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index d5116fb..2cf3656 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -29,6 +29,16 @@ do_compile() {
         normfl=`echo ${OPTEEFLAVOR} | tr "_" "-"`
         mv tee.bin.signed $normfl.optee; \
     )
+
+    if [ "${OPTEEPAGER}" = "y" ]; then
+        oe_runmake clean PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
+        oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR} CFG_WITH_PAGER=y
+        ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
+            ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh tee.bin tee.bin.signed; \
+            normfl=`echo ${OPTEEFLAVOR} | tr "_" "-"`
+            mv tee.bin.signed $normfl-pager.optee; \
+        )
+    fi
 }
 
 do_install() {
-- 
2.7.4


