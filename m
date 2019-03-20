Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id B4598529E4
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2019 17:07:04 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2KH6qDK022824
	for <meta-arago@arago-project.org>; Wed, 20 Mar 2019 12:06:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553101612;
	bh=Du9nYil2slcF4sQBKXA2k3zhRiRGurXjFsqI0kDChSk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=xsR6qDVlZNBgT6szuoQ0L643YG6XWrMPGFASFMz4eFubNi2xykpj72GAsXN4pX9hN
	xGFV6iDdtbAIU9j7AO2JLRfoYOHGKO1fMjq+1hLguJNDlLobqnM00F3WNNqV98uCRm
	pkPnR5DHM9hlZ5av4dS7ZvByjdO4fb5FmBrgsI1U=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2KH6qA7026132
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 20 Mar 2019 12:06:52 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 20 Mar 2019 12:06:51 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Wed, 20 Mar 2019 12:06:51 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2KH6pTf024971
	for <meta-arago@arago-project.org>; Wed, 20 Mar 2019 12:06:51 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 20 Mar 2019 13:06:38 -0400
Message-ID: <1553101598-12744-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553101598-12744-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1553101598-12744-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH] fftlib: SRCREV bump
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
X-List-Received-Date: Wed, 20 Mar 2019 17:07:05 -0000
Content-Type: text/plain

This srcrev update deprecates the c64P big endian support

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-ti/fftlib/fftlib.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/fftlib/fftlib.inc b/recipes-ti/fftlib/fftlib.inc
index 87d86cc..7addb90 100644
--- a/recipes-ti/fftlib/fftlib.inc
+++ b/recipes-ti/fftlib/fftlib.inc
@@ -1,5 +1,5 @@
 PV = "3_1_0_0"
-INC_PR = "r0"
+INC_PR = "r1"
 
 require recipes-ti/includes/tisdk-paths.inc
 
@@ -7,4 +7,4 @@ DESTSUFFIX = "${WORKDIR}/git"
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/fftlib/fftlib.git;protocol=git;name=fftlib;destsuffix=${DESTSUFFIX};branch=${BRANCH}"
-SRCREV = "1527e517aa43f9ade14b7a4e16e2b6522eb5bbb9"
+SRCREV = "3d5ebada3cd94096fb798548d68059dc4c34a1ea"
-- 
1.9.1


