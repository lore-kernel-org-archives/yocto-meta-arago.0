Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 31110520C0
	for <meta-arago@arago-project.org>;
	Wed, 14 Nov 2018 20:48:05 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAEKltkK098658
	for <meta-arago@arago-project.org>; Wed, 14 Nov 2018 14:47:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542228475;
	bh=c4w6FUxWzGkJgYaWKa0PDH0nn518Nfw3obA02z9cXPk=;
	h=From:To:Subject:Date;
	b=cMrA5mrKXNQ5OYotx8ZuzH+a8oBOPcuBb58jks4J97pJfvf1H3zHCV92NucTETWT/
	J0xFp8+yw7T0Y0YP2M9oDoUF/BHgLpSMKSSzeS3bQkLHhCiweb6B1zXsCSLUZqRoX5
	laSigR449CMdfMftyfMx0axOQ/zcCLx5jyNI0tXI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAEKltfo050925
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 14 Nov 2018 14:47:55 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 14 Nov 2018 14:47:54 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 14 Nov 2018 14:47:54 -0600
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAEKlspp028340
	for <meta-arago@arago-project.org>; Wed, 14 Nov 2018 14:47:54 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 14 Nov 2018 15:47:50 -0500
Message-ID: <1542228470-27301-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] evse-hmi: bump SRCREV to pick up the fix for character truncation issue
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
X-List-Received-Date: Wed, 14 Nov 2018 20:48:06 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb b/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
index 27a58a9..e2d7b88 100644
--- a/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
+++ b/meta-arago-extras/recipes-apps/evse-hmi/evse-hmi_git.bb
@@ -5,12 +5,12 @@ LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=33;md5=a9cde3921a8be42ed
 inherit qt-provider
 
 PV = "1.0"
-PR = "r0"
+PR = "r1"
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/sitara-linux/evse-hmi.git;protocol=git;branch=${BRANCH}"
 
-SRCREV = "a257dfc05db311c74cb50838ff5b9e2cfb87dbfe"
+SRCREV = "d8c309d2832735f8df84db9993a01d861fdc02d7"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


