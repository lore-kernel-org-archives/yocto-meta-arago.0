Return-Path: <d-senicic1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 5DBFB529C0
	for <meta-arago@arago-project.org>;
	Mon,  2 Jul 2018 18:10:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w62IAD9v099512
	for <meta-arago@arago-project.org>; Mon, 2 Jul 2018 13:10:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530555013;
	bh=gEUzuDFnp51x9yv0jLZk2zFAeX7Eqsugp1QPiMHsYN0=;
	h=From:To:CC:Subject:Date;
	b=lE4CbZSjBpeeB/ogWVdPdtj7bjwXuSUoIJ0xMQ22v6QUU111UyY5KrDp1z/tECxYS
	eLx+VQVgTBgVfYvzwTjcMNB3nNZIsAqtTmK3S2RElhTrauODAV4SNhUVJJ6hUO/2W5
	6D70e6aGeiGqmEvb2M/9ZbREAjtqDan66OjdzH8o=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w62IADXP032630
	for <meta-arago@arago-project.org>; Mon, 2 Jul 2018 13:10:13 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 2 Jul 2018 13:10:12 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 2 Jul 2018 13:10:12 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w62IACfv014804;
	Mon, 2 Jul 2018 13:10:12 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 2 Jul 2018 14:10:07 -0400
Message-ID: <1530555007-22337-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCH] tidl: Add tidl-demos and tidl-utils to opencl packagegroups
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
X-List-Received-Date: Mon, 02 Jul 2018 18:10:19 -0000
Content-Type: text/plain

* tidl-utils: ARM and x86 binary utilities, like tidl-viewer
* tidl-demos: System level demo, like tidl-examples package

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bbappend   | 2 +-
 recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bbappend
index 694fa75..35e362e 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bbappend
@@ -1,3 +1,3 @@
 PR_append = ".tisdk0"
 
-UTILS_append_am57xx-evm = " tidl-examples-dev"
+UTILS_append_am57xx-evm = " tidl-examples-dev tidl-demos-dev"
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
index 782affe..bf50cea 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
@@ -1,6 +1,6 @@
 PR_append = ".tisdk0"
 
-TIDL_PKGS = "tidl-examples-dev tidl-viewer"
+TIDL_PKGS = "tidl-examples-dev tidl-viewer tidl-utils tidl-demos-dev"
 
 EXTRA_PKGS_append_am57xx-evm = " ${TIDL_PKGS}"
 EXTRA_PKGS_append_am57xx-hs-evm = " ${TIDL_PKGS}"
-- 
1.9.1


