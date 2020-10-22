Return-Path: <lokeshvutla@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 1AB30520DE
	for <meta-arago@arago-project.org>;
	Thu, 22 Oct 2020 15:05:11 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09MF266o027677
	for <meta-arago@arago-project.org>; Thu, 22 Oct 2020 10:02:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603378926;
	bh=HMlxfLTc/fY2kG/Eorqq3it0lRzEK5gymZocPWf5rN0=;
	h=From:To:CC:Subject:Date;
	b=QrR6ObHUns8weOoEW8Xc3dG9C6k8mXLkZMr0cCIsAjVLFR+kBp/ZmGhtaa/6JOmby
	dF5VnLTUeId48yBLD/xHAdnBrB6/nTF4Cn8+k5ChhGPS9i1f64TghiPRhxZiAe/sWp
	TnQGTww046oJeHvRdNkul54ltWMcVP70S08gC1yo=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09MF25AX038652
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 22 Oct 2020 10:02:05 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 22 Oct 2020 10:02:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 22 Oct 2020 10:02:05 -0500
Received: from uda0131933.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09MF23gI083398;
	Thu, 22 Oct 2020 10:02:03 -0500
From: Lokesh Vutla <lokeshvutla@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Oct 2020 20:31:58 +0530
Message-ID: <20201022150158.21523-1-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Sekhar Nori <nsekhar@ti.com>
Subject: [PATCH] linuxptp: Update to latest tip of ti-linuxptp branch
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
X-List-Received-Date: Thu, 22 Oct 2020 15:05:11 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 .../recipes-connectivity/linuxptp/linuxptp_%.bbappend           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
index ff1e1616..b0552aaf 100644
--- a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
+++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
@@ -2,7 +2,7 @@ PR_append = ".arago0"
 PV_append = "+git${SRCPV}"
 
 BRANCH = "ti-linuxptp"
-SRCREV = "e54ee647f1d2844b7015d1ae60eef21aa92e113b"
+SRCREV = "a06698a12e828a0372955c2d9c8d6604d8326811"
 
 SRC_URI = " \
     git://git.ti.com/processor-sdk/linuxptp.git;branch=${BRANCH} \
-- 
2.23.0


