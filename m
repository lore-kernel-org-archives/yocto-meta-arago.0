Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A133CD3439
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 13:44:12 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12240.1778161445738236316
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 07 May 2026 06:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=qSd3FCuI;
 spf=pass (domain: ti.com, ip: 40.93.196.46, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hb/yLYYdJySITw27fiNelt6ug4F+h3SIvr9aeEnDSoRSx338EfmL1/J1fUMlVLuRkoZXjXt0GmszvmDbLBHJ+rtdd8DfiV4JYsTxF4KJKsBNkeNj9qy6TxqBlWLHGh5jwAr9CiVvtOcvQu72lfYDPpfUv/58ALmL0vPyjAgeO7b4fqiymjoujd8avBswCwvae0vS6KF1agGuti0NmNaCp8mU5d8k3N+R7TXWU9N0nCFZu0WKQbvpBNKTtOaVCKFipRiFZMC2FfDS8NPzg0lpRm8OfFtRxQd3PKQqraJezo5HdZXmg2kbm2ImHcNwA6faELdOIgYKDr9KNq5GLwBZug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9tvz4JMGkPFcpLThygmfcG18yMOLDfA5T0VAHilu0k=;
 b=iovquEaFo7+B+Tyo1+ViVQheQDl2Lsc9cDq5/7iU2CG42AthhXWPnNdqw4mhSwHl246S0GBbVwcgwAGtBRhAoHbE/jSC6WpH9IhVSltxfyrhyfnWeD51fRh8gTnK3ui96DNHlCdh4CaU4uLZUfs29MFlc9uq/yjc6pYHuVJlb0mu0FfXYK2xZ3ZM82Ms4a6uIVT0cfR11g3wLtIqVeV6JReli0gZcG867vNmmLAYn37jMae1NUqnFovI520S9kOC2PKzKjhdulBFJ9qOr6xrBU0cHbNxhFrW4+nFiXMVMenBQuKKMVSturiqxuqskdvQXrgeXZfouM7E3ApdEhCRJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9tvz4JMGkPFcpLThygmfcG18yMOLDfA5T0VAHilu0k=;
 b=qSd3FCuIZLfHXPKOdGYrvaE6HXBTn1/5IHXJcu+lyq0RECVraoOndPZnWqF5v8vtNCJBWIs+K/GwUeWgjRXfkP2VyExRuBlyvII6mKR8o79nvR+38fYCOwzdcbpFYl16hq2z3yyme/GGZ4LPfzGT+SAyBU99ueDt0nbpFz/5IFw=
Received: from CH0PR04CA0097.namprd04.prod.outlook.com (2603:10b6:610:75::12)
 by CH0PR10MB5066.namprd10.prod.outlook.com (2603:10b6:610:c4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 13:44:01 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::ed) by CH0PR04CA0097.outlook.office365.com
 (2603:10b6:610:75::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Thu,
 7 May 2026 13:44:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 13:43:59 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 7 May
 2026 08:43:48 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 7 May
 2026 08:43:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 7 May 2026 08:43:48 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 647Dhm3i3746249;
	Thu, 7 May 2026 08:43:48 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wKz12-0000000D9jz-0KaQ;
	Thu, 07 May 2026 08:43:48 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] arago-wrynose-*: Fix bitbake version
Date: Thu, 7 May 2026 08:43:48 -0500
Message-ID: <20260507134348.3135699-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|CH0PR10MB5066:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ce802a-94d3-477c-e360-08deac3eb181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|13003099007|3023799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	J/MxqDG1Ep0c4HiGH1mE9xrI9dKG5SKqhOq+ME2onVKKbV7myf+V2eevaue+t2GASzQ/Ol/Ozlz0jDm5T3uf7zrqW/U+hqa/qq2/7DteY49rGR3M3y2zfyAO1N6R9UmKGvqJ7OfVJgZItEgVQeCP8tihpB6OFafU1LRvmK4TVfkKAQUETEZeHhs4cyFbU9LuqCIe8TZihuOCCGn9qZ4bSCydtp1gAJKmY9bOzD/bp7ISMLCnw65Z9POTwX+hQ2GEVnQyhMyAZZV8/pkBM8qOE/8sEaW/0bbGvRCv35PnQPHGxRduMsprSUelFNx7vbGR2pUGocfYAK3Pm1/qKeAzTzDtdaOukQ8lYhxORj3rot9Tc5D78AIRqFSXLq1pNZ9OqLGeFctRylbLEKuJCFp/4WBMAF461rDE8Sq90HvVNPjCscqUNRZlM8E05kg0LQNzRli3wROp+ApuJJPJpk0bDD0vogYyS8VJqw/to+uR0ahkm53dFl7PrVjLPlvCdmVTuLc4LaCvNowD4vcItiU6li+pHuUzzIKA3lzIRoOUWLXv/v5sRcazyB33gPFTGJ2tnPgCua2rpRXW3d9D0cn8fzqzpvfmWdH9gOP0kEsHHigEC5QKtSYGuP3tu3FdbRUJWUZiaMJiiUJIm40UZRj0EqWXCjs7uKODNeQL+atA4cYfVz3U2FLQzWY+WGtyMX0U
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(13003099007)(3023799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VbreuExQXCRJBPcv2gfA+HtItycxMYVAuT9I5AuewSVvtfknfl1bNIVBm6TboR7UkYxs+lp9IPNy9XBC91M1hI34pOnPjUx/IRRndi7K49HBP8YKzvTxF+suM9VSr+EjRYOPTKhHCnC0vDj6DRjKbstWJCyZRLGfxRtNB01DqOrFFPDXkVhzRYGEPqCfp6PEN7MS/rkyvCPEGLd4Tfa0SG9DW0E5AfD4jvpfE6Bid7vlNOGPckZw+pxlOwg46qc5Y1DAog5hRk0grk6Bl+4SPLAkbWAUijkMOQhajAmi15niK0IKaUR9ZaIecWj257+p47jecWzLPTXZ7tQCUGDIUuVVGUTgTp/53HUl7y6e/XImY7YKHzuaNQY8VCqoydbuA+dH+M+05v9kwdZZdSq6/cDM71VwTTnLsR6pT4o/L39/SI+fTH62WKkkCjfi2uvS
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 13:43:59.8302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ce802a-94d3-477c-e360-08deac3eb181
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5066
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 07 May 2026 13:44:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17516

I incorrectly search and replaced the bitbake branch to be wrynose.
Change it to 2.18 to match the wrynose branch.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 bitbake-setup/arago-wrynose-chromium-config.conf.json | 2 +-
 bitbake-setup/arago-wrynose-config.conf.json          | 2 +-
 bitbake-setup/arago-wrynose-flutter-config.conf.json  | 2 +-
 bitbake-setup/arago-wrynose-luks-config.conf.json     | 2 +-
 bitbake-setup/arago-wrynose-next-config.conf.json     | 2 +-
 bitbake-setup/arago-wrynose-selinux-config.conf.json  | 2 +-
 bitbake-setup/arago-wrynose-wip-config.conf.json      | 2 +-
 configs/arago-wrynose-chromium-config.txt             | 2 +-
 configs/arago-wrynose-config.txt                      | 2 +-
 configs/arago-wrynose-flutter-config.txt              | 2 +-
 configs/arago-wrynose-luks-config.txt                 | 2 +-
 configs/arago-wrynose-next-config.txt                 | 2 +-
 configs/arago-wrynose-selinux-config.txt              | 2 +-
 configs/arago-wrynose-wip-config.txt                  | 2 +-
 kas/arago-wrynose-chromium-config.yml                 | 2 +-
 kas/arago-wrynose-config.yml                          | 2 +-
 kas/arago-wrynose-flutter-config.yml                  | 2 +-
 kas/arago-wrynose-luks-config.yml                     | 2 +-
 kas/arago-wrynose-next-config.yml                     | 2 +-
 kas/arago-wrynose-selinux-config.yml                  | 2 +-
 kas/arago-wrynose-wip-config.yml                      | 2 +-
 src/configs/arago-wrynose-chromium-config.xml         | 2 +-
 src/configs/arago-wrynose-config.xml                  | 2 +-
 src/configs/arago-wrynose-flutter-config.xml          | 2 +-
 src/configs/arago-wrynose-luks-config.xml             | 2 +-
 src/configs/arago-wrynose-next-config.xml             | 2 +-
 src/configs/arago-wrynose-selinux-config.xml          | 2 +-
 src/configs/arago-wrynose-wip-config.xml              | 2 +-
 28 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/bitbake-setup/arago-wrynose-chromium-config.conf.json b/bitbak=
e-setup/arago-wrynose-chromium-config.conf.json
index 77c9ee4..1a70861 100644
--- a/bitbake-setup/arago-wrynose-chromium-config.conf.json
+++ b/bitbake-setup/arago-wrynose-chromium-config.conf.json
@@ -20,7 +20,7 @@
             "uri": "https://git.openembedded.org/bitbake"
           }
         },
