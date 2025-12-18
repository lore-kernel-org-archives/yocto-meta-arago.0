Return-Path: <s-sinha@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78DB8D68BEA
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 07:43:22 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36715.1766043797117422188
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 17 Dec 2025 23:43:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Cc928/hz;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.54, mailfrom: s-sinha@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yHegzyKi2CROolfQTx57pONZs+nnhEA46Nsh5mkYklwUW2pdtRQWvNmSy9Ny2JSqulwqN02AMKyTY+MIyq7/raRUyfimh4W4h/NXkrch+ZAD6vWVF1qqhZr3LuIbtOcnZqndozlzki/u7Zg8Bxi6amDsrgs2JagaskAeZ4QBflegDtdiwpedN7Q0dN7cEoHCH69Xl5diETYaTZHTQqAchV6K2x4GBoorHTWAKqHk4wGYyEepLM5QNFBQlmQD6ezUiWGhCVYnGF5Jc4iXxlulYyD0RPhFaDD+Sb191RyhDGUTVQ7e/cA4jDMRS+LFTor5D8dLFaeSwC556FL/wrfNlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qx6JeJn3IJgp0k3lVoZiy0UQyVZVky2pDKfThMrLa2c=;
 b=VZqMwLryEbZPHiUABCHfiALK/q20qcuPiLXilm12FhGnoM8tn+yr1iUTuW6DCbH6lYJznA8dMmNVjz4vUO1QpnAQlSzQgAUHVigMlb+z2V4Q+P88oY9f3v3GXvqwZIEt9FOGHPQY15EvoCF4xGnugLi6NLZ9nYMSa3KI9g59c0D4tBC9ptpLG+yRWmH6owwXnP72p0WTGEg4IAXq9EMUV176VUIKQ3ZNB3KQ8tmb59czXxTWSjmfMUDMveU7q7vBea9x2ZkVyEHVDx7C/SH1Nfwn9uInxJbUTifGa4phkfkXlvF5M1PohqAwImC7oONDZOK/M/t/mO/bG0o1CVGtHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qx6JeJn3IJgp0k3lVoZiy0UQyVZVky2pDKfThMrLa2c=;
 b=Cc928/hzOeJQ4NFGt07wTRZnefClADLVyQGlJBQAZiTSt9Pw8KZ4+L3AF+rRCXKwCL3+7z9WaRrPATjL0BC1b+gDpFwk9GBCAEsTkA6JPf2mJ6w7SEF1Gi0YF9VuXZ/HugzXtQWrG4fV1KKtOmzvvMUBSWElXLzZH+KGqeQ2uPo=
