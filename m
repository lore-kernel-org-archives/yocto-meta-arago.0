Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 9325052993
	for <meta-arago@arago-project.org>;
	Fri, 14 Sep 2018 17:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2E16620BC0;
	Fri, 14 Sep 2018 17:22:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id fs73Jy4fN7Fq; Fri, 14 Sep 2018 17:22:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0A71420059;
	Fri, 14 Sep 2018 17:22:53 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 6A9C8163639;
	Fri, 14 Sep 2018 13:22:53 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 14 Sep 2018 13:22:52 -0400
Message-Id: <1536945772-3303-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] optee: update client and test to the latest
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
X-List-Received-Date: Fri, 14 Sep 2018 17:23:08 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-security/optee/optee-client.bbappend   | 4 ++--
 meta-arago-distro/recipes-security/optee/optee-test_git.bbappend | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-client.bbappend b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
index 52a6f58..b71bf0d 100644
--- a/meta-arago-distro/recipes-security/optee/optee-client.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".arago0"
+PR_append = ".arago1"
 
 SRC_URI = "git://git.ti.com/optee/ti-optee-client.git;branch=${BRANCH} \
            file://tee-supplicant.service"
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
 PV = "3.2.0+git${SRCPV}"
 
 BRANCH = "ti_optee_client"
-SRCREV = "2d542f2074223fde918e68efa4a9ff37f927e604"
+SRCREV = "6b4ca04b3a3738f7697597164dc1e055d4e65441"
diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
index f85c719..bbdb8ae 100644
--- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = ".arago0"
+PR_append = ".arago1"
 
 SRC_URI = "git://git.ti.com/optee/ti-optee-test.git;branch=${BRANCH}"
 
@@ -9,4 +9,4 @@ SRC_URI += "file://0001-host-xtest-Makefile-fix-COMPILE_NS_USER-not-being-se.pat
 PV = "3.2.0+git${SRCPV}"
 
 BRANCH = "ti_optee_test"
-SRCREV = "b284eedf4fa20c21403ececfe0a47af55fbaa5d8"
+SRCREV = "36c8eef15437f2280e657be7d296564452e3c427"
-- 
2.7.4


