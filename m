Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id D021852A1E
	for <meta-arago@arago-project.org>;
	Tue, 26 Feb 2019 21:42:19 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1QLgFcL026754
	for <meta-arago@arago-project.org>; Tue, 26 Feb 2019 15:42:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551217335;
	bh=d37DKB5sI0HrPPlIgf3Ct3oNbNqQkwmKwhr6c51K8Vk=;
	h=From:To:Subject:Date;
	b=vqBCYSMx1sFqUlwzNXr2fCJDVu7PofmlQwEqMy6opuJu1OrkY5cLVmaMLefutPZQ+
	Ahj3pJpKc5Oi0X5UzhE8bUQFoMADhk/y7ry+qBsIQB9Ml0QF91QPld2HKXDje80xNA
	u82wScQ9P9IX+c/InoRZSH67KtDPAQPEK9yUtZyQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1QLgFUP112659
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 26 Feb 2019 15:42:15 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 26 Feb 2019 15:42:15 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 26 Feb 2019 15:42:15 -0600
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1QLgED3023166
	for <meta-arago@arago-project.org>; Tue, 26 Feb 2019 15:42:15 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 26 Feb 2019 16:42:12 -0500
Message-ID: <1551217332-10727-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] linuxptp: bump SRCREV to pick up phc2sys enhancement
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
X-List-Received-Date: Tue, 26 Feb 2019 21:42:20 -0000
Content-Type: text/plain

phc2sys enhancement: PPS-based BC: add system time synchronization

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-connectivity/linuxptp/linuxptp_%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-connectivity/linuxptp/linuxptp_%.bbappend b/recipes-connectivity/linuxptp/linuxptp_%.bbappend
index 6e9fa7e..c2b96ac 100644
--- a/recipes-connectivity/linuxptp/linuxptp_%.bbappend
+++ b/recipes-connectivity/linuxptp/linuxptp_%.bbappend
@@ -1,11 +1,11 @@
-PR_append = ".tisdk9"
+PR_append = ".tisdk10"
 PV = "1.8+"
 
 BRANCH = "ti-linuxptp-release"
 SRC_URI = "git://git.ti.com/processor-sdk/linuxptp.git;protocol=git;branch=${BRANCH} \
            file://build-Allow-CC-and-prefix-to-be-overriden.patch"
 
-SRCREV = "f040a92092c044f6ca6c43adc59445609b272639"
+SRCREV = "308be592614861559690c911132c2aed4e2934d8"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


