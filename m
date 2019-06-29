Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 1916E52092
	for <meta-arago@arago-project.org>;
	Sat, 29 Jun 2019 14:15:03 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5TEEIBr118431
	for <meta-arago@arago-project.org>; Sat, 29 Jun 2019 09:14:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561817658;
	bh=cnt3Xtt5HMTMhC0DFVJiRQjV/TzIu1/To5H3tmGnc3Y=;
	h=From:To:Subject:Date;
	b=C1M9dppAmIHSIqZLKStD8WLZK94gV3XjNTYeYfnrkhubcW2LnrPwrwij9lzYrz/ld
	vX+pDSC4okNFZ+VB5LH9AmRZuL7SPI52CgdyBS+BH+4cOU5b5ehVFgTyQ8XL5USnWj
	20jbzaf3V6WO85bp4UoRGpzn54IeDhDbnwZph3c8=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5TEEIpq053979
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Sat, 29 Jun 2019 09:14:18 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Sat, 29 Jun 2019 09:14:18 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Sat, 29 Jun 2019 09:14:18 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5TEEIeT055445
	for <meta-arago@arago-project.org>; Sat, 29 Jun 2019 09:14:18 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 29 Jun 2019 10:13:22 -0400
Message-ID: <20190629141322.27334-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] linuxptp: bump SRCREV to pickup the fix for -r option
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
X-List-Received-Date: Sat, 29 Jun 2019 14:15:03 -0000
Content-Type: text/plain

This patch picks up the fix that phc2sys fails to handle BC state
transactions with -r option

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-connectivity/linuxptp/linuxptp_%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-connectivity/linuxptp/linuxptp_%.bbappend b/recipes-connectivity/linuxptp/linuxptp_%.bbappend
index be96f47..e298c89 100644
--- a/recipes-connectivity/linuxptp/linuxptp_%.bbappend
+++ b/recipes-connectivity/linuxptp/linuxptp_%.bbappend
@@ -1,11 +1,11 @@
-PR_append = ".tisdk12"
+PR_append = ".tisdk13"
 PV = "2.0+"
 
 BRANCH = "ti-linuxptp-v2.0-release"
 SRC_URI = "git://git.ti.com/processor-sdk/linuxptp.git;protocol=git;branch=${BRANCH} \
            file://build-Allow-CC-and-prefix-to-be-overriden.patch"
 
-SRCREV = "6dce667871385fc9bb435829b71fac1db5df6d1c"
+SRCREV = "ddde02ac6039e712687b3674ccb34d50e19198ac"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


