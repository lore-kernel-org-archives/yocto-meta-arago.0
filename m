Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 6620252A10
	for <meta-arago@arago-project.org>;
	Tue,  3 Oct 2017 21:03:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93L31rj030261
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 16:03:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507064581;
	bh=fNhC1sXCDO0By++53CPS4kQ55cbn8QpQzfsjPmH1UuE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=OliCJHzpqTN57pU6vim3cugNGPyjmotDVF3lWKXcx5N/xB3IO9PywOMYWKN7GFf+l
	cl1Ho6VNXpybuGz5oAsHzAHIQypck0r64kmeFI70wdCneDP0cZxeyEV2JGpANlTSEL
	K0OHLzx5gEz6gKYpjKZtcmrx9mPpWzxklcZbkobo=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93L31JN026513
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 16:03:01 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 16:03:00 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 16:03:00 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93L30fC028952
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 16:03:00 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Oct 2017 17:02:56 -0400
Message-ID: <1507064577-60360-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507064577-60360-1-git-send-email-e-ruei1@ti.com>
References: <1507064577-60360-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v3 1/2] packagegroup-arago-test-addons: remove omapdrmtest for X11(xsgx) build
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
X-List-Received-Date: Tue, 03 Oct 2017 21:03:01 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend
index 038d122..b27eec8 100644
--- a/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk7"
+PR_append = ".tisdk8"
 
 TEST_ADDONS_TI_append_keystone = " \
     mmap-lld-test \
@@ -30,3 +30,6 @@ TEST_ADDONS_TI_append_ti43x  = " \
 TEST_ADDONS_TI_append_am335x-evm  = " icss-emac-lld-test"
 TEST_ADDONS_TI_append_am437x-evm  = " icss-emac-lld-test"
 TEST_ADDONS_TI_append_k2g-evm  = " icss-emac-lld-test"
+TEST_ADDONS_TI_remove_omap-a15 = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'omapdrmtest', '', d)} \
+    "
-- 
1.9.1


