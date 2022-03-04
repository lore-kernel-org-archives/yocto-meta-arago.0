Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.703.1646412345509070101
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 04 Mar 2022 08:45:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LOdt7m3v;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 224GjfLA099509;
	Fri, 4 Mar 2022 10:45:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646412341;
	bh=2ToNwkwu7mZzfl3r1IHqZZy4nrH/H9/1QAyiP51K0F0=;
	h=From:To:Subject:Date;
	b=LOdt7m3vLHAm5YKFMq30Xt0M68IfpP7aXXoM+dlPBL6wVD9tpjZQPcBp4W+lRip/o
	 +iUOkdAHcnYAbKyOzTeS57ueoz7HNoQt08ZjCGto/OH5C71YlosXpQZUPnIowcMZJA
	 5kT7x48mV0C2P+ZUc4d+xofTMTl+1BsQzqfnh5hg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 224GjfQn057898
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Mar 2022 10:45:41 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 4
 Mar 2022 10:45:41 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 4 Mar 2022 10:45:41 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 224GjfKQ064367;
	Fri, 4 Mar 2022 10:45:41 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nQB3k-0007eO-Tr; Fri, 04 Mar 2022 10:45:41 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH] optee-examples: update to 3.12.0
Date: Fri, 4 Mar 2022 10:45:40 -0600
Message-ID: <20220304164540.29296-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-security/optee/optee-examples_git.bbappend     | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-arago-distro/recipes-security/optee/optee-examples_git.bbappend

diff --git a/meta-arago-distro/recipes-security/optee/optee-examples_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-examples_git.bbappend
new file mode 100644
index 00000000..4299f180
--- /dev/null
+++ b/meta-arago-distro/recipes-security/optee/optee-examples_git.bbappend
@@ -0,0 +1,7 @@
+
+PR_append = ".arago0"
+
+PV = "3.12.0+git${SRCPV}"
+
+SRCREV = "9a755dcf4d8ef6117af59dfd1b1a82315cee58ca"
+
-- 
2.17.1

