Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B684BCD342C
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 19:59:57 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27930.1778097596147354808
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 06 May 2026 12:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ozg6G3uC;
 spf=pass (domain: ti.com, ip: 52.101.201.30, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6KNbVxAtOAGYGdvhwJhNSvwTAI/lLBiws75j+OSxUbEAOxphqaCyXJODs2qYrdS3vyA0mOaL1nuHZg98W4LwKm4CbYCudyYi8kp+vG037i/5WmOsBMp86NNYCFJQUcKhWLlkmlQpsj5mbDAKmfDwwSmS17Ep5bNva4GWRzWbdisJmlPKMT5ssnvzjbASnB6GXVhFQ7WyXpc+BPuUS/4lIBtNdLODxY6PWnIpsbxuNhOcorY4bEqvEV4wRhIw1T91JYf6+ir77IoQWJyRGlXj0YjUc0rbfpJg+mcQD+IH/Hy7r9VQCyX0F45IlbaL2TX/bTCdYAjP8iZnPxW4mnvvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2liu+OqPEw3NPQKySc91KnPjlFAGKWcLc4mPGDatoe4=;
 b=r81VF1BGIKmN7uezYRRF1hCszSNSxsglHBUPcuvah7uKSfnRRaANiCB+rgOB1OpJHfk3xjK4Vu/Erw4q2yFCK3aVo5WS7Nrwc+D+RGM+TGE2jFxS+myZjlbqzB86qKeov/w+PY3y+LY0hVcz+YatZcoaUwX5mNWWGwDFMoklo2x4sgfE4dLO3aCay6tqXG30Jux9prG7md5qAEU+RbLtY9FMizhqQzCYlVj/2rcS2mPi4QvHX0V9OJXgHoEcuzLxJl/8OjcyIxqBWrCjmWc0lq/yTeQOz/5JDa5kGMYpLz0+Wq5LMQYVBVlY+78PiJ1az3KaJg+A3wG85+kG+PxkPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2liu+OqPEw3NPQKySc91KnPjlFAGKWcLc4mPGDatoe4=;
 b=ozg6G3uCHAJimV9Mv16Yge/v2+rZe9WIRHnIQrrtaDfmB74cReFeKsVcQg0bVmDA56ywgDP8x8iDZF1VGIz+uI9ZU4elFixLhNns9aPGqOEqcNARcy2BaYyO1u6oNQqGSKvbbvhCn5cO+5ISsg4jBiPAAecsz4/Y4tJrAbu633A=
Received: from BN9PR03CA0277.namprd03.prod.outlook.com (2603:10b6:408:f5::12)
 by CH4PR10MB8028.namprd10.prod.outlook.com (2603:10b6:610:23d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 19:59:50 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:408:f5:cafe::51) by BN9PR03CA0277.outlook.office365.com
 (2603:10b6:408:f5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 19:59:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 19:59:50 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 14:59:49 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 6 May
 2026 14:59:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 6 May 2026 14:59:48 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 646JxmZa1773546;
	Wed, 6 May 2026 14:59:48 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wKiPM-0000000CxFU-2yES;
	Wed, 06 May 2026 14:59:48 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] Add initial wrynose configs
Date: Wed, 6 May 2026 14:59:48 -0500
Message-ID: <20260506195948.3087681-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|CH4PR10MB8028:EE_
X-MS-Office365-Filtering-Correlation-Id: 169531ae-6cec-41a6-3fed-08deabaa0833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|13003099007|56012099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	FBb1k3MPGVclpJaASL7OCWo4Q4TvXx0rmoi5aXdqnkEWdo1pFc5UOpRcMS2ztAXcAWLik0PZk2UsHug83yfjKb0hkBtWUpxD/SaFYjyo8KQeDuTp6kXwkqE+1/ACqrFcsWOLqFUq9nkxdXMgeQvHPqU353ivpBb4TmYuZ6PKLIva3Auv8iWVllYeotUyy7NQiTmph5AJhox1Bzr1RxuF9Y05uN9nf0DLKZZkx07bS2FoJUHkeAPUwgx0tLwygH8/uTdFwUF7z2Xv3HeLfumD8MYZ5Q9Yrmu7av7angXtvoPZiQ7zKwenJ2sP6jLozYwXVuJz6Waqwsdg15/PkUj8NZhAKH0Rn6HGVSJH7bWmnyVjBTUZrtXfThHckGI0+oRywSwp5TZRCdAiQUcNMvBw5cdJEgsnsb4l9XRwhAB93tMNsrprvbxOtCgeUoJ3vMcTkM/ERU21b9XJy82ieQk6ar0e5GtNe+aDFtXIMGiWyVAXnlwjoNl25PdQawcWKmkuYbftN22/Rc5p20nhbb+dcMFnFIxcSKYbQMk+DTf8rww+O90OyxukQmRWRL31nlYxAWZwsZXMjvTg6wvls8M59ylwPK4c+m+s41f4WlNRWJrSMp85iFDWaEBiTSPiCYsKZN9xi4CKe3AHCdJk2kyFJwmkX9DFPmTMlDQgjHF+qvwQaYTm9Zapfw2/94zAX5ZF
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(13003099007)(56012099003)(18002099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hYFe+hTJLt8m5Jrv2CKkGYizqstuZ2j5vqbiaPo3PSBgL0/aEKysrdWrXHXa4auxEDEJnsiRVn11Sd3euXw3B0LsEPTbofHnXTZ0uzVJw/HHhfDY7m4UOmPzSuDPTOZCMxoQ+L2iEQQnn2DNjDVcuvOKDBkdscxImm9tL+SOqtVo6kNHI9pSr+MU7V+gyxye+QwBpj52oqLq/FTafQAcF+BHCX0THGXG0pXAM+I9viKVhRZHdlvo1utOQqgr5hVXwJr4M5/0ukG9+pELSSJ9j/XYwtzmmtQYoC3dvQ71Duq9cLFIMckAW9L54fc2/IIgSDOcjOQTTBPBP5uku7WYwVjilLa7gKvF8zBeH+T52jITMPyhctOtG81Jco+w5jp5MNMJghRS6C2ovYIifnoUbyVe3zCzx9xq6Ryo5yiw8W45Jm6zO06miWZLaQgmYKK7
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 19:59:50.2369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 169531ae-6cec-41a6-3fed-08deabaa0833
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8028
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 06 May 2026 19:59:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17515

We are still waiting on meta-virtualization, meta-browser, and
meta-flutter to release their wrynose branches, but this will let use
get started on testing wrynose for everything else.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...> arago-wrynose-chromium-config.conf.json} | 16 +++++++-------
 ...nf.json =3D> arago-wrynose-config.conf.json} | 16 +++++++-------
 ...=3D> arago-wrynose-flutter-config.conf.json} | 16 +++++++-------
 ...on =3D> arago-wrynose-luks-config.conf.json} | 20 +++++++++---------
 ...on =3D> arago-wrynose-next-config.conf.json} | 18 ++++++++--------
 ...=3D> arago-wrynose-selinux-config.conf.json} | 20 +++++++++---------
 ...son =3D> arago-wrynose-wip-config.conf.json} | 16 +++++++-------
 ...ig.conf =3D> arago-wrynose-luks-config.conf} |  4 ++--
 ...ig.conf =3D> arago-wrynose-next-config.conf} |  4 ++--
 ...conf =3D> arago-wrynose-selinux-config.conf} |  4 ++--
 configs/arago-wrynose-chromium-config.txt     | 18 ++++++++++++++++
 configs/arago-wrynose-config.txt              | 18 ++++++++++++++++
 configs/arago-wrynose-flutter-config.txt      | 17 +++++++++++++++
 configs/arago-wrynose-luks-config.txt         | 21 +++++++++++++++++++
 ...nfig.txt =3D> arago-wrynose-next-config.txt} | 16 +++++++-------
 ...g.txt =3D> arago-wrynose-selinux-config.txt} | 16 +++++++-------
 configs/arago-wrynose-wip-config.txt          | 18 ++++++++++++++++
 ....yml =3D> arago-wrynose-chromium-config.yml} | 14 ++++++-------
 ...er-config.yml =3D> arago-wrynose-config.yml} | 14 ++++++-------
 ...g.yml =3D> arago-wrynose-flutter-config.yml} | 14 ++++++-------
 ...nfig.yml =3D> arago-wrynose-luks-config.yml} | 16 +++++++-------
 ...nfig.yml =3D> arago-wrynose-next-config.yml} | 14 ++++++-------
 ...g.yml =3D> arago-wrynose-selinux-config.yml} | 16 +++++++-------
 ...onfig.yml =3D> arago-wrynose-wip-config.yml} | 14 ++++++-------
 ....xml =3D> arago-wrynose-chromium-config.xml} | 18 ++++++++--------
 ...er-config.xml =3D> arago-wrynose-config.xml} | 18 ++++++++--------
 ...g.xml =3D> arago-wrynose-flutter-config.xml} | 18 ++++++++--------
 ...nfig.xml =3D> arago-wrynose-luks-config.xml} | 20 +++++++++---------
 ...nfig.xml =3D> arago-wrynose-next-config.xml} | 18 ++++++++--------
 ...g.xml =3D> arago-wrynose-selinux-config.xml} | 18 ++++++++--------
 ...onfig.xml =3D> arago-wrynose-wip-config.xml} | 18 ++++++++--------
 31 files changed, 290 insertions(+), 198 deletions(-)
 copy bitbake-setup/{arago-master-chromium-config.conf.json =3D> arago-wryn=
ose-chromium-config.conf.json} (94%)
 copy bitbake-setup/{arago-master-config.conf.json =3D> arago-wrynose-confi=
g.conf.json} (94%)
 copy bitbake-setup/{arago-master-flutter-config.conf.json =3D> arago-wryno=
se-flutter-config.conf.json} (94%)
 copy bitbake-setup/{arago-master-luks-config.conf.json =3D> arago-wrynose-=
luks-config.conf.json} (92%)
 copy bitbake-setup/{arago-master-next-config.conf.json =3D> arago-wrynose-=
next-config.conf.json} (92%)
 copy bitbake-setup/{arago-master-selinux-config.conf.json =3D> arago-wryno=
se-selinux-config.conf.json} (92%)
 copy bitbake-setup/{arago-master-config.conf.json =3D> arago-wrynose-wip-c=
onfig.conf.json} (94%)
 copy conf/fragments/localconf/configs/{arago-master-luks-config.conf =3D> =
arago-wrynose-luks-config.conf} (78%)
 copy conf/fragments/localconf/configs/{arago-master-next-config.conf =3D> =
arago-wrynose-next-config.conf} (96%)
 copy conf/fragments/localconf/configs/{arago-master-selinux-config.conf =
=3D> arago-wrynose-selinux-config.conf} (77%)
 create mode 100644 configs/arago-wrynose-chromium-config.txt
 create mode 100644 configs/arago-wrynose-config.txt
 create mode 100644 configs/arago-wrynose-flutter-config.txt
 create mode 100644 configs/arago-wrynose-luks-config.txt
 copy configs/{arago-master-next-config.txt =3D> arago-wrynose-next-config.=
txt} (78%)
 copy configs/{arago-master-selinux-config.txt =3D> arago-wrynose-selinux-c=
onfig.txt} (50%)
 create mode 100644 configs/arago-wrynose-wip-config.txt
 copy kas/{arago-master-chromium-config.yml =3D> arago-wrynose-chromium-con=
fig.yml} (91%)
 copy kas/{arago-master-config.yml =3D> arago-wrynose-config.yml} (90%)
 copy kas/{arago-master-flutter-config.yml =3D> arago-wrynose-flutter-confi=
g.yml} (91%)
 copy kas/{arago-master-luks-config.yml =3D> arago-wrynose-luks-config.yml}=
 (90%)
 copy kas/{arago-master-next-config.yml =3D> arago-wrynose-next-config.yml}=
 (94%)
 copy kas/{arago-master-selinux-config.yml =3D> arago-wrynose-selinux-confi=
g.yml} (90%)
 copy kas/{arago-master-wip-config.yml =3D> arago-wrynose-wip-config.yml} (=
89%)
 copy src/configs/{arago-master-chromium-config.xml =3D> arago-wrynose-chro=
mium-config.xml} (86%)
 copy src/configs/{arago-master-config.xml =3D> arago-wrynose-config.xml} (=
86%)
 copy src/configs/{arago-master-flutter-config.xml =3D> arago-wrynose-flutt=
er-config.xml} (85%)
 copy src/configs/{arago-master-luks-config.xml =3D> arago-wrynose-luks-con=
fig.xml} (86%)
 copy src/configs/{arago-master-next-config.xml =3D> arago-wrynose-next-con=
fig.xml} (91%)
 copy src/configs/{arago-master-selinux-config.xml =3D> arago-wrynose-selin=
ux-config.xml} (87%)
 copy src/configs/{arago-master-config.xml =3D> arago-wrynose-wip-config.xm=
l} (86%)

