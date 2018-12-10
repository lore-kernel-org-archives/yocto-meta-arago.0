Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 5DBCC529AE
	for <meta-arago@arago-project.org>;
	Mon, 10 Dec 2018 15:52:17 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBAFq5xT098091
	for <meta-arago@arago-project.org>; Mon, 10 Dec 2018 09:52:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544457125;
	bh=2GEDY9JGI8QrhEVA2a1g5ixxKJcpKhihkDC7Zh/qjdM=;
	h=From:To:Subject:Date;
	b=SiIInj9hEwJPcGvTsue54ZBm1gorICfrh3jD3tPoGWj1HOZMxLNvnhZ8FzgvEBUx/
	JWGQGqLUiujjCcZD0lxeaJK01xktv6+Rmcl6CtLcaogPYqEqqOfcJfXjTl25wABncR
	6S2B/Ka8aDJju8dLru2csKeEB2Vu8gBoOYFwDt4c=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBAFq5GZ036892
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 10 Dec 2018 09:52:05 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 10 Dec 2018 09:52:05 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 10 Dec 2018 09:52:05 -0600
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBAFq4YU009131
	for <meta-arago@arago-project.org>; Mon, 10 Dec 2018 09:52:04 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 10 Dec 2018 10:51:44 -0500
Message-ID: <1544457104-42812-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] amsdk-av-files: move the AMSDK AV files from gforge.ti.com to git.ti.com
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
X-List-Received-Date: Mon, 10 Dec 2018 15:52:17 -0000
Content-Type: text/plain

- move the AMSDK AV files location
- add k3 specific video images

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../amsdk-av-files/amsdk-av-files_1.4.bb                 | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
index 9d20b1a..2f570d4 100644
--- a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
+++ b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "AMSDK multimedia support files"
-HOMEPAGE = "https://gforge.ti.com/gf/project/am_multimedia/"
+HOMEPAGE = "https://git.ti.com/processor-sdk/amsdk-av-files/"
 LICENSE = "CC-BY-NC-ND-3.0 & CC-BY-3.0"
 SECTION = "multimedia"
-LIC_FILES_CHKSUM = "file://Multimedia_Data_Files_Manifest.doc;md5=da0727f80b90422138535dfffc36cd1a"
-PR = "r1"
+LIC_FILES_CHKSUM = "file://Multimedia_Data_Files_Manifest.doc;md5=fe154d291c69c51495a5bb4a456403b5"
+PR = "r2"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -19,12 +19,16 @@ VIDEO_FILES_append_dra7xx      = "video_wvga \
                                   video_1080p \
                                   video_720p \
                                   video_yuv"
+VIDEO_FILES_append_k3          = "video_720p"
 
 VIDEO_FILES_keystone = "video_720p "
 
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/1279/7769/amsdk-av-files_${PV}.tar.gz;name=avfilestarball"
+BRANCH = "master"
 
-S = "${WORKDIR}/amsdk-av-files"
+SRC_URI = "git://git.ti.com/processor-sdk/amsdk-av-files.git;protocol=git;branch=${BRANCH}"
+SRCREV = "1b73009090265328ebaf1b6c880dfeccae5a8f19"
+
+S = "${WORKDIR}/git"
 
 do_compile() {
     :
@@ -42,5 +46,3 @@ do_install() {
 
 FILES_${PN} += "${datadir}/ti/*"
 
-SRC_URI[avfilestarball.md5sum] = "29a2f8b5f41f49e30bbe9cf53eb06c5a"
-SRC_URI[avfilestarball.sha256sum] = "64dde10d03156d480c6f38494c9503e73878fa0a8d5009182ed43b0e926b5569"
-- 
1.9.1


