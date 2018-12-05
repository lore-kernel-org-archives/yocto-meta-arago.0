Return-Path: <d-senicic1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id F09FB529A6
	for <meta-arago@arago-project.org>;
	Thu,  6 Dec 2018 02:08:03 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB627qtO089343
	for <meta-arago@arago-project.org>; Wed, 5 Dec 2018 20:07:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544062072;
	bh=jIvw/ztamqh3eIBKzbtq2wckePzpV2UDyXINWZbPB48=;
	h=From:To:CC:Subject:Date;
	b=EX+2FOSfCsytP/5FS9bcoBP1CEZpOTTjd4blogp3ejophFozAda+inSQHjQ7Hks1r
	HFU897PXSEb0Bkob7ojOHJyDsSUGBxVSG9xPmU8EeM/JJ7VsYN3h0EDzPjFyGRcnIT
	DhnjugNV69atSz/WHWREOBzpRN+6CEV1TZPYtlxs=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB627quP086458
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 5 Dec 2018 20:07:52 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 5 Dec 2018 20:07:52 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 5 Dec 2018 20:07:52 -0600
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB627qWS006869;
	Wed, 5 Dec 2018 20:07:52 -0600
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 5 Dec 2018 16:04:30 -0500
Message-ID: <20181205210430.31919-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [matrix-gui-v2-apps][PATCH] tof: Check if SimplePeopleTracking file is present, before starting TOF demo
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
X-List-Received-Date: Thu, 06 Dec 2018 02:08:04 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../runSimplePeopleTracking.sh                              | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/machinevision_apps/machinevision_simple_people_tracking/runSimplePeopleTracking.sh b/machinevision_apps/machinevision_simple_people_tracking/runSimplePeopleTracking.sh
index b01110c..53686ce 100644
--- a/machinevision_apps/machinevision_simple_people_tracking/runSimplePeopleTracking.sh
+++ b/machinevision_apps/machinevision_simple_people_tracking/runSimplePeopleTracking.sh
@@ -1,5 +1,7 @@
 #!/bin/sh
 
+FILE="/usr/bin/SimplePeopleTracking"
+if [ -f $FILE ]; then
 machine_type="`cat /etc/hostname`"
 echo "Simple People Tracking TOF demo started!"
 SimplePeopleTracking -w 160 -h 120 -f 30 & pid=$!
@@ -8,3 +10,7 @@ for adjpri in $(pgrep weston)
 do
    renice -n 19 -p $adjpri
 done
+
+else
+echo "SimplePeopleTracking not included in the filesystem"
+fi
-- 
2.17.1


