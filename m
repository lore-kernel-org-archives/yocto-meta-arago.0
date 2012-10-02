Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8F61952ABE
	for <meta-arago@arago-project.org>;
	Tue,  2 Oct 2012 18:01:29 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q92I1R0K016628
	for <meta-arago@arago-project.org>; Tue, 2 Oct 2012 13:01:28 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q92I1QlO013147
	for <meta-arago@arago-project.org>; Tue, 2 Oct 2012 23:31:27 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 2 Oct 2012 23:31:25 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id q92I1NRt020152;
	Tue, 2 Oct 2012 23:31:25 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Oct 2012 13:28:49 -0500
Message-ID: <1349202529-9735-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] bluez4: Update append version to 4.101
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
X-List-Received-Date: Tue, 02 Oct 2012 18:01:29 -0000
Content-Type: text/plain

* The version of the bluez4 recipe in oe-core has been updated
  to 4.101.  The append needs to be updated to match.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 ...{bluez4_4.99.bbappend => bluez4_4.101.bbappend} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-connectivity/bluez/{bluez4_4.99.bbappend => bluez4_4.101.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.99.bbappend b/meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/bluez/bluez4_4.99.bbappend
rename to meta-arago-distro/recipes-connectivity/bluez/bluez4_4.101.bbappend
-- 
1.7.0.4


