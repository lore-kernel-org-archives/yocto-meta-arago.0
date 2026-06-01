Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE3ECD6E55
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 16:41:07 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3354.1780332064102952694
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 Jun 2026 09:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=gNmZzl0o;
 spf=pass (domain: ti.com, ip: 52.101.62.42, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9jNDoXm3SdJfa1hflF1WBtjyPaoNLUJplMwl2ymEWPrBr8rNLBCyYwojvpqRJg+Y+pp9CZsUssLlvSO7icX+WW7OVhfGmdMdtT2XS1bss9GegCngtmacyNaU6JKRjnCOQBDYgFSGxNl0SaA6iKIUDWqd6etr/Q4fpvi9wjV0VQ7ANmYAH//CqcdsoCvYmYtzvkJsRFxTKKCgN7NxL+VZjBZ4SBF2gHw3dZJA3hGrNyrKAN6CgU7VD8d/cD/AGtMLJLvlJXsRWeuz3pkV00FAfT0dvQ/LRrOfnsU4bW6VD+8GzlbUmkNczZi3p3xFsEikaYLn7IYCIdYx40wBONuJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTfO0+3ZBuytsGsnfkT6eCWBHqqsUxLcKIQoNtUlS3A=;
 b=LcZKFUiB3nqrh4DvEE/howlbOb4CFTgBOWg/KhlmY2M+5rtnMFUUTkl4XrfBmBMtJa4z6nkTGw93PszznJDF9fPgIeHu8dLn+grjLUggLQc1c4PgTTBZSUCYHmnpH95oQar3mJHICj2od/UQIgu2FHyH1+AhVXjlNH+YB1qVqWYRWkz/SOTtapDYfmsg/zqG9NE1aufhlfs/bH+v2vwdIUUjHYEs/FllthEpt+S6SG4dkMUiGqaMkL8DjOKBMCOBJrol/EKwVAIjvZBDDAMS0q2nhzyCO3gHv4zIqcvh2w3a0M+M580IKw3ar9EJzcXDxqioFEfKDcJ6HIHsXKruJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTfO0+3ZBuytsGsnfkT6eCWBHqqsUxLcKIQoNtUlS3A=;
 b=gNmZzl0oXxRT3UXa/0853wpaKywoPUzH3oZckgstnHHCmz5rd/uLAD1C+hQWtoRUfd9OdJL/7mPkFTxYAqOPsAxS5rK1d0aEald4xiqiKf14d1ssvER8LMeyAcG/5ueDEwLXG1VTfRPURb9T3RTNLOnUv3dsv8Obrow8t276/mo=
Received: from CH0PR03CA0062.namprd03.prod.outlook.com (2603:10b6:610:cc::7)
 by IA1PR10MB6781.namprd10.prod.outlook.com (2603:10b6:208:42b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 16:41:00 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:cc:cafe::4a) by CH0PR03CA0062.outlook.office365.com
 (2603:10b6:610:cc::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Mon, 1
 Jun 2026 16:41:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 16:40:59 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 11:40:57 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 11:40:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 1 Jun 2026 11:40:57 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 651GevvE1988947;
	Mon, 1 Jun 2026 11:40:57 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wU5hB-00000009rb7-09kY;
	Mon, 01 Jun 2026 11:40:57 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH 2/2] poky-wrynose: Add poky-wrynose configs
Date: Mon, 1 Jun 2026 11:40:56 -0500
Message-ID: <20260601164056.2350853-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260601164056.2350853-1-reatmon@ti.com>
References: <20260601164056.2350853-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|IA1PR10MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: a363e8f7-de4e-4f9b-0ed2-08debffc8f67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|13003099007|22082099003|18002099003|6133799003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: 
	oqeSkPuXdmilaKkyOj8MSisumJToUcs/bGVL7PUVbAnVjunqmCRjvvCXsTr+jUo5mVQfkmzOg7ty9xCAO9WC7YIg0zAusFwZ6sNrNVrGyoUtU/e4QTiHpYfyxt6iuJ8l1pl32Skh4mvV1Pyvvz1WE6UOV28c9j68yVmon3uhfvO1MJi0+1DzOhUFTHWuiTGM/WW5XqbLAhqaW7/p/Me4dNkd3XhpjMpR4NyBWOE3KrgezR36MpMsf60s3T1Mvj11Sp4VXG6wo9bfFlT7Jb+yEvvB12ekeN7Ov5gsyJz6H0vFe8VNEKtzZ7YmtIl9t8NihJHkHWbS71SC4bzAsuReebHGvmwPOKXbSDgoJUaFJIdBPpDkF3Uuyq7ACsvl5BEhRIcxmQ3TOiz8YsPkva7aClO21aGBIg38PUqafjxbkvzs+Ax32NoW+pZSarZHPbnr/iZnIpQO9kuHn/xVbFqRWFWqxJefjuBK7nGjIuWdFXFknXukDjVANOTDqjD5Qzm7Wu4wNRhr39tpQ16kozXdHrcm2fK6a+kQ0vYTRkPno94m8aStb0ES1bW2KV3B05c7hAiZlTRXl3hMpbfd63NLjX0jBqXV617TFIXXVjfQsddun1lb5CQ4rMHQYKXzPyCsWmaZX2su2hIgSPAuhUkye3Hza0uKZScvaJmTIGGQZ+vyT7Sa4rDoOnSiwAzfKpQg
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(13003099007)(22082099003)(18002099003)(6133799003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	w2Jyxhulgw0i2csuGcZouZ4efWPDuxlxqeb/CXNfz+zF4FFyj/VgSFYkE0/PcyPM32disSutiUxo8HQBpUkdu3TfUjm1wkr7/XwZ4yFYTpRyCXJ0huZaAoxDbMGd3KuEJ7ht7R6h4hX3RYqsIv/HaEJBl8wFPANg7Sa1w8IRGzyXYGfXeLmxInGpIkAtKiiV0tWQ/ZisoHP2ZwXix849MEw/ueNgH8g00bDj0ilLUttStFZMbTcC1k3YJfmLqL1M9uijm1qhzC4h61FM1dAi9jVa5VQoSBzfDaS6b0cjuINWmOQvImYxnvil3UiApVJogsd0C6sowISb7IFCttv+vuS7Usf1tGV2L2goI9V646iAn4Y2ea/eG62YYRklSqLGwDxfP8rYrwDd178wleCLvswwkXvJvJ/zw8tOVLhh5V0jtbszTCLZt79rlMM7jsV3
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 16:40:59.0717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a363e8f7-de4e-4f9b-0ed2-08debffc8f67
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6781
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 Jun 2026 16:41:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17542

Add the various poky-wrynose configs to support building poky with
meta-ti.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...onfig.conf.json =3D> poky-wrynose-config.conf.json} | 10 +++++-----
 ...g.conf.json =3D> poky-wrynose-wip-config.conf.json} | 10 +++++-----
 configs/poky-wrynose-config.txt                      | 12 ++++++++++++
 configs/poky-wrynose-wip-config.txt                  | 12 ++++++++++++
 ...oky-master-config.yml =3D> poky-wrynose-config.yml} | 10 +++++-----
 ...master-config.yml =3D> poky-wrynose-wip-config.yml} | 10 +++++-----
 ...oky-master-config.xml =3D> poky-wrynose-config.xml} | 10 +++++-----
 ...er-wip-config.xml =3D> poky-wrynose-wip-config.xml} | 10 +++++-----
 8 files changed, 54 insertions(+), 30 deletions(-)
 copy bitbake-setup/{poky-master-config.conf.json =3D> poky-wrynose-config.=
conf.json} (96%)
 copy bitbake-setup/{poky-master-wip-config.conf.json =3D> poky-wrynose-wip=
-config.conf.json} (95%)
 create mode 100644 configs/poky-wrynose-config.txt
 create mode 100644 configs/poky-wrynose-wip-config.txt
 copy kas/{poky-master-config.yml =3D> poky-wrynose-config.yml} (89%)
 copy kas/{poky-master-config.yml =3D> poky-wrynose-wip-config.yml} (88%)
 copy src/configs/{poky-master-config.xml =3D> poky-wrynose-config.xml} (88=
%)
 copy src/configs/{poky-master-wip-config.xml =3D> poky-wrynose-wip-config.=
xml} (88%)

