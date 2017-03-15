Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 9AFD1529C3
	for <meta-arago@arago-project.org>;
	Wed, 15 Mar 2017 18:13:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2FIDRUq018247
	for <meta-arago@arago-project.org>; Wed, 15 Mar 2017 13:13:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489601607;
	bh=xOwZyTlTYjkYtz7R0qPTXceTa2p6U8qxS5p8YfCmbeg=;
	h=From:To:CC:Subject:Date;
	b=NxF7F/qAzpVXIzrQyw/rHKiKnkpra2GV7naUKgqav6uA6vofR5oTasQtXIUoTrpEH
	x9k86GM/WwibkNOrBspZ15pAwRpsMSQ5d6xYwhkRcifl7gvRGSU150nfJ2P7ZO1acN
	l0sy1a1RZ3o1qFffzcobkTKqATFwqFpFgc/0uv+8=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2FIDM6n011740
	for <meta-arago@arago-project.org>; Wed, 15 Mar 2017 13:13:22 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 15 Mar 2017 13:13:21 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v2FIDLr7013122;	Wed, 15 Mar 2017 13:13:21 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 15 Mar 2017 14:11:10 -0400
Message-ID: <1489601470-2055-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [krogoth/morty/master][PATCH] openmpacc: bump SRCREV to version 1.5.1.0
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
X-List-Received-Date: Wed, 15 Mar 2017 18:13:38 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc b/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
index c43b8d4..3a02d78 100644
--- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
+++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
@@ -2,7 +2,7 @@ SUMMARY = "TI OpenMP Accelerator Model"
 HOMEPAGE = "http://downloads.ti.com/mctools/esd/docs/openmpacc/"
 LICENSE = "BSD"
 
-PV = "1.5.0.0"
+PV = "1.5.1.0"
 INC_PR = "r0"
 
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=aaa2a0939d08197132fc382e97b62eb0"
@@ -13,9 +13,8 @@ OMPACC_GIT_URI = "git://git.ti.com/openmp/ti-openmpacc.git"
 OMPACC_GIT_PROTOCOL = "git"
 OMPACC_GIT_BRANCH = "master"
 
-OMPACC_SRCREV = "f0aca40a7644d8934453403f8cad63cb2e4944d8"
+OMPACC_SRCREV = "e0b45ed5325a156e1d133102bd554429a6063181"
 
 BRANCH = "${OMPACC_GIT_BRANCH}"
 SRC_URI = "${OMPACC_GIT_URI};protocol=${OMPACC_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${OMPACC_SRCREV}"
-
-- 
2.7.4


