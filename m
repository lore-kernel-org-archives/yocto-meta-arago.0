Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 0E05F52A69
	for <meta-arago@arago-project.org>;
	Fri, 18 Nov 2016 22:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 22D3C20AB6;
	Fri, 18 Nov 2016 22:09:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gFap7gfIseLX; Fri, 18 Nov 2016 22:09:53 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 90130208E7;
	Fri, 18 Nov 2016 22:09:52 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id BE60B1621A7;
	Fri, 18 Nov 2016 17:09:51 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 18 Nov 2016 17:09:45 -0500
Message-Id: <1479506990-10407-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479506990-10407-1-git-send-email-denis@denix.org>
References: <1479506990-10407-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/8] wlconf: fix build with any toolchain by using proper CC var
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
X-List-Received-Date: Fri, 18 Nov 2016 22:09:55 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-connectivity/wlconf/wlconf.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/wlconf/wlconf.bb b/meta-arago-extras/recipes-connectivity/wlconf/wlconf.bb
index 167ea43..625891c 100644
--- a/meta-arago-extras/recipes-connectivity/wlconf/wlconf.bb
+++ b/meta-arago-extras/recipes-connectivity/wlconf/wlconf.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=adc05a1903d3f107f85
 
 PV = "R8.6+git${SRCPV}"
 
-PR = "r4"
+PR = "r5"
 
 # Tag: R8.6
 SRCREV = "cf8965aad73764022669647fa33852558a657930"
@@ -12,7 +12,7 @@ SRC_URI = "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git"
 
 S = "${WORKDIR}/git/wlconf"
 
-EXTRA_OEMAKE = "CC=${TARGET_PREFIX}gcc"
+EXTRA_OEMAKE = "CC="${CC}""
 
 do_install() {
 	install -d ${D}${bindir}
-- 
2.7.4


