Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id C5EDA52A10
	for <meta-arago@arago-project.org>;
	Sat, 17 Nov 2012 18:30:28 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so3475453oag.38
	for <meta-arago@arago-project.org>;
	Sat, 17 Nov 2012 10:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Wxu/xfGTG1KwEYhTzKuZ5+d7KqB/lzsmEpQIQM24L9Q=;
	b=p2/Xaw7j+8ZYI+Uvrkgoj9RyMuepYFWI17lsuaYEDX2HigvEm0hGE6AWkx1JQGXveY
	oKLEZRLYh4yEa730GvKMJuLY5bsE7VWHQKC6BrfOoeqBvlKjdQWHyyghG1nCqXzZ4s+x
	V1te3wcuLyVypqEWfpVXXZGAsbyMtvA/BpWyYqMCkiqw6VPizqSqjKUfYO7GbWGHTQFP
	Q9h/ppbcWG0o9o0cIPnMYvaexNAwjBqCt9SbKyRyBFgD+y+9sToUpvtiwS8o00Bj3zay
	DlRkC0JIQAIuIliu1kJmTl14reuPWMF4ag/iqIDtrZl4FRcV4/Kyc3iMJJ8OWgl3cdnC
	F6cg==
Received: by 10.60.170.43 with SMTP id aj11mr7069045oec.71.1353177027838;
	Sat, 17 Nov 2012 10:30:27 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id o3sm5054625obk.13.2012.11.17.10.30.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 17 Nov 2012 10:30:26 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 17 Nov 2012 12:30:14 -0600
Message-Id: <1353177014-1258-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] meta-toolchain-arago: Substitute dirname statement
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
X-List-Received-Date: Sat, 17 Nov 2012 18:30:29 -0000

* On 32bit systems, the dirname statement sometimes return an empty string.
* Replace dirname with several statements that provide the same result.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago.bb      |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index c24fb7e..590aa9c 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -4,7 +4,7 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}"
 
 require recipes-core/meta/meta-toolchain.bb
 
-PR = "r9"
+PR = "r10"
 
 SDKTARGETSYSROOT = "${SDKPATH}/${ARAGO_TARGET_SYS}"
 
@@ -61,7 +61,11 @@ toolchain_create_sdk_env_script () {
 create_gdb_stub () {
 	# Special case for gdb, that is built as part of canadian-cross-sdk
 	mv ${ARAGO_TARGET_SYS}-gdb ${ARAGO_TARGET_SYS}-gdb.real
-	printf "#!/bin/sh\nif [ -n \x22\x24BASH_SOURCE\x22 ]; then\n\t. \x60dirname \x24BASH_SOURCE\x60/../environment-setup\nfi\n" > ${ARAGO_TARGET_SYS}-gdb
+	printf "#!/bin/sh\nif [ -n \x22\x24BASH_SOURCE\x22 ]; then\n" > ${ARAGO_TARGET_SYS}-gdb
+	printf "\tfilename\x3D\x60echo \x24\x7BBASH_SOURCE\x23\x23\x2A\x2F\x7D\x60\n" >> ${ARAGO_TARGET_SYS}-gdb
+	printf "\tdirname\x3D\x24\x7BBASH_SOURCE\x2F\x25\x24filename\x2F\x7D\n" >> ${ARAGO_TARGET_SYS}-gdb
+	printf "\t\x2E \x24dirname\x2E\x2E\x2Fenvironment-setup\n" >> ${ARAGO_TARGET_SYS}-gdb
+	printf "fi\n" >> ${ARAGO_TARGET_SYS}-gdb
 	printf "LD_LIBRARY_PATH=\x24SDK_PATH/lib:\x24LD_LIBRARY_PATH \x24SDK_PATH/lib/ld-linux.so.2 \x24SDK_PATH/bin/${ARAGO_TARGET_SYS}-gdb.real \x24\x2a\n" >> ${ARAGO_TARGET_SYS}-gdb
 	chmod +x ${ARAGO_TARGET_SYS}-gdb
 }
@@ -71,7 +75,11 @@ populate_sdk_ipk_append () {
 	binfiles=`find ! -name "${ARAGO_TARGET_SYS}-*" -type f -perm +111 -exec file {} \;|grep -v ":.*ASCII.*text"|cut -d":" -f1|cut -c3-`
 	for i in $binfiles; do
 		mv $i $i.real
-		printf "#!/bin/sh\nif [ -n \x22\x24BASH_SOURCE\x22 ]; then\n\t. \x60dirname \x24BASH_SOURCE\x60/../environment-setup\nfi\n" > $i
+		printf "#!/bin/sh\nif [ -n \x22\x24BASH_SOURCE\x22 ]; then\n" > $i
+		printf "\tfilename\x3D\x60echo \x24\x7BBASH_SOURCE\x23\x23\x2A\x2F\x7D\x60\n" >> $i
+		printf "\tdirname\x3D\x24\x7BBASH_SOURCE\x2F\x25\x24filename\x2F\x7D\n" >> $i
+		printf "\t\x2E \x24dirname\x2E\x2E\x2Fenvironment-setup\n" >> $i
+		printf "fi\n" >> $i
 		printf "LD_LIBRARY_PATH=\x24SDK_PATH/lib:\x24LD_LIBRARY_PATH \x24SDK_PATH/lib/ld-linux.so.2 \x24SDK_PATH/bin/$i.real \x24\x2a\n" >> $i
 		chmod +x $i
 	done
-- 
1.7.0.4


