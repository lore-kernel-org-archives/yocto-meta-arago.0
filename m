Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 0724D529AE
	for <meta-arago@arago-project.org>;
	Mon, 16 Jul 2018 17:51:27 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6GHpGWa018415
	for <meta-arago@arago-project.org>; Mon, 16 Jul 2018 12:51:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531763476;
	bh=6fwjsYHNltzSOMb139reDV2QT5pQKTuIcZhdC9/+6Dg=;
	h=From:To:CC:Subject:Date;
	b=kHpD5Uc+Z4Ojo4TMBCkf2qIocVMaMsNcW6wdWOYS7lknWhBBxolYhF5iAAVHeDUCt
	rRliS/6vJ6PkOi4PPnW6tgtqclfKt5fiohAWNG/v2q0fgtPdULOgfv4o2oH3Z4eIIa
	EqRNGguYzkP5gk1YrgRHjNLaxTdzQu4Brv1r+GfE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6GHpGkM001484
	for <meta-arago@arago-project.org>; Mon, 16 Jul 2018 12:51:16 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 16 Jul 2018 12:51:16 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 16 Jul 2018 12:51:16 -0500
Received: from puget.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6GHpGGt018319;
	Mon, 16 Jul 2018 12:51:16 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Jul 2018 17:49:25 +0000
Message-ID: <20180716174925.21203-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] systemd: use eth0 as RequiredForOnline so systemd-networkd-wait-online won't stall
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
X-List-Received-Date: Mon, 16 Jul 2018 17:51:28 -0000
Content-Type: text/plain

Otherwise on systems with multiple interfaces systemd-networkd-wait-online
will wait for all of them to get configured before timing out after 2 minutes.
That'll block services that wait for network to come online, like Matrix, etc.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/systemd/systemd/10-eth.network | 2 +-
 .../systemd/systemd/{10-eth.network => 15-eth.network}        | 3 +++
 meta-arago-distro/recipes-core/systemd/systemd_%.bbappend     | 4 +++-
 3 files changed, 7 insertions(+), 2 deletions(-)
 copy meta-arago-distro/recipes-core/systemd/systemd/{10-eth.network => 15-eth.network} (71%)

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network b/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
index 5d958664..b16ce4c3 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
+++ b/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
@@ -1,5 +1,5 @@
 [Match]
-Name=eth*
+Name=eth0
 KernelCommandLine=!root=/dev/nfs
 
 [Network]
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network b/meta-arago-distro/recipes-core/systemd/systemd/15-eth.network
similarity index 71%
copy from meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
copy to meta-arago-distro/recipes-core/systemd/systemd/15-eth.network
index 5d958664..be47a01f 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd/10-eth.network
+++ b/meta-arago-distro/recipes-core/systemd/systemd/15-eth.network
@@ -2,5 +2,8 @@
 Name=eth*
 KernelCommandLine=!root=/dev/nfs
 
+[Link]
+RequiredForOnline=no
+
 [Network]
 DHCP=yes
diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
index f6cb9542..54e6c29d 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".arago5"
+PR_append = ".arago6"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -11,6 +11,7 @@ SRC_URI_append = " \
     file://usb1-rules.sh \
     file://usb2-rules.sh \
     file://10-eth.network \
+    file://15-eth.network \
     file://30-wlan.network \
     file://60-usb.network \
     file://sync-clocks.service \
@@ -26,6 +27,7 @@ do_install_append() {
 
     install -d ${D}${sysconfdir}/systemd/network/
     install -m 0644 ${WORKDIR}/10-eth.network ${D}${sysconfdir}/systemd/network/
+    install -m 0644 ${WORKDIR}/15-eth.network ${D}${sysconfdir}/systemd/network/
     install -m 0644 ${WORKDIR}/30-wlan.network ${D}${sysconfdir}/systemd/network/
     install -m 0644 ${WORKDIR}/60-usb.network ${D}${sysconfdir}/systemd/network/
 
-- 
2.17.1


