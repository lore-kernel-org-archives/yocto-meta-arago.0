Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C2361529B5
	for <meta-arago@arago-project.org>;
	Wed, 17 Jun 2015 11:16:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t5HBG2ZV024101
	for <meta-arago@arago-project.org>; Wed, 17 Jun 2015 06:16:02 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t5HBG1bW004284
	for <meta-arago@arago-project.org>; Wed, 17 Jun 2015 06:16:02 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 17 Jun 2015 06:16:01 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t5HBFx8O003085;	Wed, 17 Jun 2015 06:16:01 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 17 Jun 2015 07:15:57 -0400
Message-ID: <1434539757-28779-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1434539757-28779-1-git-send-email-sam.nelson@ti.com>
References: <1434539757-28779-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] packagegroup-arago-tisdk-addons-sdk-target: Add keystone specific packages
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
X-List-Received-Date: Wed, 17 Jun 2015 11:16:04 -0000
Content-Type: text/plain

- Also include k2hk-evm & k2l-evm specific packages

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../packagegroup-arago-tisdk-addons-sdk-target.bb  |   89 +++++++++++++++++++-
 1 file changed, 88 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 9037ea1..93c6b73 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r8"
+PR = "r9"
 
 inherit packagegroup
 
@@ -8,6 +8,93 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 UTILS = "libdrm-dev"
 
+UTILS_append_keystone = "\
+	kernel-dev \
+	libdnet-dev \
+	libdnet-staticdev \
+	binutils-dev \
+	binutils-staticdev \
+	elfutils-dev \
+	elfutils-staticdev \
+	libbz2-dev \
+	libbz2-staticdev \
+	boost-dev \
+	libsdl-dev \
+	"
+
+TI_SECURE_STORAGE_DEV = "\
+	ti-softhsmv2-dev \
+	libp11-dev \
+	libp11-staticdev \
+	"
+
+EXTRA_LIBS_append_keystone = "\
+	${TI_SECURE_STORAGE_DEV} \
+	cmem-dev \
+	cmem-staticdev \
+	udma-dev \
+	udma-staticdev \
+	traceframework-dev \
+	traceframework-staticdev \
+	cuia-dev \
+	cuia-staticdev \
+	common-csl-ip-dev \
+	cppi-lld-dev \
+	cppi-lld-staticdev \
+	qmss-lld-dev \
+	qmss-lld-staticdev \
+	pa-lld-dev \
+	pa-lld-staticdev \
+	rm-lld-dev \
+	rm-lld-staticdev \
+	hyplnk-lld-dev \
+	hyplnk-lld-staticdev \
+	sa-lld-dev \
+	sa-lld-staticdev \
+	hplib-dev \
+	hplib-staticdev \
+	nwal-lld-dev \
+	nwal-lld-staticdev \
+	pktlib-dev \
+	pktlib-staticdev \
+	mmap-lld \
+	mmap-lld-staticdev \
+	netapi-dev \
+	netapi-staticdev \
+	ipsecmgr-dev \
+	ipsecmgr-staticdev \
+	libnl-xfrm-dev \
+	libnl-xfrm-staticdev \
+	libnl-dev \
+	libnl-staticdev \
+	ti-ipc-dev \
+	ti-ipc-staticdev \
+	multiprocmgr-dev \
+	multiprocmgr-staticdev \
+	mpm-transport-dev \
+	mpm-transport-staticdev \
+	edma3-lld-dev \
+	edma3-lld-staticdev \
+	lksctp-tools-dev \
+	lksctp-tools-staticdev \
+	ipc-transport-qmss-dev \
+	ipc-transport-qmss-staticdev \
+	"
+
+EXTRA_LIBS_append_k2l-evm = "\
+	dfe-lld-dev \
+	dfe-lld-staticdev \
+	iqn2-lld-dev \
+	iqn2-lld-staticdev \
+	"
+
+EXTRA_LIBS_append_k2hk-evm = "\
+	srio-lld-dev \
+	srio-lld-staticdev \
+	ipc-transport-srio-dev \
+	ipc-transport-srio-staticdev \
+	"
+
 UTILS_append_omap3 = " canutils-dev"
 UTILS_append_ti33x = " canutils-dev"
 UTILS_append_ti43x = " canutils-dev"
-- 
1.7.9.5


