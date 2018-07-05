Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id E70DD529BC
	for <meta-arago@arago-project.org>;
	Thu,  5 Jul 2018 16:51:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w65Gp5vC082430
	for <meta-arago@arago-project.org>; Thu, 5 Jul 2018 11:51:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530809465;
	bh=v71lMP0rEwjKfVluhXgKobMvJfm0n/urQgHAVNDoTN4=;
	h=From:To:CC:Subject:Date;
	b=VDz5Vd1aP8dQeQ+4ytUW2gIM2+w/04uAb0MtnZB1gMXK7M49VICqb9zboPyroFijz
	19mrwp7veRBRlQkM89RuX4XEgEI4wphyjJHq0aojCrkLEAHjC+5ij/MFNxbHRO72Gm
	qpx6t6D3e6bVoV64/Bpg7OGPOxlxF2DHHXPKPLwk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w65Gp5HZ004201
	for <meta-arago@arago-project.org>; Thu, 5 Jul 2018 11:51:05 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 5 Jul 2018 11:51:05 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 5 Jul 2018 11:51:05 -0500
Received: from beryl.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w65Gp5rp013664;
	Thu, 5 Jul 2018 11:51:05 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 5 Jul 2018 12:50:07 -0400
Message-ID: <1530809407-27294-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] optee-os: preserve original .bin and .elf output files
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
X-List-Received-Date: Thu, 05 Jul 2018 16:51:12 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-security/optee/optee-os_git.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index cf643b0..655bd02 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -57,8 +57,8 @@ do_compile() {
 do_compile_aarch64() {
     oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
     ( cd out/arm-plat-${OPTEEOUTPUTMACHINE}/core/; \
-        mv tee-pager.bin bl32.bin; \
-        mv tee.elf bl32.elf; \
+        cp tee-pager.bin bl32.bin; \
+        cp tee.elf bl32.elf; \
     )
 }
 
-- 
2.7.4


