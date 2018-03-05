Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 9050E52976
	for <meta-arago@arago-project.org>;
	Mon,  5 Mar 2018 22:53:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w25MrDfI021722
	for <meta-arago@arago-project.org>; Mon, 5 Mar 2018 16:53:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520290393;
	bh=6Uoh0qtdy9H4fDi5NxByKWAMWj2aOvQJImZp6Iqg12U=;
	h=From:To:Subject:Date;
	b=gufKXBOpzw+te+nHddXZpfOYgTfY2a1m/d4iqNngbvkvg2g5SRfNAGrCevklksg9C
	JRMqyTpfwfhfg/zlF8XR1bCYlWqKh9Nh82u2swx0dnKHr++6n2/G23GY31yJvmRt4g
	Y68b8H3bUeW9HTmAAty92Ih7G9NbmkjrKeer5wtk=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w25MrD7g028138
	for <meta-arago@arago-project.org>; Mon, 5 Mar 2018 16:53:13 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 5 Mar 2018 16:53:13 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 5 Mar 2018 16:53:13 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w25MrDiq030165
	for <meta-arago@arago-project.org>; Mon, 5 Mar 2018 16:53:13 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 5 Mar 2018 17:53:11 -0500
Message-ID: <1520290391-16288-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] jailhouse-examples-rtos: Updating commit# and passing PDK_INSTALL_PATH
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
X-List-Received-Date: Mon, 05 Mar 2018 22:53:54 -0000
Content-Type: text/plain

---
 recipes-support/jailhouse/jailhouse-examples-rtos_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-support/jailhouse/jailhouse-examples-rtos_git.bb b/recipes-support/jailhouse/jailhouse-examples-rtos_git.bb
index 2aaf302..2ffe853 100644
--- a/recipes-support/jailhouse/jailhouse-examples-rtos_git.bb
+++ b/recipes-support/jailhouse/jailhouse-examples-rtos_git.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/baremetal/soc/am572x/rules.mk;endline=
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/processor-sdk/jailhouse-inmate.git;branch=${BRANCH}"
-SRCREV = "384cdcde45c4170c31a0aef34ab1b03208ed52cb"
+SRCREV = "607f8ab44ae4455a49238b6ee94d5bf5a7b7e24c"
 
 PV = "1.0"
-PR = "r3"
+PR = "r4"
 
 require recipes-ti/includes/tisdk-paths.inc
 
@@ -35,6 +35,7 @@ EXTRA_OEMAKE += "PDK_INSTALL_PATH=${PDK_INSTALL_DIR}/packages \
                  PATH=${GCC_ARM_NONE_TOOLCHAIN}/bin:${PATH} \
                  ROOT_DIR=${S} \
 "
+export PDK_INSTALL_PATH="${PDK_INSTALL_DIR}/packages"
 
 do_install() {
     # Install the binary for Linux
-- 
1.9.1


