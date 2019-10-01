Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 5019E520DF
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2019 12:46:59 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91CjlUk113705
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2019 07:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569933947;
	bh=LcYuol3Araq9IH2/cz1yUGHqdcZvILo/Yo/id7VpTuc=;
	h=From:To:CC:Subject:Date;
	b=CmAcFDli/nLShxGo2T5w19Nk7hbVkgilyvfM/7Rz5rxJKAEashBwRk5gi4vmgW31s
	/SHc4E91mPkwtwaPBKubIPs/1c0HKVQs5sb7ZO7BxWtQsBndlYSbtR3LdWeHKs0bXr
	fLdxpQFLAFOWHcFb+aq0aQ/ZTg77WjG4jK0lAclM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x91CjlvO127515
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2019 07:45:47 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 1 Oct 2019 07:45:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 1 Oct 2019 07:45:37 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91Cjjab071423; 
	Tue, 1 Oct 2019 07:45:46 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Oct 2019 18:14:17 +0530
Message-ID: <1569933857-77302-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master PATCH v1] recipes-tisdk: makefile: Move matrix-gui out of common targets
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
X-List-Received-Date: Tue, 01 Oct 2019 12:46:59 -0000
Content-Type: text/plain

Many machines do not support matrix-gui. Remove the Makefile target
matrix-gui from the list of common targets.

This will ensure that the make all / make install on other machine SDKs
will not cause failures.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 28b616d..e99821e 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -57,7 +57,8 @@ SRC_URI = "\
 
 PR = "r102"
 
-MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
+MAKEFILES_MATRIX_GUI = "matrix-gui \
+                        matrix-gui-browser \
                         refresh-screen \
                         qt-tstat \
 "
@@ -67,7 +68,6 @@ MAKEFILES_MATRIX_GUI_omapl138 = ""
 MAKEFILES_MATRIX_GUI_j7-evm = ""
 
 MAKEFILES_COMMON = "linux \
-                    matrix-gui \
                     arm-benchmarks \
                     am-sysinfo \
                     oprofile-example \
-- 
1.9.1