diff --git a/bitbake-setup/arago-master-chromium-config.conf.json b/bitbake=
-setup/arago-wrynose-chromium-config.conf.json
similarity index 94%
copy from bitbake-setup/arago-master-chromium-config.conf.json
copy to bitbake-setup/arago-wrynose-chromium-config.conf.json
index 5bb8ec9..77c9ee4 100644
--- a/bitbake-setup/arago-master-chromium-config.conf.json
+++ b/bitbake-setup/arago-wrynose-chromium-config.conf.json
@@ -1,6 +1,6 @@
 {
   "version": "1.0",
-  "description": "Arago reference distribution for master-chromium",
+  "description": "Arago reference distribution for wrynose-chromium",
   "sources": {
     "oe-layersetup": {
       "git-remote": {
@@ -20,7 +20,7 @@
             "uri": "https://git.openembedded.org/bitbake"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "bitbake"
     },
@@ -31,7 +31,7 @@
             "uri": "https://git.yoctoproject.org/meta-arago"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-arago"
     },
@@ -53,7 +53,7 @@
             "uri": "https://code.qt.io/yocto/meta-qt6.git"
           }
         },
-        "rev": "dev"
+        "rev": "6.11"
       },
       "path": "meta-qt6"
     },
@@ -75,7 +75,7 @@
             "uri": "https://git.openembedded.org/meta-openembedded"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-openembedded"
     },
@@ -86,7 +86,7 @@
             "uri": "https://git.yoctoproject.org/meta-ti"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-ti"
     },
@@ -97,7 +97,7 @@
             "uri": "https://git.yoctoproject.org/meta-arm"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-arm"
     },
@@ -108,7 +108,7 @@
             "uri": "https://git.openembedded.org/openembedded-core"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "oe-core"
     }
diff --git a/bitbake-setup/arago-master-config.conf.json b/bitbake-setup/ar=
ago-wrynose-config.conf.json
similarity index 94%
copy from bitbake-setup/arago-master-config.conf.json
copy to bitbake-setup/arago-wrynose-config.conf.json
index a196ffd..bac8975 100644
--- a/bitbake-setup/arago-master-config.conf.json
+++ b/bitbake-setup/arago-wrynose-config.conf.json
@@ -1,6 +1,6 @@
 {
   "version": "1.0",
-  "description": "Arago reference distribution for master",
+  "description": "Arago reference distribution for wrynose",
   "sources": {
     "oe-layersetup": {
       "git-remote": {
@@ -20,7 +20,7 @@
             "uri": "https://git.openembedded.org/bitbake"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "bitbake"
     },
@@ -31,7 +31,7 @@
             "uri": "https://git.yoctoproject.org/meta-arago"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-arago"
     },
@@ -42,7 +42,7 @@
             "uri": "https://code.qt.io/yocto/meta-qt6.git"
           }
         },