diff --git a/bitbake-setup/poky-master-config.conf.json b/bitbake-setup/pok=
y-wrynose-config.conf.json
similarity index 96%
copy from bitbake-setup/poky-master-config.conf.json
copy to bitbake-setup/poky-wrynose-config.conf.json
index 4726117..80c5557 100644
--- a/bitbake-setup/poky-master-config.conf.json
+++ b/bitbake-setup/poky-wrynose-config.conf.json
@@ -20,7 +20,7 @@
             "uri": "https://git.openembedded.org/bitbake"
           }
         },
-        "rev": "master"
+        "rev": "2.18"
       },
       "path": "bitbake"
     },
@@ -31,7 +31,7 @@
             "uri": "https://git.yoctoproject.org/meta-yocto"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-yocto"
     },
@@ -42,7 +42,7 @@
             "uri": "https://git.yoctoproject.org/meta-ti"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-ti"
     },
@@ -53,7 +53,7 @@
             "uri": "https://git.yoctoproject.org/meta-arm"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-arm"
     },
@@ -64,7 +64,7 @@
             "uri": "https://git.openembedded.org/openembedded-core"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "oe-core"
     }
diff --git a/bitbake-setup/poky-master-wip-config.conf.json b/bitbake-setup=
/poky-wrynose-wip-config.conf.json
similarity index 95%
copy from bitbake-setup/poky-master-wip-config.conf.json
copy to bitbake-setup/poky-wrynose-wip-config.conf.json
index b949b3f..6906490 100644
--- a/bitbake-setup/poky-master-wip-config.conf.json
+++ b/bitbake-setup/poky-wrynose-wip-config.conf.json
@@ -20,7 +20,7 @@
             "uri": "https://git.openembedded.org/bitbake"
           }
         },
