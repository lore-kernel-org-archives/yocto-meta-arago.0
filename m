Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 4AB0252A4D
	for <meta-arago@arago-project.org>;
	Tue,  4 Feb 2020 20:38:52 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 014Kaw7V105839
	for <meta-arago@arago-project.org>; Tue, 4 Feb 2020 14:36:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580848618;
	bh=xmDZXN++cYfrNxOR5nyZxcz0kT45dyxLdrGEk3Nupv0=;
	h=From:To:CC:Subject:Date;
	b=QmSEMb661Jh1oyOlUERotj3h2vYoqFZzJhKnU+3xOK+A5qyz7KTBQ2BOD11mZdhGF
	VbIesEtkfr9WsmCur5V0uZWYVag05LuSJsdR+vYFEj+ZUY7BV17yE4IlEOaUAYNKIT
	YROUjp8uHMMNum4ONb9jCvAEt9Ep6wjS7U62QvjQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 014Kawt7016910
	for <meta-arago@arago-project.org>; Tue, 4 Feb 2020 14:36:58 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 4 Feb 2020 14:36:58 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 4 Feb 2020 14:36:58 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 014KawgD033663;
	Tue, 4 Feb 2020 14:36:58 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 4 Feb 2020 15:16:21 -0500
Message-ID: <1580847381-31222-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [RFC][PATCH] opencl: mark opencl-runtime as the systemd service package
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
X-List-Received-Date: Tue, 04 Feb 2020 20:38:52 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
index 502e1cf..ffe0811 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 
 include ocl.inc
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 inherit cmake systemd
 
@@ -77,6 +77,7 @@ do_install_append() {
     install -m0644 ${MCTD} ${D}${systemd_system_unitdir}/ti-mct-daemon.service
 }
 
+SYSTEMD_PACKAGES = "${PN}-runtime"
 SYSTEMD_SERVICE_${PN}-runtime = "ti-mct-daemon.service"
 SYSTEMD_AUTO_ENABLE_${PN}-runtime = "${@oe.utils.conditional("RESERVE_CMEM", "1", "enable", "disable", d)}"
 
-- 
2.7.4


