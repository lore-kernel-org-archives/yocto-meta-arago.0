Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id AD134529F6
	for <meta-arago@arago-project.org>;
	Wed, 25 Mar 2020 06:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BC7D740BCC;
	Wed, 25 Mar 2020 06:03:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ijm8UKsXyzPf; Wed, 25 Mar 2020 06:03:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A3D9140A35;
	Wed, 25 Mar 2020 06:03:16 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 5CEC21718E9;
	Wed, 25 Mar 2020 02:03:15 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 25 Mar 2020 02:03:13 -0400
Message-Id: <1585116194-34727-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585116194-34727-1-git-send-email-denys@ti.com>
References: <1585116194-34727-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 2/3] libloki: use BPN instead of PN for SRC_URI and S
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
X-List-Received-Date: Wed, 25 Mar 2020 06:05:28 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-support/loki/libloki_0.1.7.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-support/loki/libloki_0.1.7.bb b/meta-arago-extras/recipes-support/loki/libloki_0.1.7.bb
index d7d7980..07aaa2f 100644
--- a/meta-arago-extras/recipes-support/loki/libloki_0.1.7.bb
+++ b/meta-arago-extras/recipes-support/loki/libloki_0.1.7.bb
@@ -4,14 +4,14 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://README;md5=5f7c1a2bebe34fc290234984d5845b03"
 
-SRC_URI = "http://libloki.sourcearchive.com/downloads/${PV}-3/${PN}_${PV}.orig.tar.gz \
+SRC_URI = "http://libloki.sourcearchive.com/downloads/${PV}-3/${BPN}_${PV}.orig.tar.gz \
            file://0001-include-loki-Threads.h-return-statement-with-a-value.patch \
            file://0002-test-Function-FunctionTest.cpp-reference-to-bad_func.patch"
 
 SRC_URI[md5sum] = "af532c24a7f2e12d0829be8201934d92"
 SRC_URI[sha256sum] = "0c2094ce916b106731c8be61c32f538a22e1c0f8398bd5d6295b13d08e0c41a3"
 
-S = "${WORKDIR}/${PN}-${PV}.orig"
+S = "${WORKDIR}/${BPN}-${PV}.orig"
 
 do_configure () {
     sed -i -e 's|^prefix.*$|prefix := ${D}${prefix}|g' ${S}/Makefile.common
-- 
2.7.4


