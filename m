Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 3D796529CB
	for <meta-arago@arago-project.org>;
	Wed, 25 Feb 2015 20:56:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1PKu2gB011142
	for <meta-arago@arago-project.org>; Wed, 25 Feb 2015 14:56:02 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1PKu1JT003047
	for <meta-arago@arago-project.org>; Wed, 25 Feb 2015 14:56:01 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Feb 2015 14:56:01 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1PKu18B011449;	Wed, 25 Feb 2015 14:56:01 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 25 Feb 2015 15:55:58 -0500
Message-ID: <1424897759-23944-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/2] packagegroup-arago-mcsdk-toolchain-target: Add package group for mcsdk toolchain
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
X-List-Received-Date: Wed, 25 Feb 2015 20:56:03 -0000
Content-Type: text/plain

- Adds ti dev packages, platform specific packages and other additional packages

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../packagegroup-arago-mcsdk-toolchain-target.bb   |   94 ++++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-mcsdk-toolchain-target.bb

diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-mcsdk-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-mcsdk-toolchain-target.bb
new file mode 100644
index 0000000..9265a8c
--- /dev/null
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-mcsdk-toolchain-target.bb
@@ -0,0 +1,94 @@
+DESCRIPTION = "Target dev packages for MCSDK SDK"
+LICENSE = "BSD-3-Clause"
+
+PR = "r0"
+
+inherit packagegroup
+
+TI_PKGS_DEV = "\
+	cmem-dev \
+	cmem-staticdev \
+	"
+TI_SECURE_STORAGE_DEV = "\
+	ti-softhsmv2-dev \
+	libp11-dev \
+	libp11-staticdev \
+	"
+
+TI_PKGS_DEV_append_keystone = "\
+	${TI_SECURE_STORAGE_DEV} \
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
+	"
+
+TI_PKGS_DEV_append_k2l-evm = "\
+	dfe-lld-dev \
+	dfe-lld-staticdev \
+	iqn2-lld-dev \
+	iqn2-lld-staticdev \
+	"
+
+TI_PKGS_DEV_append_k2hk-evm = "\
+	srio-lld-dev \
+	srio-lld-staticdev \
+	"
+
+RDEPENDS_${PN} += " \
+	packagegroup-arago-standalone-sdk-target \
+	kernel-dev \
+	${TI_PKGS_DEV} \
+	libdnet-dev \
+	libdnet-staticdev \
+	binutils-dev \
+	binutils-staticdev \
+	elfutils-dev \
+	elfutils-staticdev \
+	libbz2-dev \
+	libbz2-staticdev \
+	libgl-mesa-dev \
+	boost-dev \
+	libsdl-dev \
+	"
-- 
1.7.9.5