Received: from BYAPR04CA0014.namprd04.prod.outlook.com (2603:10b6:a03:40::27)
 by LV0PR10MB997567.namprd10.prod.outlook.com (2603:10b6:408:33b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 07:43:15 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:40:cafe::91) by BYAPR04CA0014.outlook.office365.com
 (2603:10b6:a03:40::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 07:43:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 07:43:12 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 01:43:11 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 01:43:11 -0600
Received: from DFLE207.ent.ti.com ([fe80::2923:5ab1:7f94:e68a]) by
 DFLE207.ent.ti.com ([fe80::2923:5ab1:7f94:e68a%12]) with mapi id
 15.02.2562.020; Thu, 18 Dec 2025 01:43:11 -0600
From: "Sinha, Shreyash" <s-sinha@ti.com>
To: "meta-arago@lists.yoctoproject.org" <meta-arago@lists.yoctoproject.org>,
	"Kapoor, Saurabh" <s-kapoor@ti.com>
CC: "Eatmon, Ryan" <reatmon@ti.com>
Subject: Re: [meta-arago][oe-layersetup][PATCH] configs:
 processor-sdk-analytics: Add 11.2 release config
Thread-Topic: [meta-arago][oe-layersetup][PATCH] configs:
 processor-sdk-analytics: Add 11.2 release config
Thread-Index: AQHcb/HPGIOdYWI0GUmD4dlKQjFWYLUnA/LY
Date: Thu, 18 Dec 2025 07:43:10 +0000
Message-ID: <6d36de59f4284001ab75830710ffb75e@ti.com>
References: <20251218074203.585640-1-s-sinha@ti.com>
In-Reply-To: <20251218074203.585640-1-s-sinha@ti.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-Mentions: s-kapoor@ti.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.235.192]
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: multipart/alternative;
	boundary="_000_6d36de59f4284001ab75830710ffb75eticom_"
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|LV0PR10MB997567:EE_
X-MS-Office365-Filtering-Correlation-Id: 53a906ec-4c82-448b-fc88-08de3e09192d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|8096899003|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?xTRlFpt2qRsun3eU4GxtJFp5TCFr7F6ERCxx/mK9dD07fnq8jTHQXxFKGX?=
 =?iso-8859-1?Q?nsj5FLAF4+43dM0c0kAH064U6XO+maEKe4M085D2Z/sYlCpE6D+Kogh6nj?=
 =?iso-8859-1?Q?/I6slCEjKjDa/65et6SFg0ORuAWCwEA8kqUfFg817TqZFWKRcKoViSe+3+?=
 =?iso-8859-1?Q?CaGkotmhWvHrBA/v+3QDs/Nj5JoGJXeE/ayl2ORLpC/mqlfoEoxxsztPGJ?=
 =?iso-8859-1?Q?RppqZp1Dl63rHZLJuwhwLw6Odk1uruCtNkNAz7XBvxuB0lwAUUpAuSmC1V?=
 =?iso-8859-1?Q?xA0XdZH0f1RfcUaVI8XB0INKZccHQDhwiw0YeHu3Y5UhG03zh7/uFyG+lV?=
 =?iso-8859-1?Q?HGXkYGL+82uyolvvxrSDyJ51u/t2bpWZva2UkLoFIlSBhFsqLQF1SAfBqW?=
 =?iso-8859-1?Q?ONzEhbGA/Ct8dIRcFMNFG2YdHLdbDWhEqeIhFzuwXYIkobTdPA9NKRVx+y?=
 =?iso-8859-1?Q?JuwAGq83uRhRzo6lV9l5r79+IqgNmtvzIWGE5trMSGxFNcF9eyJr9FXaAO?=
 =?iso-8859-1?Q?og1pRoOHLL8AYrfaZnlFw7GHHJaNhzs4NUZ1FyqBYU/4aIDdHUAXN6lBQi?=
 =?iso-8859-1?Q?fw9oBPtl7FnWBj48rUiXierUxSH3TUdokIpWHXxti7SIwVY/1/9G3yWCeP?=
 =?iso-8859-1?Q?i1+95cx/88RJmUd4H2m09DMUXmOcpjyUEkqd8mQzAgEkKNuZdR6dHyklbE?=
 =?iso-8859-1?Q?72YSBQTpELCTBB19hVl4KjODcWgLrMBFdqdNEfUAPjPHpc0lZCb5L8u9VG?=
 =?iso-8859-1?Q?g1hSQmmB2g/bsP/I0R39jsrrRFFdBZ5ICL90ioGXMwRJyzy2k7XvFNQiKR?=
 =?iso-8859-1?Q?K15uWzRQbxjxEWG812Ymc4nI25JjlQs0rc5X3Hf6Fp06rRlC1L/R1WuvGY?=
 =?iso-8859-1?Q?dc+0QJTvtwxHANjON4GSeb1HwGQNpyh9gAJEkT0QjJ/Zxp8IbhH5gF0LkU?=
 =?iso-8859-1?Q?IJXj8QXu7YToB/K7gNsQlmNn2zjU3DGQiwVUw0CB5QE0UcEV3lU6VuU1SX?=
 =?iso-8859-1?Q?CXShZm+EXI3MKoKvoPtA3/WCgfi9gTu1Wwk2HfRZLECb9WufRIk5lxkWSw?=
 =?iso-8859-1?Q?bisDQQPYqTsb9PCLh5KcuKuSgWmwpqlgZifiWnyR6hack4LXDmMOTcrlra?=
 =?iso-8859-1?Q?0zgvC48rJ9yAaeGzl7YkgV/4WUHbEoioGyhyu9DBN+ccdIqN2jieeaikww?=
 =?iso-8859-1?Q?FayrhEPLnQWzIH0mq7+pHliUFFSZTa5y739pNdYlJGV+19srF3adYUcfCG?=
 =?iso-8859-1?Q?0dHjfsxbzddt3CSapVXFD9Mp7hCdw2GSW4oPU2BM87ElIxpMwA2nkQWYFf?=
 =?iso-8859-1?Q?8pe69b1bgMKT5VRc2f8PCHGt7DmA1oPMpBbeqbiFmYvTu9EIDWL2lXj0lf?=
 =?iso-8859-1?Q?j/UfstA0s8YNUp8eNZKbtssR2Tu7q3Hsx2Lw28M8Bf98Rk6IuiU47Ak67e?=
 =?iso-8859-1?Q?sWSGF2+GKP0rBwtJv7DhNNH3fxrhcL4cunrgtYk5AoqAzdI825toY3RFzo?=
 =?iso-8859-1?Q?qXNKYYlKvVuySc3bK8nVHlZpQU8DhU9qG1u5xEPmOs0T2qsrRgK/dZyTFG?=
 =?iso-8859-1?Q?z9DUXTU43vhAB5ZvoHgMt1TrvkVm?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(8096899003)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 07:43:12.9970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a906ec-4c82-448b-fc88-08de3e09192d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997567
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 18 Dec 2025 07:43:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16893

--_000_6d36de59f4284001ab75830710ffb75eticom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

+ @Kapoor, Saurabh<mailto:s-kapoor@ti.com>

________________________________
From: Sinha, Shreyash
Sent: 18 December 2025 13:12:03
To: meta-arago@lists.yoctoproject.org
Cc: Eatmon, Ryan; Sinha, Shreyash
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-analytic=
s: Add 11.2 release config

Signed-off-by: Shreyash Sinha <s-sinha@ti.com>
---
 ...or-sdk-analytics-11.02.00-config.conf.json | 169 ++++++++++++++++++
 ...rocessor-sdk-analytics-11.02.00-config.txt |  22 +++
 ...rocessor-sdk-analytics-11.02.00-config.yml |  93 ++++++++++
 ...rocessor-sdk-analytics-11.02.00-config.xml |  89 +++++++++
 4 files changed, 373 insertions(+)
 create mode 100644 bitbake-setup/processor-sdk-analytics/processor-sdk-ana=
lytics-11.02.00-config.conf.json
 create mode 100644 configs/processor-sdk-analytics/processor-sdk-analytics=
-11.02.00-config.txt
 create mode 100644 kas/processor-sdk-analytics/processor-sdk-analytics-11.=
02.00-config.yml
 create mode 100644 src/configs/processor-sdk-analytics/processor-sdk-analy=
tics-11.02.00-config.xml

