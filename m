Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 182B7529F2
	for <meta-arago@arago-project.org>;
	Thu,  1 Mar 2018 19:34:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w21JXu8e028886
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 13:33:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519932836;
	bh=QKM3vsnq3etOck6T4el3EAgEpWUUxay3bE8bPruVw2M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qhb33tMS8kqlOSa9xj39SRx+dRgr58G7ZmRHhjiueALuIkPElb5/tviF0//7oF6DL
	6jnSVJT6UFZixmzIKZKYnkotejOEAKwGWG6F2e9TQxCKhftCs99at0ADYsDaJcfe8M
	I2LeQR1fDZ3DEDCECpyEWTQjhTpHcmw+4n4XIe5c=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21JXuR3006853
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 13:33:56 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 1 Mar 2018 13:33:56 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 1 Mar 2018 13:33:56 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21JXrko002396;
	Thu, 1 Mar 2018 13:33:55 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 1 Mar 2018 14:25:28 -0500
Message-ID: <1519932329-26946-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519932329-26946-1-git-send-email-j-stiffler@ti.com>
References: <1519932329-26946-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v2 2/2] layer.conf: remove groff from HOSTTOOLS
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
X-List-Received-Date: Thu, 01 Mar 2018 19:34:32 -0000
Content-Type: text/plain

* oe-core provides groff, so groff-native was added as a dependency
  for ti-llvm3.6

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/conf/layer.conf | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
index 3ce0eac..83ac107 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -40,6 +40,3 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
     gstreamer1.0-plugins-bad \
     opencl \
 "
-
-# ti-llvm3.6 calls groff
-HOSTTOOLS += "groff"
-- 
2.7.4


