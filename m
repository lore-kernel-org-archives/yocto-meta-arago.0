Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id D8E3C52998
	for <meta-arago@arago-project.org>;
	Wed,  3 Jul 2019 19:16:11 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x63JFQem060874
	for <meta-arago@arago-project.org>; Wed, 3 Jul 2019 14:15:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562181326;
	bh=mnKaQELJoMQh5b78zODyLSKGKbGFvYe6rpJpMsyB59w=;
	h=From:To:CC:Subject:Date;
	b=QOctVqBOPXX9NX05F6el6amUoDqprVh4owwSI8T14fmSMLD2C0hGeF5lMD3fXbnDW
	MfgemlWBvvPwRSK27g+WejiJ/NJ8dQnWgoVsrtMtEGLZnfObc4lze6gEh3ShLXpsZV
	opBik0Lip4QFJ2vB67b72Ko9hRgcfAJiSdHHpfj0=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x63JFQ0j033614
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 3 Jul 2019 14:15:26 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 3 Jul 2019 14:15:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 3 Jul 2019 14:15:25 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x63JFPvN067302;
	Wed, 3 Jul 2019 14:15:25 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 3 Jul 2019 14:58:47 -0400
Message-ID: <1562180327-15662-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH] ti-tisdk-setup: bump SRCREV for fix
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
X-List-Received-Date: Wed, 03 Jul 2019 19:16:12 -0000
Content-Type: text/plain

* setup-targetfs-nfs: allow user to select rootfs

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index 93b2d6f..8a7737e 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Package containing scripts to setup the development host and targ
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
 
-PR = "r42"
+PR = "r43"
 
 BRANCH ?= "master"
-SRCREV = "9d048a26007f1c36823d3bfa520c1adf47172cec"
+SRCREV = "ebfc94b347bc74ad9590cfbb5588900e31d6bc0e"
 SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
-- 
2.7.4


