Return-Path: <nikhil.nd@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 832A7529E1
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2019 14:34:01 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x91EWoMI001318
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2019 09:32:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569940370;
	bh=I1QaL3g0GYtbzK60zr6bCeXvOkmHjnM+uQ7HdPh9B4c=;
	h=From:To:CC:Subject:Date;
	b=I86RO051k7RG+iSJZmvGuNtxjHNCEsf0HbjphGlN8vCHlX136DFS27WFt4FKRqdD1
	a5DVJslv60RWc4BlBiOdE9n4+yVp5YWvihLy1l5ykggvLMQKT2Cdq63mCvZyjzcvCH
	gkTa/EYTdgnhF33U36IKdyd2KNn4XAlkEyrSkTjI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x91EWoFB024915
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2019 09:32:50 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 1 Oct 2019 09:32:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 1 Oct 2019 09:32:40 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x91EWmDZ010199; 
	Tue, 1 Oct 2019 09:32:48 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Oct 2019 20:02:46 +0530
Message-ID: <1569940366-184916-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [tisdk-setup-scripts] [PATCH v1] setup-package-install: Add flex and libssl-dev packages
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
X-List-Received-Date: Tue, 01 Oct 2019 14:34:02 -0000
Content-Type: text/plain

For building kernel binaries, host machine should have flex and
libssl-dev packages installed.

Add these to list of packages.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 setup-package-install.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/setup-package-install.sh b/setup-package-install.sh
index 1e9fedb..922e504 100644
--- a/setup-package-install.sh
+++ b/setup-package-install.sh
@@ -56,7 +56,7 @@ cwd=`dirname $0`
 
 entry_header
 
-packages_to_install="xinetd tftpd nfs-kernel-server minicom build-essential libncurses5-dev autoconf automake dos2unix screen lrzsz lzop"
+packages_to_install="xinetd tftpd nfs-kernel-server minicom build-essential libncurses5-dev autoconf automake dos2unix screen lrzsz lzop flex libssl-dev"
 
 get_major_host_version host_major_version
 
-- 
1.9.1