-        "rev": "dev"
+        "rev": "6.11"
       },
       "path": "meta-qt6"
     },
@@ -64,7 +64,7 @@
             "uri": "https://git.openembedded.org/meta-openembedded"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-openembedded"
     },
@@ -75,7 +75,7 @@
             "uri": "https://git.yoctoproject.org/meta-ti"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-ti"
     },
@@ -86,7 +86,7 @@
             "uri": "https://git.yoctoproject.org/meta-arm"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-arm"
     },
@@ -97,7 +97,7 @@
             "uri": "https://git.openembedded.org/openembedded-core"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "oe-core"
     }
diff --git a/bitbake-setup/arago-master-flutter-config.conf.json b/bitbake-=
setup/arago-wrynose-flutter-config.conf.json
similarity index 94%
copy from bitbake-setup/arago-master-flutter-config.conf.json
copy to bitbake-setup/arago-wrynose-flutter-config.conf.json
index bfc3141..74970bd 100644
--- a/bitbake-setup/arago-master-flutter-config.conf.json
+++ b/bitbake-setup/arago-wrynose-flutter-config.conf.json
@@ -1,6 +1,6 @@
 {
   "version": "1.0",
-  "description": "Arago reference distribution for master-flutter",
+  "description": "Arago reference distribution for wrynose-flutter",
   "sources": {
     "oe-layersetup": {
       "git-remote": {
@@ -20,7 +20,7 @@
             "uri": "https://git.openembedded.org/bitbake"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "bitbake"
     },
@@ -31,7 +31,7 @@
             "uri": "https://git.yoctoproject.org/meta-arago"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-arago"
     },
@@ -53,7 +53,7 @@
             "uri": "https://code.qt.io/yocto/meta-qt6.git"
           }
         },
-        "rev": "dev"
+        "rev": "6.11"
       },
       "path": "meta-qt6"
     },
@@ -75,7 +75,7 @@
             "uri": "https://git.openembedded.org/meta-openembedded"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-openembedded"
     },
@@ -86,7 +86,7 @@
             "uri": "https://git.yoctoproject.org/meta-ti"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-ti"
     },
@@ -97,7 +97,7 @@
             "uri": "https://git.yoctoproject.org/meta-arm"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-arm"
     },
@@ -108,7 +108,7 @@
             "uri": "https://git.openembedded.org/openembedded-core"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "oe-core"
     }
diff --git a/bitbake-setup/arago-master-luks-config.conf.json b/bitbake-set=
up/arago-wrynose-luks-config.conf.json
similarity index 92%
copy from bitbake-setup/arago-master-luks-config.conf.json
copy to bitbake-setup/arago-wrynose-luks-config.conf.json
index c42e44e..ccaa54b 100644
--- a/bitbake-setup/arago-master-luks-config.conf.json
+++ b/bitbake-setup/arago-wrynose-luks-config.conf.json
@@ -1,6 +1,6 @@
 {
   "version": "1.0",
-  "description": "Arago reference distribution for master",
+  "description": "Arago reference distribution for wrynose",
   "sources": {
     "oe-layersetup": {
       "git-remote": {
@@ -20,7 +20,7 @@
             "uri": "https://git.openembedded.org/bitbake"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "bitbake"
     },
@@ -31,7 +31,7 @@
             "uri": "https://git.yoctoproject.org/meta-arago"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-arago"
     },
@@ -42,7 +42,7 @@
             "uri": "https://git.yoctoproject.org/meta-security"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-security"
     },
@@ -53,7 +53,7 @@
             "uri": "https://code.qt.io/yocto/meta-qt6.git"
           }
         },
-        "rev": "dev"
+        "rev": "6.11"
       },
       "path": "meta-qt6"
     },
@@ -75,7 +75,7 @@
             "uri": "https://git.openembedded.org/meta-openembedded"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-openembedded"
     },
@@ -86,7 +86,7 @@
             "uri": "https://git.yoctoproject.org/meta-ti"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-ti"
     },
@@ -97,7 +97,7 @@
             "uri": "https://git.yoctoproject.org/meta-arm"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-arm"
     },
@@ -108,7 +108,7 @@
             "uri": "https://git.openembedded.org/openembedded-core"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "oe-core"
     }
@@ -119,7 +119,7 @@
         "name": "arago",
         "description": "TI Arago distro build",
         "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-ara=
go-extras","meta-security/meta-tpm","meta-qt6","meta-virtualization","meta-=
openembedded/meta-networking","meta-openembedded/meta-python","meta-openemb=
edded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-files=
ystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-test","meta-ti=
/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta=
-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
-        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3", "oe-=
layersetup/localconf/configs/arago-master-luks-config.conf" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3", "oe-=
layersetup/localconf/configs/arago-wrynose-luks-config.conf" ],
         "oe-fragments-one-of": {
           "machine": {
             "description": "Available target machines",
diff --git a/bitbake-setup/arago-master-next-config.conf.json b/bitbake-set=
up/arago-wrynose-next-config.conf.json
similarity index 92%
copy from bitbake-setup/arago-master-next-config.conf.json
copy to bitbake-setup/arago-wrynose-next-config.conf.json
index 891da26..9289f54 100644
--- a/bitbake-setup/arago-master-next-config.conf.json
+++ b/bitbake-setup/arago-wrynose-next-config.conf.json
@@ -1,6 +1,6 @@
 {
   "version": "1.0",
-  "description": "Arago reference distribution for master-next (CICD)",
+  "description": "Arago reference distribution for wrynose-next (CICD)",
   "sources": {
     "oe-layersetup": {
       "git-remote": {
@@ -20,7 +20,7 @@
             "uri": "https://git.openembedded.org/bitbake"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "bitbake"
     },
@@ -31,7 +31,7 @@
             "uri": "https://git.yoctoproject.org/meta-arago"
           }
         },
-        "rev": "master-next"
+        "rev": "wrynose-next"
       },
       "path": "meta-arago"
     },
@@ -42,7 +42,7 @@
             "uri": "https://code.qt.io/yocto/meta-qt6.git"
           }
         },
-        "rev": "dev"
+        "rev": "6.11"
       },
       "path": "meta-qt6"
     },
@@ -64,7 +64,7 @@
             "uri": "https://git.openembedded.org/meta-openembedded"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-openembedded"
     },
@@ -75,7 +75,7 @@
             "uri": "https://git.yoctoproject.org/meta-ti"
           }
         },
-        "rev": "master-next"
+        "rev": "wrynose-next"
       },
       "path": "meta-ti"
     },
@@ -86,7 +86,7 @@
             "uri": "https://git.yoctoproject.org/meta-arm"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-arm"
     },
@@ -97,7 +97,7 @@
             "uri": "https://git.openembedded.org/openembedded-core"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "oe-core"
     }
@@ -108,7 +108,7 @@
         "name": "arago",
         "description": "TI Arago distro build",
         "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-ara=