-        "rev": "wrynose"
+        "rev": "2.18"
       },
       "path": "bitbake"
     },
diff --git a/bitbake-setup/arago-wrynose-config.conf.json b/bitbake-setup/a=
rago-wrynose-config.conf.json
index bac8975..1f371fe 100644
--- a/bitbake-setup/arago-wrynose-config.conf.json
+++ b/bitbake-setup/arago-wrynose-config.conf.json
@@ -20,7 +20,7 @@
             "uri": "https://git.openembedded.org/bitbake"
           }
         },
-        "rev": "wrynose"
+        "rev": "2.18"
       },
       "path": "bitbake"
     },
diff --git a/bitbake-setup/arago-wrynose-flutter-config.conf.json b/bitbake=
-setup/arago-wrynose-flutter-config.conf.json
index 74970bd..529225b 100644
--- a/bitbake-setup/arago-wrynose-flutter-config.conf.json
+++ b/bitbake-setup/arago-wrynose-flutter-config.conf.json
@@ -20,7 +20,7 @@
             "uri": "https://git.openembedded.org/bitbake"
           }
         },
-        "rev": "wrynose"
+        "rev": "2.18"
       },
       "path": "bitbake"
     },
diff --git a/bitbake-setup/arago-wrynose-luks-config.conf.json b/bitbake-se=
tup/arago-wrynose-luks-config.conf.json
index ccaa54b..77a814a 100644
--- a/bitbake-setup/arago-wrynose-luks-config.conf.json
+++ b/bitbake-setup/arago-wrynose-luks-config.conf.json
@@ -20,7 +20,7 @@
             "uri": "https://git.openembedded.org/bitbake"
           }
         },
