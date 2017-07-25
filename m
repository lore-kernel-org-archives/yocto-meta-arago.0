Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id DEDAC529AD
	for <meta-arago@arago-project.org>;
	Tue, 25 Jul 2017 20:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CEBD620A4A;
	Tue, 25 Jul 2017 20:09:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id A6n9ZtRFEeDl; Tue, 25 Jul 2017 20:09:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AEB0A206EB;
	Tue, 25 Jul 2017 20:09:57 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 4222B162529;
	Tue, 25 Jul 2017 16:09:57 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 25 Jul 2017 16:09:56 -0400
Message-Id: <1501013396-70945-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] packagegroup-arago-base-tisdk: automatically add OPTEE deps based on OPTEEMACHINE
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
X-List-Received-Date: Tue, 25 Jul 2017 20:09:59 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb  | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
index 5c9333c..13400ca 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
-PR = "r18"
+PR = "r19"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -12,11 +12,6 @@ OPTEE_PKGS = " \
     optee-test \
 "
 
-OPTEE_DEPS = ""
-OPTEE_DEPS_am437x-hs-evm = "${OPTEE_PKGS}"
-OPTEE_DEPS_am57xx-hs-evm = "${OPTEE_PKGS}"
-OPTEE_DEPS_dra7xx-hs-evm = "${OPTEE_PKGS}"
-
 RDEPENDS_${PN} = "\
     dbus \
     expat \
@@ -29,5 +24,5 @@ RDEPENDS_${PN} = "\
     arago-feed-config \
     nfs-utils-client \
     cifs-utils \
-    ${OPTEE_DEPS} \
+    ${@base_conditional('OPTEEMACHINE', 'ti', "${OPTEE_PKGS}", "", d)} \
 "
-- 
2.7.4