go-extras","meta-qt6","meta-virtualization","meta-openembedded/meta-network=
ing","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-open=
embedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedde=
d/meta-multimedia","meta-ti/meta-ti-test","meta-ti/meta-ti-extras","meta-ti=
/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-=
toolchain","oe-core/meta","oe-layersetup" ],
-        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3", "oe-=
layersetup/localconf/configs/arago-master-next-config.conf" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3", "oe-=
layersetup/localconf/configs/arago-wrynose-next-config.conf" ],
         "oe-fragments-one-of": {
           "machine": {
             "description": "Available target machines",
diff --git a/bitbake-setup/arago-master-selinux-config.conf.json b/bitbake-=
setup/arago-wrynose-selinux-config.conf.json
similarity index 92%
copy from bitbake-setup/arago-master-selinux-config.conf.json
copy to bitbake-setup/arago-wrynose-selinux-config.conf.json
index 09fb1a9..43fd5f8 100644
--- a/bitbake-setup/arago-master-selinux-config.conf.json
+++ b/bitbake-setup/arago-wrynose-selinux-config.conf.json
@@ -1,6 +1,6 @@
 {
   "version": "1.0",
-  "description": "Arago reference distribution for master",
+  "description": "Arago reference distribution for wrynose",
   "sources": {
     "oe-layersetup": {
       "git-remote": {
@@ -20,7 +20,7 @@
             "uri": "https://git.openembedded.org/bitbake"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "bitbake"
     },
@@ -31,7 +31,7 @@
             "uri": "https://git.yoctoproject.org/meta-arago"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-arago"
     },
@@ -42,7 +42,7 @@
             "uri": "https://git.yoctoproject.org/meta-selinux"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-selinux"
     },
@@ -53,7 +53,7 @@
             "uri": "https://code.qt.io/yocto/meta-qt6.git"
           }
         },
-        "rev": "dev"
+        "rev": "6.11"
       },
       "path": "meta-qt6"
     },
@@ -75,7 +75,7 @@
             "uri": "https://git.openembedded.org/meta-openembedded"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-openembedded"
     },
@@ -86,7 +86,7 @@
             "uri": "https://git.yoctoproject.org/meta-ti"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-ti"
     },
@@ -97,7 +97,7 @@
             "uri": "https://git.yoctoproject.org/meta-arm"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-arm"
     },
@@ -108,7 +108,7 @@
             "uri": "https://git.openembedded.org/openembedded-core"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "oe-core"
     }
@@ -119,7 +119,7 @@
         "name": "arago",
         "description": "TI Arago distro build",
         "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-ara=
go-extras","meta-selinux","meta-qt6","meta-virtualization","meta-openembedd=
ed/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta=
-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","m=
eta-openembedded/meta-multimedia","meta-ti/meta-ti-test","meta-ti/meta-ti-e=
xtras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","met=
a-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
-        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3", "oe-=
layersetup/localconf/configs/arago-master-selinux-config.conf" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3", "oe-=
layersetup/localconf/configs/arago-wrynose-selinux-config.conf" ],
         "oe-fragments-one-of": {
           "machine": {
             "description": "Available target machines",
diff --git a/bitbake-setup/arago-master-config.conf.json b/bitbake-setup/ar=
ago-wrynose-wip-config.conf.json
similarity index 94%
copy from bitbake-setup/arago-master-config.conf.json
copy to bitbake-setup/arago-wrynose-wip-config.conf.json
index a196ffd..e15ea1b 100644
--- a/bitbake-setup/arago-master-config.conf.json
+++ b/bitbake-setup/arago-wrynose-wip-config.conf.json
@@ -1,6 +1,6 @@
 {
   "version": "1.0",
-  "description": "Arago reference distribution for master",
+  "description": "Arago reference distribution for wrynose-wip",
   "sources": {
     "oe-layersetup": {
       "git-remote": {
@@ -20,7 +20,7 @@
             "uri": "https://git.openembedded.org/bitbake"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "bitbake"
     },
@@ -31,7 +31,7 @@
             "uri": "https://git.yoctoproject.org/meta-arago"
           }
         },
-        "rev": "master"
+        "rev": "wrynose-wip"
       },
       "path": "meta-arago"
     },
@@ -42,7 +42,7 @@
             "uri": "https://code.qt.io/yocto/meta-qt6.git"
           }
         },
-        "rev": "dev"
+        "rev": "6.11"
       },
       "path": "meta-qt6"
     },
@@ -64,7 +64,7 @@
             "uri": "https://git.openembedded.org/meta-openembedded"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-openembedded"
     },
@@ -75,7 +75,7 @@
             "uri": "https://git.yoctoproject.org/meta-ti"
           }
         },
-        "rev": "master"
+        "rev": "wrynose-wip"
       },
       "path": "meta-ti"
     },
@@ -86,7 +86,7 @@
             "uri": "https://git.yoctoproject.org/meta-arm"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-arm"
     },
@@ -97,7 +97,7 @@
             "uri": "https://git.openembedded.org/openembedded-core"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "oe-core"
     }
diff --git a/conf/fragments/localconf/configs/arago-master-luks-config.conf=
 b/conf/fragments/localconf/configs/arago-wrynose-luks-config.conf
similarity index 78%
copy from conf/fragments/localconf/configs/arago-master-luks-config.conf
copy to conf/fragments/localconf/configs/arago-wrynose-luks-config.conf
index fed0c94..51f5277 100644
--- a/conf/fragments/localconf/configs/arago-master-luks-config.conf
+++ b/conf/fragments/localconf/configs/arago-wrynose-luks-config.conf
@@ -1,4 +1,4 @@
-BB_CONF_FRAGMENT_SUMMARY =3D "Config specific overrides for arago-master-l=
uks-config"
-BB_CONF_FRAGMENT_DESCRIPTION =3D "Config specific overrides for arago-mast=
er-luks-config"
+BB_CONF_FRAGMENT_SUMMARY =3D "Config specific overrides for arago-wrynose-=
luks-config"
+BB_CONF_FRAGMENT_DESCRIPTION =3D "Config specific overrides for arago-wryn=
ose-luks-config"
=20
 DISTRO_FEATURES:append =3D " tpm luks"
diff --git a/conf/fragments/localconf/configs/arago-master-next-config.conf=
 b/conf/fragments/localconf/configs/arago-wrynose-next-config.conf
similarity index 96%
copy from conf/fragments/localconf/configs/arago-master-next-config.conf
copy to conf/fragments/localconf/configs/arago-wrynose-next-config.conf
index d66bdab..7f41f92 100644
--- a/conf/fragments/localconf/configs/arago-master-next-config.conf
+++ b/conf/fragments/localconf/configs/arago-wrynose-next-config.conf
@@ -1,5 +1,5 @@
-BB_CONF_FRAGMENT_SUMMARY =3D "Config specific overrides for arago-master-n=
ext-config"
-BB_CONF_FRAGMENT_DESCRIPTION =3D "Config specific overrides for arago-mast=
er-next-config"
+BB_CONF_FRAGMENT_SUMMARY =3D "Config specific overrides for arago-wrynose-=
next-config"
+BB_CONF_FRAGMENT_DESCRIPTION =3D "Config specific overrides for arago-wryn=
ose-next-config"
=20
 OVERRIDES:append =3D ":recipe-${@os.path.basename(d.getVar('FILE'))}"
 BRANCH:recipe-cadence-mhdp-fw_git.bb =3D "ti-linux-firmware-next"
diff --git a/conf/fragments/localconf/configs/arago-master-selinux-config.c=
onf b/conf/fragments/localconf/configs/arago-wrynose-selinux-config.conf
similarity index 77%
copy from conf/fragments/localconf/configs/arago-master-selinux-config.conf
copy to conf/fragments/localconf/configs/arago-wrynose-selinux-config.conf
index 022576a..a3fa66e 100644
--- a/conf/fragments/localconf/configs/arago-master-selinux-config.conf
+++ b/conf/fragments/localconf/configs/arago-wrynose-selinux-config.conf
@@ -1,4 +1,4 @@
-BB_CONF_FRAGMENT_SUMMARY =3D "Config specific overrides for arago-master-s=
elinux-config"
-BB_CONF_FRAGMENT_DESCRIPTION =3D "Config specific overrides for arago-mast=
er-selinux-config"
+BB_CONF_FRAGMENT_SUMMARY =3D "Config specific overrides for arago-wrynose-=
selinux-config"
+BB_CONF_FRAGMENT_DESCRIPTION =3D "Config specific overrides for arago-wryn=
ose-selinux-config"
=20
 DISTRO_FEATURES:append =3D " acl xattr pam selinux"
