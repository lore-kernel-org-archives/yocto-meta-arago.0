Return-Path: <dmurphy@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id B661A520E5
	for <meta-arago@arago-project.org>;
	Thu, 14 Feb 2019 19:17:59 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1EJHjXp083300
	for <meta-arago@arago-project.org>; Thu, 14 Feb 2019 13:17:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1550171865;
	bh=PArwSuEu8JpfPmEGShERC6WMZ8QJC10pZg8LCLzY4qc=;
	h=From:To:CC:Subject:Date;
	b=vkaKSqF6dMZD1YMvcIxubHXhDj2mW539twfWFiXi61SDT2yce71yydsRm33oVIfM5
	2MSgXfWbEsREx3eSC5rt2dNfKdsa9eN8tS3TuOFEnjo3z+jrxkVj6wWWX+AM18FSI0
	f212SLYiZnpCw5tREG8RX98jDnGQU/qoulZSkSjc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1EJHj5G045942
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 14 Feb 2019 13:17:45 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 14 Feb 2019 13:17:45 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 14 Feb 2019 13:17:45 -0600
Received: from legion.dal.desgin.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1EJHjTp015963;
	Thu, 14 Feb 2019 13:17:45 -0600
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.120.181])
	by legion.dal.desgin.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x1EJHiU04496; Thu, 14 Feb 2019 13:17:44 -0600 (CST)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 Feb 2019 13:17:37 -0600
Message-ID: <20190214191737.19875-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ti-linux-firmware: Change TI linux firmware branch
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
X-List-Received-Date: Thu, 14 Feb 2019 19:18:00 -0000
Content-Type: text/plain

Changing the branch that the TI linux firmware is picked
up from.  As this is a branch that is used for numerous
kernel versions so the version needs to be removed from the
branch name.

Changing ti-linux-firmware-4.1.y to ti-linux-firmware

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb
index 3ad52743..98152e12 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb
@@ -13,7 +13,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRCREV = "7a6ce28348a99d2ad08a6cb2b36450d73bfccc80"
 
-BRANCH ?= "ti-linux-firmware-4.1.y"
+BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = " \
 	git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH} \
-- 
2.20.1.390.gb5101f9297