-        "rev": "master"
+        "rev": "2.18"
       },
       "path": "bitbake"
     },
@@ -31,7 +31,7 @@
             "uri": "https://git.yoctoproject.org/meta-yocto"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-yocto"
     },
@@ -42,7 +42,7 @@
             "uri": "https://git.yoctoproject.org/meta-ti"
           }
         },
-        "rev": "master-wip"
+        "rev": "wrynose-wip"
       },
       "path": "meta-ti"
     },
@@ -53,7 +53,7 @@
             "uri": "https://git.yoctoproject.org/meta-arm"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-arm"
     },
@@ -64,7 +64,7 @@
             "uri": "https://git.openembedded.org/openembedded-core"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "oe-core"
     }
diff --git a/configs/poky-wrynose-config.txt b/configs/poky-wrynose-config.=
txt
new file mode 100644
index 0000000..50d7a79
--- /dev/null
+++ b/configs/poky-wrynose-config.txt
@@ -0,0 +1,12 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
+
+bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
+meta-yocto,https://git.yoctoproject.org/meta-yocto,wrynose,HEAD,layers=3Dm=
eta-poky:meta-yocto-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,wrynose,HEAD,layers=3Dmeta-ti=
-test:meta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,HEAD,layers=3Dmeta-=
arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,wrynose,HEAD,layers=
=3Dmeta
+
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-poky-v3.conf.sample
+BITBAKE_INCLUSIVE_VARS=3Dyes
diff --git a/configs/poky-wrynose-wip-config.txt b/configs/poky-wrynose-wip=
-config.txt
new file mode 100644
index 0000000..c541fb2
--- /dev/null
+++ b/configs/poky-wrynose-wip-config.txt
@@ -0,0 +1,12 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
+
+bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
+meta-yocto,https://git.yoctoproject.org/meta-yocto,wrynose,HEAD,layers=3Dm=
eta-poky:meta-yocto-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,wrynose-wip,HEAD,layers=3Dmet=
a-ti-test:meta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,HEAD,layers=3Dmeta-=
arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,wrynose,HEAD,layers=
=3Dmeta
+
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-poky-v3.conf.sample
+BITBAKE_INCLUSIVE_VARS=3Dyes
diff --git a/kas/poky-master-config.yml b/kas/poky-wrynose-config.yml
similarity index 89%
copy from kas/poky-master-config.yml
copy to kas/poky-wrynose-config.yml
index 1b8035c..34577f3 100644
--- a/kas/poky-master-config.yml
+++ b/kas/poky-wrynose-config.yml
@@ -10,14 +10,14 @@ target: core_image_minimal
 repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
