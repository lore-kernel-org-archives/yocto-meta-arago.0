Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 4D76052A2B
	for <meta-arago@arago-project.org>;
	Fri, 28 Sep 2018 21:01:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8SL1F5L118557
	for <meta-arago@arago-project.org>; Fri, 28 Sep 2018 16:01:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538168475;
	bh=75pW2pMtWf8ZTJSQQ4vD3UTPxMDJqZgUdosXA56drrM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KgJZ9fE5hi2wy+bGSc8vFwrXGMQFyXL6Sjd/O0KGMkbuKLRjssp+e8LUOJV+w6gug
	30bVEwVzee+fARGmpfSsttUqGiQhk0xKSGFCNXAX+GCPC96iMdYXnH1kzMCICNlKRC
	VKkSg+t6fHLgNW5Fv5yo4vJT0ZaPSpwBcd/qGYl4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SL1FnY006744
	for <meta-arago@arago-project.org>; Fri, 28 Sep 2018 16:01:15 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 28 Sep 2018 16:01:14 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 28 Sep 2018 16:01:14 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SL1DZi013264;
	Fri, 28 Sep 2018 16:01:14 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 28 Sep 2018 20:57:02 +0000
Message-ID: <20180928205703.28562-3-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180928205703.28562-1-denys@ti.com>
References: <20180928205703.28562-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCHv2 3/4] arago.conf: add ti-sci-fw into EXTRA_IMAGEDEPENDS for k3
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
X-List-Received-Date: Fri, 28 Sep 2018 21:01:25 -0000
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


