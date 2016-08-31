Return-Path: <jake@udc0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3F01252A3C
	for <meta-arago@arago-project.org>;
	Wed, 31 Aug 2016 18:10:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u7VI9vnE031624
	for <meta-arago@arago-project.org>; Wed, 31 Aug 2016 13:09:57 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7VI9uGR029000
	for <meta-arago@arago-project.org>; Wed, 31 Aug 2016 13:09:56 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 31 Aug 2016 13:09:55 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7VI9tuC011484;
	Wed, 31 Aug 2016 13:09:55 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1bf9xT-0004NO-Af; Wed, 31 Aug 2016 14:09:55 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 31 Aug 2016 14:09:53 -0400
Message-ID: <1472666993-16783-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] openmpacc: add dev dependency on clacc
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
X-List-Received-Date: Wed, 31 Aug 2016 18:10:01 -0000
Content-Type: text/plain

* clacc is the openmpacc kernel compiler and is thus required when
  developing with the openmpacc package.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb b/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
index 8fec0d1..a28a922 100644
--- a/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
+++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc_git.bb
@@ -2,12 +2,13 @@ DESCRIPTION = "TI OpenMP-Acc host runtime and development packages"
 
 include openmpacc.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 inherit cmake
 
 DEPENDS = "boost boost-native opencl"
 RDEPENDS_${PN} += "opencl-runtime"
+RDEPENDS_${PN}-dev += "clacc"
 
 S = "${WORKDIR}/git/host"
 
-- 
1.9.1