diff --git a/configs/arago-wrynose-chromium-config.txt b/configs/arago-wryn=
ose-chromium-config.txt
new file mode 100644
index 0000000..c12ea4a
--- /dev/null
+++ b/configs/arago-wrynose-chromium-config.txt
@@ -0,0 +1,18 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
+
+bitbake,https://git.openembedded.org/bitbake,wrynose,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=3Dm=
eta-arago-distro:meta-arago-extras
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51f=
d261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
+#meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layer=
s=3D
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
+meta-openembedded,https://git.openembedded.org/meta-openembedded,wrynose,H=
EAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystem=
s:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,wrynose,HEAD,layers=3Dmeta-ti=
-test:meta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,HEAD,layers=3Dmeta-=
arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,wrynose,HEAD,layers=
=3Dmeta
+
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
+BITBAKE_INCLUSIVE_VARS=3Dyes
diff --git a/configs/arago-wrynose-config.txt b/configs/arago-wrynose-confi=
g.txt
new file mode 100644
index 0000000..00d5093
--- /dev/null
+++ b/configs/arago-wrynose-config.txt
@@ -0,0 +1,18 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
+
+bitbake,https://git.openembedded.org/bitbake,wrynose,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=3Dm=
eta-arago-distro:meta-arago-extras
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
+#meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layer=
s=3D
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
+meta-openembedded,https://git.openembedded.org/meta-openembedded,wrynose,H=
EAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystem=
s:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,wrynose,HEAD,layers=3Dmeta-ti=
-test:meta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,HEAD,layers=3Dmeta-=
arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,wrynose,HEAD,layers=
=3Dmeta
+
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
+BITBAKE_INCLUSIVE_VARS=3Dyes
diff --git a/configs/arago-wrynose-flutter-config.txt b/configs/arago-wryno=
se-flutter-config.txt
new file mode 100644
index 0000000..77ac4db
--- /dev/null
+++ b/configs/arago-wrynose-flutter-config.txt
@@ -0,0 +1,17 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
+
+bitbake,https://git.openembedded.org/bitbake,wrynose,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=3Dm=
eta-arago-distro:meta-arago-extras
+meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,=
layers=3D.:meta-flutter-apps
+#meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layer=
s=3D
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
+meta-openembedded,https://git.openembedded.org/meta-openembedded,wrynose,H=
EAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystem=
s:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,wrynose,HEAD,layers=3Dmeta-ti=
-test:meta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,HEAD,layers=3Dmeta-=
arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,wrynose,HEAD,layers=
=3Dmeta
+
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
+BITBAKE_INCLUSIVE_VARS=3Dyes
diff --git a/configs/arago-wrynose-luks-config.txt b/configs/arago-wrynose-=
luks-config.txt
new file mode 100644
index 0000000..7494844
--- /dev/null
+++ b/configs/arago-wrynose-luks-config.txt
@@ -0,0 +1,21 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
+
+bitbake,https://git.openembedded.org/bitbake,wrynose,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=3Dm=
eta-arago-distro:meta-arago-extras
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
+#meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layer=
s=3D
+meta-security,https://git.yoctoproject.org/meta-security,wrynose,HEAD,laye=
rs=3Dmeta-tpm
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
+meta-openembedded,https://git.openembedded.org/meta-openembedded,wrynose,H=
EAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystem=
s:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,wrynose,HEAD,layers=3Dmeta-ti=
-test:meta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,HEAD,layers=3Dmeta-=
arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,wrynose,HEAD,layers=
=3Dmeta
+
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
+BITBAKE_INCLUSIVE_VARS=3Dyes
+
+LOCALCONF:DISTRO_FEATURES:append =3D " tpm luks"
diff --git a/configs/arago-master-next-config.txt b/configs/arago-wrynose-n=
ext-config.txt
similarity index 78%
copy from configs/arago-master-next-config.txt
copy to configs/arago-wrynose-next-config.txt
index 6a0c94d..6b411d8 100644
--- a/configs/arago-master-next-config.txt
+++ b/configs/arago-wrynose-next-config.txt
@@ -9,17 +9,17 @@ MOTD: NOTE: repos.  These recipes will not build correctl=
y without also a change
 MOTD: NOTE: to point the recipe to the appropriate cicd/next branch for th=
at recipe.
 MOTD: NOTE:
=20
-bitbake,https://git.openembedded.org/bitbake,master,HEAD
-meta-arago,https://git.yoctoproject.org/meta-arago,master-next,HEAD,layers=
=3Dmeta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,wrynose,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,wrynose-next,HEAD,layer=
s=3Dmeta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
-#meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
-meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
+#meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layer=
s=3D
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
-meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
-meta-ti,https://git.yoctoproject.org/meta-ti,master-next,HEAD,layers=3Dmet=
a-ti-test:meta-ti-extras:meta-beagle:meta-ti-bsp
-meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
-oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,wrynose,H=
EAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystem=
s:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,wrynose-next,HEAD,layers=3Dme=
ta-ti-test:meta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,HEAD,layers=3Dmeta-=
arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,wrynose,HEAD,layers=
=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
 OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
diff --git a/configs/arago-master-selinux-config.txt b/configs/arago-wrynos=
e-selinux-config.txt
similarity index 50%
copy from configs/arago-master-selinux-config.txt
copy to configs/arago-wrynose-selinux-config.txt
index 9f41014..5132168 100644
--- a/configs/arago-master-selinux-config.txt
+++ b/configs/arago-wrynose-selinux-config.txt
@@ -1,17 +1,17 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
=20
-bitbake,https://git.openembedded.org/bitbake,master,HEAD
-meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=3Dme=
ta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,wrynose,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=3Dm=
eta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
-meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
-meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
+meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layers=
=3D
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
-meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
-meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
test:meta-ti-extras:meta-beagle:meta-ti-bsp
-meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
-oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,wrynose,H=
EAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystem=
s:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,wrynose,HEAD,layers=3Dmeta-ti=
-test:meta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,HEAD,layers=3Dmeta-=
arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,wrynose,HEAD,layers=
=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
 OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
diff --git a/configs/arago-wrynose-wip-config.txt b/configs/arago-wrynose-w=
ip-config.txt
new file mode 100644
index 0000000..738f43f
--- /dev/null
+++ b/configs/arago-wrynose-wip-config.txt
@@ -0,0 +1,18 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
+
+bitbake,https://git.openembedded.org/bitbake,wrynose,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,wrynose-wip,HEAD,layers=
=3Dmeta-arago-distro:meta-arago-extras
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
+#meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layer=
s=3D
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
+meta-openembedded,https://git.openembedded.org/meta-openembedded,wrynose,H=
EAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystem=
s:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,wrynose-wip,HEAD,layers=3Dmet=
a-ti-test:meta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,HEAD,layers=3Dmeta-=
arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,wrynose,HEAD,layers=
=3Dmeta
+
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
+BITBAKE_INCLUSIVE_VARS=3Dyes
diff --git a/kas/arago-master-chromium-config.yml b/kas/arago-wrynose-chrom=
ium-config.yml
similarity index 91%
copy from kas/arago-master-chromium-config.yml
copy to kas/arago-wrynose-chromium-config.yml
index 45aef4c..c15c9a4 100644
--- a/kas/arago-master-chromium-config.yml
+++ b/kas/arago-wrynose-chromium-config.yml
@@ -10,14 +10,14 @@ target: tisdk-default-image
 repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-arago"
     layers:
       meta-arago-distro:
@@ -33,7 +33,7 @@ repos:
=20
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
-    branch: "dev"
+    branch: "6.11"
     path: "sources/meta-qt6"
=20
   meta-virtualization:
@@ -43,7 +43,7 @@ repos:
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-openembedded"
     layers:
       meta-networking:
