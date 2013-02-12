Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 39ED352A12
	for <meta-arago@arago-project.org>;
	Tue, 12 Feb 2013 00:46:34 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id h2so6983044oag.10
	for <meta-arago@arago-project.org>;
	Mon, 11 Feb 2013 16:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=kmatbv7GcYhNXz6PANQutKbF4CqsMt9W5hEQdX6xbx8=;
	b=oiMN7YQDkBfKyBVMt4YE6uCBTF/x1pZezFR0j49Ekq/LExIDyEs/bJbncGTjGhQyEm
	Ic8LIo4jPdRRDVW00MJljnV5HG5zAjr5EqaO4QRYx5911YEJxw+aPxtBar48DFbiFspi
	nGZ6Eb1fexknMV/SjtS+E5ofUEjO2VmDdMs+GBDBHmcA4T40Hl73JRNStnOsxhhFDBeV
	iCZ7Go1AweSIPT17DEFznXesMDiHMEhmXcupWVjK/bj5DYujOiX6K3M5Y6g1SxrGlzhZ
	il00ebOWI4PmUmPfSJ/NL8L5z6rbIeRqrB3X9XfNk7ERXGmvTyTH4X2ihl3PN20DfAYl
	AkMg==
X-Received: by 10.60.172.131 with SMTP id bc3mr12343539oec.79.1360629993681;
	Mon, 11 Feb 2013 16:46:33 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b6sm52434322oee.3.2013.02.11.16.46.31
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 16:46:32 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 11 Feb 2013 18:46:05 -0600
Message-Id: <1360629979-24789-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360629979-24789-1-git-send-email-fcooper@ti.com>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 04/18] sourceipk.bbclass: Provide the ability to change the source directory
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
X-List-Received-Date: Tue, 12 Feb 2013 00:46:34 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Allow the directory where the sources are grabbed to be changed.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/classes/sourceipk.bbclass |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
index ecc92c2..1844ff3 100644
--- a/meta-arago-distro/classes/sourceipk.bbclass
+++ b/meta-arago-distro/classes/sourceipk.bbclass
@@ -47,6 +47,9 @@ CREATE_SRCIPK ?= "0"
 # Default installation prefix
 SRCIPK_INSTALL_DIR ?= "/usr/src/${PN}-src"
 
+# Specify the directory of the sources
+SRCIPK_SRC_DIR ?= "${S}"
+
 # Default PACKAGE_ARCH for sources is "all"
 SRCIPK_PACKAGE_ARCH ?= "all"
 
@@ -56,7 +59,6 @@ SRCIPK_SECTION ?= "${SECTION}"
 # Default SRCIPK_INCLUDE_EXTRAFILES is to include the extra files
 SRCIPK_INCLUDE_EXTRAFILES ?= "1"
 
-
 # Remove git repositories before packaging up the sources
 clear_git() {
 
@@ -126,11 +128,11 @@ sourceipk_do_create_srcipk() {
 
         # Copy sources for packaging
         mkdir -p $tmp_dir/${SRCIPK_INSTALL_DIR}
-        if [ -e ${S} ]; then
-	    if [ "${S}" = "${WORKDIR}" ]; then
-		excludes='--exclude ./temp --exclude ./sourceipk-tmp --exclude ./sourceipk-data'
-	    fi
-            tar -C ${S} -cO $excludes . | tar -C $tmp_dir/${SRCIPK_INSTALL_DIR} -xpf -
+        if [ -e ${SRCIPK_SRC_DIR} ]; then
+            if [ "${SRCIPK_SRC_DIR}" = "${WORKDIR}" ]; then
+                excludes='--exclude ./temp --exclude ./sourceipk-tmp --exclude ./sourceipk-data'
+            fi
+            tar -C ${SRCIPK_SRC_DIR} -cO $excludes . | tar -C $tmp_dir/${SRCIPK_INSTALL_DIR} -xpf -
         fi
 
         if [ ${SRCIPK_INCLUDE_EXTRAFILES} != "0" ]
-- 
1.7.0.4


