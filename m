Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC45C4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 21:14:05 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34077.1784668436840458433
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 14:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=lb1aJTSp;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=f0jMdLcH;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66LKkXKP4047010;
	Tue, 21 Jul 2026 16:13:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=8h1bH+p1/pr2l
	IBi+Mp5y342lFzVUhbn7eEi+hT2tsg=; b=lb1aJTSpuoo+623iAy7860vVSYiql
	RnK8kei5TQO1cL+PYttKQLNceut7qu4AYD7r+CRL1jkRncfrYyDg+qJFfmFUjrQy
	LcoeO7Ix8olq0oVVagy58kUCtwGmZOUnCfJ9xODOLfIk3jhRmMXzKaF+WlDu7Oo7
	qxF+9/5LYrFdJtkvs+1TuMMlGcGOpmVhnVAk7mQhrNwQwBnw7JuRcFzfccJ1Mk/m
	lQHB0yQqnqghbz/tu1aqGKluaI5llZWGk3sheQstBkyA/6MYIemx+IAryKo09K9z
	BwYNaqUQMr/0GVkPEjKBaZ3ELXh5HLABV5D/G/PDQY3jq46ApPJnE0Oig==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012033.outbound.protection.outlook.com [52.101.43.33])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fj869kgfm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 16:13:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQvriMr0EpPKXUNuKd31ZZFkPRUQicuQbUt1rQLBRAEEF32xU4ZlJk61uZJEQtHR167PTrTyIVbngPoTtT+4FZYBwvGUtK6PpKKm6ZYZGoOA02ldzuKqqM9UlljU1jlWas4yCj1EPEvLSZsIx+A2GKhRfe7PGD+gC/uuERtH0Z6GtRXPZhDkHB6+UtzFW9EqqpplxEix/cTM3e8Vh/83sU/KMX5i0ebFkb6UxKddjVa0wdNZ7vINj7fAP567beeNUANL6xbO5IP0BCDMjXqlt1eP1FKTcoVOyMFD08WJZgtn74kez9xOe6hkeCdMpaRS7SsyoGMX1K1LIjFNP3UzXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8h1bH+p1/pr2lIBi+Mp5y342lFzVUhbn7eEi+hT2tsg=;
 b=E8rFBuP59g71XW24DbrryIFFp4EuEr+8I5CJti3B6FPljx3G9D3txoTKBHzHdQYKCUokHCqDTSKzZj6xmXsS2vc+jH8xRnw21FfNqmUswL75zyfukgpyOWwQyku0/E3Kw0rgEuJvi0+dRAYE2aG0MGzD3T/TsKdfs2Ro9XmcBa2bzCasmnb626k8yMO2xRl8l/DTf4zkKJ2SZYsZAbHZ8DS5WzEQGTqwVtigonnlJCZ/nklLpMz6oTsiMD1pHT6QsPFoOcOcrPTXkUqrc7/q9pgnbuZwck6MpdPYkjEzzpsr1RClkyjRCe2TZIFVpInoyYpZxNrK4xdmp081JOYAvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8h1bH+p1/pr2lIBi+Mp5y342lFzVUhbn7eEi+hT2tsg=;
 b=f0jMdLcHI0XMAewqW4Tgj0Fi0qNd8ByFrO9LgmeItUqm2p7FOBQIVPUPYhuus7Z8dI0s0RKH1snWbH/Fy5l34JLPgCw9fNiJKGLnVoNi8frZ42v6h32ZarxuCoObwsn4CtTy62g105BToPfAyj4tAmy9OTr9bp2GWVD5BHLsUEA=
Received: from SJ0PR03CA0368.namprd03.prod.outlook.com (2603:10b6:a03:3a1::13)
 by DS7PR10MB4975.namprd10.prod.outlook.com (2603:10b6:5:3b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 21:13:51 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::5d) by SJ0PR03CA0368.outlook.office365.com
 (2603:10b6:a03:3a1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 21:13:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 21:13:50 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 16:13:50 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 16:13:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 21 Jul 2026 16:13:50 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66LLDoIe2242278;
	Tue, 21 Jul 2026 16:13:50 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wmHmg-0000000E68o-0MBA;
	Tue, 21 Jul 2026 16:13:50 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] meson: Fix patch for v1.11.2
