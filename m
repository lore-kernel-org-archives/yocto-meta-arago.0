Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B26CA5FAD
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 19:10:15 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4310.1790709005548855464
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 29 Sep 2026 12:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=okR/pH04;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=STcLmlef;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: t-lannynd@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TGNljv486742
	for <meta-arago@lists.yoctoproject.org>; Tue, 29 Sep 2026 14:10:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=CwOlZ4QicrEg6
	jB8CAEHi021EATR5rbSGI649RQqFUk=; b=okR/pH041f27dfNuGmWpkPWHq6zxH
	8ucYZ3k87oXqcIMJy+cq52H3wX0XxHLTybfi7m4xLDrRRxtpRWQ2Uja0XOUXS5a7
	QQEFMdEDtv1s5aAEJSxQi7FG7IBBIPuerQ0k+3aaVC6EZf2S8feCKCZY+SUi7KXr
	Y3LA6pTpAWzzgll0is8E6CbJqEKVcIX9VoHvRXjpjplJdPH7CZrt8D0QKbmMW5oy
	G8KIfmX+akXwbzPnuQuAQVQpTELmOynm0XKyCJWCBS8h8lTTjVACoNqGl1gLeHBM
	lYyMoyPn4so70eJDd+hJesVaZR7jEs2lgoXjnsusuHWorjZCRJQOi4Ncw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011012.outbound.protection.outlook.com [52.101.57.12])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0cpc2x3c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Tue, 29 Sep 2026 14:10:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fAU7gc73ht4FW2XJu00JUZZj/V7Emrs2qMuzRQRTnIqVIcJXmP6zyQuHQXMQlTJ+u+7IWgkaRfu8CU5Gl//YmGpd26CsqaTvh7A+7PPFm9dyGI+4Ak5/frXyx2eoXPV9z9DTnUuaUwavCZtRSLsBma9V57mPqFwczi5575IdA6NNrMjmjLwoZ5coroj3a7C8+d21XPuYzqH/xArpUGLrSW0qKm3fTUqYfQJ7F67gI2MfoWcql0ZdwtWlRShCi1MkPDdapKAveXyKrVlx14888fUzNPlDJ3tEYhLOX/EhFOmmwrPjFLppvzM6EWyN9H9g3KqHuCSbaPiQMRjvFU0/jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwOlZ4QicrEg6jB8CAEHi021EATR5rbSGI649RQqFUk=;
 b=CGCXVw9b6I3A3SyYmXyJo1HgXFogDxHv7nKLgUytWxp0o/nNGFjAdbglL4OFD9CuLBjVbKEpGLyBZiCyQhqq1+qV9hNgyCCuSMCV6cKmBIjcXFSrsG3jYEUumf4+8A8mENksuhnShUwUB0BQ6AKW0cCoMhJ9Uz9o5rSm4qGV8qKl87mHYxrkHkepVAoT+1vJASKSCYrHJi45L5H3fZgyA8vlESyXvBRBXJ+Qgwj62Dj3Iq8C5UpsZi0ivGPFNp4zx1CMQlJ4jyHWJpDemOa4vALtzpyztHOkvQjSTQh7hpM/6vEnIlablJ1hij1MRCL1ppZ2GwIqkh8mzTx+y/ob8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CwOlZ4QicrEg6jB8CAEHi021EATR5rbSGI649RQqFUk=;
 b=STcLmlefeb8oUSLWa9RAmRJd+wG3/ZZT2g6mS5D9S24/wiKff4cJpv2alT7DpMSkNxFU0TEjIB7wp9ktyBmojuJGG1NxA0RY68BO/Ed6HXShemqUmgthTk1CMbPKeY2jCJP1tBPaNxGm+AuezeZewVGTFVcX0wlhKhS8YHMYNro=
Received: from MW4PR03CA0036.namprd03.prod.outlook.com (2603:10b6:303:8e::11)
 by CH4PR10MB8121.namprd10.prod.outlook.com (2603:10b6:610:247::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Tue, 29 Sep
 2026 19:09:59 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:303:8e:cafe::7) by MW4PR03CA0036.outlook.office365.com
 (2603:10b6:303:8e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 19:09:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 19:09:55 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 14:08:59 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 14:08:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 14:08:59 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.75.146])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TJ8x6D1594741;
	Tue, 29 Sep 2026 14:08:59 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>
