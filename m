Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.7475.1646282079407515165
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Mar 2022 20:34:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=kle4xx4O;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2234YcRY018039;
	Wed, 2 Mar 2022 22:34:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646282078;
	bh=RfmvuALFBzWS08WZscLFlLCAHhxwKSPq09yq3g/hXyk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=kle4xx4OBeLNCUufflpIAroz4y74bH/PCfJil3RYRYHjYNBaWj9rjiwG5JJQ9sFgV
	 Nd7XVfccW/8GFsac0GAHBu5MMelIiEwM7vOXVUhIKZEHCyLHn09iMj2Z966XyB03B9
	 q+0B+ky7iIMam7JZQ7nHuW0FTDaNgyYHKQZucrgQ=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2234YcAH083160
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Mar 2022 22:34:38 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Mar 2022 22:34:38 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Mar 2022 22:34:38 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2234YcnK112828;
	Wed, 2 Mar 2022 22:34:38 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nPdAi-0006FL-UW; Wed, 02 Mar 2022 22:34:37 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH v2 2/2] optee-test: update to 3.12.0
Date: Wed, 2 Mar 2022 22:34:33 -0600
Message-ID: <20220303043433.22149-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303043433.22149-1-reatmon@ti.com>
References: <20220303043433.22149-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-security/optee/optee-test_git.bbappend         | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-arago-distro/recipes-security/optee/optee-test_git.bbappend

diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
new file mode 100644
index 00000000..4bfcc89f
--- /dev/null
+++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
@@ -0,0 +1,7 @@
+
+PR_append = ".arago0"
+
+PV = "3.12.0+git${SRCPV}"
+
+SRCREV = "7be42398e8848f09995abf8a9e9d8bb8840cc19a"
+
-- 
2.17.1