-    branch: "master"
+    branch: "2.18"
     path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-yocto:
     url: "https://git.yoctoproject.org/meta-yocto"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-yocto"
     layers:
       meta-poky:
@@ -25,7 +25,7 @@ repos:
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-ti"
     layers:
       meta-ti-test:
@@ -35,7 +35,7 @@ repos:
=20
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-arm"
     layers:
       meta-arm:
@@ -43,7 +43,7 @@ repos:
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/poky-master-config.yml b/kas/poky-wrynose-wip-config.yml
similarity index 88%
copy from kas/poky-master-config.yml
copy to kas/poky-wrynose-wip-config.yml
index 1b8035c..e023e9f 100644
--- a/kas/poky-master-config.yml
+++ b/kas/poky-wrynose-wip-config.yml
@@ -10,14 +10,14 @@ target: core_image_minimal
 repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
-    branch: "master"
+    branch: "2.18"
     path: "sources/bitbake"
     layers:
       .: disabled
=20
   meta-yocto:
     url: "https://git.yoctoproject.org/meta-yocto"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-yocto"
     layers:
       meta-poky:
@@ -25,7 +25,7 @@ repos:
=20
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
-    branch: "master"
+    branch: "wrynose-wip"
     path: "sources/meta-ti"
     layers:
       meta-ti-test:
@@ -35,7 +35,7 @@ repos:
=20
   meta-arm:
     url: "https://git.yoctoproject.org/meta-arm"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/meta-arm"
     layers:
       meta-arm:
@@ -43,7 +43,7 @@ repos:
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
-    branch: "master"
+    branch: "wrynose"
     path: "sources/oe-core"
     layers:
       meta:
diff --git a/src/configs/poky-master-config.xml b/src/configs/poky-wrynose-=
config.xml
similarity index 88%
copy from src/configs/poky-master-config.xml
copy to src/configs/poky-wrynose-config.xml
index 8562f36..3a0a19f 100644
--- a/src/configs/poky-master-config.xml
+++ b/src/configs/poky-wrynose-config.xml
@@ -7,16 +7,16 @@
     <xi:include href=3D'../templates/bblayers.conf.xml' xmlns:xi=3D'http:/=
/www.w3.org/2001/XInclude'/>
     <xi:include href=3D'../templates/local-poky-v3.conf.xml' xmlns:xi=3D'h=
ttp://www.w3.org/2001/XInclude'/>
=20
-    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'master=
' commit=3D'HEAD'/>
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.18' =
commit=3D'HEAD'/>
=20
     <repos>
-        <repo name=3D'meta-yocto' url=3D'https://git.yoctoproject.org/meta=
-yocto' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-yocto' url=3D'https://git.yoctoproject.org/meta=
-yocto' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-poky</layer>
                 <layer>meta-yocto-bsp</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-ti-test</layer>
                 <layer>meta-ti-extras</layer>
@@ -24,13 +24,13 @@
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
diff --git a/src/configs/poky-master-wip-config.xml b/src/configs/poky-wryn=
ose-wip-config.xml
similarity index 88%
copy from src/configs/poky-master-wip-config.xml
copy to src/configs/poky-wrynose-wip-config.xml
index 9e4d6c0..4e2d9f1 100644
--- a/src/configs/poky-master-wip-config.xml
+++ b/src/configs/poky-wrynose-wip-config.xml
@@ -7,16 +7,16 @@
     <xi:include href=3D'../templates/bblayers.conf.xml' xmlns:xi=3D'http:/=
/www.w3.org/2001/XInclude'/>
     <xi:include href=3D'../templates/local-poky-v3.conf.xml' xmlns:xi=3D'h=
ttp://www.w3.org/2001/XInclude'/>
=20
-    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'master=
' commit=3D'HEAD'/>
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.18' =
commit=3D'HEAD'/>
=20
     <repos>
-        <repo name=3D'meta-yocto' url=3D'https://git.yoctoproject.org/meta=
-yocto' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-yocto' url=3D'https://git.yoctoproject.org/meta=
-yocto' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-poky</layer>
                 <layer>meta-yocto-bsp</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master-wip' commit=3D'HEAD'>
+        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'wrynose-wip' commit=3D'HEAD'>
             <layers>
                 <layer>meta-ti-test</layer>
                 <layer>meta-ti-extras</layer>
@@ -24,13 +24,13 @@
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


