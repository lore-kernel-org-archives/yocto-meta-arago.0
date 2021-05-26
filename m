Return-Path: <yogeshs@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id EC66F52B66
	for <meta-arago@arago-project.org>;
	Wed, 26 May 2021 15:18:28 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14QFJ666130576;
	Wed, 26 May 2021 10:19:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1622042346;
	bh=FtpXAtrM/cK6tPkYK5xkWpa5TAsXl3O3ARQDkyAnubI=;
	h=From:To:CC:Subject:Date;
	b=MZYjNqX3UyjGRt/oEnTbGs3Y27hYa7Lh7O2S5MfNOEsfiZlFB3EDDH2YcBEWdbnDe
	JA0Qapy6MtsAC1JDpjB7CF5zx17nI+N633Kmt0mthAV7rquBadDnkumXLEhnz4ujNe
	jcaJUjODnNQ3ZP4P0VqBnH2yXjVe6UzJJ2MEm6GQ=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14QFJ6pe071946
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 May 2021 10:19:06 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 26 May 2021 10:19:05 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 26 May 2021 10:19:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14QFJ50K049058;
	Wed, 26 May 2021 10:19:05 -0500
From: Yogesh Siraswar <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Praneeth Bajjuri
	<praneeth@ti.com>, Nishant Menon <nm@ti.com>
Date: Wed, 26 May 2021 10:19:05 -0500
Message-ID: <20210526151905.13389-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [dunfell][PATCH v2] linuxptp: update bbappend against latest upstream
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
X-List-Received-Date: Wed, 26 May 2021 15:18:29 -0000
Content-Type: text/plain

From: Denys Dmytriyenko <denys@konsulko.com>

Back-porting upstream patch dc1101ed36094749219285378a73f660255e3cbd
for dunfell. The dunfell linux-ptp is still at 2.0. This forks linuxptp
to 3.0 to update it for the linux ptp fixes done on meta-openembedded

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Cc: Lokesh Vutla <lokeshvutla@ti.com>
---
Re-sending with correct email.
Fixed the subject to be applicable to only dunfell

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


