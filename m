Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 46CCB52A28
	for <meta-arago@arago-project.org>;
	Mon, 15 Jan 2018 23:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BF5E920B99;
	Mon, 15 Jan 2018 23:41:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id WHjZdLpYEx4E; Mon, 15 Jan 2018 23:41:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9E8B520B93;
	Mon, 15 Jan 2018 23:41:06 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 20760163261;
	Mon, 15 Jan 2018 18:41:06 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 15 Jan 2018 18:41:05 -0500
Message-Id: <1516059665-5822-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] external-linaro-toolchain: stop using deprecated ${COREBASE}/LICENSE
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
X-List-Received-Date: Mon, 15 Jan 2018 23:41:21 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb | 5 +----
 .../recipes-core/meta/external-linaro-toolchain-cross.bb             | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb b/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb
index 92f3fd7..945ef7b 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-sdk-toolchain.bb
@@ -12,10 +12,7 @@ EXCLUDE_FROM_SHLIBS = "1"
 
 # License applies to this recipe code, not the toolchain itself
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "\
-	file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-	file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420 \
-"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 INSANE_SKIP_gcc-cross-canadian-arm = "dev-so staticdev"
 INSANE_SKIP_gdb-cross-canadian-arm = "dev-so"
diff --git a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb
index d448f47..14e0826 100644
--- a/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb
+++ b/meta-arago-extras/recipes-core/meta/external-linaro-toolchain-cross.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Stage provided unwind.h header being used by target gcc installation"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 PR = "r1"
 
-- 
2.7.4