@@ -55,7 +55,7 @@ repos:
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-ti"
     layers:
       meta-ti-test:
@@ -65,7 +65,7 @@ repos:
=20
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-arm"
     layers:
       meta-arm:
@@ -73,7 +73,7 @@ repos:
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-master-config.yml b/kas/arago-wrynose-config.yml
similarity index 90%
copy from kas/arago-master-config.yml
copy to kas/arago-wrynose-config.yml
index c8a64d0..c593185 100644
--- a/kas/arago-master-config.yml
+++ b/kas/arago-wrynose-config.yml
@@ -10,14 +10,14 @@ target: tisdk-default-image
 repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-arago"
     layers:
       meta-arago-distro:
@@ -25,7 +25,7 @@ repos:
=20
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
-    branch: "dev"
+    branch: "6.11"
     path: "sources/meta-qt6"
=20
   meta-virtualization:
@@ -35,7 +35,7 @@ repos:
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-openembedded"
     layers:
       meta-networking:
@@ -47,7 +47,7 @@ repos:
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-ti"
     layers:
       meta-ti-test:
@@ -57,7 +57,7 @@ repos:
=20
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-arm"
     layers:
       meta-arm:
@@ -65,7 +65,7 @@ repos:
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-master-flutter-config.yml b/kas/arago-wrynose-flutte=
r-config.yml
similarity index 91%
copy from kas/arago-master-flutter-config.yml
copy to kas/arago-wrynose-flutter-config.yml
index 4b35225..bfc9f22 100644
--- a/kas/arago-master-flutter-config.yml
+++ b/kas/arago-wrynose-flutter-config.yml
@@ -10,14 +10,14 @@ target: tisdk-default-image
 repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-arago"
     layers:
       meta-arago-distro:
@@ -33,7 +33,7 @@ repos:
=20
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
-    branch: "dev"
+    branch: "6.11"
     path: "sources/meta-qt6"
=20
   meta-virtualization:
@@ -43,7 +43,7 @@ repos:
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-openembedded"
     layers:
       meta-networking:
@@ -55,7 +55,7 @@ repos:
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-ti"
     layers:
       meta-ti-test:
@@ -65,7 +65,7 @@ repos:
=20
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-arm"
     layers:
       meta-arm:
@@ -73,7 +73,7 @@ repos:
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-master-luks-config.yml b/kas/arago-wrynose-luks-conf=
ig.yml
similarity index 90%
copy from kas/arago-master-luks-config.yml
copy to kas/arago-wrynose-luks-config.yml
index 6aa8d96..71b4476 100644
--- a/kas/arago-master-luks-config.yml
+++ b/kas/arago-wrynose-luks-config.yml
@@ -10,14 +10,14 @@ target: tisdk-default-image
 repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-arago"
     layers:
       meta-arago-distro:
@@ -25,14 +25,14 @@ repos:
=20
   meta-security:
     url: "https://git.yoctoproject.org/meta-security"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-security"
     layers:
       meta-tpm:
=20
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
-    branch: "dev"
+    branch: "6.11"
     path: "sources/meta-qt6"
=20
   meta-virtualization:
@@ -42,7 +42,7 @@ repos:
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-openembedded"
     layers:
       meta-networking:
@@ -54,7 +54,7 @@ repos:
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-ti"
     layers:
       meta-ti-test:
@@ -64,7 +64,7 @@ repos:
=20
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-arm"
     layers:
       meta-arm:
@@ -72,7 +72,7 @@ repos:
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-master-next-config.yml b/kas/arago-wrynose-next-conf=
ig.yml
similarity index 94%
copy from kas/arago-master-next-config.yml
copy to kas/arago-wrynose-next-config.yml
index 08be685..fd4e936 100644
--- a/kas/arago-master-next-config.yml
+++ b/kas/arago-wrynose-next-config.yml
@@ -10,14 +10,14 @@ target: tisdk-default-image
 repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
-    branch: "master-next"
+    branch: "wrynose-next"
     path: "sources/meta-arago"
     layers:
       meta-arago-distro:
@@ -25,7 +25,7 @@ repos:
=20
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
-    branch: "dev"
+    branch: "6.11"
     path: "sources/meta-qt6"
=20
   meta-virtualization:
@@ -35,7 +35,7 @@ repos:
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-openembedded"
     layers:
       meta-networking:
@@ -47,7 +47,7 @@ repos:
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
-    branch: "master-next"
+    branch: "wrynose-next"
     path: "sources/meta-ti"
     layers:
       meta-ti-test:
@@ -57,7 +57,7 @@ repos:
=20
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-arm"
     layers:
       meta-arm:
@@ -65,7 +65,7 @@ repos:
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-master-selinux-config.yml b/kas/arago-wrynose-selinu=
x-config.yml
similarity index 90%
copy from kas/arago-master-selinux-config.yml
copy to kas/arago-wrynose-selinux-config.yml
index 1a4ad25..8e3e0a0 100644
--- a/kas/arago-master-selinux-config.yml
+++ b/kas/arago-wrynose-selinux-config.yml
@@ -10,14 +10,14 @@ target: tisdk-default-image
 repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-arago"
     layers:
       meta-arago-distro:
@@ -25,12 +25,12 @@ repos:
=20
   meta-selinux:
     url: "https://git.yoctoproject.org/meta-selinux"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-selinux"
=20
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
-    branch: "dev"
+    branch: "6.11"
     path: "sources/meta-qt6"
=20
   meta-virtualization:
@@ -40,7 +40,7 @@ repos:
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-openembedded"
     layers:
       meta-networking:
@@ -52,7 +52,7 @@ repos:
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-ti"
     layers:
       meta-ti-test:
@@ -62,7 +62,7 @@ repos:
=20
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-arm"
     layers:
       meta-arm:
@@ -70,7 +70,7 @@ repos:
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-master-wip-config.yml b/kas/arago-wrynose-wip-config=
.yml
similarity index 89%
copy from kas/arago-master-wip-config.yml
copy to kas/arago-wrynose-wip-config.yml
index 94e4c95..3494533 100644
--- a/kas/arago-master-wip-config.yml
+++ b/kas/arago-wrynose-wip-config.yml
@@ -10,14 +10,14 @@ target: tisdk-default-image
 repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
-    branch: "master-wip"
+    branch: "wrynose-wip"
     path: "sources/meta-arago"
     layers:
       meta-arago-distro:
@@ -25,7 +25,7 @@ repos:
=20
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
-    branch: "dev"
+    branch: "6.11"
     path: "sources/meta-qt6"
=20
   meta-virtualization:
@@ -35,7 +35,7 @@ repos:
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-openembedded"
     layers:
       meta-networking:
@@ -47,7 +47,7 @@ repos:
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
-    branch: "master-wip"
+    branch: "wrynose-wip"
     path: "sources/meta-ti"
     layers:
       meta-ti-test:
@@ -57,7 +57,7 @@ repos:
=20
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-arm"
     layers:
       meta-arm:
@@ -65,7 +65,7 @@ repos:
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/oe-core"
     layers:
       meta:
diff --git a/src/configs/arago-master-chromium-config.xml b/src/configs/ara=
go-wrynose-chromium-config.xml
similarity index 86%
copy from src/configs/arago-master-chromium-config.xml
copy to src/configs/arago-wrynose-chromium-config.xml
index 9091595..4a5620e 100644
--- a/src/configs/arago-master-chromium-config.xml
+++ b/src/configs/arago-wrynose-chromium-config.xml
@@ -1,16 +1,16 @@
 <?xml version=3D'1.0'?>
 <config>
-    <description>Arago reference distribution for master-chromium</descrip=
tion>
+    <description>Arago reference distribution for wrynose-chromium</descri=
ption>
=20
     <xi:include href=3D'../common/distro_arago.xml' xmlns:xi=3D'http://www=
