Return-Path: <nm@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id E872452AE5
	for <meta-arago@arago-project.org>;
	Fri,  9 Jul 2021 18:00:28 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 169I0Ygn049928;
	Fri, 9 Jul 2021 13:00:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625853634;
	bh=pbQ9DgAZhrj5aQuOuk8FJHT0IaSHivW9XN3r9TjupS8=;
	h=From:To:CC:Subject:Date;
	b=bDTvQiLwrxoSWdXRKXcxUs3oxMcj0o/rttCLjKEMrV6AJGBxa9D8u//KmCK2FO1Jc
	bggsiV6yIfY2/NvtSjNOqWHJgAGVrWijDd1oOBOrM58gaj9ATfJLwVJk8nFCjFiROO
	FdX9Bd4e59Tss5SW8k0Jxu1+aStsPAqdxqea5bRM=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 169I0YcH079835
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jul 2021 13:00:34 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 9 Jul 2021 13:00:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 9 Jul 2021 13:00:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 169I0YrQ003696;
	Fri, 9 Jul 2021 13:00:34 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <praneeth@ti.com>, <yogeshs@ti.com>
Date: Fri, 9 Jul 2021 13:00:32 -0500
Message-ID: <20210709180032.2570-1-nm@ti.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [tisdk-build-scripts PATCH] generate-report: Switch arago-project git repo to ti git repo
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
X-List-Received-Date: Fri, 09 Jul 2021 18:00:29 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Arago-project is on the way down, so flip over to git.ti.com repo

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 lib/oesdk/generate-report | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/oesdk/generate-report b/lib/oesdk/generate-report
index 84fffb4127b9..86813ae0cfd8 100644
--- a/lib/oesdk/generate-report
+++ b/lib/oesdk/generate-report
@@ -36,7 +36,7 @@ cat >> $results_file << EOM
 These builds were performed using the build-oesdk.sh script at:
 </p>
 <p>
-git://arago-project.org/git/projects/tisdk-build-scripts.git
+git://git.ti.com/arago-project/tisdk-build-scripts.git
 </p>
 
 <p>
-- 
2.32.0


