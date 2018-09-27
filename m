Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id DB73752A15
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2018 23:32:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RNWoUr025772
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 18:32:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538091170;
	bh=75pW2pMtWf8ZTJSQQ4vD3UTPxMDJqZgUdosXA56drrM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qcUELDh8V1AHiNAlokMRdUQqxWJkZKiTPOdE5uwk2My65F/n0b13jewuAA6kAE+Oc
	sNOAVdXFfty65qCep+FQu8DK+bcO8UbseqB5EcvhFgmTH3zNv2A6NhdmGnjrNFVEQm
	iOCr89vTFsCvYuVEcqDsfYoO1/CZdgOcKbq1JnyE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RNWot9020229
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 18:32:50 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 18:32:50 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 18:32:50 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RNWnnA004772;
	Thu, 27 Sep 2018 18:32:49 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 27 Sep 2018 23:28:36 +0000
Message-ID: <20180927232836.21884-3-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180927232836.21884-1-denys@ti.com>
References: <20180927232836.21884-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko-next][PATCH 3/3] arago.conf: add ti-sci-fw into EXTRA_IMAGEDEPENDS for k3
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
X-List-Received-Date: Thu, 27 Sep 2018 23:33:00 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 9b6a5e4c..1ba4dd92 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -123,7 +123,7 @@ PACKAGECONFIG_pn-glmark2 = "drm-gles2 wayland-gles2"
 # Enable U-boot OPTEE config for K3
 PACKAGECONFIG_append_pn-u-boot-ti-staging_k3 = " optee"
 
-EXTRA_IMAGEDEPENDS_append_k3 += " u-boot-k3-r5"
+EXTRA_IMAGEDEPENDS_append_k3 += " u-boot-k3-r5 ti-sci-fw"
 
 # Enable UI and scripting for perf
 PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
-- 
2.17.1


