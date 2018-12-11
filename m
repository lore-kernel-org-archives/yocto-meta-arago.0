Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id F13D8529AE
	for <meta-arago@arago-project.org>;
	Tue, 11 Dec 2018 19:38:42 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBBJcTgc020234
	for <meta-arago@arago-project.org>; Tue, 11 Dec 2018 13:38:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544557109;
	bh=X+i6i1wP6iHcGDUtJhVsQBcywDwZywChIyH+3OBZWo0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Kq9K1R6ZnmwzW+o0kKoTarZEPdLyBw/s9tsPMrq4YZMFyIpNXVBQXDNcHYwuwT0Gh
	lY3O4Sr16EY5qiv5U1vaKRgyroT9ZpzVXnJjKCDRM6CK9sc54MChO5iZm27lPEj96T
	HRmdO2e8CPwi4+zjyHS5fLgxdXFKeMdxpx8Rsucg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBBJcTpC021380
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 11 Dec 2018 13:38:29 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 11 Dec 2018 13:38:29 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 11 Dec 2018 13:38:29 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBBJcS1T026540;
	Tue, 11 Dec 2018 13:38:29 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 11 Dec 2018 14:26:07 -0500
Message-ID: <1544556367-5429-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1544556367-5429-1-git-send-email-j-stiffler@ti.com>
References: <1544556367-5429-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 2/2] hevc-arm-decoder: fetch from git
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
X-List-Received-Date: Tue, 11 Dec 2018 19:38:43 -0000
Content-Type: text/plain

* Fetch from git as previous hosting location has been shutdown.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 ...arm-decoder_01.00.00.01.bb => hevc-arm-decoder_git.bb} | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)
 rename meta-arago-extras/recipes-multimedia/hevc-arm-decoder/{hevc-arm-decoder_01.00.00.01.bb => hevc-arm-decoder_git.bb} (75%)

diff --git a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
similarity index 75%
rename from meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb
rename to meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
index c942e2e..069e839 100644
--- a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb
+++ b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
@@ -1,19 +1,22 @@
 SUMMARY = "ARM HEVC Decoder with Unit Test Application"
-HOMEPAGE = "https://gforge.ti.com/gf/project/am_multimedia/"
+HOMEPAGE = "https://git.ti.com/processor-sdk/hevc_arm_decoder/"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://Inc/exp_pp_h265decoder.h;beginline=1;endline=27;md5=51a0ae5cca603a21186bf6ff458f3be9"
-PR = "r3"
+PR = "r4"
 
 COMPATIBLE_MACHINE = "dra7xx|keystone"
 
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/1280/7770/REL.HEVC.D.ARM.OBJ.${PV}.tar.gz \
+BRANCH = "master"
+
+SRC_URI = "git://git.ti.com/processor-sdk/hevc_arm_decode.git;protocol=git;branch=${BRANCH} \
            file://Testparams.cfg \
 "
 
-SRC_URI[md5sum] = "bb7620e34175f53a1ed989f7ce8f6d29"
-SRC_URI[sha256sum] = "e5743478e94bcfcee2e59e2e0056ece648c11bcbac91a6a8b8e492e3b42738d4"
+SRCREV = "4004c553e672538d0c3b5fa2ea0490ec095d0060"
+
+PV = "01.00.00.01"
 
-S = "${WORKDIR}/HEVC.D.ARM.${PV}/ARM_001"
+S = "${WORKDIR}/git"
 
 do_configure() {
     sed "s/-lpthread/-pthread/g" -i ${S}/Client/Build/ARM/makefile
-- 
2.7.4


