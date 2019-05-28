Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 4343C529B1
	for <meta-arago@arago-project.org>;
	Tue, 28 May 2019 15:47:38 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4SFl3RL031907
	for <meta-arago@arago-project.org>; Tue, 28 May 2019 10:47:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559058423;
	bh=Xi7+403u3rmYtZj3fLzL300Va4lyixRJf2F/Y5mwv2U=;
	h=From:To:Subject:Date;
	b=kk165pLHCgMH1LhYoyj29+yYValXs2Izc7Q4UW591rCzXXbn+q28kzGrlUlsJPN79
	Zj1DTLv6t+3nfJtCFNfFyvXLtpksG8xoeK5A7vpA16VObUGwfcNf4/IC/OqmKvxFv3
	VWXgd/NM+A+NoKPNSOrxIvJAmf4U21fBOk49x9Rc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4SFl3Gs005069
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 28 May 2019 10:47:03 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 28 May 2019 10:47:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 28 May 2019 10:47:02 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4SFl2gG048799
	for <meta-arago@arago-project.org>; Tue, 28 May 2019 10:47:02 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 28 May 2019 11:46:49 -0400
Message-ID: <20190528154649.27933-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] linuxptp: switch to V2.0-based release branch
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
X-List-Received-Date: Tue, 28 May 2019 15:47:38 -0000
Content-Type: text/plain

- rebased all patches to Linuxptp 2.0

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-connectivity/linuxptp/linuxptp_%.bbappend | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-connectivity/linuxptp/linuxptp_%.bbappend b/recipes-connectivity/linuxptp/linuxptp_%.bbappend
index 7cc76f4..be96f47 100644
--- a/recipes-connectivity/linuxptp/linuxptp_%.bbappend
+++ b/recipes-connectivity/linuxptp/linuxptp_%.bbappend
@@ -1,11 +1,11 @@
-PR_append = ".tisdk11"
-PV = "1.8+"
+PR_append = ".tisdk12"
+PV = "2.0+"
 
-BRANCH = "ti-linuxptp-release"
+BRANCH = "ti-linuxptp-v2.0-release"
 SRC_URI = "git://git.ti.com/processor-sdk/linuxptp.git;protocol=git;branch=${BRANCH} \
            file://build-Allow-CC-and-prefix-to-be-overriden.patch"
 
-SRCREV = "2b48bb38da8453df1d57cbe0c58e8bb5551ec83c"
+SRCREV = "6dce667871385fc9bb435829b71fac1db5df6d1c"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


