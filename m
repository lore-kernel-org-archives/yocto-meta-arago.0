Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id B3867529AD
	for <meta-arago@arago-project.org>;
	Mon, 20 May 2019 19:17:44 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4KJHCqK042366
	for <meta-arago@arago-project.org>; Mon, 20 May 2019 14:17:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1558379832;
	bh=VFITdU0VjwUQR9IENhOqsCmmnoIwUlfYXqvJ5GYkVRk=;
	h=From:To:CC:Subject:Date;
	b=tv87ooQvdvm/dMb6+Tal91fk95htrWjoByf6O8xWWn9xwwJJyiXdLVYHMLWkkmHKJ
	ENflclnXYVhKAoxhIHHbDSSMdsZLHKxRMUQw6WwcK6135/PzF8dtcOZiqyoEpACNdZ
	xCBdtbvQ2w+ietQsN/fOpfhIKXTG+AqW9xlmQj7E=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4KJHC0d052002
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 20 May 2019 14:17:12 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 20 May 2019 14:17:11 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 20 May 2019 14:17:11 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4KJHB6G095102;
	Mon, 20 May 2019 14:17:11 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 20 May 2019 19:05:43 +0000
Message-ID: <20190520190543.11302-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] kernel-fitimage: drop dir part from DTB name, as u-boot setup w/o it
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
X-List-Received-Date: Mon, 20 May 2019 19:17:46 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/kernel-fitimage.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/classes/kernel-fitimage.bbclass b/meta-arago-distro/classes/kernel-fitimage.bbclass
index 34b61d00..e58652bc 100644
--- a/meta-arago-distro/classes/kernel-fitimage.bbclass
+++ b/meta-arago-distro/classes/kernel-fitimage.bbclass
@@ -342,7 +342,7 @@ fitimage_emit_section_config() {
 
 	dtbcount=1
 	for DTB in ${KERNEL_DEVICETREE}; do
-		DTB=$(echo "${DTB}" | tr '/' '_')
+		DTB=$(basename "${DTB}")
 		if [ "x${FITIMAGE_CONF_BY_NAME}" = "x1" ] ; then
 			conf_name="${DTB}"
 		else
@@ -514,7 +514,7 @@ fitimage_assemble() {
 			if [ ! -e "${DTB_PATH}" ]; then
 				DTB_PATH="arch/${ARCH}/boot/${DTB}"
 			fi
-			DTB=$(echo "${DTB}" | tr '/' '_')
+			DTB=$(basename "${DTB}")
 			fitimage_ti_secure ${DTB_PATH} ${DTB_PATH}.sec
 			if [ "x${FITIMAGE_DTB_BY_NAME}" = "x1" ] ; then
 				fitimage_emit_section_dtb ${1} ${DTB} ${DTB_PATH}.sec
-- 
2.17.1


