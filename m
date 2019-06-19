Return-Path: <anandb@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id D1FD55297F
	for <meta-arago@arago-project.org>;
	Wed, 19 Jun 2019 15:35:54 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5JFZDwM033014
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 10:35:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560958513;
	bh=RMvsSMuNl+J8tRRLT5/R0y2ojflbQCH8mtqcpfUKiOA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Xmts1tf8hi3kmq9QBTiaD+jerL2zo7tbVCZVSokgVDRRMN4YscFrTMeYT3p0uXj9m
	SL4QyBC+xh/vanlkNxeeEwxUt9MgJEkS91slhF43ku5z5g4xsuHUB8FF9Z+0krsRKX
	tbyQihDUuikzUpG8plJ2mOtQHHBGCn3Lq0hsWXns=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5JFZDTK063826
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 10:35:13 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 19 Jun 2019 10:35:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 19 Jun 2019 10:35:13 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5JFZAZH117712; 
	Wed, 19 Jun 2019 10:35:12 -0500
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 19 Jun 2019 21:05:05 +0530
Message-ID: <1560958508-141402-2-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560958508-141402-1-git-send-email-anandb@ti.com>
References: <1560958508-141402-1-git-send-email-anandb@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [[thud] PATCH] glmark2: disable for J7
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
X-List-Received-Date: Wed, 19 Jun 2019 15:35:55 -0000
Content-Type: text/plain

glmark2 has a dependency on libgbm which will come from Mesa. Disable this for
now on J7.

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb b/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb
index d7744ad..0b38596 100644
--- a/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-arago-extras/recipes-benchmark/glmark2/glmark2_git.bb
@@ -13,6 +13,7 @@ DEPENDS = "libpng jpeg"
 PV = "2014.03+${SRCPV}"
 
 COMPATIBLE_HOST_rpi  = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '.*-linux*', 'null', d)}"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
 
 SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https \
     file://build-Check-packages-to-be-used-by-the-enabled-flavo.patch \
-- 
1.9.1


