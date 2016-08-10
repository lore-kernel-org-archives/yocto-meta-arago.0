Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTPS id 444AD529AA
	for <meta-arago@arago-project.org>;
	Wed, 10 Aug 2016 19:44:43 +0000 (UTC)
Received: from vz-proxy-m002.mx.aol.com ([64.236.83.3])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OBP0015PLH63VM0@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 10 Aug 2016 14:44:05 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=yQ9kT6OsLgv7WE5tBE7I5g==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=8WInZxtUmQaPytMsKwoA:9
Received: by 100.15.86.14 with SMTP id 30897187; Wed, 10 Aug 2016 19:44:05 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 680ED1620C3;	Wed, 10 Aug 2016 15:43:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 10 Aug 2016 15:43:50 -0400
Message-id: <1470858232-3586-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/3] meta-toolchain-arago: switch from bzip2 to xz compression for devkits
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
X-List-Received-Date: Wed, 10 Aug 2016 19:44:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

xz provides much better compression ratio (~40% smaller) and supports
multi-threading when compressing.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago.bb              | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 014bc76..8457d6d 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -10,7 +10,11 @@ inherit toolchain-scripts
 
 require recipes-core/meta/meta-toolchain.bb
 
-PR = "r32"
+PR = "r33"
+
+XZ_COMPRESSION_LEVEL ?= "-e -6"
+XZ_INTEGRITY_CHECK ?= "crc32"
+XZ_THREADS ?= "-T 0"
 
 # This function creates an environment-setup-script for use in a deployable SDK
 toolchain_create_sdk_env_script () {
@@ -142,7 +146,7 @@ fakeroot tar_sdk() {
 	# Package it up
 	mkdir -p ${SDK_DEPLOY}
 	cd ${SDK_OUTPUT}/${SDKPATH}
-	tar --owner=root --group=root -cj --file=${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
+	tar --owner=root --group=root -c . | xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} - > ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
 }
 
 fakeroot create_shar() {
@@ -269,7 +273,7 @@ fi
 payload_offset=$(($(grep -na -m1 "^MARKER:$" $0|cut -d':' -f1) + 1))
 
 printf "Extracting SDK..."
-tail -n +$payload_offset $0| $SUDO_EXEC tar xj -C $target_sdk_dir
+tail -n +$payload_offset $0| $SUDO_EXEC tar xJ -C $target_sdk_dir
 echo "done"
 
 printf "Setting it up..."
@@ -335,8 +339,8 @@ exit 0
 MARKER:
 EOF
 	# append the SDK tarball
-	cat ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 >> ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
+	cat ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.xz >> ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	# delete the old tarball, we don't need it anymore
-	rm ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2
+	rm ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
 }
-- 
2.7.4


