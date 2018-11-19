Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 44854529AC
	for <meta-arago@arago-project.org>;
	Mon, 19 Nov 2018 19:59:52 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAJJxf5f090606
	for <meta-arago@arago-project.org>; Mon, 19 Nov 2018 13:59:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542657581;
	bh=m+nv8Nre3ApA8kY5snLj0FF1mgboIj38H/jzRICMhjo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=FsSrckjHwxip8ttiBIJJ2XGIa0xeVRnCutrHhOzv56rD234X6VozmWxsqFcD+hUoN
	T4wNriBeh3jBDCONiesybxv36rC9/4lbV0sk/T1viaRH1pjShklXmjItpwoNBf6DZn
	WBhV4fPo1CDbTTFajkByB6m79BQ19u/msSwWx+T8=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAJJxfIu102093
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 19 Nov 2018 13:59:41 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 19 Nov 2018 13:59:41 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 19 Nov 2018 13:59:41 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAJJxeFk022983
	for <meta-arago@arago-project.org>; Mon, 19 Nov 2018 13:59:41 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Nov 2018 14:59:37 -0500
Message-ID: <1542657577-36895-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1542657577-36895-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1542657577-36895-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH] ti-cgt-arm-native: Adding the workaround as done in 16.9.2
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
X-List-Received-Date: Mon, 19 Nov 2018 19:59:52 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 ...i-cgt-arm-native_16.9.2.bbappend => ti-cgt-arm-native_16.9.9.bbappend} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-ti/devtools/{ti-cgt-arm-native_16.9.2.bbappend => ti-cgt-arm-native_16.9.9.bbappend} (100%)

diff --git a/recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bbappend b/recipes-ti/devtools/ti-cgt-arm-native_16.9.9.bbappend
similarity index 100%
rename from recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bbappend
rename to recipes-ti/devtools/ti-cgt-arm-native_16.9.9.bbappend
-- 
1.9.1