Subject: [meta-arago][master/wrynose][PATCH v5] meta-arago-disto: chromium: restrict force-h264-youtube extension to supported boards
Date: Tue, 29 Sep 2026 14:08:49 -0500
Message-ID: <20260929190849.3465293-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|CH4PR10MB8121:EE_
X-MS-Office365-Filtering-Correlation-Id: b06f7eb0-befb-45b3-4d18-08df1e5d3f94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|10067099003|3023799007|18002099003|260925022911599003|56012099006|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info: 
	AOxe2vl5t9OstChhX03R3ugm84nWweEwF9r8bZXr+TLSLCJlne0WtAChxyu9G1b0eS3g27MRVkOjepKSDZr8pONC9qFD8AG1XpE+HetKF/7iKNmv0au8ehLTHKVn0YXoKW+ddKBNNKW5ElBu+Ldqgr7wAVPKRY64CJdOMqMMjl0gdFitHg86NQLAF+SiuDTVo2PIvzVgMTOod9czmHHtYU5J9yXW7/YQOfCCw3O5yhjfpwYHB8HQYkWXE78rdqk4ZTx84TeR47O2dJgz0bQ8RO60cncshoagHN4IUDuoSWSluACNA0M85zzP8JSObjDsXnZoGlB+McY7YMLAvMk/TBwiMUqS+ldZez6OzRkBQ+9OfDu4I1MGb6bSoCFIU4x9YBqbFFiJaH90i6/WOt+CpjLPHTxq5vJD4PBOSWe3Mlzb8JdLRFhidnT3RtruhSmMO4Gy/QzgMOa81a8FHhE00VOh9+JsxZv5nAF/62mKLf50VF0GXVIOIUio16JVNX3TD9i6/+OAd5u6fe2Kr8YN3q61wskzz75e3c+LpcF313uLfUYEgXIqoO7uV/ZBjvth9QIz6Tjk11L99IYBVQnqHVn8/ugh9z6xF/K4vfBg41IsGOp0bmY79mG7cMWWabFKGbHGvBvdGLtaI+kFdUNOiWp+M7w4szcqOIASPjXaspsjB1YlkH+ja2h09rOyg0v49O7BgZIXTiLlPI9ADLZkDA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(10067099003)(3023799007)(18002099003)(260925022911599003)(56012099006)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	nnlPqvymGpWVAeJw2GAycPsYb5npNJZ6D9wppUkLf9JlNY7kb5rBSEigJnu94f9pR2vY5PDKnJsaiKZLnOfnw7elqJtKfZ3A96uwDPuLWS23uWodU2RmSgWzdsysxpAUpxbAuGSwqXYpbBmfQHVV75WJ/DyHFoF3Ywo2V92nZivkX1oEmbYuzitZGXRNHYUcB0J94n4OKAKEL3opCmZKINmdFgxuzLcio/OioEnTiuorvHK/rcHXZuMjNXWKl/AlUGzCmJzIv3pASMgJ8tz0Bm1RWzR3r1Z5EAyQEj72jlx6YHHFt1/+OklTCWNjFUyg6gt6054ju8QoMMYuscXRT8uYutZqx3918qCfYlbjnGje8OoE6gjhGuaPb1bHTJU2DsIFi8mLFbMK9EYQ9vqH7b/ybWhHMNti9ZLa5C2tKDlqwftNZvTOJ8ZyfkBbu284
