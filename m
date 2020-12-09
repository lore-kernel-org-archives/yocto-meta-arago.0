Return-Path: <c-robey@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 21C9E52968
	for <meta-arago@arago-project.org>;
	Wed,  9 Dec 2020 19:17:37 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B9JHV4H076881
	for <meta-arago@arago-project.org>; Wed, 9 Dec 2020 13:17:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607541451;
	bh=DKaew8inGOQ5/I6DafIzwtzBKmi7YfiMcikZy6Gi8iM=;
	h=From:To:CC:Subject:Date;
	b=FU5B5kGtSkh3VKBjMOKDGgvuTQP5QoWJmB28dba5YP0inHK5YQdvRfmCVkMbhhAYA
	vxaAP9wt6K6hLLtAzauYIQY2gTgd5aks0WWYfwoRh++ZLjobtRg5xvycsKO2B0QulA
	DduchtjyK37O10+yoTlq9P8+wGT+7bpyWX6l8/Qs=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B9JHV4d037102
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 9 Dec 2020 13:17:31 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 9 Dec 2020 13:17:30 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 9 Dec 2020 13:17:30 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B9JHU3V085164;
	Wed, 9 Dec 2020 13:17:30 -0600
Received: from localhost ([10.250.64.178])
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 0B9JHUYJ086452;
	Wed, 9 Dec 2020 13:17:30 -0600
From: Caleb Robey <c-robey@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 9 Dec 2020 13:17:13 -0600
Message-ID: <20201209191713.22358-1-c-robey@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 10 Dec 2020 12:42:13 +0000
Cc: a0232989 <a0232989@ti.com>, a0132237 <a0132237@ti.com>
Subject: [PATCH 1/2] [meta-ti][dunfell/master][PATCH] setup-scripts - removing confusion for users when script succeeds, but does not include correct version in success message
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
X-List-Received-Date: Wed, 09 Dec 2020 19:17:37 -0000
Content-Type: text/plain

From: a0232989 <a0232989@ti.com>

---
 setup-host-check.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/setup-host-check.sh b/setup-host-check.sh
index 45b4c71..a9db056 100644
--- a/setup-host-check.sh
+++ b/setup-host-check.sh
@@ -43,6 +43,6 @@ if [ "$host" != "precise" -a "$host" != "trusty" -a "$host" != "xenial"  -a "$ho
     echo "Unsupported host machine, only Ubuntu 12.04 LTS, Ubuntu 14.04 LTS, Ubuntu 16.04 LTS, and Ubuntu 18.04 LTS are supported"
     exit 1
 fi
-echo "Ubuntu 12.04 LTS, Ubuntu 14.04, or Ubuntu 14.04 LTS is being used, continuing.."
+echo "Ubuntu 12.04 LTS, Ubuntu 14.04, LTS Ubuntu 16.04 LTS, or Ubuntu 18.04 LTS is being used, continuing.."
 echo "--------------------------------------------------------------------------------"
 echo
-- 
2.17.1


