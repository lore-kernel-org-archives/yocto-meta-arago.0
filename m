Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 8C27652AD5
	for <meta-arago@arago-project.org>;
	Fri, 29 Sep 2017 18:23:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8TINaUn007550
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506709416;
	bh=7sFQXi7jr+LNC46q23eytZtGCQJnB1S9uWu8MvKwZSg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ccQAvr3gFK8fMHxTiJXaqfnUyPklArMOyoySElBtQBUG8/ztZeS735ViJwavhqduI
	BpORunTiAYuch+cHwckW+vE+RSDpGluNKTtVWxjWCAivbwlrnYxqpCHDSqZNvUTPY0
	TnkEAQJO9shIuErPoXmdWUTjVy2wXSGvr4i0vyCo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINai5010257
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:36 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 29 Sep 2017 13:23:36 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 29 Sep 2017 13:23:36 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINW8e006890
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:35 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Sep 2017 14:23:19 -0400
Message-ID: <1506709407-16448-16-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
References: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][morty-x11-experimental][PATCH 15/ packagegroup-arago-test-addons: remove omapdrmtest for X11(xsgx) build
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
X-List-Received-Date: Fri, 29 Sep 2017 18:23:41 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend
index e477295..19a627c 100644
--- a/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk6"
+PR_append = ".tisdk7"
 
 TEST_ADDONS_TI_append_keystone = " \
     mmap-lld-test \
@@ -29,3 +29,7 @@ TEST_ADDONS_TI_append_ti43x  = " \
 
 TEST_ADDONS_TI_append_am335x-evm  = " icss-emac-lld-test"
 TEST_ADDONS_TI_append_am437x-evm  = " icss-emac-lld-test"
+
+TEST_ADDONS_TI_remove_omap-a15 = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'xsgx', 'omapdrmtest', '', d)} \
+    "
-- 
1.9.1