Date: Tue, 21 Jul 2026 16:13:50 -0500
Message-ID: <20260721211350.3360100-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|DS7PR10MB4975:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bac93c2-2fa5-4989-7e78-08dee76cf66a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|18002099003|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	Ksq/7Jkzzg4o6XWpNwRjIjNz3OMwKUcWDaKmeEmhGMZwok9BMejcBOKAFmZOG5TiAqT6GJrtnonxiT30diNwb2h4oViYk3ndXMP8jVc9nMNVXDaClCv/+tliLXeWFkzsSRXwwyJZaHGfuaN2DolckbirAdhLKks2+OiCvtbwvRgTTgHFR9w9TABaLxpvJYbgLLoVMWwkFPHvelt7QMhnib5Y9Fkz0QxF8IaSDu553TmcJ4xCwpQ1KQYCJOVdVWh73aUym2qraVRYFCz5dvKsxEBUN94EALyx2kC4L/E/lSwNnpnZ4xbv/V0GsdvjoxnzAo3lQznjduwM7AkRaV1sJECUGi+E94sZd8xRnb6eamMk889Ct08Cf6Ni38MZBT0JKs3+EcIBpf9EWkh62eMpnYIp7s+GqmaZ45j5TdIG6RahsU2HjPSsehrhaIzgi/GmHwbXIEl3EhrirkWjaUkLyK3ZpcusFJG5IIOrC9D24AiASBdGjLSItQ+3KRdm+dZDPb/m6pbmd9KXTxTaFDwTX1cVzVAh+nUh5mpkt0DqUrB79bENYDHe/V9Bd5I7lLZCgD6U6fnC+pTwg+vLmXZdsqNNejIWbzYyHm8NhoyRZhNfw+xfpLfdqyuaoss2P0AgbAa1CLughFQVBSi1cnLNMA7dAvFaXlzrD18FAJzy9CSYEoisEbrxKmRBf2FEjCTMMtUcfNA2nU/+o1/SWesY8g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(18002099003)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	njcoBND/8gX3wETylJP9JaS9pDLkDEuCKw2rVwWwF6OlvGGaRjFml5sXrjN8BqKTv/sL+r1OPxSBK7V5OBeF7SEywJH/xrRhgtpt9/sssr5HSYm00oS5jJ3W+InVe8TymvevLxdbTMhvpljE3Hl8uQjJD61cvF91JH8fL+usbBrNU4YlOmmhgQFlvl0PGLZ9j1Y5yNI8YmIL2Qb4DkmKLmsx2j9+2+UMvbcDuOuNOWB9svTzNi4bXtjMH2zaD58T2LMCdZmgl4R74+xWgH6cvzHw/VdR0i3CiDmKx2171sZmVIcsyfhxXPBfFXCoyUEQHQEzlL6LyeCqzInLF1XquPSZkWNzz5/iHdkhOt5ueJUL7fPqwuwPQQg/edAmnXLYRIAUsp7YHFRF1sD+Y25veQwgR428G3yp6huEVOVzPOm6RQgHeRdI68XQjVceV/Ql
X-Exchange-RoutingPolicyChecked: 
	mwDCUhHyvZAYTimp+ZO5mWXBWLEv6SuVHKDJJXXm+Qa/WNTMUAm4Zm2uW9xbplF+DXYbzuKH4lNHfSjfOdSk/CbudhVdvwGPSZMshIQWg/s4k5XpJ6kIpfqBoOSlVLK4xi2cdvb3rm59sZVbbcngjTF6cHJ957kXXBUUheS3FAQ6eoI72M70kO7Lni+3lREaSqeiKyvhzGPba3EXOi3z7c0ZVM+uI1a121dZ4u+roTb+zD2sjDjCZdoAVIFy9cBnqlTVOQfe3FezEYnteFCqn6Lkw3nsc/XlalhJXPj9w3n+zID8ocYJugXKWKLuDwVSr1i1UGggknWn+Mrt7urBXA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 21:13:50.8502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bac93c2-2fa5-4989-7e78-08dee76cf66a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4975
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyMCBTYWx0ZWRfXxEx8GLoujol+
 fBuBDKbexd+Y/r2Afi49MecoEZ2VIy0IjMVvivvM7IiFUkodaZW9WgpB/4px3RsWcTj3tbI21mQ
 ZHJo8LtgHxNWRPCguyShDwAeCXOynuZBuEi3y8i1lv4DlfZl1gPqbvvMsKJV0n3bGbmOiZwvmEb
 VTwJV88eadxNaofjGZq2fpdsJpN/VegCiahTqBGkhjFBszoIBEH59uUHxjQHtXJJTBWbAg0J3p6
 xCysFH+geOVmc/S+ihhpHuh+nH03POq0golgpKpZ2PaRqwOsfgZ4Gfjlk1GGcV6bvzrbu1L3U28
 DpBpA2ZRn8JoI2gA1SF2QyT/ZX5aKpsdJlcKxNV+YxBlMfCZG2Ocao0LvcmENyHCwlLQXy+5Dr0
 GziwdyM1xsO9aPOfuoAaxa5EGzzhoewka8GtYBP0/NyPcyGF11Fx47QxlxDICPW76Bw8dL0tozQ
 VaC+cTlf/F7KtC8W5bA==
