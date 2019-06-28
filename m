Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 6ABFB52980
	for <meta-arago@arago-project.org>;
	Fri, 28 Jun 2019 21:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 357A440BF6;
	Fri, 28 Jun 2019 21:31:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id WpqWI4BLwuoO; Fri, 28 Jun 2019 21:31:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6D60F40BAE;
	Fri, 28 Jun 2019 21:31:54 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 32099170A98;
	Fri, 28 Jun 2019 17:31:54 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri, 28 Jun 2019 17:31:53 -0400
Message-Id: <1561757513-47688-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561757513-47688-1-git-send-email-denys@ti.com>
References: <1561757513-47688-1-git-send-email-denys@ti.com>
Subject: [thud/master][PATCH 2/2] packagegroup-standalone-sdk-target: pull unconditionally libgomp-dev and libc-staticdev
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
X-List-Received-Date: Fri, 28 Jun 2019 21:32:41 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-standalone-sdk-target.bb     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
index 5a33a04..2a1d29b 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Target packages for the standalone SDK"
-PR = "r12"
+PR = "r13"
 LICENSE = "MIT"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -10,8 +10,9 @@ RDEPENDS_${PN} = "\
     libgcc \
     libgcc-dev \
     libstdc++-dev \
+    libgomp-dev \
     ${LIBC_DEPENDENCIES} \
-    ${@oe.utils.conditional('TCMODE', 'external-linaro', 'glibc-staticdev', '', d)} \
+    libc-staticdev \
     linux-libc-headers-dev \
     gdbserver \
     alsa-dev \
@@ -32,5 +33,4 @@ RDEPENDS_${PN} = "\
     ncurses-dev \
     opkg-dev \
     util-linux-dev \
-    ${@oe.utils.conditional('TCMODE', 'external-linaro', 'libgomp-dev', '', d)} \
-    "
+"
-- 
2.7.4