-        "rev": "wrynose"
+        "rev": "2.18"
       },
       "path": "bitbake"
     },
diff --git a/bitbake-setup/arago-wrynose-next-config.conf.json b/bitbake-se=
tup/arago-wrynose-next-config.conf.json
index 9289f54..7ead35f 100644
--- a/bitbake-setup/arago-wrynose-next-config.conf.json
+++ b/bitbake-setup/arago-wrynose-next-config.conf.json
@@ -20,7 +20,7 @@
             "uri": "https://git.openembedded.org/bitbake"
           }
         },
-        "rev": "wrynose"
+        "rev": "2.18"
       },
       "path": "bitbake"
     },
diff --git a/bitbake-setup/arago-wrynose-selinux-config.conf.json b/bitbake=
-setup/arago-wrynose-selinux-config.conf.json
index 43fd5f8..cb36a62 100644
--- a/bitbake-setup/arago-wrynose-selinux-config.conf.json
+++ b/bitbake-setup/arago-wrynose-selinux-config.conf.json
@@ -20,7 +20,7 @@
             "uri": "https://git.openembedded.org/bitbake"
           }
         },
-        "rev": "wrynose"
+        "rev": "2.18"
       },
       "path": "bitbake"
     },
diff --git a/bitbake-setup/arago-wrynose-wip-config.conf.json b/bitbake-set=
up/arago-wrynose-wip-config.conf.json
index e15ea1b..3ad20b9 100644
--- a/bitbake-setup/arago-wrynose-wip-config.conf.json
+++ b/bitbake-setup/arago-wrynose-wip-config.conf.json
@@ -20,7 +20,7 @@
             "uri": "https://git.openembedded.org/bitbake"
           }
         },
-        "rev": "wrynose"
+        "rev": "2.18"
       },
       "path": "bitbake"
     },
