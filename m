Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 155C752A51
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2020 00:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D9A1140C1F;
	Wed,  8 Apr 2020 00:48:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 2d6M2emBEZIK; Wed,  8 Apr 2020 00:48:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C1AE340A6E;
	Wed,  8 Apr 2020 00:48:28 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 64B6C17126C;
	Tue,  7 Apr 2020 20:48:28 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  7 Apr 2020 20:48:26 -0400
Message-Id: <1586306907-8544-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/2] packagegroup-arago-base-tisdk-server-extra: do not explicitly list perl or python modules
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
X-List-Received-Date: Wed, 08 Apr 2020 00:50:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroup-arago-base-tisdk-server-extra.bb  | 54 ----------------------
 1 file changed, 54 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 1c68ba9..d1f8a49 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -14,42 +14,6 @@ ARAGO_LIBNL = "\
     libnl-cli \
     "
 
-ARAGO_PERL = "\
-    perl \
-    perl-module-carp \
-    perl-module-class-struct \
-    perl-module-errno \
-    perl-module-exporter \
-    perl-module-exporter-heavy \
-    perl-module-fcntl \
-    perl-module-file-spec \
-    perl-module-file-spec-unix \
-    perl-module-file-stat \
-    perl-module-io-dir \
-    perl-module-io-file \
-    perl-module-io-handle \
-    perl-module-io-pipe \
-    perl-module-io-poll \
-    perl-module-io-seekable \
-    perl-module-io-select \
-    perl-module-io-socket-inet \
-    perl-module-io-socket-unix \
-    perl-module-io-socket \
-    perl-module-io \
-    perl-module-list-util \
-    perl-module-selectsaver \
-    perl-module-socket \
-    perl-module-strict \
-    perl-module-symbol \
-    perl-module-tie-handle \
-    perl-module-tie-hash \
-    perl-module-tie-stdhandle \
-    perl-module-vars \
-    perl-module-warnings-register \
-    perl-module-warnings \
-    perl-module-xsloader \
-    "
-
 ARAGO_NDISC6 = "\
     ndisc6-ndisc6 \
     ndisc6-rdisc6 \
@@ -59,22 +23,6 @@ ARAGO_NDISC6 = "\
     ndisc6-tracert6 \
     "
 
-ARAGO_PYTHON = "\
-    python-core \
-    python-io \
-    python-ctypes \
-    python-json \
-    python-numpy \
-    python-codecs \
-    python-subprocess \
-    python-pickle \
-    python-shell \
-    python-logging \
-    python-mmap \
-    python-profile \
-    python \
-    "
-
 ARAGO_SECURE_STORAGE = ""
 # All these secure storage packages need to be
 # migrated to openssl 1.1
@@ -163,9 +111,7 @@ ARAGO_VTUN_aarch64 = ""
 #    recovery-kernel
 RDEPENDS_${PN} = "\
     ${ARAGO_LIBNL} \
-    ${ARAGO_PERL} \
     ${ARAGO_NDISC6} \
-    ${ARAGO_PYTHON} \
     ${ARAGO_TI_PKGS} \
     ${ARAGO_VTUN} \
     ptpd \
-- 
2.7.4