.w3.org/2001/XInclude'/>
     <xi:include href=3D'../common/machines.xml' xmlns:xi=3D'http://www.w3.=
org/2001/XInclude'/>
     <xi:include href=3D'../templates/bblayers.conf.xml' xmlns:xi=3D'http:/=
/www.w3.org/2001/XInclude'/>
     <xi:include href=3D'../templates/local-arago64-v3.conf.xml' xmlns:xi=
=3D'http://www.w3.org/2001/XInclude'/>
=20
-    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'master=
' commit=3D'HEAD'/>
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'wrynos=
e' commit=3D'HEAD'/>
=20
     <repos>
-        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
@@ -27,16 +27,16 @@
                 <layer>meta-chromium</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-selinux' url=3D'https://git.yoctoproject.org/me=
ta-selinux' branch=3D'master' commit=3D'HEAD' disabled=3D'true'>
+        <repo name=3D'meta-selinux' url=3D'https://git.yoctoproject.org/me=
ta-selinux' branch=3D'wrynose' commit=3D'HEAD' disabled=3D'true'>
             <layers/>
         </repo>
-        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'dev' commit=3D'HEAD'>
+        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'6.11' commit=3D'HEAD'>
             <layers/>
         </repo>
         <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-networking</layer>
                 <layer>meta-python</layer>
@@ -46,7 +46,7 @@
                 <layer>meta-multimedia</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-ti-test</layer>
                 <layer>meta-ti-extras</layer>
@@ -54,13 +54,13 @@
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-arm</layer>
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta</layer>
             </layers>
diff --git a/src/configs/arago-master-config.xml b/src/configs/arago-wrynos=
e-config.xml
similarity index 86%
copy from src/configs/arago-master-config.xml
copy to src/configs/arago-wrynose-config.xml
index 3718323..89f81cc 100644
--- a/src/configs/arago-master-config.xml
+++ b/src/configs/arago-wrynose-config.xml
@@ -1,16 +1,16 @@
 <?xml version=3D'1.0'?>
 <config>
-    <description>Arago reference distribution for master</description>
+    <description>Arago reference distribution for wrynose</description>
=20
     <xi:include href=3D'../common/distro_arago.xml' xmlns:xi=3D'http://www=
.w3.org/2001/XInclude'/>
     <xi:include href=3D'../common/machines.xml' xmlns:xi=3D'http://www.w3.=
org/2001/XInclude'/>
     <xi:include href=3D'../templates/bblayers.conf.xml' xmlns:xi=3D'http:/=
/www.w3.org/2001/XInclude'/>
     <xi:include href=3D'../templates/local-arago64-v3.conf.xml' xmlns:xi=
=3D'http://www.w3.org/2001/XInclude'/>
=20
-    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'master=
' commit=3D'HEAD'/>
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'wrynos=
e' commit=3D'HEAD'/>
=20
     <repos>
-        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
@@ -27,16 +27,16 @@
                 <layer>meta-chromium</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-selinux' url=3D'https://git.yoctoproject.org/me=
ta-selinux' branch=3D'master' commit=3D'HEAD' disabled=3D'true'>
+        <repo name=3D'meta-selinux' url=3D'https://git.yoctoproject.org/me=
ta-selinux' branch=3D'wrynose' commit=3D'HEAD' disabled=3D'true'>
             <layers/>
         </repo>
-        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'dev' commit=3D'HEAD'>
+        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'6.11' commit=3D'HEAD'>
             <layers/>
         </repo>
         <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-networking</layer>
                 <layer>meta-python</layer>
@@ -46,7 +46,7 @@
                 <layer>meta-multimedia</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-ti-test</layer>
                 <layer>meta-ti-extras</layer>
@@ -54,13 +54,13 @@
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-arm</layer>
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta</layer>
             </layers>
diff --git a/src/configs/arago-master-flutter-config.xml b/src/configs/arag=
o-wrynose-flutter-config.xml
similarity index 85%
copy from src/configs/arago-master-flutter-config.xml
copy to src/configs/arago-wrynose-flutter-config.xml
index ad3cda6..ccb92e3 100644
--- a/src/configs/arago-master-flutter-config.xml
+++ b/src/configs/arago-wrynose-flutter-config.xml
@@ -1,16 +1,16 @@
 <?xml version=3D'1.0'?>
 <config>
-    <description>Arago reference distribution for master-flutter</descript=
ion>
+    <description>Arago reference distribution for wrynose-flutter</descrip=
tion>
=20
     <xi:include href=3D'../common/distro_arago.xml' xmlns:xi=3D'http://www=
.w3.org/2001/XInclude'/>
     <xi:include href=3D'../common/machines.xml' xmlns:xi=3D'http://www.w3.=
org/2001/XInclude'/>
     <xi:include href=3D'../templates/bblayers.conf.xml' xmlns:xi=3D'http:/=
/www.w3.org/2001/XInclude'/>
     <xi:include href=3D'../templates/local-arago64-v3.conf.xml' xmlns:xi=
=3D'http://www.w3.org/2001/XInclude'/>
=20
-    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'master=
' commit=3D'HEAD'/>
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'wrynos=
e' commit=3D'HEAD'/>
=20
     <repos>
-        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
@@ -22,16 +22,16 @@
 		<layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-selinux' url=3D'https://git.yoctoproject.org/me=
ta-selinux' branch=3D'master' commit=3D'HEAD' disabled=3D'true'>
+        <repo name=3D'meta-selinux' url=3D'https://git.yoctoproject.org/me=
ta-selinux' branch=3D'wrynose' commit=3D'HEAD' disabled=3D'true'>
             <layers/>
         </repo>
-        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'dev' commit=3D'HEAD'>
+        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'6.11' commit=3D'HEAD'>
             <layers/>
         </repo>
         <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-networking</layer>
                 <layer>meta-python</layer>
@@ -41,7 +41,7 @@
                 <layer>meta-multimedia</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-ti-test</layer>
                 <layer>meta-ti-extras</layer>
@@ -49,13 +49,13 @@
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-arm</layer>
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta</layer>
             </layers>
diff --git a/src/configs/arago-master-luks-config.xml b/src/configs/arago-w=
rynose-luks-config.xml
similarity index 86%
copy from src/configs/arago-master-luks-config.xml
copy to src/configs/arago-wrynose-luks-config.xml
index 7e3b3ea..e4a49c6 100644
--- a/src/configs/arago-master-luks-config.xml
+++ b/src/configs/arago-wrynose-luks-config.xml
@@ -1,16 +1,16 @@
 <?xml version=3D'1.0'?>
 <config>
-    <description>Arago reference distribution for master</description>
+    <description>Arago reference distribution for wrynose</description>
=20
     <xi:include href=3D'../common/distro_arago.xml' xmlns:xi=3D'http://www=
.w3.org/2001/XInclude'/>
     <xi:include href=3D'../common/machines.xml' xmlns:xi=3D'http://www.w3.=
org/2001/XInclude'/>
     <xi:include href=3D'../templates/bblayers.conf.xml' xmlns:xi=3D'http:/=
/www.w3.org/2001/XInclude'/>
     <xi:include href=3D'../templates/local-arago64-v3.conf.xml' xmlns:xi=
=3D'http://www.w3.org/2001/XInclude'/>
=20
-    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'master=
' commit=3D'HEAD'/>
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'wrynos=
e' commit=3D'HEAD'/>
=20
     <repos>
-        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
@@ -27,21 +27,21 @@
                 <layer>meta-chromium</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-selinux' url=3D'https://git.yoctoproject.org/me=
ta-selinux' branch=3D'master' commit=3D'HEAD' disabled=3D'true'>
+        <repo name=3D'meta-selinux' url=3D'https://git.yoctoproject.org/me=
ta-selinux' branch=3D'wrynose' commit=3D'HEAD' disabled=3D'true'>
             <layers/>
         </repo>