diff --git a/configs/arago-wrynose-chromium-config.txt b/configs/arago-wryn=
ose-chromium-config.txt
index c12ea4a..696baf0 100644
--- a/configs/arago-wrynose-chromium-config.txt
+++ b/configs/arago-wrynose-chromium-config.txt
@@ -1,7 +1,7 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
=20
-bitbake,https://git.openembedded.org/bitbake,wrynose,HEAD
+bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=3Dm=
eta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51f=
d261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
diff --git a/configs/arago-wrynose-config.txt b/configs/arago-wrynose-confi=
g.txt
index 00d5093..ab77e34 100644
--- a/configs/arago-wrynose-config.txt
+++ b/configs/arago-wrynose-config.txt
@@ -1,7 +1,7 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
=20
-bitbake,https://git.openembedded.org/bitbake,wrynose,HEAD
+bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=3Dm=
eta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
diff --git a/configs/arago-wrynose-flutter-config.txt b/configs/arago-wryno=
se-flutter-config.txt
index 77ac4db..c60c672 100644
--- a/configs/arago-wrynose-flutter-config.txt
+++ b/configs/arago-wrynose-flutter-config.txt
@@ -1,7 +1,7 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
=20
-bitbake,https://git.openembedded.org/bitbake,wrynose,HEAD
+bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=3Dm=
eta-arago-distro:meta-arago-extras
 meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD,=
layers=3D.:meta-flutter-apps
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layer=
s=3D
diff --git a/configs/arago-wrynose-luks-config.txt b/configs/arago-wrynose-=
luks-config.txt
index 7494844..6fa45e4 100644
--- a/configs/arago-wrynose-luks-config.txt
+++ b/configs/arago-wrynose-luks-config.txt
@@ -1,7 +1,7 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
=20
-bitbake,https://git.openembedded.org/bitbake,wrynose,HEAD
+bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=3Dm=
eta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
diff --git a/configs/arago-wrynose-next-config.txt b/configs/arago-wrynose-=
next-config.txt
index 6b411d8..c9714fd 100644
--- a/configs/arago-wrynose-next-config.txt
+++ b/configs/arago-wrynose-next-config.txt
@@ -9,7 +9,7 @@ MOTD: NOTE: repos.  These recipes will not build correctly =
without also a change
 MOTD: NOTE: to point the recipe to the appropriate cicd/next branch for th=
at recipe.
 MOTD: NOTE:
=20
-bitbake,https://git.openembedded.org/bitbake,wrynose,HEAD
+bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose-next,HEAD,layer=
s=3Dmeta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
diff --git a/configs/arago-wrynose-selinux-config.txt b/configs/arago-wryno=
se-selinux-config.txt
index 5132168..b20c1ea 100644
--- a/configs/arago-wrynose-selinux-config.txt
+++ b/configs/arago-wrynose-selinux-config.txt
@@ -1,7 +1,7 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
=20
-bitbake,https://git.openembedded.org/bitbake,wrynose,HEAD
+bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=3Dm=
eta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
diff --git a/configs/arago-wrynose-wip-config.txt b/configs/arago-wrynose-w=
ip-config.txt
index 738f43f..de24279 100644
--- a/configs/arago-wrynose-wip-config.txt
+++ b/configs/arago-wrynose-wip-config.txt
@@ -1,7 +1,7 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
=20
-bitbake,https://git.openembedded.org/bitbake,wrynose,HEAD
+bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose-wip,HEAD,layers=
=3Dmeta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
diff --git a/kas/arago-wrynose-chromium-config.yml b/kas/arago-wrynose-chro=
mium-config.yml
index c15c9a4..3a395ce 100644
--- a/kas/arago-wrynose-chromium-config.yml
+++ b/kas/arago-wrynose-chromium-config.yml
@@ -10,7 +10,7 @@ target: tisdk-default-image
 repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
-    branch: "wrynose"
+    branch: "2.18"
     path: "sources/bitbake"
     layers:
       .: disabled
diff --git a/kas/arago-wrynose-config.yml b/kas/arago-wrynose-config.yml
index c593185..66d986a 100644
--- a/kas/arago-wrynose-config.yml
+++ b/kas/arago-wrynose-config.yml
@@ -10,7 +10,7 @@ target: tisdk-default-image
 repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
-    branch: "wrynose"
+    branch: "2.18"
     path: "sources/bitbake"
     layers:
       .: disabled
