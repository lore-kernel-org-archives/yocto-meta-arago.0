Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 7E0D4529E6
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 18:37:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JIa7EC007750
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 13:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521484567;
	bh=e7Sb9o7HqH/8ppTVJeNMBAGsPB/eIPugfecNzAOxUU4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nkg+UqDUDKfg2luTwoVOBWBsV+cLyNaLw68H5QzLMVJN2NbysvX3KZSqS712wUZtg
	8zvdqTR2f18VA3SIlnjWsJRZDRkbbiIc3PSHjvzGbPfKZyEbkE9VcbuYrQYbyxDDnE
	7OKUQESOTIQhEvBnwtz3BVwTYo5ZRg67O6Zw+39A=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JIa7gG014791
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 13:36:07 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 13:36:06 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 13:36:06 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JIa4SD009580;
	Mon, 19 Mar 2018 13:36:06 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Mar 2018 14:35:41 -0400
Message-ID: <1521484541-8104-7-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521484541-8104-1-git-send-email-a0271529@ti.com>
References: <1521484541-8104-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 6/6] [PATCH] packagegroup-arago-tisdk-addons: add tiovx-app-host-examples
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
X-List-Received-Date: Mon, 19 Mar 2018 18:37:06 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
index cb75be2..43640e2 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-tisdk45"
+PR_append = "-tisdk46"
 
 EXTRA_PACKAGES_append_ti33x = " opencv"
 EXTRA_PACKAGES_append_ti43x = " opencv"
@@ -14,6 +14,6 @@ EXTRA_PACKAGES_append = " zbar hidapi"
 
 UTILS_append = " net-snmp net-snmp-server-snmpd"
 
-EXTRA_PACKAGES_append_dra7xx = " tiovx-app-host kaldi ti-fftw-examples"
+EXTRA_PACKAGES_append_dra7xx = " tiovx-app-host tiovx-app-host-examples kaldi ti-fftw-examples"
 
 EXTRA_PACKAGES_append_k2hk = " ti-fftw-examples"
-- 
1.9.1


