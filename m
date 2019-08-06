Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 4C16052A10
	for <meta-arago@arago-project.org>;
	Tue,  6 Aug 2019 19:44:08 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x76JhCWr074235
	for <meta-arago@arago-project.org>; Tue, 6 Aug 2019 14:43:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565120592;
	bh=/xLBiZD/2XMkIOQ0SlQR2wkuAkWzD4fhEgLJGUW3ZDY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=AgOqZcISJKUHG8cIpAFGUaRztJ9mLlW1npznvx/KfB2cGyibHK+CNqVTLv8g17nze
	PGaguhFkilqYpmpW4BCTDNh5Mg4Xs4GHqNgqV0/ZzDDZczRijxEYYGxsMQniJvGMhe
	xYTaFWVqa9F4NQHW+M3vTp+clHpJm2VGVVezhw54=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x76JhCnV089430
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 6 Aug 2019 14:43:12 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 6 Aug 2019 14:43:12 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 6 Aug 2019 14:43:12 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x76Jh9i6084537
	for <meta-arago@arago-project.org>; Tue, 6 Aug 2019 14:43:11 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 6 Aug 2019 15:43:06 -0400
Message-ID: <1565120586-55542-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565120586-55542-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1565120586-55542-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH] fftlib: SRCREV update
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
X-List-Received-Date: Tue, 06 Aug 2019 19:44:09 -0000
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