diff --git a/kas/arago-wrynose-flutter-config.yml b/kas/arago-wrynose-flutt=
er-config.yml
index bfc9f22..6b93a77 100644
--- a/kas/arago-wrynose-flutter-config.yml
+++ b/kas/arago-wrynose-flutter-config.yml
@@ -10,7 +10,7 @@ target: tisdk-default-image
 repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
-    branch: "wrynose"
+    branch: "2.18"
     path: "sources/bitbake"
     layers:
       .: disabled
diff --git a/kas/arago-wrynose-luks-config.yml b/kas/arago-wrynose-luks-con=
fig.yml
index 71b4476..6ac3463 100644
--- a/kas/arago-wrynose-luks-config.yml
+++ b/kas/arago-wrynose-luks-config.yml
@@ -10,7 +10,7 @@ target: tisdk-default-image
 repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
-    branch: "wrynose"
+    branch: "2.18"
     path: "sources/bitbake"
     layers:
       .: disabled
diff --git a/kas/arago-wrynose-next-config.yml b/kas/arago-wrynose-next-con=
fig.yml
index fd4e936..6513be1 100644
--- a/kas/arago-wrynose-next-config.yml
+++ b/kas/arago-wrynose-next-config.yml
@@ -10,7 +10,7 @@ target: tisdk-default-image
 repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
-    branch: "wrynose"
+    branch: "2.18"
     path: "sources/bitbake"
     layers:
       .: disabled
diff --git a/kas/arago-wrynose-selinux-config.yml b/kas/arago-wrynose-selin=
ux-config.yml
index 8e3e0a0..c9e2756 100644
--- a/kas/arago-wrynose-selinux-config.yml
+++ b/kas/arago-wrynose-selinux-config.yml
@@ -10,7 +10,7 @@ target: tisdk-default-image
 repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
-    branch: "wrynose"
+    branch: "2.18"
     path: "sources/bitbake"
     layers:
       .: disabled
diff --git a/kas/arago-wrynose-wip-config.yml b/kas/arago-wrynose-wip-confi=
g.yml
index 3494533..f736ad1 100644
--- a/kas/arago-wrynose-wip-config.yml
+++ b/kas/arago-wrynose-wip-config.yml
@@ -10,7 +10,7 @@ target: tisdk-default-image
 repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
-    branch: "wrynose"
+    branch: "2.18"
     path: "sources/bitbake"
     layers:
       .: disabled
diff --git a/src/configs/arago-wrynose-chromium-config.xml b/src/configs/ar=
ago-wrynose-chromium-config.xml
index 4a5620e..ef13904 100644
--- a/src/configs/arago-wrynose-chromium-config.xml
+++ b/src/configs/arago-wrynose-chromium-config.xml
@@ -7,7 +7,7 @@
     <xi:include href=3D'../templates/bblayers.conf.xml' xmlns:xi=3D'http:/=
/www.w3.org/2001/XInclude'/>
     <xi:include href=3D'../templates/local-arago64-v3.conf.xml' xmlns:xi=
=3D'http://www.w3.org/2001/XInclude'/>
=20
-    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'wrynos=
e' commit=3D'HEAD'/>
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.18' =
commit=3D'HEAD'/>
=20
     <repos>
         <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'wrynose' commit=3D'HEAD'>
diff --git a/src/configs/arago-wrynose-config.xml b/src/configs/arago-wryno=
se-config.xml
index 89f81cc..b924056 100644
--- a/src/configs/arago-wrynose-config.xml
+++ b/src/configs/arago-wrynose-config.xml
@@ -7,7 +7,7 @@
     <xi:include href=3D'../templates/bblayers.conf.xml' xmlns:xi=3D'http:/=
/www.w3.org/2001/XInclude'/>
     <xi:include href=3D'../templates/local-arago64-v3.conf.xml' xmlns:xi=
=3D'http://www.w3.org/2001/XInclude'/>
=20
-    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'wrynos=
e' commit=3D'HEAD'/>
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.18' =
commit=3D'HEAD'/>
=20
     <repos>
         <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'wrynose' commit=3D'HEAD'>
