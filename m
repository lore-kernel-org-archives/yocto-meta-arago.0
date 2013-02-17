Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ye0-f181.google.com (mail-ye0-f181.google.com
	[209.85.213.181])
	by arago-project.org (Postfix) with ESMTPS id 6C42652A5D
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 22:53:53 +0000 (UTC)
Received: by mail-ye0-f181.google.com with SMTP id m11so907759yen.26
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 14:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=JfhFyER8f6vJvd+btkkxhDRL+yxjdEzkOlGE0ponmqU=;
	b=KRXggWsZeljma8pEOrfD6O1bwgHxz01LB1eyPqwuTJeHyp8rNQeE1ppq9CLA08evEX
	sc4tEadO9zGW2OEetsHFes+TRwkMXx+eDxaMzq6os1TSyGDt9QlEKQJO9ufAn034qBkA
	PLw+U2h6QmSRJ97hcchvdtb9EPm0GXH/VwSQ1pY4BKujWmweaHs+jHvNQLJophWG0Gwi
	Oz+AlVfWpvAQjzpeO28KitgH1cU8AW0l9/B5tfVsjuAxSuYjJW91KA31BfoqPivllq39
	O2v/8TeoTjV/H+zHUY4KzQS3qftyTLsXQ3AOJo+YIvkiNOour9wQq2Du/dXpaXgUWGbO
	EYKg==
X-Received: by 10.236.129.72 with SMTP id g48mr16905796yhi.102.1361141633125; 
	Sun, 17 Feb 2013 14:53:53 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id s74sm3456861yhh.5.2013.02.17.14.53.51
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 14:53:52 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Sun, 17 Feb 2013 16:53:11 -0600
Message-Id: <1361141595-1687-16-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361141595-1687-1-git-send-email-fcooper@ti.com>
References: <1361141595-1687-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 16/20] meta-toolchain-arago: Create shell stub for gdb
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
X-List-Received-Date: Sun, 17 Feb 2013 22:53:53 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* PYTHONHOME and PYTHONPATH variable causes various problems in the
  environment-setup file.
* Since it is only needed by gdb resurrect the shell stub concept and place
  those environment variables in there for gdb.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago.bb      |   22 +++++++++++++++++++-
 1 files changed, 21 insertions(+), 1 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index 863e0ef..e683f9a 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -5,7 +5,7 @@ TOOLCHAIN_CLEANUP_PACKAGES ?= ""
 
 require recipes-core/meta/meta-toolchain.bb
 
-PR = "r19"
+PR = "r20"
 
 SDKTARGETSYSROOT = "${SDKPATH}/${ARAGO_TARGET_SYS}"
 
@@ -57,12 +57,32 @@ toolchain_create_sdk_env_script () {
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 }
 
+create_shell_stub () {
+	i=$1
+	mv $i $i.real
+	printf "#!/bin/sh\nif [ -n \x22\x24BASH_SOURCE\x22 ]; then\n" > $i
+	printf "\tfilename\x3D\x60echo \x24\x7BBASH_SOURCE\x23\x23\x2A\x2F\x7D\x60\n" >> $i
+	printf "\tdirname\x3D\x24\x7BBASH_SOURCE\x2F\x25\x24filename\x2F\x7D\n" >> $i
+	printf "\t\x2E \x24dirname\x2E\x2E\x2Fenvironment-setup\n" >> $i
+	printf "fi\n" >> $i
+
+	if [ "$2" == "yes" ]; then
+		echo 'export PYTHONHOME=$SDK_PATH' >> $i
+		echo 'export PYTHONPATH=lib/python2.7' >> $i
+	fi
+	printf "LD_LIBRARY_PATH=\x24SDK_PATH/lib:\x24LD_LIBRARY_PATH \x24SDK_PATH/lib/ld-linux.so.2 \x24SDK_PATH/bin/$i.real \x24\x2a\n" >> $i
+	chmod +x $i
+}
+
 populate_sdk_ipk_append () {
 	# Remove broken .la files
 	for i in `find ${SDK_OUTPUT}/${SDKPATH} -name \*.la`; do
 		rm -f $i
 	done
 
+	cd ${SDK_OUTPUT}/${SDKPATH}/bin
+	${@base_conditional('PREFERRED_PROVIDER_gdb-cross-canadian-arm', 'external-arago-sdk-toolchain', '', 'create_shell_stub ${TARGET_PREFIX}gdb yes', d)}
+
 	cleanup_toolchain_packages
 
 	mkdir -p "${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/lib/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
-- 
1.7.0.4