-        <repo name=3D'meta-security' url=3D'https://git.yoctoproject.org/m=
eta-security' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-security' url=3D'https://git.yoctoproject.org/m=
eta-security' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-tpm</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'dev' commit=3D'HEAD'>
+        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'6.11' commit=3D'HEAD'>
             <layers/>
         </repo>
         <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-networking</layer>
                 <layer>meta-python</layer>
@@ -51,7 +51,7 @@
                 <layer>meta-multimedia</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-ti-test</layer>
                 <layer>meta-ti-extras</layer>
@@ -59,13 +59,13 @@
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-arm</layer>
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta</layer>
             </layers>
diff --git a/src/configs/arago-master-next-config.xml b/src/configs/arago-w=
rynose-next-config.xml
similarity index 91%
copy from src/configs/arago-master-next-config.xml
copy to src/configs/arago-wrynose-next-config.xml
index 2238ae7..bd87045 100644
--- a/src/configs/arago-master-next-config.xml
+++ b/src/configs/arago-wrynose-next-config.xml
@@ -1,6 +1,6 @@
 <?xml version=3D'1.0'?>
 <config>
-    <description>Arago reference distribution for master-next (CICD)</desc=
ription>
+    <description>Arago reference distribution for wrynose-next (CICD)</des=
cription>
=20
     <xi:include href=3D'../common/motd_cicd.xml' xmlns:xi=3D'http://www.w3=
.org/2001/XInclude'/>
     <xi:include href=3D'../common/distro_arago.xml' xmlns:xi=3D'http://www=
.w3.org/2001/XInclude'/>
@@ -8,10 +8,10 @@
     <xi:include href=3D'../templates/bblayers.conf.xml' xmlns:xi=3D'http:/=
/www.w3.org/2001/XInclude'/>
     <xi:include href=3D'../templates/local-arago64-v3.conf.xml' xmlns:xi=
=3D'http://www.w3.org/2001/XInclude'/>
=20
-    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'master=
' commit=3D'HEAD'/>
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'wrynos=
e' commit=3D'HEAD'/>
=20
     <repos>
-        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'master-next' commit=3D'HEAD'>
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'wrynose-next' commit=3D'HEAD'>
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
@@ -28,16 +28,16 @@
                 <layer>meta-chromium</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-selinux' url=3D'https://git.yoctoproject.org/me=
ta-selinux' branch=3D'master' commit=3D'HEAD' disabled=3D'true'>
+        <repo name=3D'meta-selinux' url=3D'https://git.yoctoproject.org/me=
ta-selinux' branch=3D'wrynose' commit=3D'HEAD' disabled=3D'true'>
             <layers/>
         </repo>
-        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'dev' commit=3D'HEAD'>
+        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'6.11' commit=3D'HEAD'>
             <layers/>
         </repo>
         <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-networking</layer>
                 <layer>meta-python</layer>
@@ -47,7 +47,7 @@
                 <layer>meta-multimedia</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master-next' commit=3D'HEAD'>
+        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'wrynose-next' commit=3D'HEAD'>
             <layers>
                 <layer>meta-ti-test</layer>
                 <layer>meta-ti-extras</layer>
@@ -55,13 +55,13 @@
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-arm</layer>
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta</layer>
             </layers>
diff --git a/src/configs/arago-master-selinux-config.xml b/src/configs/arag=
o-wrynose-selinux-config.xml
similarity index 87%
copy from src/configs/arago-master-selinux-config.xml
copy to src/configs/arago-wrynose-selinux-config.xml
index c41e735..de6ad79 100644
--- a/src/configs/arago-master-selinux-config.xml
+++ b/src/configs/arago-wrynose-selinux-config.xml
@@ -1,16 +1,16 @@
 <?xml version=3D'1.0'?>
 <config>
-    <description>Arago reference distribution for master</description>
+    <description>Arago reference distribution for wrynose</description>
=20
     <xi:include href=3D'../common/distro_arago.xml' xmlns:xi=3D'http://www=
.w3.org/2001/XInclude'/>
     <xi:include href=3D'../common/machines.xml' xmlns:xi=3D'http://www.w3.=
org/2001/XInclude'/>
     <xi:include href=3D'../templates/bblayers.conf.xml' xmlns:xi=3D'http:/=
/www.w3.org/2001/XInclude'/>
     <xi:include href=3D'../templates/local-arago64-v3.conf.xml' xmlns:xi=
=3D'http://www.w3.org/2001/XInclude'/>
=20
-    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'master=
' commit=3D'HEAD'/>
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'wrynos=
e' commit=3D'HEAD'/>
=20
     <repos>
-        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
@@ -27,16 +27,16 @@
                 <layer>meta-chromium</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-selinux' url=3D'https://git.yoctoproject.org/me=
ta-selinux' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-selinux' url=3D'https://git.yoctoproject.org/me=
ta-selinux' branch=3D'wrynose' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'dev' commit=3D'HEAD'>
+        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'6.11' commit=3D'HEAD'>
             <layers/>
         </repo>
         <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-networking</layer>
                 <layer>meta-python</layer>
@@ -46,7 +46,7 @@
                 <layer>meta-multimedia</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-ti-test</layer>
                 <layer>meta-ti-extras</layer>
@@ -54,13 +54,13 @@
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-arm</layer>
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta</layer>
             </layers>
diff --git a/src/configs/arago-master-config.xml b/src/configs/arago-wrynos=
e-wip-config.xml
similarity index 86%
copy from src/configs/arago-master-config.xml
copy to src/configs/arago-wrynose-wip-config.xml
index 3718323..4f25ae9 100644
--- a/src/configs/arago-master-config.xml
+++ b/src/configs/arago-wrynose-wip-config.xml
@@ -1,16 +1,16 @@
 <?xml version=3D'1.0'?>
 <config>
-    <description>Arago reference distribution for master</description>
+    <description>Arago reference distribution for wrynose-wip</description=
>
=20
     <xi:include href=3D'../common/distro_arago.xml' xmlns:xi=3D'http://www=
.w3.org/2001/XInclude'/>
     <xi:include href=3D'../common/machines.xml' xmlns:xi=3D'http://www.w3.=
org/2001/XInclude'/>
     <xi:include href=3D'../templates/bblayers.conf.xml' xmlns:xi=3D'http:/=
/www.w3.org/2001/XInclude'/>
     <xi:include href=3D'../templates/local-arago64-v3.conf.xml' xmlns:xi=
=3D'http://www.w3.org/2001/XInclude'/>
=20
-    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'master=
' commit=3D'HEAD'/>
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'wrynos=
e' commit=3D'HEAD'/>
=20
     <repos>
-        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'wrynose-wip' commit=3D'HEAD'>
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
@@ -27,16 +27,16 @@
                 <layer>meta-chromium</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-selinux' url=3D'https://git.yoctoproject.org/me=
ta-selinux' branch=3D'master' commit=3D'HEAD' disabled=3D'true'>
+        <repo name=3D'meta-selinux' url=3D'https://git.yoctoproject.org/me=
ta-selinux' branch=3D'wrynose' commit=3D'HEAD' disabled=3D'true'>
             <layers/>
         </repo>
-        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'dev' commit=3D'HEAD'>
+        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'6.11' commit=3D'HEAD'>
             <layers/>
         </repo>
         <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'HEAD'>
             <layers/>
         </repo>
-        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-networking</layer>
                 <layer>meta-python</layer>
@@ -46,7 +46,7 @@
                 <layer>meta-multimedia</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'wrynose-wip' commit=3D'HEAD'>
             <layers>
                 <layer>meta-ti-test</layer>
                 <layer>meta-ti-extras</layer>
@@ -54,13 +54,13 @@
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-arm</layer>
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta</layer>
             </layers>
--=20
2.43.0


