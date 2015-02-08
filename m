Return-Path: <sam.nelson@TI.COM>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id DFA7452099
	for <meta-arago@arago-project.org>;
	Sun,  8 Feb 2015 21:24:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t18LOf18014300
	for <meta-arago@arago-project.org>; Sun, 8 Feb 2015 15:24:41 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t18LOePx014261
	for <meta-arago@arago-project.org>; Sun, 8 Feb 2015 15:24:40 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 8 Feb 2015 15:24:40 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t18LOesW022176;	Sun, 8 Feb 2015 15:24:40 -0600
From: Sam Nelson <sam.nelson@TI.COM>
To: <meta-arago@arago-project.org>
Date: Sun, 8 Feb 2015 16:24:38 -0500
Message-ID: <1423430678-15468-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] packagegroup-arago-base-tisdk-server-extra: Add new package group
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
X-List-Received-Date: Sun, 08 Feb 2015 21:24:43 -0000
Content-Type: text/plain

- Adds other packages libnl, perl, ndisc6, python and other ti packages
  meant to be shared by tisdk server filesystem.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../packagegroup-arago-base-tisdk-server-extra.bb  |  142 ++++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100755 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
new file mode 100755
index 0000000..eedde5d
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -0,0 +1,142 @@
+DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit packagegroup
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+ARAGO_LIBNL = "\
+    libnl-route \
+    libnl-nf \
+    libnl-genl \
+    libnl-cli \
+    "
+
+ARAGO_PERL = "\
+    perl \
+    perl-module-carp \
+    perl-module-class-struct \
+    perl-module-errno \
+    perl-module-exporter \
+    perl-module-exporter-heavy \
+    perl-module-fcntl \
+    perl-module-file-spec \
+    perl-module-file-spec-unix \
+    perl-module-file-stat \
+    perl-module-io-dir \
+    perl-module-io-file \
+    perl-module-io-handle \
+    perl-module-io-pipe \
+    perl-module-io-poll \
+    perl-module-io-seekable \
+    perl-module-io-select \
+    perl-module-io-socket-inet \
+    perl-module-io-socket-unix \
+    perl-module-io-socket \
+    perl-module-io \
+    perl-module-list-util \
+    perl-module-selectsaver \
+    perl-module-socket \
+    perl-module-strict \
+    perl-module-symbol \
+    perl-module-tie-handle \
+    perl-module-tie-hash \
+    perl-module-tie-stdhandle \
+    perl-module-vars \
+    perl-module-warnings-register \
+    perl-module-warnings \
+    perl-module-xsloader \
+    "
+
+ARAGO_NDISC6 = "\
+    ndisc6-ndisc6 \
+    ndisc6-rdisc6 \
+    ndisc6-rltraceroute6 \
+    ndisc6-tcpspray6 \
+    ndisc6-tcptraceroute6 \
+    ndisc6-tracert6 \
+    "
+
+ARAGO_PYTHON = "\
+    python-core \
+    python-io \
+    python-ctypes \
+    python-json \
+    python-numpy \
+    python-codecs \
+    python-subprocess \
+    python-pickle \
+    python-shell \
+    python-logging \
+    python-mmap \
+    python-profile \
+    python \
+    "
+
+ARAGO_SECURE_STORAGE = "\
+    ti-softhsmv2 \
+    "
+
+ARAGO_TI_PKGS = "\
+    uio-module-drv \
+    multiprocmgr \
+    mpm-transport \
+    traceframework \
+    cuia \
+    hplib \
+    hplib-mod \
+    libnl-xfrm \
+    demo-image-proc \
+    ti-ipc \
+    rm-lld \
+    cmem \
+    cmem-mod \
+    mmap-lld \
+    udma \
+    cuia \
+    qmss-lld \
+    pa-lld \
+    cppi-lld \
+    edma3-lld \
+    hyplnk-lld \
+    pktlib \
+    nwal-lld \
+    srss-tc \
+    "
+
+RDEPENDS_${PN} = "\
+    ${ARAGO_LIBNL} \
+    ${ARAGO_PERL} \
+    ${ARAGO_NDISC6} \
+    ${ARAGO_PYTHON} \
+    ${ARAGO_TI_PKGS} \
+    ${ARAGO_SECURE_STORAGE} \
+    ptpd \
+    vsftpd \
+    syslog-ng \
+    dtc \
+    strongswan \
+    procps \
+    dhcp-client \
+    ipsec-tools \
+    kexec \
+    kdump \
+    tzdata \
+    lksctp-tools \
+    lksctp-tools-utils \
+    libdnet \
+    vtun \
+    bridge-utils \
+    ebtables \
+    rng-tools \
+    elfutils \
+    zip \
+    libsdl \
+    libgomp \
+    libgomp-dev \
+    file \
+    libbz2 \
+    boost \
+	"
-- 
1.7.9.5