diff --git a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-=
11.02.00-config.conf.json b/bitbake-setup/processor-sdk-analytics/processor=
-sdk-analytics-11.02.00-config.conf.json
new file mode 100644
index 0000000..7b8f16a
--- /dev/null
+++ b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.02.0=
0-config.conf.json
@@ -0,0 +1,169 @@
+{
+  "version": "1.0",
+  "description": "TI Processor SDK Analytics v11.02.00",
+  "sources": {
+    "oe-layersetup": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git=
"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "oe-layersetup"
+    },
+    "bitbake": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/bitbake"
+          }
+        },
+        "rev": "2.8"
+      },
+      "path": "bitbake"
+    },
+    "meta-arago": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arago"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-arago"
+    },
+    "meta-qt6": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://code.qt.io/yocto/meta-qt6.git"
+          }
+        },
+        "rev": "6.9"
+      },
+      "path": "meta-qt6"
+    },
+    "meta-virtualization": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-virtualization"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-virtualization"
+    },
+    "meta-openembedded": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/meta-openembedded"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-openembedded"
+    },
+    "meta-lts-mixins": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-lts-mixins"
+          }
+        },
+        "rev": "scarthgap/rust"
+      },
+      "path": "meta-lts-mixins"
+    },
+    "meta-ti": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-ti"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-ti"
+    },
+    "meta-arm": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arm"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-arm"
+    },
+    "meta-clang": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/kraj/meta-clang"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-clang"
+    },
+    "oe-core": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/openembedded-core"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "oe-core"
+    },
+    "meta-tisdk": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-tisdk"
+    },
+    "meta-edgeai": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "ssh://git@bitbucket.itg.ti.com/processor-sdk-vision/me=
ta-edgeai.git"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-edgeai"
+    }
+  },
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-ara=
go-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","m=
eta-openembedded/meta-networking","meta-openembedded/meta-python","meta-ope=
nembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-f=
ilesystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/=
meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-=
arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-tisdk/=
meta-ti-foundational","meta-edgeai","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","mac=
hine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57=
xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-=
evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","mac=
hine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx=
-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/=
beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beaglep=
lay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/=
j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","m=
achine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j7=
84s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle=
2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
+      }
+    ]
+  }
+}
diff --git a/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.=
00-config.txt b/configs/processor-sdk-analytics/processor-sdk-analytics-11.=
02.00-config.txt
new file mode 100644
index 0000000..c333ba0
--- /dev/null
+++ b/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.00-conf=
ig.txt
@@ -0,0 +1,22 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,8dcf084522b9c66a6639b5f11=
7f554fde9b6b45a
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,b9c8be5cceb1b=
67c6d14a871fe20e599542999f1,layers=3Dmeta-arago-distro:meta-arago-extras:me=
ta-arago-test
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f=
635a31f5f9762813a8527dd31323549b7,layers=3Dmeta-chromium
+#meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,lay=
ers=3D
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,c7d71f4cece4d1fe3110c94=
5b9bd40ca82960e05,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scart=
hgap,17ac21e7d7f6f40a87618b22278b63bcfa14dbf2,layers=3D
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap=
,89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099,layers=3Dmeta-networking:meta-pyt=
hon:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rus=
t,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=3D
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,802cd01e783aeec00af=
81d99cd242f20ede3adc9,layers=3Dmeta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,a81c19915b5b9e71e=
d394032e9a50fd06919e1cd,layers=3Dmeta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,731488911f55ebfe74=
6068512b426351192f82f2,layers=3D
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,H=
EAD,layers=3D.:meta-flutter-apps
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,1fbd9eddb=
df0da062df0510cabff6f6ee33d5752,layers=3Dmeta
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,71=
e97d787810978a21dc536dfe59d0c821b554fd,layers=3Dmeta-ti-foundational
+meta-edgeai,ssh://git@bitbucket.itg.ti.com/processor-sdk-vision/meta-edgea=
i.git,scarthgap,e814c23648afeb0efd277ae6a9fce9aba0aee025,layers=3D
+
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=3Dyes
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-c=
onfig.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-co=
nfig.yml
new file mode 100644
index 0000000..1bc640c
--- /dev/null
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-config.y=
ml
@@ -0,0 +1,93 @@
+---
+header:
+  version: 17
+  includes:
+    - ../templates/bblayers.conf.yml
+    - ../templates/local-arago64-v2.conf.yml
+
+target: tisdk-default-image
+
+repos:
+  bitbake:
+    url: "https://git.openembedded.org/bitbake"
+    branch: "2.8"
+    commit: "8dcf084522b9c66a6639b5f117f554fde9b6b45a"
+    layers:
+      .: disabled
+
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "scarthgap"
+    commit: "b9c8be5cceb1b67c6d14a871fe20e599542999f1"
+    layers:
+      meta-arago-distro:
+      meta-arago-extras:
+      meta-arago-test:
+
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "6.9"
+    commit: "c7d71f4cece4d1fe3110c945b9bd40ca82960e05"
+
+  meta-virtualization:
+    url: "https://git.yoctoproject.org/meta-virtualization"
+    branch: "scarthgap"
+    commit: "17ac21e7d7f6f40a87618b22278b63bcfa14dbf2"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "scarthgap"
+    commit: "89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099"
+    layers:
+      meta-networking:
+      meta-python:
+      meta-oe:
+      meta-gnome:
+      meta-filesystems:
+      meta-multimedia:
+
+  meta-lts-mixins:
+    url: "https://git.yoctoproject.org/meta-lts-mixins"
+    branch: "scarthgap/rust"
+    commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+
+  meta-ti:
+    url: "https://git.yoctoproject.org/meta-ti"
+    branch: "scarthgap"
+    commit: "802cd01e783aeec00af81d99cd242f20ede3adc9"
+    layers:
+      meta-ti-extras:
+      meta-beagle:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "scarthgap"
+    commit: "a81c19915b5b9e71ed394032e9a50fd06919e1cd"
+    layers:
+      meta-arm:
+      meta-arm-toolchain:
+
+  meta-clang:
+    url: "https://github.com/kraj/meta-clang"
+    branch: "scarthgap"
+    commit: "731488911f55ebfe746068512b426351192f82f2"
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "scarthgap"
+    commit: "1fbd9eddbdf0da062df0510cabff6f6ee33d5752"
+    layers:
+      meta:
+
+  meta-tisdk:
+    url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
+    branch: "scarthgap"
+    commit: "71e97d787810978a21dc536dfe59d0c821b554fd"
+    layers:
+      meta-ti-foundational:
+
+  meta-edgeai:
+    url: "ssh://git@bitbucket.itg.ti.com/processor-sdk-vision/meta-edgeai.=
git"
+    branch: "scarthgap"
+    commit: "e814c23648afeb0efd277ae6a9fce9aba0aee025"
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11=
.02.00-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analy=
tics-11.02.00-config.xml
new file mode 100644
index 0000000..2ae7bd0
--- /dev/null
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.00-=
config.xml
@@ -0,0 +1,89 @@
+<?xml version=3D'1.0'?>
+<config>
+    <description>TI Processor SDK Analytics v11.02.00</description>
+
+    <xi:include href=3D'../../common/distro_arago.xml' xmlns:xi=3D'http://=
www.w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../common/machines.xml' xmlns:xi=3D'http://www.=
w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../templates/bblayers.conf.xml' xmlns:xi=3D'htt=
p://www.w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../templates/local-arago64-v2.conf.xml' xmlns:x=
i=3D'http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.8' c=
ommit=3D'8dcf084522b9c66a6639b5f117f554fde9b6b45a'/>
+
+    <repos>
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'scarthgap' commit=3D'b9c8be5cceb1b67c6d14a871fe20e5995429=
99f1'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'27ca52f635a31f5f9762813a8527dd3=
1323549b7' disabled=3D'true'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-selinux' url=3D'https://git.yoctoproject.org/me=
ta-selinux' branch=3D'scarthgap' commit=3D'HEAD' disabled=3D'true'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'6.9' commit=3D'c7d71f4cece4d1fe3110c945b9bd40ca82960e05'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'scarthgap' commit=3D'17ac21e7d7f6f40a87=
618b22278b63bcfa14dbf2'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'scarthgap' commit=3D'89a01c3d9ad1f8fce6aeb4=
dd0e694cfa28d42099'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-lts-mixins' url=3D'https://git.yoctoproject.org=
/meta-lts-mixins' branch=3D'scarthgap/rust' commit=3D'a8046d5ec53b1856169ac=
795aa87cb0d5db84c04'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'scarthgap' commit=3D'802cd01e783aeec00af81d99cd242f20ede3adc9'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'scarthgap' commit=3D'a81c19915b5b9e71ed394032e9a50fd06919e1cd=
'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-clan=
g' branch=3D'scarthgap' commit=3D'731488911f55ebfe746068512b426351192f82f2'=
>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-flutter' url=3D'https://github.com/meta-flutter=
/meta-flutter.git' branch=3D'scarthgap' commit=3D'HEAD' disabled=3D'true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'scarthgap' commit=3D'1fbd9eddbdf0da062df0510cabff6f6e=
e33d5752'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-tisdk' url=3D'https://git.ti.com/git/ti-sdk-lin=
ux/meta-tisdk.git' branch=3D'scarthgap' commit=3D'71e97d787810978a21dc536df=
e59d0c821b554fd'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-edgeai' url=3D'ssh://git@bitbucket.itg.ti.com/p=
rocessor-sdk-vision/meta-edgeai.git' branch=3D'scarthgap' commit=3D'e814c23=
648afeb0efd277ae6a9fce9aba0aee025'>
+            <layers/>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type=3D'oe-layersetup'>
+            <var name=3D'BITBAKE_INCLUSIVE_VARS' value=3D'yes'/>
+        </tool>
+    </tools>
+</config>
--
2.34.1