X-Authority-Analysis: v=2.4 cv=WbI8rUhX c=1 sm=1 tr=0 ts=6a5fe113 cx=c_pps
 a=BRoDR27eCUDGJJSfTO8W4A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8
 a=qQmSPLKm1k-rUPtZaJ4A:9 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: ObqvGv9dYOTvLji2CEZQy6CQR-8LBkyb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyMCBTYWx0ZWRfX5ZSKMHLtS1g3
 CeJANYRrQQD2ke7NTUHtmFijevDmlesV2dAgspwBRGGWd0+gbUVErD27vfDrpP+Ev04y1Nu+Mb1
 crKlXceISMrGfvpkDAYDy7mv6C+EETQ=
X-Proofpoint-GUID: ObqvGv9dYOTvLji2CEZQy6CQR-8LBkyb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210220
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Jul 2026 21:14:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17592

The Qt patch for meson needs to be tweaked to apply to the v1.11.2
change [1] in oe-core.

[1] https://git.openembedded.org/openembedded-core/commit/?id=c3bfaa3cd34ac0730c83f38675a25d5ec3f9b6fe

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...ependencies-respect-PKG_CONFIG_SYSROOT_DIR-for-c.patch | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/meson/0001-qt-dependencies-respect-PKG_CONFIG_SYSROOT_DIR-for-c.patch b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/meson/0001-qt-dependencies-respect-PKG_CONFIG_SYSROOT_DIR-for-c.patch
index ff14dc1c..8ce77c8a 100644
--- a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/meson/0001-qt-dependencies-respect-PKG_CONFIG_SYSROOT_DIR-for-c.patch
+++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/meson/0001-qt-dependencies-respect-PKG_CONFIG_SYSROOT_DIR-for-c.patch
@@ -56,7 +56,7 @@ index c245e5c..a3846ec 100644
      return [private_dir, Path(private_dir, f'Qt{module}').as_posix()]
 
 
-@@ -192,7 +200,10 @@ class QtPkgConfigDependency(_QtBase, PkgConfigDependency, metaclass=abc.ABCMeta)
+@@ -195,7 +203,10 @@ class QtPkgConfigDependency(_QtBase, PkgConfigDependency, metaclass=abc.ABCMeta)
              if self.private_headers:
                  qt_inc_dir = mod.get_variable(pkgconfig='includedir')
                  mod_private_dir = os.path.join(qt_inc_dir, 'Qt' + m)
@@ -65,8 +65,8 @@ index c245e5c..a3846ec 100644
 +                sysroot = os.environ.get('PKG_CONFIG_SYSROOT_DIR', '')
 +                check_dir = os.path.join(sysroot, mod_private_dir.lstrip('/')) if sysroot else mod_private_dir
 +                if not os.path.isdir(check_dir):
-                     # At least some versions of homebrew don't seem to set this
-                     # up correctly. /usr/local/opt/qt/include/Qt + m_name is a
-                     # symlink to /usr/local/opt/qt/include, but the pkg-config
+                     if self.env.machines[self.for_machine].is_darwin():
+                         # On macOS Qt is conventionally shipped as a framework
+                         # (e.g. Homebrew's qt@6). pkg-config 'includedir' is
 --
 2.34.1
-- 
2.43.0


