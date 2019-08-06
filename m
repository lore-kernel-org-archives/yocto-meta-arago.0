Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id E4C3452981
	for <meta-arago@arago-project.org>;
	Tue,  6 Aug 2019 18:58:30 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x76IvZqK064005
	for <meta-arago@arago-project.org>; Tue, 6 Aug 2019 13:57:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565117855;
	bh=/xLBiZD/2XMkIOQ0SlQR2wkuAkWzD4fhEgLJGUW3ZDY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=HfkHMK0k45aIL5eQ065RYqIKTTP+j62e3sxUPdTSFInw8u/jfzvPh1CTaHIt9lc8l
	hBldHVYAYjvdtwA8e4CyeHnA0MSjCNerPkWhVTXT26Jk5x5KtNKan4clOtHYiFrxPJ
	YEvcOUM7ktSwJZK/WHDqiWyLu55PJVgLxMtG3fwo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x76IvZYG037028
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 6 Aug 2019 13:57:35 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 6 Aug 2019 13:57:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 6 Aug 2019 13:57:35 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x76IvYkD091355
	for <meta-arago@arago-project.org>; Tue, 6 Aug 2019 13:57:35 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 6 Aug 2019 14:57:33 -0400
Message-ID: <1565117853-52717-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565117853-52717-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1565117853-52717-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH] fftlib: SRCREV update
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
X-List-Received-Date: Tue, 06 Aug 2019 18:58:31 -0000
Content-Type: text/plain

SRCREV udpate to include big-endian descope
---
 meta-arago-extras/recipes-ti/fftlib/fftlib.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/fftlib/fftlib.inc b/meta-arago-extras/recipes-ti/fftlib/fftlib.inc
index ab5baf5..f6d5935 100644
--- a/meta-arago-extras/recipes-ti/fftlib/fftlib.inc
+++ b/meta-arago-extras/recipes-ti/fftlib/fftlib.inc
@@ -1,5 +1,5 @@
 PV = "3_1_0_0"
-INC_PR = "r3"
+INC_PR = "r4"
 
 require recipes-ti/includes/arago-paths.inc
 
@@ -9,7 +9,7 @@ FFTLIB_GIT_PROTOCOL = "git"
 FFTLIB_GIT_BRANCH = "master"
 FFTLIB_GIT_DESTSUFFIX = "${WORKDIR}/git"
 
-FFTLIB_SRCREV = "54fb858e97235c0a3cd948d24d22329653a7837f"
+FFTLIB_SRCREV = "e05426894c73af940ccc26880ebd7f2c9ce21880"
 
 BRANCH = "${FFTLIB_GIT_BRANCH}"
 SRC_URI = "${FFTLIB_GIT_URI};destsuffix=${FFTLIB_GIT_DESTSUFFIX};protocol=${FFTLIB_GIT_PROTOCOL};branch=${BRANCH}"
-- 
1.9.1


