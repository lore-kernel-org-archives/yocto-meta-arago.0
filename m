Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 6163452A12
	for <meta-arago@arago-project.org>;
	Sat,  8 Feb 2020 05:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D0AE140B9E;
	Sat,  8 Feb 2020 05:52:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 5MDe5e9QIDWh; Sat,  8 Feb 2020 05:52:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B34D840AD1;
	Sat,  8 Feb 2020 05:52:58 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id ED1381743E4;
	Sat,  8 Feb 2020 00:52:57 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat,  8 Feb 2020 00:52:57 -0500
Message-Id: <1581141177-42420-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [zeus/master][PATCH] optee-test: also depend on pycryptodomex, as scripts used from optee-os
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
X-List-Received-Date: Sat, 08 Feb 2020 05:54:54 -0000

From: Denys Dmytriyenko <denys@ti.com>

Cleanup optee-os and optee-client, while at it.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-security/optee/optee-client.bbappend   | 5 -----
 meta-arago-distro/recipes-security/optee/optee-os_git.bbappend   | 2 --
 meta-arago-distro/recipes-security/optee/optee-test_git.bbappend | 7 +------
 3 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-client.bbappend b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
index c653612..39152f8 100644
--- a/meta-arago-distro/recipes-security/optee/optee-client.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
@@ -2,11 +2,6 @@ PR_append = ".arago0"
 
 SRC_URI = "git://git.ti.com/optee/ti-optee-client.git;branch=${BRANCH} \
            file://tee-supplicant.service"
-
-LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
-
-PV = "3.7.0+git${SRCPV}"
-
 BRANCH = "ti-optee-client"
 SRCREV = "2e526f4be1d471706915ba1e0044bcbe7c0b2626"
 
diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index 88af965..da70fe7 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -1,7 +1,5 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
-
 DEPENDS += "python3-pycryptodomex-native"
 
 PR_append = ".arago0"
diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
index 42bdadf..913e8b5 100644
--- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
@@ -1,14 +1,9 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-inherit python3native
-
-DEPENDS += "python3-pycrypto-native"
+DEPENDS += "python3-pycryptodomex-native"
 
 PR_append = ".arago0"
 
 SRC_URI = "git://git.ti.com/optee/ti-optee-test.git;branch=${BRANCH}"
-
-PV = "3.7.0+git${SRCPV}"
-
 BRANCH = "ti-optee-test"
 SRCREV = "7c68d7b098b19363ada3c48b133484b018254fb1"
-- 
2.7.4


