Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 9B73E5299E
	for <meta-arago@arago-project.org>;
	Tue, 13 Nov 2018 17:16:01 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wADHFpui037432
	for <meta-arago@arago-project.org>; Tue, 13 Nov 2018 11:15:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542129351;
	bh=c2Uxyq16/y3SztqjllYW//96epr/q5MmfKFiqe0FmvY=;
	h=From:To:CC:Subject:Date;
	b=cG9Wn7O/iGhJMZYN/Y3YrpjSSKhAeuP4G2eBEHYcdkC6717jfJIkdDD0LuK7aP8f/
	m4+1d7X2dryQIG73qV+43d/Wv+wqXC73/465sc4GnPUIgUrn/iV/MFYc247WojyCV4
	B8Y26bhlvyQPBGL8q2nmkfBD5OgDYjcf5NGjh9Z0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wADHFpHm027601
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 13 Nov 2018 11:15:51 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 13 Nov 2018 11:15:51 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 13 Nov 2018 11:15:51 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wADHFodC009860;
	Tue, 13 Nov 2018 11:15:51 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 13 Nov 2018 12:03:19 -0500
Message-ID: <1542128604-12176-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v2 1/6] ti-sci-fw: deploy original firmware
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
X-List-Received-Date: Tue, 13 Nov 2018 17:16:02 -0000
Content-Type: text/plain

* This can be used in the SDK to rebuild the sysfw.itb image.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* Fix deploy of original firmware. In the previous version, the
  install was incorrectly occuring within do_install(). This version
  adds it to do_deploy().

 meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb
index c05582a..3ad5274 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2018.10.bb
@@ -53,6 +53,8 @@ do_deploy () {
 	install -m 644 ${WORKDIR}/imggen/${SYSFW_BINARY} ${DEPLOYDIR}/${SYSFW_IMAGE}
 	rm -f ${DEPLOYDIR}/${SYSFW_BINARY}
 	ln -sf ${SYSFW_IMAGE} ${DEPLOYDIR}/${SYSFW_BINARY}
+
+        install -m 644 ${S}/ti-sysfw/${SYSFW_TISCI} ${DEPLOYDIR}/${SYSFW_TISCI}
 }
 
 addtask deploy before do_build after do_compile
-- 
2.7.4


