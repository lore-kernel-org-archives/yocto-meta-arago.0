Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id D016E52A12
	for <meta-arago@arago-project.org>;
	Mon, 10 Sep 2018 15:05:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8AF5Dpo058733
	for <meta-arago@arago-project.org>; Mon, 10 Sep 2018 10:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536591913;
	bh=lcfkBoYxofFCAD6oa9lFVn4J8MJw8CYdKAowDuBVQmI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=A31kzgGjzeN8bc7trU7G1eP+3ilLbL9N7JgabHfYIJKF3chQIVXwteOKDcTUsgZBu
	pngYH3SQumTMAA5hRO+T7oJ+uytq6HRahU8YHbrP2MA4Wzsq+fqcah4qQN38NQpfrV
	mY5EkBBuBmEPe+0PzENp9SQwr+zT4jhUtrgVUNvY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8AF5Dhg007588
	for <meta-arago@arago-project.org>; Mon, 10 Sep 2018 10:05:13 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 10 Sep 2018 10:05:13 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 10 Sep 2018 10:05:13 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8AF5DnF001701;
	Mon, 10 Sep 2018 10:05:13 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 10 Sep 2018 11:05:10 -0400
Message-ID: <1536591910-29066-2-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1536591910-29066-1-git-send-email-a0271529@ti.com>
References: <1536591910-29066-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 2/2] [PATCH] ti-tisdk-makefile: add pru-adc Makefile segment for am335x-evm
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
X-List-Received-Date: Mon, 10 Sep 2018 15:05:22 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
index 80394a1..f80e65b 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk56"
+PR_append = ".tisdk57"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -43,9 +43,10 @@ MAKEFILES_append_ti43x = " evse-hmi"
 
 MAKEFILES_append_ti33x = " evse-hmi \
 			   protection-relays-hmi \
-			   pru-adc \
 "
 
+MAKEFILES_append_am335x-evm = " pru-adc"
+
 MAKEFILES_append_am57xx-evm = " jailhouse \
                                 tidl-examples \
 "
-- 
1.9.1


