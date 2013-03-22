Return-Path: <hzhang@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 253335298C
	for <meta-arago@arago-project.org>;
	Fri, 22 Mar 2013 13:46:22 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2MDkLkn016185
	for <meta-arago@arago-project.org>; Fri, 22 Mar 2013 08:46:21 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2MDkLil016854
	for <meta-arago@arago-project.org>; Fri, 22 Mar 2013 08:46:21 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 22 Mar 2013 08:46:20 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ares-ubuntu.am.dhcp.ti.com
	[158.218.103.17])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r2MDkKCq005912;	Fri, 22 Mar 2013 08:46:20 -0500
Received: from a0868496 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <hzhang@ti.com>)	id 1UJ2IW-0006rC-Fm; Fri, 22 Mar 2013
	09:46:20 -0400
From: <hzhang@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Mar 2013 09:46:11 -0400
Message-ID: <1363959971-26325-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] bluez-hcidump: update SRC_URI since the old URI is not valid.
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
X-List-Received-Date: Fri, 22 Mar 2013 13:46:22 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 .../bluez/bluez-hcidump_2.2.bb                     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/bluez/bluez-hcidump_2.2.bb b/meta-arago-extras/recipes-connectivity/bluez/bluez-hcidump_2.2.bb
index 57a1a02..4c005ee 100644
--- a/meta-arago-extras/recipes-connectivity/bluez/bluez-hcidump_2.2.bb
+++ b/meta-arago-extras/recipes-connectivity/bluez/bluez-hcidump_2.2.bb
@@ -5,9 +5,9 @@ DEPENDS = "bluez4"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://src/hcidump.c;beginline=1;endline=23;md5=3bee3a162dff43a5be7470710b99fbcf"
-PR = "r0"
+PR = "r1"
 
-SRC_URI = "http://bluez.sourceforge.net/download/bluez-hcidump-${PV}.tar.gz"
+SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/bluez-hcidump-${PV}.tar.gz"
 S = "${WORKDIR}/bluez-hcidump-${PV}"
 
 EXTRA_OECONF = "--with-bluez-libs=${STAGING_LIBDIR} --with-bluez-includes=${STAGING_INCDIR}"
-- 
1.7.9.5


