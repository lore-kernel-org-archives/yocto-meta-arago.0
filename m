Return-Path: <aparnab@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4615F52A5D
	for <meta-arago@arago-project.org>;
	Thu,  5 Jun 2014 18:45:27 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s55IjQMA023629
	for <meta-arago@arago-project.org>; Thu, 5 Jun 2014 13:45:26 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s55IjQ8q016785
	for <meta-arago@arago-project.org>; Thu, 5 Jun 2014 13:45:26 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 5 Jun 2014 13:45:25 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s55IjQbe019345;	Thu, 5 Jun 2014 13:45:26 -0500
From: Aparna Balasubramanian <aparnab@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 5 Jun 2014 13:47:06 -0500
Message-ID: <1401994026-20738-1-git-send-email-aparnab@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <rng_tools>
References: <rng_tools>
MIME-Version: 1.0
Subject: [META-ARAGO V1] Including rng-tools in arago test package
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
X-List-Received-Date: Thu, 05 Jun 2014 18:45:27 -0000
Content-Type: text/plain

This patch includes rng-tools in arago test package and bumps up revision of package-arago-test.bb.

Signed-off-by: Aparna Balasubramanian <aparnab@ti.com>
---
 .../packagegroups/packagegroup-arago-test.bb       |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index 29c8dae..28269c6 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Extended task to get System Test specific apps"
 LICENSE = "MIT"
-PR = "r16"
+PR = "r17"
 
 inherit packagegroup
 
@@ -19,6 +19,7 @@ ARAGO_TEST = "\
     libdrm-tests \
     powertop \
     stress \
+    rng-tools \
     "
 
 ARAGO_TI_TEST = "\
-- 
1.7.0.4


