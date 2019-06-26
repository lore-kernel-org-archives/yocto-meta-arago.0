Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id A5EB3520E4
	for <meta-arago@arago-project.org>;
	Wed, 26 Jun 2019 21:07:42 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5QL6wlX125256
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2019 16:06:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561583219;
	bh=NDgmaQm0Jn4mE14ZrFcOcn9l6+QE5gl4gzzEJEVEWXw=;
	h=From:To:CC:Subject:Date;
	b=aVrz5IEZI5Pm2sigFaK3sdQOXSYgLEopTdUOqU7Zzqn7QG0sKz47B9fho+19BPMBq
	GAFsFnpctj4e6E/39j7cN+lajiaM4Gt3N1v2linHzhmxvL/jbUTMqMgEQfhAVGbpZh
	vBz5citERnBS5jh91qo0VdNNT/ssAr/Qhkon9SGM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5QL6wa6104498
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2019 16:06:58 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 26 Jun 2019 16:06:58 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 26 Jun 2019 16:06:58 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5QL6wxq073652;
	Wed, 26 Jun 2019 16:06:58 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 26 Jun 2019 20:54:36 +0000
Message-ID: <20190626205437.32712-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 1/2] optee-os: update to ti2019.02-rc1 tag
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
X-List-Received-Date: Wed, 26 Jun 2019 21:07:43 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-security/optee/optee-os_git.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index 4b0846aa..ba190355 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -13,7 +13,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
            file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
 "
 BRANCH = "ti-optee-os"
-SRCREV = "2cf91981a966ae834c517a3ee33138431f6df8be"
+SRCREV = "3a513ceae7706834f9538219503848f40302ff6d"
 
 ARMCORE = "CFG_ARM32_core=y ta-targets=ta_arm32"
 ARMCORE_aarch64 = "CFG_ARM64_core=y ta-targets=ta_arm64"
-- 
2.17.1


