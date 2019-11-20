Return-Path: <xuj@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id B00A652986
	for <meta-arago@arago-project.org>;
	Wed, 20 Nov 2019 16:57:18 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAKGtpuF042301
	for <meta-arago@arago-project.org>; Wed, 20 Nov 2019 10:55:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1574268951;
	bh=m3SxAhw6/KrF9gEqvE088QrRbaDKryjMFWcjcN2o39I=;
	h=From:To:CC:Subject:Date;
	b=lNx0YySA+6gEm64qRUohDTofG4nmWhlKa4HF/oGIl4GQRAVSL0QdW0KXqjlpd4IRQ
	EyqY9ew1Roeq4nfSlj+Hf90y92/+obNBI2SvlF2A+0EZoQGPxxbU4Gr4iAXUgBgiT0
	6xgP9T3xyS0LPMVVRlfszEegLqIbsCGikqVARqyU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAKGtpQE036625
	for <meta-arago@arago-project.org>; Wed, 20 Nov 2019 10:55:51 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 20 Nov 2019 10:55:50 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 20 Nov 2019 10:55:50 -0600
Received: from UDA0869574.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAKGtopo119509;
	Wed, 20 Nov 2019 10:55:50 -0600
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 20 Nov 2019 11:54:22 -0500
Message-ID: <20191120165422.9897-1-xuj@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] neo-ai-dlr: fix dlr runtime problem
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
X-List-Received-Date: Wed, 20 Nov 2019 16:57:19 -0000
Content-Type: text/plain

* move dlr shared library to python sitepackages dlr folder

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 recipes-support/neo-ai/neo-ai-dlr_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-support/neo-ai/neo-ai-dlr_git.bb b/recipes-support/neo-ai/neo-ai-dlr_git.bb
index cbf4447..e81a939 100644
--- a/recipes-support/neo-ai/neo-ai-dlr_git.bb
+++ b/recipes-support/neo-ai/neo-ai-dlr_git.bb
@@ -57,6 +57,7 @@ do_install() {
 
     # setup.py install some libs under datadir, but we don't need them, so remove.
     rm ${D}${datadir}/dlr/*.so
+    mv ${D}${libdir}/libdlr.so ${D}${PYTHON_SITEPACKAGES_DIR}/dlr
 
     # Now install python test scripts
     install -d ${D}${datadir}/dlr/tests
-- 
2.17.1


