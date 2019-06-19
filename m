Return-Path: <d-senicic1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 02AE752972
	for <meta-arago@arago-project.org>;
	Wed, 19 Jun 2019 23:26:10 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5JNPSWC107422
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 18:25:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560986728;
	bh=ra0UYtay7hzXB8c2DTzZhULUofdZ3FFD6RR0DYVxyZ8=;
	h=From:To:CC:Subject:Date;
	b=VPoSDJMZeSZizNfkYI5T7FZbT/Z4JRB9AM45A7fIX95KBzQS+VPVJ2MT327K+214Z
	I4Pq44q/laGJShhd2cv8IyzB7xFHLAoDEOQPB319YyUcqaHmgxCCha4WkOmvWHhjcm
	j0SHY+L10FYBJMaZyXKnlpKnnDObSnY4ChOSMdI4=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5JNPSmt012110
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 18:25:28 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 19 Jun 2019 18:25:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 19 Jun 2019 18:25:28 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5JNPR0u105816;
	Wed, 19 Jun 2019 18:25:28 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 19 Jun 2019 14:15:41 -0400
Message-ID: <20190619181541.17550-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [meta-processor-sdk][PATCH] tidl: Add tidl-examples, tidl-utils, tidl-import to dra76x build
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
X-List-Received-Date: Wed, 19 Jun 2019 23:26:14 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../packagegroup-arago-tisdk-opencl-sdk-host.bbappend          | 3 ++-
 .../packagegroup-arago-tisdk-opencl-sdk-target.bbappend        | 1 +
 .../packagegroups/packagegroup-arago-tisdk-opencl.bbappend     | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bbappend
index 48bef98..387c748 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bbappend
@@ -1,4 +1,5 @@
-PR_append = ".tisdk0"
+PR_append = ".tisdk1"
 
 UTILS_append_am57xx-evm = "tidl-examples-src"
 UTILS_append_am57xx-hs-evm = "tidl-examples-src"
+UTILS_append_dra7xx-evm = "tidl-examples-src"
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bbappend
index c14398c..4021a13 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bbappend
@@ -2,3 +2,4 @@ PR_append = ".tisdk0"
 
 UTILS_append_am57xx-evm = " tidl-examples-dev"
 UTILS_append_am57xx-hs-evm = " tidl-examples-dev"
+UTILS_append_dra7xx-evm = " tidl-examples-dev"
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
index 9bbb4e1..d095c21 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bbappend
@@ -4,3 +4,4 @@ TIDL_PKGS = "tidl-examples-dev tidl-viewer tidl-utils tidl-import"
 
 EXTRA_PKGS_append_am57xx-evm = " ${TIDL_PKGS}"
 EXTRA_PKGS_append_am57xx-hs-evm = " ${TIDL_PKGS}"
+EXTRA_PKGS_append_dra7xx-evm = " ${TIDL_PKGS}"
-- 
2.17.1


