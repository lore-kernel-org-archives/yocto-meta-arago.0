Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 0F46152093
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 22:17:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KMGpsW008831
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 17:16:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505945811;
	bh=84sbf1UsJgSaP3urqdiOAyOS5bl47xIxcDEnql4UxPY=;
	h=From:To:CC:Subject:Date;
	b=xagfkkDlTfySONWksLZnsJM1gN9z/FxYvUlCB6bhg8Rw8rlcCaaVr+mgOd6DgnZne
	jMInUjbqLvyaS7xyJssnnEomvf94G62aaROolzbxR/RcceesXbyci2/34aOLhJXK0/
	gC5UujJEm+j7WOeYwYzhKtc54BWlapLXxjN1oBb4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KMGk4M010080
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 17:16:46 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 17:16:46 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 17:16:46 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KMGkb4029542;
	Wed, 20 Sep 2017 17:16:46 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 20 Sep 2017 18:16:42 -0400
Message-ID: <1505945802-11705-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processsor-sdk] [PATCH] pruss-lld-rtos: add DEPENDS on ti-cgt-pru-native
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
X-List-Received-Date: Wed, 20 Sep 2017 22:17:02 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
index 499afce..7a05def 100644
--- a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
+++ b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
@@ -5,11 +5,11 @@ require recipes-bsp/pruss-lld/pruss-lld.inc
 require recipes-bsp/pruss-lld/pruss-lld-1.0.0.inc
 
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 S = "${WORKDIR}/${PRUSS_LLD_GIT_DESTSUFFIX}"
 
-DEPENDS_append = " osal-rtos"
+DEPENDS_append = " osal-rtos ti-cgt-pru-native"
 DEPENDS_append_ti33x = " starterware-rtos"
 DEPENDS_append_ti43x = " starterware-rtos"
 
-- 
1.9.1


