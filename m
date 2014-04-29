Return-Path: <aparnab@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 00C5052A34
	for <meta-arago@arago-project.org>;
	Tue, 29 Apr 2014 14:31:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3TEVCB5000483
	for <meta-arago@arago-project.org>; Tue, 29 Apr 2014 09:31:12 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3TEVBTi015040
	for <meta-arago@arago-project.org>; Tue, 29 Apr 2014 09:31:12 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 29 Apr 2014 09:31:11 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s3TEVBLN029211;	Tue, 29 Apr 2014 09:31:11 -0500
From: Aparna Balasubramanian <aparnab@ti.com>
To: <meta-arago@arago-project.org>, <aparnab@ti.com>
Message-ID: <1398781791-14760-1-git-send-email-aparnab@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <rng_tools>
References: <rng_tools>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Jun 2014 15:53:33 +0000
Subject: [RNG-TOOLS to arago test package V1] Including rng-tools in arago test package
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
Date: Tue, 29 Apr 2014 14:31:13 -0000
X-Original-Date: Tue, 29 Apr 2014 09:29:51 -0500
X-List-Received-Date: Tue, 29 Apr 2014 14:31:13 -0000
Content-Type: text/plain

This patch includes rng-tools in arago test package and bumps up revision of packagegroup-arago-test.bb.

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


