Return-Path: <yogeshs@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id AB628529F0
	for <meta-arago@arago-project.org>;
	Tue, 25 May 2021 15:59:43 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14PG0KCZ044147;
	Tue, 25 May 2021 11:00:20 -0500
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14PG0Ksi048543
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 May 2021 11:00:20 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 25 May 2021 11:00:19 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 25 May 2021 11:00:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14PG0J6J065280;
	Tue, 25 May 2021 11:00:19 -0500
From: Denys Dmytriyenko <denys@konsulko.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Praneeth Bajjuri
	<praneeth@ti.com>, Yogesh Siraswar <yogeshs@ti.com>, Nishant Menon
	<nm@ti.com>
Date: Tue, 25 May 2021 11:00:19 -0500
Message-ID: <20210525160019.28175-1-denys@konsulko.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [dunfell/master][PATCH] linuxptp: update bbappend against latest upstream
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
X-List-Received-Date: Tue, 25 May 2021 15:59:44 -0000
Content-Type: text/plain

Back-porting upstream patch for dunfell. The dunfell linux-ptp is
still at 2.0. This forks linuxptp to 3.0 to update it for the linux
ptp fixes done on meta-openembedded

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Cc: Lokesh Vutla <lokeshvutla@ti.com>
---
 .../recipes-connectivity/linuxptp/linuxptp_%.bbappend       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
index b0552aaf..e4fb109a 100644
--- a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
+++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
@@ -1,13 +1,13 @@
 PR_append = ".arago0"
-PV_append = "+git${SRCPV}"
+PV = "3.0+git${SRCPV}"
 
 BRANCH = "ti-linuxptp"
-SRCREV = "a06698a12e828a0372955c2d9c8d6604d8326811"
+SRCREV = "f155c21283a0421f5e1e0b5e850c8a9a71d72453"
 
 SRC_URI = " \
     git://git.ti.com/processor-sdk/linuxptp.git;branch=${BRANCH} \
     file://build-Allow-CC-and-prefix-to-be-overriden.patch \
-    file://no-incdefs-using-host-headers.patch \
+    file://Use-cross-cpp-in-incdefs.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


