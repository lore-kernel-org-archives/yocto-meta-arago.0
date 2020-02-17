Return-Path: <yan-liu@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id CF14652994
	for <meta-arago@arago-project.org>;
	Mon, 17 Feb 2020 15:09:59 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01HF81W6122634
	for <meta-arago@arago-project.org>; Mon, 17 Feb 2020 09:08:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581952081;
	bh=oh4HijxJkXQF1aHhPVUsHrJGDr5W5me0Fw4A8IJROVw=;
	h=From:To:CC:Subject:Date;
	b=EITZ/3vYF8wqGYmgmH02HLesxsyrLJwdWYFJz3yE3ln6mOMlUvswErt/ECMWjauD3
	Qpq8PCcfkX98JEgv2s24qEJgDZnUVhYUK9FONIZFKXuhZYIaQQ2zzS8q4SiQeCHamQ
	RVSr0N8j15h5gvsyjE3avYgOhysaBd81yD1qWJA8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01HF81HI126773
	for <meta-arago@arago-project.org>; Mon, 17 Feb 2020 09:08:01 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 17 Feb 2020 09:08:01 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 17 Feb 2020 09:08:01 -0600
Received: from yan-ubuntu-1204.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01HF80Xu108777;
	Mon, 17 Feb 2020 09:08:01 -0600
From: <yan-liu@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 17 Feb 2020 10:05:41 -0500
Message-ID: <1581951941-16538-1-git-send-email-yan-liu@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v1] ltp-ddt: Update to latest
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
X-List-Received-Date: Mon, 17 Feb 2020 15:10:00 -0000
Content-Type: text/plain

From: Yan Liu <yan-liu@ti.com>

Signed-off-by: Yan Liu <yan-liu@ti.com>
---
 .../{ltp-ddt_20190305.bb => ltp-ddt_20200217.bb}   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-extras/recipes-devtools/ltp-ddt/{ltp-ddt_20190305.bb => ltp-ddt_20200217.bb} (97%)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200217.bb
similarity index 97%
rename from meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
rename to meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200217.bb
index 40f979e..959ff79 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20190305.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200217.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PR = "r25"
+PR = "r1"
 PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
@@ -39,7 +39,7 @@ RDEPENDS_${PN} = "\
 
 inherit autotools-brokensep
 
-SRCREV = "514a7d8c9f9494b421d2e712cf4bcf926732ce20"
+SRCREV = "b4f687e9f59f2a4136e2f718817059c265b0cf01"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
-- 
1.7.9.5