diff --git a/src/configs/arago-wrynose-flutter-config.xml b/src/configs/ara=
go-wrynose-flutter-config.xml
index ccb92e3..5b4245a 100644
--- a/src/configs/arago-wrynose-flutter-config.xml
+++ b/src/configs/arago-wrynose-flutter-config.xml
@@ -7,7 +7,7 @@
     <xi:include href=3D'../templates/bblayers.conf.xml' xmlns:xi=3D'http:/=
/www.w3.org/2001/XInclude'/>
     <xi:include href=3D'../templates/local-arago64-v3.conf.xml' xmlns:xi=
=3D'http://www.w3.org/2001/XInclude'/>
=20
-    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'wrynos=
e' commit=3D'HEAD'/>
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.18' =
commit=3D'HEAD'/>
=20
     <repos>
         <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'wrynose' commit=3D'HEAD'>
diff --git a/src/configs/arago-wrynose-luks-config.xml b/src/configs/arago-=
wrynose-luks-config.xml
index e4a49c6..ed23b42 100644
--- a/src/configs/arago-wrynose-luks-config.xml
+++ b/src/configs/arago-wrynose-luks-config.xml
@@ -7,7 +7,7 @@
     <xi:include href=3D'../templates/bblayers.conf.xml' xmlns:xi=3D'http:/=
/www.w3.org/2001/XInclude'/>
     <xi:include href=3D'../templates/local-arago64-v3.conf.xml' xmlns:xi=
=3D'http://www.w3.org/2001/XInclude'/>
=20
-    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'wrynos=
e' commit=3D'HEAD'/>
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.18' =
commit=3D'HEAD'/>
=20
     <repos>
         <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'wrynose' commit=3D'HEAD'>
diff --git a/src/configs/arago-wrynose-next-config.xml b/src/configs/arago-=
wrynose-next-config.xml
index bd87045..d816f1b 100644
--- a/src/configs/arago-wrynose-next-config.xml
+++ b/src/configs/arago-wrynose-next-config.xml
@@ -8,7 +8,7 @@
     <xi:include href=3D'../templates/bblayers.conf.xml' xmlns:xi=3D'http:/=
/www.w3.org/2001/XInclude'/>
     <xi:include href=3D'../templates/local-arago64-v3.conf.xml' xmlns:xi=
=3D'http://www.w3.org/2001/XInclude'/>
=20
-    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'wrynos=
e' commit=3D'HEAD'/>
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.18' =
commit=3D'HEAD'/>
=20
     <repos>
         <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'wrynose-next' commit=3D'HEAD'>
diff --git a/src/configs/arago-wrynose-selinux-config.xml b/src/configs/ara=
go-wrynose-selinux-config.xml
index de6ad79..032803a 100644
--- a/src/configs/arago-wrynose-selinux-config.xml
+++ b/src/configs/arago-wrynose-selinux-config.xml
@@ -7,7 +7,7 @@
     <xi:include href=3D'../templates/bblayers.conf.xml' xmlns:xi=3D'http:/=
/www.w3.org/2001/XInclude'/>
     <xi:include href=3D'../templates/local-arago64-v3.conf.xml' xmlns:xi=
=3D'http://www.w3.org/2001/XInclude'/>
=20
-    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'wrynos=
e' commit=3D'HEAD'/>
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.18' =
commit=3D'HEAD'/>
=20
     <repos>
         <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'wrynose' commit=3D'HEAD'>
diff --git a/src/configs/arago-wrynose-wip-config.xml b/src/configs/arago-w=
rynose-wip-config.xml
index 4f25ae9..9feec4a 100644
--- a/src/configs/arago-wrynose-wip-config.xml
+++ b/src/configs/arago-wrynose-wip-config.xml
@@ -7,7 +7,7 @@
     <xi:include href=3D'../templates/bblayers.conf.xml' xmlns:xi=3D'http:/=
/www.w3.org/2001/XInclude'/>
     <xi:include href=3D'../templates/local-arago64-v3.conf.xml' xmlns:xi=
=3D'http://www.w3.org/2001/XInclude'/>
=20
-    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'wrynos=
e' commit=3D'HEAD'/>
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.18' =
commit=3D'HEAD'/>
=20
     <repos>
         <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'wrynose-wip' commit=3D'HEAD'>
--=20
2.43.0