--_000_6d36de59f4284001ab75830710ffb75eticom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p>&#43; <a class=3D"x_mention x_ms-bgc-nlr x_ms-fcl-b" id=3D"OWAAM53299" h=
ref=3D"mailto:s-kapoor@ti.com">
@Kapoor, Saurabh</a></p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Sinha, Shreyash<br>
<b>Sent:</b> 18 December 2025 13:12:03<br>
<b>To:</b> meta-arago@lists.yoctoproject.org<br>
<b>Cc:</b> Eatmon, Ryan; Sinha, Shreyash<br>
<b>Subject:</b> [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-a=
nalytics: Add 11.2 release config</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Signed-off-by: Shreyash Sinha &lt;s-sinha@ti.com&g=
t;<br>
---<br>
&nbsp;...or-sdk-analytics-11.02.00-config.conf.json | 169 &#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<b=
r>
&nbsp;...rocessor-sdk-analytics-11.02.00-config.txt |&nbsp; 22 &#43;&#43;&#=
43;<br>
&nbsp;...rocessor-sdk-analytics-11.02.00-config.yml |&nbsp; 93 &#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;...rocessor-sdk-analytics-11.02.00-config.xml |&nbsp; 89 &#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;4 files changed, 373 insertions(&#43;)<br>
&nbsp;create mode 100644 bitbake-setup/processor-sdk-analytics/processor-sd=
k-analytics-11.02.00-config.conf.json<br>
&nbsp;create mode 100644 configs/processor-sdk-analytics/processor-sdk-anal=
ytics-11.02.00-config.txt<br>
&nbsp;create mode 100644 kas/processor-sdk-analytics/processor-sdk-analytic=
s-11.02.00-config.yml<br>
&nbsp;create mode 100644 src/configs/processor-sdk-analytics/processor-sdk-=
analytics-11.02.00-config.xml<br>
<br>
diff --git a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-=
11.02.00-config.conf.json b/bitbake-setup/processor-sdk-analytics/processor=
-sdk-analytics-11.02.00-config.conf.json<br>
new file mode 100644<br>
index 0000000..7b8f16a<br>
--- /dev/null<br>
&#43;&#43;&#43; b/bitbake-setup/processor-sdk-analytics/processor-sdk-analy=
tics-11.02.00-config.conf.json<br>
@@ -0,0 &#43;1,169 @@<br>
&#43;{<br>
&#43;&nbsp; &quot;version&quot;: &quot;1.0&quot;,<br>
&#43;&nbsp; &quot;description&quot;: &quot;TI Processor SDK Analytics v11.0=
2.00&quot;,<br>
&#43;&nbsp; &quot;sources&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;oe-layersetup&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;<a href=3D"https://git.ti.com/git/arago-project/oe-laye=
rsetup.git">https://git.ti.com/git/arago-project/oe-layersetup.git</a>&quot=
;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;mast=
er&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;oe-layersetup&q=
uot;<br>
&#43;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;bitbake&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;<a href=3D"https://git.openembedded.org/bitbake">https:=
//git.openembedded.org/bitbake</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;2.8&=
quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;bitbake&quot;<b=
r>
&#43;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;meta-arago&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;<a href=3D"https://git.yoctoproject.org/meta-arago">htt=
ps://git.yoctoproject.org/meta-arago</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;scar=
thgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;meta-arago&quot=
;<br>
&#43;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;meta-qt6&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;<a href=3D"https://code.qt.io/yocto/meta-qt6.git">https=
://code.qt.io/yocto/meta-qt6.git</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;6.9&=
quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;meta-qt6&quot;<=
br>
&#43;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;meta-virtualization&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;<a href=3D"https://git.yoctoproject.org/meta-virtualiza=
tion">https://git.yoctoproject.org/meta-virtualization</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;scar=
thgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;meta-virtualiza=
tion&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;meta-openembedded&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;<a href=3D"https://git.openembedded.org/meta-openembedd=
ed">https://git.openembedded.org/meta-openembedded</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;scar=
thgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;meta-openembedd=
ed&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;meta-lts-mixins&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;<a href=3D"https://git.yoctoproject.org/meta-lts-mixins=
">https://git.yoctoproject.org/meta-lts-mixins</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;scar=
thgap/rust&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;meta-lts-mixins=
&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;meta-ti&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;<a href=3D"https://git.yoctoproject.org/meta-ti">https:=
//git.yoctoproject.org/meta-ti</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;scar=
thgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;meta-ti&quot;<b=
r>
&#43;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;meta-arm&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;<a href=3D"https://git.yoctoproject.org/meta-arm">https=
://git.yoctoproject.org/meta-arm</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;scar=
thgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;meta-arm&quot;<=
br>
&#43;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;meta-clang&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;<a href=3D"https://github.com/kraj/meta-clang">https://=
github.com/kraj/meta-clang</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;scar=
thgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;meta-clang&quot=
;<br>
&#43;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;oe-core&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;<a href=3D"https://git.openembedded.org/openembedded-co=
re">https://git.openembedded.org/openembedded-core</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;scar=
thgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;oe-core&quot;<b=
r>
&#43;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;meta-tisdk&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;<a href=3D"https://git.ti.com/git/ti-sdk-linux/meta-tis=
dk.git">https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;scar=
thgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;meta-tisdk&quot=
;<br>
&#43;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;meta-edgeai&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;git-remote&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;remotes&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;origin&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;uri&quot;: &quot;ssh://git@bitbucket.itg.ti.com/processor-sdk-vision/met=
a-edgeai.git&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rev&quot;: &quot;scar=
thgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;path&quot;: &quot;meta-edgeai&quo=
t;<br>
&#43;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp; },<br>
&#43;&nbsp; &quot;bitbake-setup&quot;: {<br>
&#43;&nbsp;&nbsp;&nbsp; &quot;configurations&quot;: [<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;name&quot;: &quot;ara=
go&quot;,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;description&quot;: &q=
uot;TI Arago distro build&quot;,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;bb-layers&quot;: [ &q=
uot;meta-arago/meta-arago-distro&quot;,&quot;meta-arago/meta-arago-extras&q=
uot;,&quot;meta-arago/meta-arago-test&quot;,&quot;meta-qt6&quot;,&quot;meta=
-virtualization&quot;,&quot;meta-openembedded/meta-networking&quot;,&quot;m=
eta-openembedded/meta-python&quot;,&quot;meta-openembedded/meta-oe&quot;,&q=
uot;meta-openembedded/meta-gnome&quot;,&quot;meta-openembedded/meta-filesys=
tems&quot;,&quot;meta-openembedded/meta-multimedia&quot;,&quot;meta-lts-mix=
ins&quot;,&quot;meta-ti/meta-ti-extras&quot;,&quot;meta-ti/meta-beagle&quot=
;,&quot;meta-ti/meta-ti-bsp&quot;,&quot;meta-arm/meta-arm&quot;,&quot;meta-=
arm/meta-arm-toolchain&quot;,&quot;meta-clang&quot;,&quot;oe-core/meta&quot=
;,&quot;meta-tisdk/meta-ti-foundational&quot;,&quot;meta-edgeai&quot;,&quot=
;oe-layersetup&quot;
 ],<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;oe-fragments&quot;: [=
 &quot;oe-layersetup/localconf/local-arago64-v2&quot; ],<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;oe-fragments-one-of&q=
uot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;machine&q=
uot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;description&quot;: &quot;Available target machines&quot;,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;options&quot;: [ &quot;machine/am335x-evm&quot;,&quot;machine/am335x-hs-=
evm&quot;,&quot;machine/am437x-evm&quot;,&quot;machine/am437x-hs-evm&quot;,=
&quot;machine/am57xx-evm&quot;,&quot;machine/am57xx-hs-evm&quot;,&quot;mach=
ine/am62xx-evm&quot;,&quot;machine/am62xx-lp-evm&quot;,&quot;machine/am62xx=
sip-evm&quot;,&quot;machine/am62axx-evm&quot;,&quot;machine/am62dxx-evm&quo=
t;,&quot;machine/am62lxx-evm&quot;,&quot;machine/am62pxx-evm&quot;,&quot;ma=
chine/am64xx-evm&quot;,&quot;machine/am65xx-evm&quot;,&quot;machine/am65xx-=
hs-evm&quot;,&quot;machine/am68-sk&quot;,&quot;machine/am69-sk&quot;,&quot;=
machine/beagle-x15&quot;,&quot;machine/beaglebone&quot;,&quot;machine/beagl=
ebone-ai64&quot;,&quot;machine/beagleplay&quot;,&quot;machine/beagleplay-ti=
&quot;,&quot;machine/beagley-ai&quot;,&quot;machine/j7-evm&quot;,&quot;mach=
ine/j7-hs-evm&quot;,&quot;machine/j721e-evm&quot;,&quot;machine/j721e-sk&qu=
ot;,&quot;machine/j7200-evm&quot;,&quot;machine/j7200-hs-evm&quot;,&quot;ma=
chine/j721s2-evm&quot;,&quot;machine/j721s2-hs-evm&quot;,&quot;machine/j742=
s2-evm&quot;,&quot;machine/j784s4-evm&quot;,&quot;machine/j784s4-hs-evm&quo=
t;,&quot;machine/j722s-evm&quot;,&quot;machine/pocketbeagle2&quot;
 ]<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;distro&qu=
ot;: {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;description&quot;: &quot;Available distributions&quot;,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &qu=
ot;options&quot;: [ &quot;distro/arago&quot; ]<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp; ]<br>
&#43;&nbsp; }<br>
&#43;}<br>
diff --git a/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.=
00-config.txt b/configs/processor-sdk-analytics/processor-sdk-analytics-11.=
02.00-config.txt<br>
new file mode 100644<br>
index 0000000..c333ba0<br>
--- /dev/null<br>
&#43;&#43;&#43; b/configs/processor-sdk-analytics/processor-sdk-analytics-1=
1.02.00-config.txt<br>
@@ -0,0 &#43;1,22 @@<br>
&#43;# This file takes repo entries in the format<br>
&#43;# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2..=
.:layern]<br>
&#43;<br>
&#43;bitbake,https://git.openembedded.org/bitbake,2.8,8dcf084522b9c66a6639b=
5f117f554fde9b6b45a<br>
&#43;meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,b9c8be5cc=
eb1b67c6d14a871fe20e599542999f1,layers=3Dmeta-arago-distro:meta-arago-extra=
s:meta-arago-test<br>
&#43;#meta-browser,https://github.com/OSSystems/meta-browser.git,master,27c=
a52f635a31f5f9762813a8527dd31323549b7,layers=3Dmeta-chromium<br>
&#43;#meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD=
,layers=3D<br>
&#43;meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,c7d71f4cece4d1fe311=
0c945b9bd40ca82960e05,layers=3D<br>
&#43;meta-virtualization,https://git.yoctoproject.org/meta-virtualization,s=
carthgap,17ac21e7d7f6f40a87618b22278b63bcfa14dbf2,layers=3D<br>
&#43;meta-openembedded,https://git.openembedded.org/meta-openembedded,scart=
hgap,89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099,layers=3Dmeta-networking:meta=
-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia<br>
&#43;meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap=
/rust,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=3D<br>
&#43;meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,802cd01e783aeec=
00af81d99cd242f20ede3adc9,layers=3Dmeta-ti-extras:meta-beagle:meta-ti-bsp<b=
r>
&#43;meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,a81c19915b5b9=
e71ed394032e9a50fd06919e1cd,layers=3Dmeta-arm:meta-arm-toolchain<br>
&#43;meta-clang,https://github.com/kraj/meta-clang,scarthgap,731488911f55eb=
fe746068512b426351192f82f2,layers=3D<br>
&#43;#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthg=
ap,HEAD,layers=3D.:meta-flutter-apps<br>
&#43;oe-core,https://git.openembedded.org/openembedded-core,scarthgap,1fbd9=
eddbdf0da062df0510cabff6f6ee33d5752,layers=3Dmeta<br>
&#43;meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthga=
p,71e97d787810978a21dc536dfe59d0c821b554fd,layers=3Dmeta-ti-foundational<br=
>
&#43;meta-edgeai,ssh://git@bitbucket.itg.ti.com/processor-sdk-vision/meta-e=
dgeai.git,scarthgap,e814c23648afeb0efd277ae6a9fce9aba0aee025,layers=3D<br>
&#43;<br>
&#43;OECORELAYERCONF=3D./sample-files/bblayers.conf.sample<br>
&#43;OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample<br>
&#43;BITBAKE_INCLUSIVE_VARS=3Dyes<br>
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-c=
onfig.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-co=
nfig.yml<br>
new file mode 100644<br>
index 0000000..1bc640c<br>
--- /dev/null<br>
&#43;&#43;&#43; b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02=
.00-config.yml<br>
@@ -0,0 &#43;1,93 @@<br>
&#43;---<br>
&#43;header:<br>
&#43;&nbsp; version: 17<br>
&#43;&nbsp; includes:<br>
&#43;&nbsp;&nbsp;&nbsp; - ../templates/bblayers.conf.yml<br>
&#43;&nbsp;&nbsp;&nbsp; - ../templates/local-arago64-v2.conf.yml<br>
&#43;<br>
&#43;target: tisdk-default-image<br>
&#43;<br>
&#43;repos:<br>
&#43;&nbsp; bitbake:<br>
&#43;&nbsp;&nbsp;&nbsp; url: &quot;<a href=3D"https://git.openembedded.org/=
bitbake">https://git.openembedded.org/bitbake</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; branch: &quot;2.8&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; commit: &quot;8dcf084522b9c66a6639b5f117f554fde9b6b=
45a&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; layers:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .: disabled<br>
&#43;<br>
&#43;&nbsp; meta-arago:<br>
&#43;&nbsp;&nbsp;&nbsp; url: &quot;<a href=3D"https://git.yoctoproject.org/=
meta-arago">https://git.yoctoproject.org/meta-arago</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; branch: &quot;scarthgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; commit: &quot;b9c8be5cceb1b67c6d14a871fe20e59954299=
9f1&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; layers:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-arago-distro:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-arago-extras:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-arago-test:<br>
&#43;<br>
&#43;&nbsp; meta-qt6:<br>
&#43;&nbsp;&nbsp;&nbsp; url: &quot;<a href=3D"https://code.qt.io/yocto/meta=
-qt6.git">https://code.qt.io/yocto/meta-qt6.git</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; branch: &quot;6.9&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; commit: &quot;c7d71f4cece4d1fe3110c945b9bd40ca82960=
e05&quot;<br>
&#43;<br>
&#43;&nbsp; meta-virtualization:<br>
&#43;&nbsp;&nbsp;&nbsp; url: &quot;<a href=3D"https://git.yoctoproject.org/=
meta-virtualization">https://git.yoctoproject.org/meta-virtualization</a>&q=
uot;<br>
&#43;&nbsp;&nbsp;&nbsp; branch: &quot;scarthgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; commit: &quot;17ac21e7d7f6f40a87618b22278b63bcfa14d=
bf2&quot;<br>
&#43;<br>
&#43;&nbsp; meta-openembedded:<br>
&#43;&nbsp;&nbsp;&nbsp; url: &quot;<a href=3D"https://git.openembedded.org/=
meta-openembedded">https://git.openembedded.org/meta-openembedded</a>&quot;=
<br>
&#43;&nbsp;&nbsp;&nbsp; branch: &quot;scarthgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; commit: &quot;89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42=
099&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; layers:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-networking:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-python:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-oe:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-gnome:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-filesystems:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-multimedia:<br>
&#43;<br>
&#43;&nbsp; meta-lts-mixins:<br>
&#43;&nbsp;&nbsp;&nbsp; url: &quot;<a href=3D"https://git.yoctoproject.org/=
meta-lts-mixins">https://git.yoctoproject.org/meta-lts-mixins</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; branch: &quot;scarthgap/rust&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; commit: &quot;a8046d5ec53b1856169ac795aa87cb0d5db84=
c04&quot;<br>
&#43;<br>
&#43;&nbsp; meta-ti:<br>
&#43;&nbsp;&nbsp;&nbsp; url: &quot;<a href=3D"https://git.yoctoproject.org/=
meta-ti">https://git.yoctoproject.org/meta-ti</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; branch: &quot;scarthgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; commit: &quot;802cd01e783aeec00af81d99cd242f20ede3a=
dc9&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; layers:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-ti-extras:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-beagle:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-ti-bsp:<br>
&#43;<br>
&#43;&nbsp; meta-arm:<br>
&#43;&nbsp;&nbsp;&nbsp; url: &quot;<a href=3D"https://git.yoctoproject.org/=
meta-arm">https://git.yoctoproject.org/meta-arm</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; branch: &quot;scarthgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; commit: &quot;a81c19915b5b9e71ed394032e9a50fd06919e=
1cd&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; layers:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-arm:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-arm-toolchain:<br>
&#43;<br>
&#43;&nbsp; meta-clang:<br>
&#43;&nbsp;&nbsp;&nbsp; url: &quot;<a href=3D"https://github.com/kraj/meta-=
clang">https://github.com/kraj/meta-clang</a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; branch: &quot;scarthgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; commit: &quot;731488911f55ebfe746068512b426351192f8=
2f2&quot;<br>
&#43;<br>
&#43;&nbsp; oe-core:<br>
&#43;&nbsp;&nbsp;&nbsp; url: &quot;<a href=3D"https://git.openembedded.org/=
openembedded-core">https://git.openembedded.org/openembedded-core</a>&quot;=
<br>
&#43;&nbsp;&nbsp;&nbsp; branch: &quot;scarthgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; commit: &quot;1fbd9eddbdf0da062df0510cabff6f6ee33d5=
752&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; layers:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta:<br>
&#43;<br>
&#43;&nbsp; meta-tisdk:<br>
&#43;&nbsp;&nbsp;&nbsp; url: &quot;<a href=3D"https://git.ti.com/git/ti-sdk=
-linux/meta-tisdk.git">https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git</=
a>&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; branch: &quot;scarthgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; commit: &quot;71e97d787810978a21dc536dfe59d0c821b55=
4fd&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; layers:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-ti-foundational:<br>
&#43;<br>
&#43;&nbsp; meta-edgeai:<br>
&#43;&nbsp;&nbsp;&nbsp; url: &quot;ssh://git@bitbucket.itg.ti.com/processor=
-sdk-vision/meta-edgeai.git&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; branch: &quot;scarthgap&quot;<br>
&#43;&nbsp;&nbsp;&nbsp; commit: &quot;e814c23648afeb0efd277ae6a9fce9aba0aee=
025&quot;<br>
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11=
.02.00-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analy=
tics-11.02.00-config.xml<br>
new file mode 100644<br>
index 0000000..2ae7bd0<br>
--- /dev/null<br>
&#43;&#43;&#43; b/src/configs/processor-sdk-analytics/processor-sdk-analyti=
cs-11.02.00-config.xml<br>
@@ -0,0 &#43;1,89 @@<br>
&#43;&lt;?xml version=3D'1.0'?&gt;<br>
&#43;&lt;config&gt;<br>
&#43;&nbsp;&nbsp;&nbsp; &lt;description&gt;TI Processor SDK Analytics v11.0=
2.00&lt;/description&gt;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp; &lt;xi:include href=3D'../../common/distro_arago.xm=
l' xmlns:xi=3D'<a href=3D"http://www.w3.org/2001/XInclude'/">http://www.w3.=
org/2001/XInclude'/</a>&gt;<br>
&#43;&nbsp;&nbsp;&nbsp; &lt;xi:include href=3D'../../common/machines.xml' x=
mlns:xi=3D'<a href=3D"http://www.w3.org/2001/XInclude'/">http://www.w3.org/=
2001/XInclude'/</a>&gt;<br>
&#43;&nbsp;&nbsp;&nbsp; &lt;xi:include href=3D'../../templates/bblayers.con=
f.xml' xmlns:xi=3D'<a href=3D"http://www.w3.org/2001/XInclude'/">http://www=
.w3.org/2001/XInclude'/</a>&gt;<br>
&#43;&nbsp;&nbsp;&nbsp; &lt;xi:include href=3D'../../templates/local-arago6=
4-v2.conf.xml' xmlns:xi=3D'<a href=3D"http://www.w3.org/2001/XInclude'/">ht=
tp://www.w3.org/2001/XInclude'/</a>&gt;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp; &lt;bitbake url=3D'<a href=3D"https://git.openembed=
ded.org/bitbake">https://git.openembedded.org/bitbake</a>' branch=3D'2.8' c=
ommit=3D'8dcf084522b9c66a6639b5f117f554fde9b6b45a'/&gt;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp; &lt;repos&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-arago=
' url=3D'<a href=3D"https://git.yoctoproject.org/meta-arago">https://git.yo=
ctoproject.org/meta-arago</a>' branch=3D'scarthgap' commit=3D'b9c8be5cceb1b=
67c6d14a871fe20e599542999f1'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-arago-distro&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-arago-extras&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-arago-test&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;/layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-brows=
er' url=3D'<a href=3D"https://github.com/OSSystems/meta-browser.git">https:=
//github.com/OSSystems/meta-browser.git</a>' branch=3D'master' commit=3D'27=
ca52f635a31f5f9762813a8527dd31323549b7' disabled=3D'true'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-chromium&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;/layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-selin=
ux' url=3D'<a href=3D"https://git.yoctoproject.org/meta-selinux">https://gi=
t.yoctoproject.org/meta-selinux</a>' branch=3D'scarthgap' commit=3D'HEAD' d=
isabled=3D'true'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers/&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-qt6' =
url=3D'<a href=3D"https://code.qt.io/yocto/meta-qt6.git">https://code.qt.io=
/yocto/meta-qt6.git</a>' branch=3D'6.9' commit=3D'c7d71f4cece4d1fe3110c945b=
9bd40ca82960e05'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers/&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-virtu=
alization' url=3D'<a href=3D"https://git.yoctoproject.org/meta-virtualizati=
on">https://git.yoctoproject.org/meta-virtualization</a>' branch=3D'scarthg=
ap' commit=3D'17ac21e7d7f6f40a87618b22278b63bcfa14dbf2'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers/&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-opene=
mbedded' url=3D'<a href=3D"https://git.openembedded.org/meta-openembedded">=
https://git.openembedded.org/meta-openembedded</a>' branch=3D'scarthgap' co=
mmit=3D'89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-networking&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-python&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-oe&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-gnome&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-filesystems&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-multimedia&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;/layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-lts-m=
ixins' url=3D'<a href=3D"https://git.yoctoproject.org/meta-lts-mixins">http=
s://git.yoctoproject.org/meta-lts-mixins</a>' branch=3D'scarthgap/rust' com=
mit=3D'a8046d5ec53b1856169ac795aa87cb0d5db84c04'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers/&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-ti' u=
rl=3D'<a href=3D"https://git.yoctoproject.org/meta-ti">https://git.yoctopro=
ject.org/meta-ti</a>' branch=3D'scarthgap' commit=3D'802cd01e783aeec00af81d=
99cd242f20ede3adc9'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-ti-extras&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-beagle&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-ti-bsp&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;/layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-arm' =
url=3D'<a href=3D"https://git.yoctoproject.org/meta-arm">https://git.yoctop=
roject.org/meta-arm</a>' branch=3D'scarthgap' commit=3D'a81c19915b5b9e71ed3=
94032e9a50fd06919e1cd'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-arm&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-arm-toolchain&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;/layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-clang=
' url=3D'<a href=3D"https://github.com/kraj/meta-clang">https://github.com/=
kraj/meta-clang</a>' branch=3D'scarthgap' commit=3D'731488911f55ebfe7460685=
12b426351192f82f2'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers/&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-flutt=
er' url=3D'<a href=3D"https://github.com/meta-flutter/meta-flutter.git">htt=
ps://github.com/meta-flutter/meta-flutter.git</a>' branch=3D'scarthgap' com=
mit=3D'HEAD' disabled=3D'true'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;.&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-flutter-apps&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;/layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'oe-core' u=
rl=3D'<a href=3D"https://git.openembedded.org/openembedded-core">https://gi=
t.openembedded.org/openembedded-core</a>' branch=3D'scarthgap' commit=3D'1f=
bd9eddbdf0da062df0510cabff6f6ee33d5752'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;/layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-tisdk=
' url=3D'<a href=3D"https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git">htt=
ps://git.ti.com/git/ti-sdk-linux/meta-tisdk.git</a>' branch=3D'scarthgap' c=
ommit=3D'71e97d787810978a21dc536dfe59d0c821b554fd'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &lt;layer&gt;meta-ti-foundational&lt;/layer&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;/layers&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;repo name=3D'meta-edgea=
i' url=3D'ssh://git@bitbucket.itg.ti.com/processor-sdk-vision/meta-edgeai.g=
it' branch=3D'scarthgap' commit=3D'e814c23648afeb0efd277ae6a9fce9aba0aee025=
'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;layers/&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/repo&gt;<br>
&#43;&nbsp;&nbsp;&nbsp; &lt;/repos&gt;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp; &lt;tools&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;tool type=3D'oe-layerse=
tup'&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt=
;var name=3D'BITBAKE_INCLUSIVE_VARS' value=3D'yes'/&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/tool&gt;<br>
&#43;&nbsp;&nbsp;&nbsp; &lt;/tools&gt;<br>
&#43;&lt;/config&gt;<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_6d36de59f4284001ab75830710ffb75eticom_--

