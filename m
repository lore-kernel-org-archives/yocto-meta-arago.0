Return-Path: <yan-liu@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 9B9AD529FD
	for <meta-arago@arago-project.org>;
	Mon, 20 Nov 2017 15:31:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vAKFVjm1028204
	for <meta-arago@arago-project.org>; Mon, 20 Nov 2017 09:31:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1511191905;
	bh=iVMZ4SUxJdxryMmQwYeC7EJOjg5f5KAI4LW6X7Gz3mM=;
	h=From:To:CC:Subject:Date;
	b=Tj7g+b2UQgymPA2be9rcUyfPajeUyrG8ULEesgq4B/+FO/5D1iGw0ye4fcEvtjzG/
	dChazUWdg8+aIivFEnwfGhy19Yl8oH1McdQ6RmnWC96vv8V7B/VEVT3VlyedjAhsTU
	qcgaCuNoEW3iwF+UnKo3mmZUNAIUxkyHJfTT0njc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vAKFVjPs001568
	for <meta-arago@arago-project.org>; Mon, 20 Nov 2017 09:31:45 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 20 Nov 2017 09:31:45 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 20 Nov 2017 09:31:45 -0600
Received: from yan-ubuntu-1204.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vAKFVirQ016991;
	Mon, 20 Nov 2017 09:31:45 -0600
From: <yan-liu@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 20 Nov 2017 10:26:28 -0500
Message-ID: <1511191588-21988-1-git-send-email-yan-liu@ti.com>
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
X-List-Received-Date: Mon, 20 Nov 2017 15:31:45 -0000
Content-Type: text/plain

From: Yan Liu <yan-liu@ti.com>

Signed-off-by: Yan Liu <yan-liu@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
index 6bf701b..c6b46eb 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170929.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PR = "r0"
+PR = "r1"
 PV_append = "+git${SRCPV}"
 
 PROVIDES += "ltp"
@@ -37,7 +37,7 @@ RDEPENDS_${PN} = "\
 
 inherit autotools-brokensep
 
-SRCREV = "feec63612a16bb48cd1da698ca794d25ff03bedc"
+SRCREV = "ece95ecbd4f34f4921a643689da55894d5882199"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
-- 
1.7.9.5


