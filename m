Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 635245209B
	for <meta-arago@arago-project.org>;
	Fri, 18 Sep 2015 18:58:31 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NUV00BLMZD2VO30@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 18 Sep 2015 13:58:15 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=ff-B7xzCdYMA:10 a=sozttTNsAAAA:8
	a=lTaffnaOjYQEs8HXVuEA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C7E95161C47;	Fri,
	18 Sep 2015 14:58:14 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 18 Sep 2015 14:58:14 -0400
Message-id: <1442602694-15713-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] meta-toolchain-arago: adjust devkit paths slightly for new 2015.05+ toolchain layout
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
X-List-Received-Date: Fri, 18 Sep 2015 18:58:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 5e88c86..cda39a6 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -8,7 +8,7 @@ SDKIMAGE_FEATURES = ""
 
 require recipes-core/meta/meta-toolchain.bb
 
-PR = "r29"
+PR = "r30"
 
 # This function creates an environment-setup-script for use in a deployable SDK
 toolchain_create_sdk_env_script () {
@@ -82,6 +82,8 @@ arago_sdk_fixup () {
 	tcv=`ls -1 $lexec|head -1`
 	ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/$tcv
 	ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/$tcv
+	ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/lib/${TOOLCHAIN_SYS}
+	ln -s . ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/usr/lib/${TOOLCHAIN_SYS}
 	tcpath="${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/${TOOLCHAIN_SYS}"
 	mkdir -p $tcpath
 	pushd $tcpath
@@ -90,10 +92,9 @@ arago_sdk_fixup () {
 		mkdir -p libc
 		cd libc
 	fi
-	mkdir -p lib
-	mkdir -p usr/lib
-	ln -s ${SDKTARGETSYSROOT}/lib lib/${TOOLCHAIN_SYS}
-	ln -s ${SDKTARGETSYSROOT}/usr/lib usr/lib/${TOOLCHAIN_SYS}
+	mkdir -p usr
+	ln -s ${SDKTARGETSYSROOT}/lib lib
+	ln -s ${SDKTARGETSYSROOT}/usr/lib usr/lib
 	ln -s ${SDKTARGETSYSROOT}/usr/include usr/include
 	popd
 }
-- 
2.2.0


