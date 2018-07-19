Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id C073C52A2A
	for <meta-arago@arago-project.org>;
	Thu, 19 Jul 2018 17:28:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JHSqjt000913
	for <meta-arago@arago-project.org>; Thu, 19 Jul 2018 12:28:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532021332;
	bh=U+nthNUMj1KGUpcsR1NhfqKgbbGbJ6qFx/yguvw7p7Y=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ZgIA4f0kGGkWoBrWJ64enLtA/D3envmHhWMEflVW8WD3hWwZvIx5XFVK9SvlZp9hr
	CQiLZH3PMAB9wx8eLa+UDZK0THJYNEr+qlROpkEUz2hMZUi0ElGajACC2Ync7XO2IU
	SZMlkNi73jsvA2UDOA4ScRAlpVMFhCzy1mT0JZ3E=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHSq5n021856
	for <meta-arago@arago-project.org>; Thu, 19 Jul 2018 12:28:52 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 12:28:52 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Jul 2018 12:28:52 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHSpg8028108
	for <meta-arago@arago-project.org>; Thu, 19 Jul 2018 12:28:52 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 19 Jul 2018 13:28:48 -0400
Message-ID: <1532021329-48972-4-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532021329-48972-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1532021329-48972-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 3/4] jailhouse: SRCREV bump
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
X-List-Received-Date: Thu, 19 Jul 2018 17:29:00 -0000
Content-Type: text/plain

---
 recipes-support/jailhouse/jailhouse_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-support/jailhouse/jailhouse_git.bb b/recipes-support/jailhouse/jailhouse_git.bb
index b1c88bd..6c5cd14 100644
--- a/recipes-support/jailhouse/jailhouse_git.bb
+++ b/recipes-support/jailhouse/jailhouse_git.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9fa7f895f96bde2d47fd5b7d95b6ba4d"
 BRANCH = "plsdk_am57xx"
 SRC_URI = "git://git.ti.com/processor-sdk/jailhouse.git;branch=${BRANCH}"
 
-SRCREV = "238433e3f4203b23dc4bba9d09118a3608be1931"
+SRCREV = "2ad429b04f30a082f206e0083c398f018467ef1c"
 
-PV = "0.7"
-PR = "r1"
+PV = "0.8"
+PR = "r0"
 
 PACKAGES =+ "${PN}-drivers ${PN}-firmware ${PN}-examples"
 RDEPENDS_${PN} += "${PN}-drivers ${PN}-firmware"
-- 
1.9.1