X-Exchange-RoutingPolicyChecked: 
	dqLAc73OYWE/qx7GX1Qh29IhhSKnhfF/LmzT3CdYtc4fYb0WPwOshuvC86jFvvIXmDH8WweNgO7h33BUTGdLjijg0VZEs0i69IDaMthFB8M590VDE1GoA+n2UIwcA+LhO8YLsJ6JYwd/ci3ZKUt9BAZ4OuUCuOXLAJaZ1D/4Tw9jSFUW+cbqogW5ZWkxRqXuRS7Zh/BYYTrscaW+SnZy5I9x13oPXWMOSjyPdNtWSucGmXZDVITgob5DrLBnxoAz6nb69otZwqf7R81bKfNFzyEH9h+/zeU8n/EM/ZGFBNfoBoWOOuQO53jDcDOH3occLC0QBqT6WCdeBQZ7x9on9g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 19:09:55.6046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b06f7eb0-befb-45b3-4d18-08df1e5d3f94
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8121
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA3NiBTYWx0ZWRfXyYPzb8QaHv+B
 kGvu4AooWwLOQfg9wj2i58Kwb1n5zD+UoOtk3yfm7cOTJFo4RNH7kYY0NuncqBpCmi8fZwBtbQD
 YxlW1JH5raxPulvGhFpxSLHK+Qba6Y4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA3NiBTYWx0ZWRfX8QgWnz0DuV9X
 dXmqBHSlcJ36ukNiC5gNPZqel4kHyYYQaJ0W/XeBqM0vxlAlDCtW9X6x53np7IIpk4pYti/sZPC
 84YMSztfazr4KiIlzJlZDRI6wYLaW0OQLu87Gl5Q6LrlpHpBCrE6fG3XyidJCVci76+07Kpww2g
 hcbi1gxekYkAh8nvYbDrGLmaopgyMzn2L7D1uSCi6PW2Y9c0Aao6YMY1AziUQWg+PoaqRZs6/Vd
 p6YLDhiJ9dCv371c0NOvg9zstN5rsM+P9Ej5pohKi7mTadfdT+BT5i0Pn2l/ogm215VqjdbtWuz
 Bh/d/4KWec6hlYefuxeBtvjtaSWBLF14yQmz654B4ndOdAFtolJhtC739mG5D4txQtQtkp6A05A
 VAhzKMv4VqObzkv1jE4kBpRuVBHAhEyQtNhlzrtiMqUAEqg5wMJlDuxzRb3vrgcKqfQzoEbGzyk
 xpH8hwSYCB0gqVsso6A==
X-Authority-Analysis: v=2.4 cv=Y4xtIReN c=1 sm=1 tr=0 ts=6abc0d0b cx=c_pps
 a=6brTJxCCefizds7ERwDNzw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=ca3eXa3e90v1pi6MnjgA:9
X-Proofpoint-GUID: cixVpsWbgcEEgb-XCS5TIJwP1HFUAKYN
X-Proofpoint-ORIG-GUID: cixVpsWbgcEEgb-XCS5TIJwP1HFUAKYN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290076
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Sep 2026 19:10:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17711

Split force-h264-youtube into its own package, enabled only on boards that
support H264 YouTube hardware accelerated playback.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---

v5:
- Use generic approach to loading extensions by creating arago subdirectory
  and loading all extensions that live in the subdirectory

v4:
- Add branch and layer to subject line

v3:
- Separate the extension into its own package and install on boards with
  Wave5 firmware
- Enable extension if extension directory exists

v2:
- Shorten commit message title

 .../force_h264.js                             |  0
 .../manifest.json                             |  0
 ...mium-extension-force-h264-youtube_1.0.0.bb | 24 +++++++++++++
 .../chromium/chromium-ozone-wayland-arago.inc | 14 +-------
 ...-Auto-load-arago-extensions-at-runti.patch | 34 +++++++++++++++++++
 5 files changed, 59 insertions(+), 13 deletions(-)
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/{chromium/chromium-ozone-wayland/force-h264-youtube => chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube}/force_h264.js (100%)
 rename meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/{chromium/chromium-ozone-wayland/force-h264-youtube => chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube}/manifest.json (100%)
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube_1.0.0.bb
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch

diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube/force_h264.js
similarity index 100%
rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/force_h264.js
rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube/force_h264.js
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube/manifest.json
similarity index 100%
rename from meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/force-h264-youtube/manifest.json
rename to meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube/manifest.json
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube_1.0.0.bb b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube_1.0.0.bb
new file mode 100644
index 00000000..bdc3d223
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium-extension-force-h264-youtube/chromium-extension-force-h264-youtube_1.0.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Chromium extension that forces YouTube to use H.264 codec"
+LICENSE = "CLOSED"
+
+python () {
+    if not bb.utils.contains("MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS", "cnm-wave-fw", True, False, d):
+        raise bb.parse.SkipRecipe("cnm-wave-fw not in MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS")
+}
+
+RDEPENDS:${PN} = "chromium-ozone-wayland"
+
+SRC_URI = "file://force_h264.js \
+           file://manifest.json \
+           "
+
+EXTENSION_DIR = "${libdir}/chromium/extensions/arago/force-h264-youtube"
+
+do_install() {
+    install -d ${D}${EXTENSION_DIR}
+    install -m 0644 ${WORKDIR}/force_h264.js \
+                    ${WORKDIR}/manifest.json \
+                    ${D}${EXTENSION_DIR}/
+}
+
+FILES:${PN} = "${EXTENSION_DIR}"
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
index d8eb0204..40b74c18 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland-arago.inc
@@ -1,7 +1,5 @@
 PR:append = ".arago0"
 
-EXTENSION_DIR = "/usr/lib/chromium/extensions/force-h264-youtube"
-
 FILESEXTRAPATHS:prepend := "${THISDIR}/chromium-ozone-wayland:"
 
 PACKAGECONFIG:append = " proprietary-codecs"
@@ -11,15 +9,5 @@ SRC_URI:append = " \
                   file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-access-to-V4L.patch \
                   file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming-in-V4L2.patch \
                   file://0004-media-gpu-v4l2-Avoid-placing-incomplete-H264-access-.patch \
-                  file://force-h264-youtube/force_h264.js \
-                  file://force-h264-youtube/manifest.json \
+                  file://0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch \
                   "
-
-do_install:append() {
-    install -d ${D}${EXTENSION_DIR}
-    install -m 0644 ${WORKDIR}/sources/force-h264-youtube/force_h264.js \
-                    ${WORKDIR}/sources/force-h264-youtube/manifest.json \
-                    ${D}${EXTENSION_DIR}/
-}
-
-FILES:${PN}:append = " ${EXTENSION_DIR}"
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch
new file mode 100644
index 00000000..90323537
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-wayland/0005-chromium-wrapper-Auto-load-arago-extensions-at-runti.patch
@@ -0,0 +1,34 @@
+From 5bcdc4db88d908abdeba11270740864a13bafad1 Mon Sep 17 00:00:00 2001
+From: Thorsten Lannynd <t-lannynd@ti.com>
+Date: Mon, 28 Sep 2026 13:22:56 -0500
+Subject: [PATCH] chromium: wrapper: Auto-load arago extensions at runtime
+
+Upstream-Status: Inappropriate [TI-specific extension directory]
+
+Scan $HERE/extensions/arago/ at runtime and pass any installed
+subdirectories through --load-extension, allowing all TI extensions to be
+enabled by default.
+
+Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
+---
+ chrome/installer/linux/common/wrapper | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/chrome/installer/linux/common/wrapper b/chrome/installer/linux/common/wrapper
+index 3547069c2a..76588abda8 100755
+--- a/chrome/installer/linux/common/wrapper
++++ b/chrome/installer/linux/common/wrapper
+@@ -28,5 +28,11 @@ exec 2> >(exec cat >&2)
+ 
+ CHROME_EXTRA_ARGS=""
+ 
++# Auto-load arago extensions at runtime
++for _ext in "$HERE/extensions/arago"/*/; do
++    [ -d "$_ext" ] && _ext_list="${_ext_list:+$_ext_list,}${_ext%/}"
++done
++[ -n "$_ext_list" ] && CHROME_EXTRA_ARGS="$CHROME_EXTRA_ARGS --load-extension=$_ext_list"
++
+ # Note: exec -a below is a bashism.
+ exec -a "$0" "$HERE/@@PROGNAME@@" ${CHROME_EXTRA_ARGS} "$@"
+-- 
+2.34.1
-- 
2.34.1

