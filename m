Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id AA66652976
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2019 16:57:15 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LGv34F040044
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 11:57:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553187423;
	bh=arzrK55+dXCJvOzMlmzzh4NKzZmD/HCublJaNALwsT0=;
	h=From:To:Subject:Date;
	b=YR1Mf6fPkZdlEJEfcRvRtXqzs12Scqp4nZlwsFj03H8sz1GCFo/eJ8qatKeUiRl6S
	+WtuxPz5OYjZr6M4iY8I/C4O9diK80QQmQuyTtlX5eARxVs/HH6bHz6BPmtJsNTF7P
	d+YXD9hqFyA/i+ArNxYWl95g+J33RcIksmWGOJUE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LGv2iG063932
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 11:57:03 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 11:57:02 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 21 Mar 2019 11:57:02 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LGv1A5023631
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 11:57:02 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 21 Mar 2019 12:56:56 -0400
Message-ID: <1553187416-4891-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] linuxptp: bump SRCREV for bug fix
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
X-List-Received-Date: Thu, 21 Mar 2019 16:57:17 -0000
Content-Type: text/plain

ti: phc2sys: fix the error/warning messages for -r (REALTIME) option

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-connectivity/linuxptp/linuxptp_%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-connectivity/linuxptp/linuxptp_%.bbappend b/recipes-connectivity/linuxptp/linuxptp_%.bbappend
index c2b96ac..7cc76f4 100644
--- a/recipes-connectivity/linuxptp/linuxptp_%.bbappend
+++ b/recipes-connectivity/linuxptp/linuxptp_%.bbappend
@@ -1,11 +1,11 @@
-PR_append = ".tisdk10"
+PR_append = ".tisdk11"
 PV = "1.8+"
 
 BRANCH = "ti-linuxptp-release"
 SRC_URI = "git://git.ti.com/processor-sdk/linuxptp.git;protocol=git;branch=${BRANCH} \
            file://build-Allow-CC-and-prefix-to-be-overriden.patch"
 
-SRCREV = "308be592614861559690c911132c2aed4e2934d8"
+SRCREV = "2b48bb38da8453df1d57cbe0c58e8bb5551ec83c"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


