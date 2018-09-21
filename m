Return-Path: <d-senicic1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 72DE752094
	for <meta-arago@arago-project.org>;
	Fri, 21 Sep 2018 20:51:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8LKp93E021588
	for <meta-arago@arago-project.org>; Fri, 21 Sep 2018 15:51:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537563069;
	bh=strEtcAeKlur21pCfqUwV5kaxAqNSJb1aM/JgMVRh6Q=;
	h=From:To:CC:Subject:Date;
	b=GDS83GFN2KmMNFTfHYAtx7C6VLsyoLpU8vZyLvpIDgPrfJOVzuO2aOXCZLuD7r1u4
	W2D+m6r20HGOXq6AnG+Gmh8y4wG6knP23ysK1Q3liI7s/E109idG0qBKJRY1bh8xeo
	y1WF6mb4R+E4NRdqowAZMER+rx8e17QUwieyJ+6Y=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8LKp9sW023570
	for <meta-arago@arago-project.org>; Fri, 21 Sep 2018 15:51:09 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 21 Sep 2018 15:51:09 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 21 Sep 2018 15:51:09 -0500
Received: from UDA0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8LKp7Zi003961;
	Fri, 21 Sep 2018 15:51:08 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 21 Sep 2018 16:51:05 -0400
Message-ID: <1537563065-23167-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [matrix-gui-v2-apps][PATCH] simple_people_tracking: Modify priorities of application processes
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
X-List-Received-Date: Fri, 21 Sep 2018 20:51:17 -0000
Content-Type: text/plain

* Priorities of main application threads are increased, whereas weston process priority is decreased
  This eliminates intermittent "Bulk transfer failed" messages

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../runSimplePeopleTracking.sh                                    | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/machinevision_apps/machinevision_simple_people_tracking/runSimplePeopleTracking.sh b/machinevision_apps/machinevision_simple_people_tracking/runSimplePeopleTracking.sh
index 8b74be2..a148f8d 100644
--- a/machinevision_apps/machinevision_simple_people_tracking/runSimplePeopleTracking.sh
+++ b/machinevision_apps/machinevision_simple_people_tracking/runSimplePeopleTracking.sh
@@ -2,4 +2,10 @@
 
 machine_type="`cat /etc/hostname`"
 echo "Simple People Tracking TOF demo started!"
-SimplePeopleTracking -w 160 -h 120 -f 30
+SimplePeopleTracking -w 160 -h 120 -f 30 & pid=$!
+renice -n -19 -p $pid
+for adjpri in $(pgrep weston)
+do
+   renice -n 19 -p $adjpri
+done
+
-- 
1.9.1


