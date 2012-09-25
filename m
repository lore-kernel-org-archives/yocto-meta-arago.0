Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id ED8FC529A4
	for <meta-arago@arago-project.org>;
	Tue, 25 Sep 2012 15:10:30 +0000 (UTC)
Received: by obblz20 with SMTP id lz20so1286452obb.38
	for <meta-arago@arago-project.org>;
	Tue, 25 Sep 2012 08:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=p97I2KeRCO9AOqkxfj7uW/VE62DdVDEZThenPmkP3m8=;
	b=UN8+b3Gsm6C+V91JKf+n+M4zHz4j0p8ek8ZKxb+fFBvHxRXoX7dMMrdduCoNBjlhBc
	D6VL3p9hYfxS27esEU0o5BwDN64Bw8k+4lwLEdw7TJfGii9JKM4N+8iFKg/0ucR3b4a+
	0fc+kM9PuAMuHJ2C0KBp/9ukzZc1XNpFczDenRGnvZo50fiXpPgFPiNOKfdAeNciIE9C
	LbwkYVpeYSvbSvUdzNqpEmrMAGMt7X9bwR+M44Up/SxsRD/Lj+jf1crMj7MtvG5q+pml
	p4faYgDI2MEBAtj7VWM+ced1mqPrEcT3VXwrAsAUi4xN8TbSesvfEJ4bo4szumhNj/ED
	8eyw==
Received: by 10.182.110.67 with SMTP id hy3mr12792570obb.52.1348585830376;
	Tue, 25 Sep 2012 08:10:30 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id ec1sm467704obc.2.2012.09.25.08.10.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Sep 2012 08:10:29 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Tue, 25 Sep 2012 10:35:10 -0500
Message-Id: <1348587310-25357-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] openssl: Add SHA and MD5 large file patch
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
X-List-Received-Date: Tue, 25 Sep 2012 15:10:31 -0000

* Add patch that allows SHA and MD5 operations to work with large files
* Change from PR_INC to PR_append using meta-arago-distro append naming
  convention.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch |   59 ++++++++++++++++++++
 .../openssl/openssl_1.0.0i.bbappend                |    8 +-
 2 files changed, 63 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-distro/recipes-connectivity/openssl/openssl/0002-Modify-eng_cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch

diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl/0002-Modify-eng_cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch b/meta-arago-distro/recipes-connectivity/openssl/openssl/0002-Modify-eng_cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch
new file mode 100644
index 0000000..9f3d1cb
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/openssl/openssl/0002-Modify-eng_cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch
@@ -0,0 +1,59 @@
+From 6c7f195aadd770476b714f5c3075fbc74366d535 Mon Sep 17 00:00:00 2001
+From: Greg Turner <gregturner@ti.com>
+Date: Wed, 7 Mar 2012 15:45:53 -0600
+Subject: [PATCH 2/2] Modify eng_cryptodev.c to make SHA1 and MD5 work with big file sizes
+
+Upstream-Status: pending
+	* Will be submitted upstream
+
+---
+ crypto/engine/eng_cryptodev.c |    6 ++++++
+ 1 files changed, 6 insertions(+), 0 deletions(-)
+
+diff --git a/crypto/engine/eng_cryptodev.c b/crypto/engine/eng_cryptodev.c
+index 52f4ca3..44f3c10 100644
+--- a/crypto/engine/eng_cryptodev.c
++++ b/crypto/engine/eng_cryptodev.c
+@@ -42,6 +42,8 @@
+ # endif
+ #endif
+
++#define OPENSSL_CRYPTODEF_HASH_NO_ONESHOT 1
++
+ #ifndef HAVE_CRYPTODEV
+
+ void
+@@ -711,6 +713,7 @@ static int cryptodev_digest_update(EVP_MD_CTX *ctx, const void *data,
+		return (0);
+	}
+
++#ifndef OPENSSL_CRYPTODEF_HASH_NO_ONESHOT
+	if (!(ctx->flags & EVP_MD_CTX_FLAG_ONESHOT)) {
+		/* if application doesn't support one buffer */
+		state->mac_data = OPENSSL_realloc(state->mac_data, state->mac_len + count);
+@@ -725,6 +728,7 @@ static int cryptodev_digest_update(EVP_MD_CTX *ctx, const void *data,
+
+		return (1);
+	}
++#endif
+
+	memset(&cryp, 0, sizeof(cryp));
+
+@@ -755,6 +759,7 @@ static int cryptodev_digest_final(EVP_MD_CTX *ctx, unsigned char *md)
+		return(0);
+	}
+
++#ifndef OPENSSL_CRYPTODEF_HASH_NO_ONESHOT
+	if (! (ctx->flags & EVP_MD_CTX_FLAG_ONESHOT) ) {
+		/* if application doesn't support one buffer */
+		memset(&cryp, 0, sizeof(cryp));
+@@ -773,6 +778,7 @@ static int cryptodev_digest_final(EVP_MD_CTX *ctx, unsigned char *md)
+
+		return 1;
+	}
++#endif
+
+	memcpy(md, state->digest_res, ctx->digest->md_size);
+
+--
+1.7.0.4
diff --git a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.0i.bbappend b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.0i.bbappend
index 3536316..d7c677d 100644
--- a/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.0i.bbappend
+++ b/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.0i.bbappend
@@ -10,11 +10,11 @@
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR = "${INC_PR}.4"
+PR_append = "-arago5"
 
-SRC_URI += " \
-            file://find.pl \
-            "
+SRC_URI += "file://find.pl \
+            file://0002-Modify-eng_cryptodev.c-to-make-SHA1-and-MD5-work-wit.patch \
+"
 
 do_configure_prepend() {
   cp ${WORKDIR}/find.pl ${S}/util/find.pl
-- 
1.7.0.4


