Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 13F4F52A10
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2020 20:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A3E0940C0A;
	Tue, 17 Mar 2020 20:11:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id jaMrDO60gE0n; Tue, 17 Mar 2020 20:11:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9158040C1E;
	Tue, 17 Mar 2020 20:11:46 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id E5039171265;
	Tue, 17 Mar 2020 16:11:44 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 17 Mar 2020 16:11:38 -0400
Message-Id: <1584475904-3730-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584475904-3730-1-git-send-email-denys@ti.com>
References: <1584475904-3730-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 3/9] openfst: only inherit pythonnative for python PACKAGECONFIG
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
X-List-Received-Date: Tue, 17 Mar 2020 20:13:56 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-support/openfst/openfst_1.6.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-support/openfst/openfst_1.6.2.bb b/meta-arago-extras/recipes-support/openfst/openfst_1.6.2.bb
index 2f693d2..b2a1f66 100644
--- a/meta-arago-extras/recipes-support/openfst/openfst_1.6.2.bb
+++ b/meta-arago-extras/recipes-support/openfst/openfst_1.6.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "OpenFst: library for operating on finite-state transducers"
 DESCRIPTION = "OpenFst: a library for constructing, combining, optimizing, and searching weighted finite-state transducers (FSTs)"
 LICENSE = "Apache-2.0"
 HOMEPAGE = "http://www.openfst.org/twiki/bin/view/FST/WebHome"
-PR ="r0"
+PR = "r0"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=17bdccf7f927b4b2aeac950537db3369"
 SRC_URI = "http://openslr.org/resources/2/openfst-${PV}.tar.gz"
@@ -12,7 +12,7 @@ S = "${WORKDIR}/openfst-${PV}"
 SRC_URI[md5sum] = "e5b2b8c41a8320a03f3a8bbea63bb0ca"
 SRC_URI[sha256sum] = "3f72e35097fdf1c1c41e15165c16696c223295b40b7b145b5466306db7972578"
 
-inherit autotools pythonnative
+inherit autotools ${@bb.utils.contains("PACKAGECONFIG", "python", "pythonnative", "", d)}
 
 # From the OpenFST documentation:
 #
-- 
2.7.4


