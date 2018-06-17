Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 9A64B529BF
	for <meta-arago@arago-project.org>;
	Sun, 17 Jun 2018 19:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8BDBF20BBE;
	Sun, 17 Jun 2018 19:37:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ZtP5Op9zY92K; Sun, 17 Jun 2018 19:37:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 53FC020BCF;
	Sun, 17 Jun 2018 19:37:42 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id D4C571634B0;
	Sun, 17 Jun 2018 15:37:41 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Sun, 17 Jun 2018 15:37:36 -0400
Message-Id: <1529264260-41284-5-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529264260-41284-1-git-send-email-denys@ti.com>
References: <1529264260-41284-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 5/9] packagegroup-*-server-extra: vtun does not support Aarch64, skip it
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
X-List-Received-Date: Sun, 17 Jun 2018 19:37:50 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-base-tisdk-server-extra.bb   | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 343fd2a..564a799 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -153,6 +153,12 @@ ARAGO_TI_PKGS_append_k2e = "\
     hyplnk-lld \
     "
 
+ARAGO_VTUN = "\
+    vtun \
+"
+# vtun does not support aarch64
+ARAGO_VTUN_aarch64 = ""
+
 #    recovery-kernel
 RDEPENDS_${PN} = "\
     ${ARAGO_LIBNL} \
@@ -160,6 +166,7 @@ RDEPENDS_${PN} = "\
     ${ARAGO_NDISC6} \
     ${ARAGO_PYTHON} \
     ${ARAGO_TI_PKGS} \
+    ${ARAGO_VTUN} \
     ptpd \
     vsftpd \
     syslog-ng \
@@ -170,7 +177,6 @@ RDEPENDS_${PN} = "\
     lksctp-tools \
     lksctp-tools-utils \
     libdnet \
-    vtun \
     bridge-utils \
     ebtables \
     rng-tools \
-- 
2.7.4


